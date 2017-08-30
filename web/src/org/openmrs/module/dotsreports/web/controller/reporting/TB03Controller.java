package org.openmrs.module.dotsreports.web.controller.reporting;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
import org.openmrs.module.dotsreports.reporting.PDFHelper;
import org.openmrs.module.dotsreports.reporting.ReportUtil;
import org.openmrs.module.dotsreports.reporting.TB03Data;
import org.openmrs.module.dotsreports.reporting.TB03Util;
import org.openmrs.module.dotsreports.reporting.data.Cohorts;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.dotsreports.specimen.Culture;
import org.openmrs.module.dotsreports.specimen.Dst;
import org.openmrs.module.dotsreports.specimen.DstResult;
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

public class TB03Controller {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(Context.getDateFormat(), true, 10));
        binder.registerCustomEditor(Concept.class, new ConceptEditor());
        binder.registerCustomEditor(Location.class, new LocationEditor());
    }
        
    
    @RequestMapping(method=RequestMethod.GET, value="/module/dotsreports/reporting/tb03")
    public void showRegimenOptions(ModelMap model) {
    	
    	
    
       
        List<Location> locations = Context.getLocationService().getAllLocations(false);// Context.getLocationService().getAllLocations();//ms = (MdrtbDrugForecastService) Context.getService(MdrtbDrugForecastService.class);
        List<Oblast> oblasts = Context.getService(TbService.class).getOblasts();
        //drugSets =  ms.getMdrtbDrugs();
        
       

        model.addAttribute("locations", locations);
        model.addAttribute("oblasts", oblasts);
      
    	
    }
    
  
    
    
    @SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method=RequestMethod.POST, value="/module/dotsreports/reporting/tb03")
    public static String doTB03(
    		@RequestParam("location") Location location,
    		@RequestParam("oblast") String oblast,
            @RequestParam(value="year", required=true) Integer year,
            @RequestParam(value="quarter", required=false) String quarter,
            @RequestParam(value="month", required=false) String month,
            ModelMap model) throws EvaluationException {
    	
    	Oblast o = null;
    	if(oblast!=null && !oblast.equals("") && location == null)
			o =  Context.getService(TbService.class).getOblast(Integer.parseInt(oblast));
		
		List<Location> locList = new ArrayList<Location>();
		if(o != null && location == null)
			locList = Context.getService(TbService.class).getLocationsFromOblastName(o);
		else if (location != null)
			locList.add(location);
		
		Map<String, Date> dateMap = ReportUtil.getPeriodDates(year, quarter, month);
		
		Date startDate = (Date)(dateMap.get("startDate"));
		Date endDate = (Date)(dateMap.get("endDate"));
		
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
    	//Cohort patients = TbUtil.getDOTSPatientsTJK(null, null, location, oblast, null, null, null, null,year,quarter,month);
    	
		
		Form tb03Form = Context.getFormService().getForm(MdrtbConstants.TB03_FORM_ID);
		ArrayList<Form> formList = new ArrayList<Form>();
		formList.add(tb03Form);
    	
    	
    	Set<Integer> idSet = patients.getMemberIds();
    	ArrayList<TB03Data> patientSet  = new ArrayList<TB03Data>();
    	SimpleDateFormat sdf = new SimpleDateFormat();
    	
    	ArrayList<Person> patientList = new ArrayList<Person>();
    	ArrayList<Concept> conceptQuestionList = new ArrayList<Concept>();
    	ArrayList<Concept> conceptAnswerList = new ArrayList<Concept>();
    	Integer regimenConceptId = null;
    	Integer codId = null;
    	List<Obs> obsList = null;
    	
    	Concept reg1New = Context.getService(TbService.class).getConcept(TbConcepts.REGIMEN_1_NEW);
    	Concept reg1Rtx = Context.getService(TbService.class).getConcept(TbConcepts.REGIMEN_1_RETREATMENT);
    	
    	sdf.applyPattern("dd.MM.yyyy");
    	for (Integer i : idSet) {
    		patientList.clear();
         	conceptQuestionList.clear();
         	conceptAnswerList.clear();
    		
    		TB03Data tb03Data = new TB03Data();
    		tb03Data.setReg1New(Boolean.FALSE);
    		tb03Data.setReg1Rtx(Boolean.FALSE);
    	    Patient patient = Context.getPatientService().getPatient(i);
    	    if(patient==null) {
    	    	continue;
    	    	
    	    }
    	    	
    	    
    	    
    	    patientList.add(patient);
    	    
    	    
    	    tb03Data.setPatient(patient);
    	    
    	    //PATIENT IDENTIFIER
    	   /* tb03Data.setIdentifier(patient.getActiveIdentifiers().get(0).toString());*/
List<PatientIdentifier> idList = patient.getActiveIdentifiers();
    	    
    	    for(PatientIdentifier pi : idList) {
    	    	
    	    	if(pi.getIdentifierType().getId()==2 && tb03Data.getIdentifier()==null) {
    	    		tb03Data.setIdentifier(pi.getIdentifier());
    	    			break;
    	    	}
    	    	
    	    
    	    	
    	    }
    	    
    	    //DATE OF TB03 REGISTRATION
    	    List<Encounter> tb03EncList = Context.getEncounterService().getEncounters(patient, null, startDate, endDate, formList, null, null, false);
    	    Date encDate = null;
    	    if(tb03EncList.size() > 0 && tb03EncList.get(0)!=null) {
    	    	encDate = tb03EncList.get(0).getEncounterDatetime();
    	    	tb03Data.setTb03RegistrationDate(sdf.format(encDate));
    	    	
    	    }
    	    
    	    else 
    	    	continue;
    	   
    	    
    	    //FORMATTED DATE OF BIRTH
    	    if(patient.getBirthdate()!=null)
    	    	tb03Data.setDateOfBirth(sdf.format(patient.getBirthdate()));
    	    
    	    //AGE AT TB03 Registration
    	    Concept q = Context.getService(TbService.class).getConcept(TbConcepts.AGE_AT_DOTS_REGISTRATION);
    	    
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setAgeAtTB03Registration(obsList.get(0).getValueNumeric().intValue());
    	    
    	    //TX CENTER FOR IP
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.TREATMENT_CENTER_FOR_IP);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setIntensivePhaseFacility(obsList.get(0).getValueCoded().getName().getName());
    	    
    	    //TX CENTER FOR CP
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.TREATMENT_CENTER_FOR_CP);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setContinuationPhaseFacility(obsList.get(0).getValueCoded().getName().getName());
    	    
    	    //DOTS TREATMENT REGIMEN
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.TUBERCULOSIS_PATIENT_CATEGORY);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setTreatmentRegimen(obsList.get(0).getValueCoded().getName().getName());
    	    
    	    //DATE OF TB03 TREATMENT START
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.DOTS_TREATMENT_START_DATE);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setTb03TreatmentStartDate(sdf.format(obsList.get(0).getValueDatetime()));
    	    
    	  //SITE OF DISEASE (P/EP)
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.ANATOMICAL_SITE_OF_TB);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setSiteOfDisease(obsList.get(0).getValueCoded().getName().getShortName());
    	    
    	  //HIV TEST RESULT
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.RESULT_OF_HIV_TEST);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setHivTestResult(obsList.get(0).getValueCoded().getName().getName());

    	    //DATE OF HIV TEST
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.DATE_OF_HIV_TEST);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setHivTestDate(sdf.format(obsList.get(0).getValueDatetime()));
    	    
    	  //DATE OF ART START
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.DATE_OF_ART_TREATMENT_START);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setArtStartDate(sdf.format(obsList.get(0).getValueDatetime()));
    	    
    	  //DATE OF CP START
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.DATE_OF_PCT_TREATMENT_START);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setCpStartDate(sdf.format(obsList.get(0).getValueDatetime()));  
    	    
    	    
    	    
    	    //REGISTRATION GROUP
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.PATIENT_GROUP);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null) {
    	    	tb03Data.setRegGroup(obsList.get(0).getValueCoded().getConceptId());
    	    }
    	    
    	    
    	    //DIAGNOSTIC RESULTS
    	    
    	    //DIAGNOSTIC SMEAR
    	    
    	    Smear diagnosticSmear = TB03Util.getDiagnosticSmear(patient);
    	    if(diagnosticSmear!=null) {
    	    		if(diagnosticSmear.getResult()!=null) 
    	    			tb03Data.setDiagnosticSmearResult(diagnosticSmear.getResult().getName().getShortName());
    	    		if(diagnosticSmear.getResultDate()!=null)
    	    			tb03Data.setDiagnosticSmearDate(sdf.format(diagnosticSmear.getResultDate()));
    	    		
    	    		tb03Data.setDiagnosticSmearTestNumber(diagnosticSmear.getRealSpecimenId());
    	    }
    	    
    	    
    	    //DIAGNOSTIC XPERT
    	    Xpert firstXpert = TB03Util.getFirstXpert(patient);
    	    if(firstXpert!=null) {
    	    	if(firstXpert.getResult()!=null)
    	    		tb03Data.setXpertMTBResult(firstXpert.getResult().getName().getShortName());
    	    	if(firstXpert.getRifResistance()!=null)
    	    		tb03Data.setXpertRIFResult(firstXpert.getRifResistance().getName().getShortName());
    	    	if(firstXpert.getResultDate()!=null)
    	    		tb03Data.setXpertTestDate(sdf.format(firstXpert.getResultDate()));
    	    	
    	    	tb03Data.setXpertTestNumber(firstXpert.getRealSpecimenId());
    	    }
    	    
    	    
    	    
    	    //DIAGNOSTIC HAIN
    	    HAIN firstHAIN = TB03Util.getFirstHAIN(patient);
    	    if(firstHAIN!=null) {
    	    	if(firstHAIN.getResult()!=null)
    	    		tb03Data.setHainMTBResult(firstHAIN.getResult().getName().getShortName());
    	    	if(firstHAIN.getRifResistance()!=null)
    	    		tb03Data.setHainRIFResult(firstHAIN.getRifResistance().getName().getShortName());
    	    	if(firstHAIN.getInhResistance()!=null)
    	    		tb03Data.setHainINHResult(firstHAIN.getInhResistance().getName().getShortName());
    	    	if(firstHAIN.getResultDate()!=null)
    	    		tb03Data.setHainTestDate(sdf.format(firstHAIN.getResultDate()));
    	    	
    	    	tb03Data.setHainTestNumber(firstHAIN.getRealSpecimenId());
    	    }
    	    
    	    //DIAGNOSTIC CULTURE
    	    Culture diagnosticCulture  = TB03Util.getDiagnosticCulture(patient);
    	    if(diagnosticCulture!=null) {
    	    	if(diagnosticCulture.getResult()!=null)
    	    		tb03Data.setCultureResult(diagnosticCulture.getResult().getName().getShortName());
    	    	if(diagnosticCulture.getResultDate()!=null)
    	    		tb03Data.setCultureTestDate(sdf.format(diagnosticCulture.getResultDate()));
    	    	tb03Data.setCultureTestNumber(diagnosticCulture.getRealSpecimenId());
    	    }
    	    
    	    
    	   
    	    
    	    //DST
    	    Dst firstDst = TB03Util.getDiagnosticDST(patient);
    	    
    	    if(firstDst!=null) {
    	    	if(firstDst.getDateCollected()!=null)
    	    		tb03Data.setDstCollectionDate(sdf.format(firstDst.getDateCollected()));
    	    	if(firstDst.getResultDate()!=null)
    	    		tb03Data.setDstResultDate(sdf.format(firstDst.getResultDate()));
    	    	List<DstResult> resList = firstDst.getResults();
    	    	String drugName = null;
    	    	String result = null;
    	    	for(DstResult res : resList)
    	    	{
    	    		if(res.getDrug()!=null) {
    	    			drugName = res.getDrug().getShortestName(Context.getLocale(), false).toString();
    	    			result = res.getResult().getName().getShortName();
    	    			tb03Data.getDstResults().put(drugName,result);
    	    			//System.out.println(drugName + "-" + result + " | " + res.getResult());
    	    			
    	    		}
    	    	}
    	    	System.out.println("-------");
    	    }
    	    
    	    
    	    
    	    //DRUG RESISTANCE
    	    
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.RESISTANCE_TYPE);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setDrugResistance(obsList.get(0).getValueCoded().getName().getShortName());
    	    
    	
    	    
    	    //FOLLOW-UP SMEARS
    	    
    	    //first check patient regimen
    	    Smear followupSmear = null;
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.TUBERCULOSIS_PATIENT_CATEGORY);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	regimenConceptId = obsList.get(0).getValueCoded().getConceptId();
    	    
    	    //accordingly look for smears
    	    if(regimenConceptId!=null) {
    	    	if(regimenConceptId.equals(reg1New.getConceptId())) {
    	    		
    	    		tb03Data.setReg1New(Boolean.TRUE);
    	    		
    	    		followupSmear = TB03Util.getFollowupSmear(patient, 2);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth2SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth2SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth2TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 3);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth3SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth3SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth3TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 5);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth5SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth5SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth5TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 6);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth6SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth6SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth6TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	}
    	    	
    	    	else if(regimenConceptId.equals(reg1Rtx.getConceptId())) {
    	    		tb03Data.setReg1Rtx(Boolean.TRUE);
    	    		 followupSmear = TB03Util.getFollowupSmear(patient, 3);
     	    	    if(followupSmear!=null) {
     	    	    		if(followupSmear.getResult()!=null) 
     	    	    			tb03Data.setMonth3SmearResult(followupSmear.getResult().getName().getShortName());
     	    	    		if(followupSmear.getResultDate()!=null)
     	    	    			tb03Data.setMonth3SmearDate(sdf.format(followupSmear.getResultDate()));
     	    	    		
     	    	    		tb03Data.setMonth3TestNumber(followupSmear.getRealSpecimenId());
     	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 4);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth4SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth4SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth4TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 5);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth5SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth5SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth5TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	    
    	    	    followupSmear = TB03Util.getFollowupSmear(patient, 8);
    	    	    if(followupSmear!=null) {
    	    	    		if(followupSmear.getResult()!=null) 
    	    	    			tb03Data.setMonth8SmearResult(followupSmear.getResult().getName().getShortName());
    	    	    		if(followupSmear.getResultDate()!=null)
    	    	    			tb03Data.setMonth8SmearDate(sdf.format(followupSmear.getResultDate()));
    	    	    		
    	    	    		tb03Data.setMonth8TestNumber(followupSmear.getRealSpecimenId());
    	    	    }
    	    	}
    	    }
    	    
    	    //TX OUTCOME
    	    //CHECK CAUSE OF DEATH
    	   
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.CAUSE_OF_DEATH);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    {	
    	    	codId = obsList.get(0).getValueCoded().getConceptId();
    	    	if(codId.equals(Context.getService(TbService.class).getConcept(TbConcepts.DEATH_BY_TB).getConceptId()))
    	    		tb03Data.setDiedOfTB(true);
    	    	else
    	    		tb03Data.setDiedOfTB(false);
    	    }
    	    
    	    else
	    		tb03Data.setDiedOfTB(false);
    	    
    	    
    	    	
    	    
    	    
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.TB_TX_OUTCOME);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null) {
    	    	tb03Data.setTb03TreatmentOutcome(obsList.get(0).getValueCoded().getConceptId());
    	    	
    	    	 q = Context.getService(TbService.class).getConcept(TbConcepts.TX_OUTCOME_DATE);
    	    	    conceptQuestionList.clear();
    	    	    conceptQuestionList.add(q);
    	    	    
    	    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    	    if(obsList.size()>0 && obsList.get(0)!=null) {
    	    	    	tb03Data.setTb03TreatmentOutcomeDate(sdf.format(obsList.get(0).getValueDatetime()));
    	    	    }
    	    }
    	    
    	    //NOTES
    	    
    	    q = Context.getService(TbService.class).getConcept(TbConcepts.CLINICIAN_NOTES);
    	    conceptQuestionList.clear();
    	    conceptQuestionList.add(q);
    	    
    	    obsList = Context.getObsService().getObservations(patientList, null, conceptQuestionList, null, null, null, null, null, null, startDate, endDate, false);
    	    if(obsList.size()>0 && obsList.get(0)!=null)
    	    	tb03Data.setNotes(obsList.get(0).getValueText());
    	    
    	    patientSet.add(tb03Data);
    	    
    	    regimenConceptId = null;
        	codId = null;
        	obsList = null;
    	   
    	}
    	
    	Collections.sort(patientSet);
    	
    	Integer num = patients.getSize();
    	model.addAttribute("num", num);
    	model.addAttribute("patientSet", patientSet);
    	model.addAttribute("locale", Context.getLocale().toString());

    	
    	// TO CHECK WHETHER REPORT IS CLOSED OR NOT
    	Integer report_oblast = null; Integer report_quarter = null; Integer report_month = null;
		if(new PDFHelper().isInt(oblast)) { report_oblast = Integer.parseInt(oblast); }
		if(new PDFHelper().isInt(quarter)) { report_quarter = Integer.parseInt(quarter); }
		if(new PDFHelper().isInt(month)) { report_month = Integer.parseInt(month); }
		
    	boolean reportStatus = Context.getService(TbService.class).readReportStatus(report_oblast, location.getId(), year, report_quarter, report_month, "TB 03");
		System.out.println(reportStatus);
    	model.addAttribute("oblast", oblast);
    	model.addAttribute("location", location);
    	model.addAttribute("year", year);
    	model.addAttribute("quarter", quarter);
    	model.addAttribute("reportDate", sdf.format(new Date()));
    	model.addAttribute("reportStatus", reportStatus);
    	return "/module/dotsreports/reporting/tb03Results";
    }
    
    
  
    
}
