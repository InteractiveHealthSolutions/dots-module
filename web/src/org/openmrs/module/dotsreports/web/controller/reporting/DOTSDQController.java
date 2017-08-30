package org.openmrs.module.dotsreports.web.controller.reporting;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openmrs.Cohort;
import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Form;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.Person;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.MdrtbConstants;
import org.openmrs.module.dotsreports.Oblast;
import org.openmrs.module.dotsreports.TbConcepts;
import org.openmrs.module.dotsreports.reporting.DQItem;
import org.openmrs.module.dotsreports.reporting.DQUtil;
import org.openmrs.module.dotsreports.reporting.PDFHelper;
import org.openmrs.module.dotsreports.reporting.ReportUtil;
import org.openmrs.module.dotsreports.reporting.TB03Data;
import org.openmrs.module.dotsreports.reporting.TB03Util;
import org.openmrs.module.dotsreports.reporting.data.Cohorts;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.dotsreports.specimen.Culture;
import org.openmrs.module.dotsreports.specimen.HAIN;
import org.openmrs.module.dotsreports.specimen.Smear;
import org.openmrs.module.dotsreports.specimen.Xpert;
import org.openmrs.module.reporting.cohort.definition.CohortDefinition;
import org.openmrs.module.reporting.cohort.definition.service.CohortDefinitionService;
import org.openmrs.module.reporting.evaluation.EvaluationContext;
import org.openmrs.module.reporting.evaluation.EvaluationException;
import org.openmrs.propertyeditor.ConceptEditor;
import org.openmrs.propertyeditor.LocationEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
/*import org.openmrs.module.mdrtbdrugforecast.DrugCount;
import org.openmrs.module.mdrtbdrugforecast.MdrtbDrugStock;
import org.openmrs.module.mdrtbdrugforecast.MdrtbUtil;
import org.openmrs.module.mdrtbdrugforecast.MdrtbConcepts;
import org.openmrs.module.mdrtbdrugforecast.drugneeds.DrugForecastUtil;
import org.openmrs.module.mdrtbdrugforecast.program.MdrtbPatientProgram;
import org.openmrs.module.mdrtbdrugforecast.regimen.Regimen;
import org.openmrs.module.mdrtbdrugforecast.regimen.RegimenUtils;
import org.openmrs.module.mdrtbdrugforecast.reporting.definition.MdrtbDrugForecastTreatmentStartedCohortDefinition;
import org.openmrs.module.mdrtbdrugforecast.reporting.definition.MdrtbDrugForecastTreatmentStartedOnDrugCohortDefinition;
import org.openmrs.module.mdrtbdrugforecast.service.MdrtbDrugForecastService;
import org.openmrs.module.mdrtbdrugforecast.status.TreatmentStatusCalculator;
import org.openmrs.module.mdrtbdrugforecast.web.controller.status.DashboardTreatmentStatusRenderer;*/

@Controller

public class DOTSDQController {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(Context.getDateFormat(), true, 10));
        binder.registerCustomEditor(Concept.class, new ConceptEditor());
        binder.registerCustomEditor(Location.class, new LocationEditor());
    }
        
    
    @RequestMapping(method=RequestMethod.GET, value="/module/dotsreports/reporting/dq")
    public void showRegimenOptions(ModelMap model) {
    	System.out.println("-----GET-----");
    	System.out.print(model);
        List<Location> locations = Context.getLocationService().getAllLocations(false);//Context.getService(TbService.class).getEnrollmentLocations();//ms = (MdrtbDrugForecastService) Context.getService(MdrtbDrugForecastService.class);
        List<Oblast> oblasts = Context.getService(TbService.class).getOblasts();
        
        model.addAttribute("locations", locations);
        model.addAttribute("oblasts", oblasts);
        
      
      
    	
    }
    
  
    
    
    @SuppressWarnings("unused")
	@RequestMapping(method=RequestMethod.POST, value="/module/dotsreports/reporting/dq")
    public static String doDQ(
    		@RequestParam("location") Location location,
    		@RequestParam("oblast") String oblast,
            @RequestParam(value="year", required=true) Integer year,
            @RequestParam(value="quarter", required=false) String quarter,
            @RequestParam(value="month", required=false) String month,
            ModelMap model) throws EvaluationException {
    	
    	System.out.println("---POST-----");
    	System.out.println("PARAMS:" + location + " " + oblast + " " + year + " " + quarter + " " + month);
    	
    	//Cohort patients = TbUtil.getDOTSPatientsTJK(null, null, location, oblast, null, null, null, null,year,quarter,month);
    	//Cohort patients = 
    	
    	Oblast o = null;
    	if(oblast!=null && !oblast.equals("") && location == null)
			o =  Context.getService(TbService.class).getOblast(Integer.parseInt(oblast));
    	String oName = "";
    	if(o!=null) {
    		oName = o.getName();
    	}
		
		List<Location> locList = new ArrayList<Location>();
		if(o != null && location == null)
			locList = Context.getService(TbService.class).getLocationsFromOblastName(o);
		else if (location != null)
			locList.add(location);
		
		Map<String, Date> dateMap = ReportUtil.getPeriodDates(year, quarter, month);
		
		Date startDate = (Date)(dateMap.get("startDate"));
		Date endDate = (Date)(dateMap.get("endDate"));
		
		System.out.println("ST: " + startDate);
		System.out.println("ED: " + endDate);
		
		CohortDefinition baseCohort = null;
		
		//OBLAST
		if (!locList.isEmpty()){
			List<CohortDefinition> cohortDefinitions = new ArrayList<CohortDefinition>();
			for(Location loc : locList)
				cohortDefinitions.add(Cohorts.getTB03ByDatesAndLocation(startDate, endDate, loc));
				
			if(!cohortDefinitions.isEmpty()){
				baseCohort = ReportUtil.getCompositionCohort("OR", cohortDefinitions);
			}
		}
		
		else
			baseCohort = Cohorts.getTB03ByDatesAndLocation(startDate, endDate, null);
    	
    	Cohort patients = Context.getService(CohortDefinitionService.class).evaluate(baseCohort, new EvaluationContext());
 
		Form tb03Form = Context.getFormService().getForm(MdrtbConstants.TB03_FORM_ID);
		ArrayList<Form> formList = new ArrayList<Form>();
		formList.add(tb03Form);
    	
    	
    	Set<Integer> idSet = patients.getMemberIds();
    	ArrayList<TB03Data> patientSet  = new ArrayList<TB03Data>();
    	SimpleDateFormat sdf = new SimpleDateFormat();
    	
    	ArrayList<Person> patientList = new ArrayList<Person>();
    	ArrayList<Concept> conceptQuestionList = new ArrayList<Concept>();
    	ArrayList<Concept> conceptAnswerList = new ArrayList<Concept>();
    	
    	List<Obs> obsList = null;
    	
    	List<DQItem> missingTB03 = new ArrayList<DQItem>();
    	List<DQItem> missingAge = new ArrayList<DQItem>();
    	List<DQItem> missingPatientGroup = new ArrayList<DQItem>();
    	List<DQItem> missingDiagnosticTests = new ArrayList<DQItem>();
    	List<DQItem> notStartedTreatment = new ArrayList<DQItem>();
    	List<DQItem> missingOutcomes = new ArrayList<DQItem>();
    	//List<DQItem> missingAddress = new ArrayList<DQItem>();
    	List<DQItem> noDOTSId = new ArrayList<DQItem>();
    	List<DQItem> noSite = new ArrayList<DQItem>();
    	
    	Boolean errorFlag = Boolean.FALSE;
    	Integer errorCount = 0;
    	
    	Date treatmentStartDate = null;
    	Calendar tCal = null;
    	Calendar nowCal = null;
    	long timeDiff = 0;
    	double diffInWeeks = 0;
    	
    	Smear diagnosticSmear = null;
	    Xpert firstXpert = null;
	    HAIN firstHAIN = null;
	    Culture diagnosticCulture  = null;
	    Boolean eptb = Boolean.FALSE;
	    Boolean child = Boolean.FALSE;
	    DQItem dqi = null;
	    
	    Integer eptbConcept = Context.getService(TbService.class).getConcept(TbConcepts.EXTRA_PULMONARY_TB).getConceptId();
	    
    	sdf.applyPattern("dd.MM.yyyy");
    	for (Integer i : idSet) {
    		
    		 //INIT
    	    treatmentStartDate = null;
    		tCal = null;
    		nowCal = null;
    		timeDiff = 0;
    		diffInWeeks = 0;
    		diagnosticSmear = null;
    	    firstXpert = null;
    	    firstHAIN = null;
    	    diagnosticCulture  = null;
    	    patientList.clear();
    	    errorFlag = Boolean.FALSE;
    	    eptb = Boolean.FALSE;
    	    child = Boolean.FALSE;
    		
    		dqi = new DQItem();
    	    Patient patient = Context.getPatientService().getPatient(i);
    	    
    	    if(patient==null) {
    	    	continue;
    	    }
    	    patientList.add(patient);
    	    dqi.setPatient(patient);
    	    dqi.setDateOfBirth(sdf.format(patient.getBirthdate()));
    	    

    	    //Missing TB03
    	    List<Encounter> tb03EncList = Context.getEncounterService().getEncounters(patient, null, startDate, endDate, formList, null, null, false);
    	    if(tb03EncList==null || tb03EncList.size() == 0) {
    	    	missingTB03.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    
    	    //Missing Age at Registration
    	    Concept q = Context.getService(TbService.class).getConcept(TbConcepts.AGE_AT_DOTS_REGISTRATION);
    	    
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList==null || obsList.size()==0) {
    	    	missingAge.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    //MISSING REGISTRATION GROUP
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.PATIENT_GROUP);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList==null || obsList.size()==0) {
    	    	missingPatientGroup.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    
    	    //NOT STARTED TREATMENT
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.DOTS_TREATMENT_START_DATE);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList==null || obsList.size()==0) {
    	    	notStartedTreatment.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    else {
    	    	 //MISSING OUTCOMES
    	    	 if(obsList.size()>0 && obsList.get(0)!=null) {
    	    		 treatmentStartDate = obsList.get(0).getValueDatetime();
    	    		 tCal = new GregorianCalendar();
    	    		 tCal.setTime(treatmentStartDate);
    	    		 nowCal = new GregorianCalendar();
    	    		 timeDiff = nowCal.getTimeInMillis() - tCal.getTimeInMillis();
    	    		 diffInWeeks = DQUtil.timeDiffInWeeks(timeDiff);
    	    		 if(diffInWeeks > 32) {
    	    			  q = Context.getService(TbService.class).getConcept(TbConcepts.TB_TX_OUTCOME);
    	    	    	    conceptQuestionList.clear();
    	    	    	    conceptQuestionList.add(q);
    	    	    	    
    	    	    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    	    	    if(obsList==null || obsList.size()==0) {
    	    	    	    	missingOutcomes.add(dqi);
    	    	    	    	errorFlag = Boolean.TRUE;
    	    	    	    }
    	    		 } 
    	    	 }
    	    }
    	    
    	    //NO SITE
    	    
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.ANATOMICAL_SITE_OF_TB);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList==null || obsList.size()==0) {
    	    	noSite.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    
    	    else {
    	    	
    	    	
    	    	if(obsList.get(0).getValueCoded().getConceptId().intValue()==eptbConcept.intValue())
    	    	{
    	    		System.out.println("EP: " + i);
    	    		eptb = Boolean.TRUE;
    	    	}
    	    }
    	    
    	    
    	    
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.AGE_AT_DOTS_REGISTRATION);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList!=null && obsList.size()!=0) {
    	    	Double age = obsList.get(0).getValueNumeric();
    	    	System.out.println(i + "->" + age);
    	    	if(age > 14)
    	    		child = Boolean.FALSE;
    	    	else
    	    		child = Boolean.TRUE;
    	    }
    	    
    	    
    	    //MISSING DIAGNOSTIC TESTS

    	    
    	    diagnosticSmear = TB03Util.getDiagnosticSmear(patient);
    	    firstXpert = TB03Util.getFirstXpert(patient);
    	    firstHAIN = TB03Util.getFirstHAIN(patient);
    	    diagnosticCulture  = TB03Util.getDiagnosticCulture(patient);
    	    
    	   
    	    if(diagnosticSmear == null && diagnosticCulture == null && firstXpert==null && firstHAIN == null && eptb == Boolean.FALSE && child ==Boolean.FALSE) {
    	    	
    	    	missingDiagnosticTests.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    
    	    
    	    //MISSING DOTS ID
    	    List<PatientIdentifier> ids = patient.getActiveIdentifiers();
    	    Boolean idFound = Boolean.FALSE;
    	    for(PatientIdentifier pi : ids) {
    	    	if(pi.getIdentifierType().getId()==2) 
    	    	{
    	    		idFound = Boolean.TRUE;
    	    		break;
    	    	}
    	    }
    	    
    	    if(!idFound) {
    	    	noDOTSId.add(dqi);
    	    	errorFlag = Boolean.TRUE;
    	    }
    	    
    	    if(errorFlag) {
    	    	errorCount ++;
    	    }

    	    
    	}
    	
    	Integer num = patients.getSize();
    	Integer errorPercentage = null;
    	if(num==0)
    		errorPercentage = 0;
    	else
    		errorPercentage = (errorCount*100)/num;
    	
    	
    	model.addAttribute("num", num);
    	model.addAttribute("missingTB03", missingTB03);
    	model.addAttribute("missingAge", missingAge);
    	model.addAttribute("missingPatientGroup", missingPatientGroup);
    	model.addAttribute("missingDiagnosticTests", missingDiagnosticTests);
    	model.addAttribute("notStartedTreatment", notStartedTreatment);
    	model.addAttribute("missingOutcomes", missingOutcomes);
    	model.addAttribute("noDOTSId", noDOTSId);
    	model.addAttribute("noSite", noSite);
    	model.addAttribute("errorCount", new Integer(errorCount));
    	model.addAttribute("errorPercentage", errorPercentage.toString() + "%");
    	model.addAttribute("oblast", oName);
    	if(location!=null)
    		model.addAttribute("location", location.getName());
    	else
    		model.addAttribute("location", "");
    	model.addAttribute("year", year);
    	model.addAttribute("quarter", quarter);
    	model.addAttribute("month", month);
    	
    	
    	
    	model.addAttribute("locale", Context.getLocale().toString());
    	
    	// TO CHECK WHETHER REPORT IS CLOSED OR NOT
    	Integer report_oblast = null; Integer report_quarter = null; Integer report_month = null;
		if(new PDFHelper().isInt(oblast)) { report_oblast = Integer.parseInt(oblast); }
		if(new PDFHelper().isInt(quarter)) { report_quarter = Integer.parseInt(quarter); }
		if(new PDFHelper().isInt(month)) { report_month = Integer.parseInt(month); }
		
    	boolean reportStatus = Context.getService(TbService.class).readReportStatus(report_oblast, location.getId(), year, report_quarter, report_month, "DOTSDQ");
		System.out.println(reportStatus);
		
    	model.addAttribute("oblast", oblast);
    	model.addAttribute("location", location);
    	model.addAttribute("year", year);
    	model.addAttribute("quarter", quarter);
    	model.addAttribute("reportDate", sdf.format(new Date()));
    	model.addAttribute("reportStatus", reportStatus);
        return "/module/dotsreports/reporting/dqResults";
    }
    
    
  
    
}
