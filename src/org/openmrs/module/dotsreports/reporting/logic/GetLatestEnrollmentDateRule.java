package org.openmrs.module.dotsreports.reporting.logic;

import java.util.Map;
import java.util.Set;

import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.logic.LogicContext;
import org.openmrs.logic.LogicException;
import org.openmrs.logic.Rule;
import org.openmrs.logic.result.Result;
import org.openmrs.logic.result.Result.Datatype;
import org.openmrs.logic.rule.RuleParameterInfo;

public class GetLatestEnrollmentDateRule implements Rule {
    
	public Result eval(LogicContext context, Patient patient, Map<String, Object> parameters) throws LogicException {
        Result lastProgram = context.read(patient, context.getLogicDataSource("pihprogram"), "MDR-TB PROGRAM");
        return lastProgram;
        
    }
    
    /**
     * @see org.openmrs.logic.Rule#getChildRules()
     */
    public String[] getDependencies() {
        // TODO Auto-generated method stub
        return null;
    }
    
    /**
     * @see org.openmrs.logic.Rule#getDefaultDatatype()
     */
    public Datatype getDefaultDatatype() {
        // TODO Auto-generated method stub
        return null;
    }
    
    /**
     * @see org.openmrs.logic.Rule#getParameterList()
     */
    public Set<RuleParameterInfo> getParameterList() {
        // TODO Auto-generated method stub
        return null;
    }
    
    /**
     * @see org.openmrs.logic.Rule#getTTL()
     */
    public int getTTL() {
        // TODO Auto-generated method stub
        return 0;
    }

}
