package org.openmrs.module.dotsreports.reporting.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;



import org.apache.commons.lang.StringUtils;
import org.openmrs.Cohort;
import org.openmrs.Location;
import org.openmrs.api.PatientSetService.TimeModifier;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.Oblast;
import org.openmrs.module.dotsreports.TbConcepts;
import org.openmrs.module.dotsreports.exception.MdrtbAPIException;
import org.openmrs.module.dotsreports.reporting.ReportSpecification;
import org.openmrs.module.dotsreports.reporting.ReportUtil;
import org.openmrs.module.dotsreports.reporting.definition.DotsBacResultAfterTreatmentStartedCohortDefinition.Result;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.reporting.cohort.definition.CohortDefinition;
import org.openmrs.module.reporting.cohort.definition.evaluator.CompositionCohortDefinitionEvaluator;
import org.openmrs.module.reporting.common.SetComparator;
import org.openmrs.module.reporting.dataset.definition.CohortCrossTabDataSetDefinition;
import org.openmrs.module.reporting.evaluation.EvaluationContext;
import org.openmrs.module.reporting.evaluation.EvaluationException;
import org.openmrs.module.reporting.evaluation.parameter.Mapped;
import org.openmrs.module.reporting.evaluation.parameter.Parameter;
import org.openmrs.module.reporting.report.ReportData;
import org.openmrs.module.reporting.report.definition.ReportDefinition;
import org.openmrs.module.reporting.report.definition.service.ReportDefinitionService;
import org.openmrs.module.reporting.report.renderer.RenderingMode;


public class DOTS08TJKUpdatedTB03 implements ReportSpecification /**
 * @see ReportSpecification#getName()
 */
{
	
public String getName() {
	return Context.getMessageSourceService().getMessage("dotsreports.form08");
}

/**
 * @see ReportSpecification#getDescription()
 */
public String getDescription() {
	return Context.getMessageSourceService().getMessage("dotsreports.form08.title");
}

/**
 * @see ReportSpecification#getParameters()
 */
public List<Parameter> getParameters() {
	List<Parameter> l = new ArrayList<Parameter>();
	l.add(new Parameter("location", Context.getMessageSourceService().getMessage("dotsreports.facility"), Location.class));
	l.add(new Parameter("year", Context.getMessageSourceService().getMessage("dotsreports.year"), Integer.class));
	//l.add(new Parameter("quarter", Context.getMessageSourceService().getMessage("mdrtb.quarter"), Integer.class));
	l.add(new Parameter("quarter", Context.getMessageSourceService().getMessage("dotsreports.quarterOptional"), String.class));
	l.add(new Parameter("month", Context.getMessageSourceService().getMessage("dotsreports.monthOptional"), String.class));
	return l;
}

/**
 * @see ReportSpecification#getRenderingModes()
 */
public List<RenderingMode> getRenderingModes() {
	List<RenderingMode> l = new ArrayList<RenderingMode>();
	l.add(ReportUtil.renderingModeFromResource("HTML", "org/openmrs/module/dotsreports/reporting/data/output/DOTS-TB08-OMAR" + 
		(StringUtils.isNotBlank(Context.getLocale().getLanguage()) ? "_" + Context.getLocale().getLanguage() : "") + ".html"));
	return l;
}



/**
 * @see ReportSpecification#validateAndCreateContext(Map)
 */
public EvaluationContext validateAndCreateContext(Map<String, Object> parameters) {
	
	EvaluationContext context = ReportUtil.constructContext(parameters);
	Integer year = (Integer)parameters.get("year");
	/*Integer quarter = (Integer)parameters.get("quarter");*/
	String quarter = (String) parameters.get("quarter");
	String oblast = (String) parameters.get("oblast");
	String month = (String) parameters.get("month");
	
	if (quarter == null && month==null) {
		throw new IllegalArgumentException(Context.getMessageSourceService().getMessage("dotsreports.error.pleaseEnterAQuarterOrMonth"));
	}
	context.getParameterValues().putAll(ReportUtil.getPeriodDates(year, quarter, month));
	
	Map<String,Object>pMap = context.getParameterValues();
	Set<String> keySet = pMap.keySet();
	System.out.println("PARAMS");
	for (Iterator iterator = keySet.iterator(); iterator.hasNext();) {
        System.out.println(iterator.next());
 }
	return context;
}

/**
 * ReportSpecification#evaluateReport(EvaluationContext)
 */
 @SuppressWarnings("unchecked")
public ReportData evaluateReport(EvaluationContext context) {
	
	ReportDefinition report = new ReportDefinition();
	
	Location location = (Location) context.getParameterValue("location");
	Date startDate = (Date)context.getParameterValue("startDate");
	Date endDate = (Date)context.getParameterValue("endDate");
	
	
	String oblast = (String) context.getParameterValue("oblast");
	
	
	
			Oblast o = null;
			if(!oblast.equals("") && location == null)
				o =  Context.getService(TbService.class).getOblast(Integer.parseInt(oblast));
			
			List<Location> locList = new ArrayList<Location>();
			if(o != null && location == null)
				locList = Context.getService(TbService.class).getLocationsFromOblastName(o);
			else if (location != null)
				locList.add(location);
			
			if(location != null)
				context.addParameterValue("location", location.getName()); 
			else if(o != null)
				context.addParameterValue("location", o.getName()); 
			else
				context.addParameterValue("location", "All"); 
			
			
	
	// Base Cohort is confirmed mdr patients, in program, who started treatment during the quarter, optionally at location
			Map<String, Mapped<? extends CohortDefinition>> baseCohortDefs = new LinkedHashMap<String, Mapped<? extends CohortDefinition>>();
			
			
			
			CohortDefinition baseCohort = null;
			
			if (!locList.isEmpty()){
				List<CohortDefinition> cohortDefinitions = new ArrayList<CohortDefinition>();
				for(Location loc : locList)
					cohortDefinitions.add(Cohorts.getTB03ByDatesAndLocation(startDate, endDate, loc));
					
				if(!cohortDefinitions.isEmpty()){
					baseCohort= ReportUtil.getCompositionCohort("OR", cohortDefinitions);
				}
			}
			
			else
				baseCohort = Cohorts.getTB03ByDatesAndLocation(startDate, endDate, null);
			

		
			report.setBaseCohortDefinition(baseCohort, null);
	
		
			
			Map<String, CohortDefinition> dotsoutcomes = ReportUtil.getDotsOutcomesFilterSet(startDate, endDate);
			Map<String, CohortDefinition> mdroutcomes = ReportUtil.getMdrtbOutcomesFilterSet(startDate, endDate);
			//CURED
			
			CohortDefinition dotscured =  dotsoutcomes.get("Cured");
			CohortDefinition dotstxCompleted = dotsoutcomes.get("TreatmentCompleted");
			CohortDefinition dotsdied = dotsoutcomes.get("Died");
			CohortDefinition dotsfailed = dotsoutcomes.get("Failed");
			CohortDefinition dotsdefaulted = dotsoutcomes.get("Defaulted");
			CohortDefinition dotstout = dotsoutcomes.get("TransferredOut");
			CohortDefinition dotscancelled = dotsoutcomes.get("Canceled");
			CohortDefinition dotsstartedSLD =dotsoutcomes.get("StartedSLD");
			
			
			CohortDefinition mdrcured =  mdroutcomes.get("Cured");
			CohortDefinition mdrtxCompleted = mdroutcomes.get("TreatmentCompleted");
			CohortDefinition mdrdied = mdroutcomes.get("Died");
			CohortDefinition mdrfailed = mdroutcomes.get("Failed");
			CohortDefinition mdrdefaulted = mdroutcomes.get("Defaulted");
			CohortDefinition mdrtout = mdroutcomes.get("TransferredOut");
		
			CohortDefinition cured =  ReportUtil.getCompositionCohort("OR", dotscured,mdrcured);
			CohortDefinition txCompleted = ReportUtil.getCompositionCohort("OR", dotstxCompleted,mdrtxCompleted);
			CohortDefinition died = ReportUtil.getCompositionCohort("OR", dotsdied,mdrdied);
			CohortDefinition failed = ReportUtil.getCompositionCohort("OR", dotsfailed,mdrfailed);
			CohortDefinition defaulted = ReportUtil.getCompositionCohort("OR", dotsdefaulted,mdrdefaulted);
			CohortDefinition tout = ReportUtil.getCompositionCohort("OR", dotstout,mdrtout);
			CohortDefinition cancelled = dotscancelled;
			CohortDefinition startedSLD =dotsstartedSLD;
			
			CohortDefinition pulmonary = Cohorts.getAllPulmonaryDuring(startDate,endDate);
			CohortDefinition extrapulmonary = Cohorts.getAllExtraPulmonaryDuring(startDate,endDate);
			
			
			CohortDefinition smearPositive = Cohorts.getDotsBacBaselineTJKResult(startDate, endDate, null, null, org.openmrs.module.dotsreports.reporting.definition.DotsBacBaselineResultTJKCohortDefinition.Result.POSITIVE);
			CohortDefinition rapidTestPositive = Cohorts.getAnyXpertOrHAINPositiveDuring(startDate, endDate);
			
			
			
			CohortDefinition haveLabDiagnosis = ReportUtil.getCompositionCohort("OR", smearPositive,  rapidTestPositive);
			
			CohortDefinition haveClinicalDiagnosis = ReportUtil.minus(baseCohort,haveLabDiagnosis);
			
			CohortDefinition haveTxOutcome = Cohorts.getHaveTreatmentOutcome(null, null, null);
			
			CohortDefinition haveNoTxOutcome = ReportUtil.minus(baseCohort,haveTxOutcome);
			
			
			//DIED:TB
			CohortDefinition tbDied = ReportUtil.getCodedObsCohort(TimeModifier.ANY, Context.getService(TbService.class).getConcept(TbConcepts.CAUSE_OF_DEATH).getId(),
					null, null, SetComparator.IN, Context.getService(TbService.class).getConcept(TbConcepts.DEATH_BY_TB).getId());
			
			
			
			//DIED: NON-TB
			//
			CohortDefinition nonTbDeath = ReportUtil.getCodedObsCohort(TimeModifier.ANY, Context.getService(TbService.class).getConcept(TbConcepts.CAUSE_OF_DEATH).getId(),
					null, null, SetComparator.IN, Context.getService(TbService.class).getConcept(TbConcepts.DEATH_BY_OTHER_DISEASES).getId());
			
			
			CohortDefinition sldTreatmentStarted = ReportUtil.getCompositionCohort("OR", startedSLD, Cohorts.getSLDTreatmentStartedFilter(startDate, endDate));
			
			
			GregorianCalendar gc = new GregorianCalendar();
			gc.set(1900, 0, 1, 0, 0, 1);
			//ENROLLED FOR SLD
			CohortDefinition mdr = Cohorts.getInMdrProgramEverDuring(gc.getTime(), endDate);
			
			
			//New Age filters added by Omar
			CohortDefinition age04=Cohorts.getAgeAtEnrollmentInDotsProgram(startDate, endDate, 0, 5);
			CohortDefinition age0514=Cohorts.getAgeAtEnrollmentInDotsProgram(startDate, endDate, 5, 15);
			CohortDefinition age1517=Cohorts.getAgeAtEnrollmentInDotsProgram(startDate, endDate, 15, 18);
				
			Map<String, CohortDefinition> groups = ReportUtil.getDotsRegistrationGroupsFilterSet(startDate, endDate);
			
			
		
			
			Map<String, CohortDefinition> dotsgroups = ReportUtil.getDotsRegistrationGroupsFilterSet(startDate, endDate);
			Map<String, CohortDefinition> mdrgroups = ReportUtil.getMdrtbPreviousTreatmentFilterSet(startDate, endDate);
			
			CohortDefinition dotsallNewCases = dotsgroups.get("New");
			CohortDefinition dotsallFailures = ReportUtil.getCompositionCohort("OR", dotsgroups.get("AfterFailure1"),dotsgroups.get("AfterFailure2"));
			CohortDefinition dotsallDefault = ReportUtil.getCompositionCohort("OR", dotsgroups.get("AfterDefault1"),dotsgroups.get("AfterDefault2"));
			CohortDefinition dotsallOthers = dotsgroups.get("Other");
			CohortDefinition dotsallTransferred = dotsgroups.get("TransferredIn");
			CohortDefinition dotsallRelapses = ReportUtil.getCompositionCohort("OR", dotsgroups.get("Relapse1"),dotsgroups.get("Relapse2"));
			
			CohortDefinition mdrallNewCases = mdrgroups.get("New");
			CohortDefinition mdrallFailures = ReportUtil.getCompositionCohort("OR", mdrgroups.get("AfterFailure1"),mdrgroups.get("AfterFailure2"));
			CohortDefinition mdrallDefault =ReportUtil.getCompositionCohort("OR", mdrgroups.get("AfterDefault1"),mdrgroups.get("AfterDefault2"));
			CohortDefinition mdrallOthers = mdrgroups.get("Other");
			CohortDefinition mdrallTransferred = mdrgroups.get("TransferredIn");
			CohortDefinition mdrallRelapses = ReportUtil.getCompositionCohort("OR", mdrgroups.get("Relapse1"),mdrgroups.get("Relapse2"));
			
			CohortDefinition allNewCases = ReportUtil.getCompositionCohort("OR", dotsallNewCases,mdrallNewCases);
			CohortDefinition allFailures = ReportUtil.getCompositionCohort("OR", dotsallFailures,mdrallFailures);
			CohortDefinition allDefault = ReportUtil.getCompositionCohort("OR", dotsallDefault,mdrallDefault);
			CohortDefinition allOthers = ReportUtil.getCompositionCohort("OR", dotsallOthers,mdrallOthers);
			CohortDefinition allTransferred = ReportUtil.getCompositionCohort("OR", dotsallTransferred,mdrallTransferred);
			CohortDefinition allRelapses = ReportUtil.getCompositionCohort("OR", dotsallRelapses,mdrallRelapses);
			
			CohortDefinition allRetreatmentAlpha= ReportUtil.getCompositionCohort("OR",allDefault,allFailures,allOthers ); 
			
			
			//////////////////////			TABLE1			/////////////////////
			CohortCrossTabDataSetDefinition table1 = new CohortCrossTabDataSetDefinition();
			
			
			CohortDefinition pulmonaryLabDiagnosis = ReportUtil.getCompositionCohort("AND", pulmonary, haveLabDiagnosis);
			CohortDefinition pulmonaryClinicalDiagnosis = ReportUtil.getCompositionCohort("AND", pulmonary, haveClinicalDiagnosis);
			
			CohortDefinition pulmonaryNew = ReportUtil.getCompositionCohort("AND", pulmonary, allNewCases);
			CohortDefinition extrapulmonaryNew = ReportUtil.getCompositionCohort("AND", extrapulmonary, allNewCases);
			
			CohortDefinition pulmonaryRelapse = ReportUtil.getCompositionCohort("AND", pulmonary, allRelapses);
			CohortDefinition extrapulmonaryRelapse = ReportUtil.getCompositionCohort("AND", extrapulmonary, allRelapses);
			
			CohortDefinition pulmonaryNewLab = ReportUtil.getCompositionCohort("AND", pulmonaryNew, haveLabDiagnosis);
			CohortDefinition pulmonaryNewClinical = ReportUtil.getCompositionCohort("AND", pulmonaryNew, haveClinicalDiagnosis);
			
			CohortDefinition pulmonaryRelapseLab = ReportUtil.getCompositionCohort("AND", pulmonaryRelapse, haveLabDiagnosis);
			CohortDefinition pulmonaryRelapseClinical = ReportUtil.getCompositionCohort("AND", pulmonaryRelapse, haveClinicalDiagnosis);
			
			CohortDefinition newAllKindsPul = ReportUtil.getCompositionCohort("OR",pulmonaryNewLab,pulmonaryNewClinical,extrapulmonaryNew);
			CohortDefinition relapseAllKindsPul = ReportUtil.getCompositionCohort("OR",pulmonaryRelapseLab,pulmonaryRelapseClinical,extrapulmonaryRelapse);
			
			table1.addRow("newptbld", pulmonaryNewLab, null);
			table1.addRow("newptbld04", ReportUtil.getCompositionCohort("AND", pulmonaryNewLab,age04), null);
			table1.addRow("newptbld0514", ReportUtil.getCompositionCohort("AND", pulmonaryNewLab, age0514),null);
			table1.addRow("newptbld1517", ReportUtil.getCompositionCohort("AND", pulmonaryNewLab,age1517),null);

			
			table1.addRow("newptbsd", pulmonaryNewClinical, null);
			table1.addRow("newptbsd04", ReportUtil.getCompositionCohort("AND", pulmonaryNewClinical, age04), null);
			table1.addRow("newptbsd0514", ReportUtil.getCompositionCohort("AND", pulmonaryNewClinical, age0514),null);
			table1.addRow("newptbsd1517", ReportUtil.getCompositionCohort("AND", pulmonaryNewClinical,age1517),null);

			table1.addRow("neweptb", extrapulmonaryNew, null);
			table1.addRow("neweptb04", ReportUtil.getCompositionCohort("AND", extrapulmonaryNew,age04), null);
			table1.addRow("neweptb0514", ReportUtil.getCompositionCohort("AND", extrapulmonaryNew, age0514),null);
			table1.addRow("neweptb1517", ReportUtil.getCompositionCohort("AND", extrapulmonaryNew, age1517),null);
			
			table1.addRow("newTotal", newAllKindsPul ,null);
			table1.addRow("newTotal04", ReportUtil.getCompositionCohort("AND",age04, newAllKindsPul),null);
			table1.addRow("newTotal0514", ReportUtil.getCompositionCohort("AND",age0514, newAllKindsPul) ,null);
			table1.addRow("newTotal1517", ReportUtil.getCompositionCohort("AND",age1517, newAllKindsPul) ,null);
			
			//RELAPSES
			table1.addRow("relapseptbld", pulmonaryRelapseLab, null);
			table1.addRow("relapseptbld04", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseLab,age04), null);
			table1.addRow("relapseptbld0514", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseLab,age0514),null);
			table1.addRow("relapseptbld1517", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseLab,age1517),null);
			
			table1.addRow("relapseptbsd", pulmonaryRelapseClinical, null);
			table1.addRow("relapseptbsd04", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseClinical,age04), null);
			table1.addRow("relapseptbsd0514", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseClinical, age0514),null);
			table1.addRow("relapseptbsd1517", ReportUtil.getCompositionCohort("AND", pulmonaryRelapseClinical,age1517),null);

			table1.addRow("relapseeptb", extrapulmonaryRelapse, null);
			table1.addRow("relapseeptb04", ReportUtil.getCompositionCohort("AND", extrapulmonaryRelapse,age04), null);
			table1.addRow("relapseeptb0514", ReportUtil.getCompositionCohort("AND", extrapulmonaryRelapse, age0514),null);
			table1.addRow("relapseeptb1517", ReportUtil.getCompositionCohort("AND", extrapulmonaryRelapse,age1517),null);
			
			table1.addRow("relapseTotal", ReportUtil.getCompositionCohort("AND", relapseAllKindsPul) ,null);
			table1.addRow("relapseTotal04", ReportUtil.getCompositionCohort("AND",age04, relapseAllKindsPul ) ,null);
			table1.addRow("relapseTotal0514", ReportUtil.getCompositionCohort("AND",age0514, relapseAllKindsPul ) ,null);
			table1.addRow("relapseTotal1517", ReportUtil.getCompositionCohort("AND",age1517, relapseAllKindsPul) ,null);
			
			//FAILURE
			table1.addRow("failureptbld", ReportUtil.getCompositionCohort("AND", pulmonaryLabDiagnosis,allFailures), null);
			table1.addRow("failureptbsd", ReportUtil.getCompositionCohort("AND", pulmonaryClinicalDiagnosis,allFailures), null);
			table1.addRow("failureeptb", ReportUtil.getCompositionCohort("AND", extrapulmonary,allFailures), null);
			table1.addRow("failureTotal", ReportUtil.getCompositionCohort("AND", allFailures,ReportUtil.getCompositionCohort("OR",pulmonaryLabDiagnosis,pulmonaryClinicalDiagnosis,extrapulmonary) ) ,null);
			
			//DEFAULT
			table1.addRow("defaultptbld", ReportUtil.getCompositionCohort("AND", pulmonaryLabDiagnosis,allDefault), null);
			table1.addRow("defaultptbsd", ReportUtil.getCompositionCohort("AND", pulmonaryClinicalDiagnosis, allDefault), null);
			table1.addRow("defaulteptb", ReportUtil.getCompositionCohort("AND", extrapulmonary,allDefault), null);
			table1.addRow("defaultTotal", ReportUtil.getCompositionCohort("AND", allDefault,ReportUtil.getCompositionCohort("OR",pulmonaryLabDiagnosis,pulmonaryClinicalDiagnosis,extrapulmonary) ) ,null);
			
			
			//OTHER
			table1.addRow("otherptbld", ReportUtil.getCompositionCohort("AND", pulmonaryLabDiagnosis,allOthers), null);
			table1.addRow("otherptbsd", ReportUtil.getCompositionCohort("AND", pulmonaryClinicalDiagnosis, allOthers), null);
			table1.addRow("othereptb", ReportUtil.getCompositionCohort("AND", extrapulmonary,allOthers), null);
			table1.addRow("otherTotal", ReportUtil.getCompositionCohort("AND", allOthers,ReportUtil.getCompositionCohort("OR",pulmonaryLabDiagnosis,pulmonaryClinicalDiagnosis,extrapulmonary) ) ,null);
			
			//TOTAL
			table1.addRow("totalptbld", ReportUtil.getCompositionCohort("AND", pulmonaryLabDiagnosis,allRetreatmentAlpha),null);
			table1.addRow("totalptbsd", ReportUtil.getCompositionCohort("AND", pulmonaryClinicalDiagnosis, allRetreatmentAlpha),null);
			table1.addRow("totaleptb", ReportUtil.getCompositionCohort("AND", extrapulmonary,allRetreatmentAlpha),null);

			table1.addRow("totaltotal", ReportUtil.getCompositionCohort("AND", allRetreatmentAlpha, ReportUtil.getCompositionCohort("OR",pulmonaryLabDiagnosis,pulmonaryClinicalDiagnosis,extrapulmonary)) ,null);
			
			//TOTAL
			table1.addRow("total", baseCohort,null);
			
			/////////////////////////////////////////////////////
			////      			COLUMNS           			////
			///////////////////////////////////////////////////
			table1.addColumn("reg", baseCohort,null);
			
			table1.addColumn("eval",  ReportUtil.getCompositionCohort("OR",cured,txCompleted,died,failed,defaulted,tout),null);
			table1.addColumn("cured", cured, null);
			table1.addColumn("tx", txCompleted, null);
			
			
			table1.addColumn("tbdeath", tbDied, null);
			table1.addColumn("notbdeath", nonTbDeath, null);
			table1.addColumn("fail", failed, null);
			table1.addColumn("def", defaulted, null);
			table1.addColumn("tout", tout, null);
		
			
			table1.addColumn("coltotal",ReportUtil.getCompositionCohort("OR",cured,txCompleted,died,failed,defaulted,tout),null);
			table1.addColumn("canceled", cancelled,null);
			
			table1.addColumn("sld", startedSLD/*ReportUtil.getCompositionCohort("AND",allTB,startedSLD)*/, null);
			
			report.addDataSetDefinition("tbl", table1, null);
		
			
	ReportData data;
	try {
		data = Context.getService(ReportDefinitionService.class).evaluate(
				report, context);
	} catch (EvaluationException e) {
		throw new MdrtbAPIException("Unable to evaluate WHO Form 8 report",
				e);
	}
	return data;
}
 }
