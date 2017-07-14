package org.openmrs.module.dotsreports.reporting;

import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.dotsreports.specimen.Dst;
import org.openmrs.module.dotsreports.specimen.HAIN;
import org.openmrs.module.dotsreports.specimen.Smear;
import org.openmrs.module.dotsreports.specimen.Culture;
import org.openmrs.module.dotsreports.specimen.Specimen;
import org.openmrs.module.dotsreports.specimen.Xpert;

public class DQUtil {

	
	public static double timeDiffInWeeks(long milli) {
		
		double diff = 0;
		
		diff = milli*1000*60*24*7;
		
		return diff;
	}
	
	
	
}
