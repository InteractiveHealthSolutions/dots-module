package org.openmrs.module.dotsreports.reporting.definition;

import java.util.List;
import java.util.Map;

import org.openmrs.Cohort;
import org.openmrs.ProgramWorkflowState;
import org.openmrs.annotation.Handler;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.TbConcepts;
import org.openmrs.module.dotsreports.exception.MdrtbAPIException;
import org.openmrs.module.dotsreports.program.TbPatientProgram;
import org.openmrs.module.dotsreports.reporting.ReportUtil;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.reporting.cohort.definition.CohortDefinition;
import org.openmrs.module.reporting.cohort.definition.evaluator.CohortDefinitionEvaluator;
import org.openmrs.module.reporting.evaluation.EvaluationContext;

@Handler(supports={DotsMdrtbPatientProgramStateCohortDefinition.class})
public class DotsMdrtbPatientProgramStateCohortDefinitionEvaluator implements CohortDefinitionEvaluator  {

	/**
	 * Default Evaluator
	 */
	public DotsMdrtbPatientProgramStateCohortDefinitionEvaluator(){
	}
	
    public Cohort evaluate(CohortDefinition cohortDefinition, EvaluationContext context) {
	
    	DotsMdrtbPatientProgramStateCohortDefinition cd = (DotsMdrtbPatientProgramStateCohortDefinition) cohortDefinition;
    	Cohort baseCohort = (context.getBaseCohort() != null ? context.getBaseCohort() : new Cohort(Context.getPatientService().getAllPatients()));
    	Cohort resultCohort = new Cohort();
    	
    	Map<Integer,List<TbPatientProgram>> mdrtbPatientProgramsMap = ReportUtil.getMdrtbPatientProgramsInDateRangeMap(cd.getStartDate(), cd.getEndDate());
    	
    	for (int id : baseCohort.getMemberIds()) {
    		// first we need to find out what program(s) the patient was on during a given time period
    		List<TbPatientProgram> programs = mdrtbPatientProgramsMap.get(id);
    		
    		// only continue if the patient was in a program during this time period
    		if (programs != null && programs.size() != 0) {
    			
    			// by convention, operate on the most recent program during the time period (there really should only ever be one program in a single period)
    			TbPatientProgram program = programs.get(programs.size() - 1);
    			ProgramWorkflowState state;
    			
    			// figure out what workflow state we want to operate on
    			if (cd.getWorkflowConcept().equals(Context.getService(TbService.class).getConcept(TbConcepts.CAT_4_CLASSIFICATION_PREVIOUS_DRUG_USE))) {
    				state = program.getClassificationAccordingToPreviousDrugUse();
    			}
    			else if (cd.getWorkflowConcept().equals(Context.getService(TbService.class).getConcept(TbConcepts.CAT_4_CLASSIFICATION_PREVIOUS_TX))) {
    				state = program.getClassificationAccordingToPreviousTreatment();
    			}
    			else if (cd.getWorkflowConcept().equals(Context.getService(TbService.class).getConcept(TbConcepts.MDR_TB_TX_OUTCOME))) {
    				state = program.getOutcome();
    			}
    			else {
    				throw new MdrtbAPIException("Invalid workflow " + cd.getWorkflowConcept() + " assigned to MdrtbRegistrationGroupCohortDefinition.");
    			}
    			
    			// test the null case 
    			if ((cd.getStateConcepts() == null || cd.getStateConcepts().isEmpty()) && state == null) {
    				// if the state parameter has been set to null, or is empty, by convention we define that to mean that the patient state should be null) {
    				resultCohort.addMember(id);
    			}
    			// test to see if the current patient state is within the definition set
    			else if (cd.getStateConcepts() != null && !cd.getStateConcepts().isEmpty() && state != null
    						&& cd.getStateConcepts().contains(state.getConcept())) {
    				resultCohort.addMember(id);
    			}
    		}
    	}	
	    return resultCohort;
    }

}
