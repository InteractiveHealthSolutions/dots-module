package org.openmrs.module.dotsreports.reporting;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.service.TbService;
import org.openmrs.module.dotsreports.specimen.Dst;
import org.openmrs.module.dotsreports.specimen.HAIN;
import org.openmrs.module.dotsreports.specimen.Smear;
import org.openmrs.module.dotsreports.specimen.Culture;
import org.openmrs.module.dotsreports.specimen.Specimen;
import org.openmrs.module.dotsreports.specimen.Xpert;

public class TB03Util {

	
	public static Culture getDiagnosticCulture(Patient patient) {
		Culture c = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			if(specimen.getMonthOfTreatment()!=null && specimen.getMonthOfTreatment()==0) {
				if(specimen.getCultures().size()>0) {
					c = specimen.getCultures().get(0);
					break;
				}
					
			}
		
		}
		
		return c;
	}
	
	public static Xpert getFirstXpert(Patient patient) {
		Xpert c = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			if(specimen.getXperts()!=null && specimen.getXperts().size() > 0) {
					c = specimen.getXperts().get(0);
					break;
				}
		}
		
		return c;
	}
	
	public static HAIN getFirstHAIN(Patient patient) {
		HAIN c = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			if(specimen.getHAINs()!=null && specimen.getHAINs().size() > 0) {
				c = specimen.getHAINs().get(0);
				break;
			}
		
		}
		
		return c;
	}
	
	public static Smear getDiagnosticSmear(Patient patient) {
		Smear c = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			if(specimen.getMonthOfTreatment()!=null && specimen.getMonthOfTreatment()==0) {
				if(specimen.getSmears().size()>0) {
					c = specimen.getSmears().get(0);
					break;
				}
					
			}
		
		}
		
		return c;
	}
	
	public static Smear getFollowupSmear(Patient patient, Integer month) {
		Smear c = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			if(specimen.getMonthOfTreatment()!=null && specimen.getMonthOfTreatment()==month.intValue()) {
				if(specimen.getSmears().size()>0) {
					c = specimen.getSmears().get(0);
					break;
				}
					
			}
		
		}
		
		return c;
	}
	
	public static Dst getDiagnosticDST(Patient patient) {
		Dst d = null;
		
		for (Specimen specimen : Context.getService(TbService.class).getSpecimens(patient)) {//, startDateCollected, endDateCollected)) {
			
				if(specimen.getDsts().size()>0) {
					d = specimen.getDsts().get(0);
					break;
				}
					
		}
		
		return d;
	}
	
	//find out which date and before or after
	//also to use sample collection date of test or other date?
	public static Specimen getClosestTestTo(List<Specimen> tests, Date date) {
		
		Specimen min = tests.get(0);
		long minDiff = 0;
		long diffInTime = 0;
		GregorianCalendar dateCal = new GregorianCalendar();
		dateCal.setTime(date);
		dateCal.set(Calendar.HOUR,0);
		dateCal.set(Calendar.MINUTE, 0);
		dateCal.set(Calendar.SECOND, 0);
		dateCal.set(Calendar.MILLISECOND, 1);
		
		GregorianCalendar testCal = new GregorianCalendar();
		testCal.setTime(min.getDateCollected());
		testCal.set(Calendar.HOUR,0);
		testCal.set(Calendar.MINUTE, 0);
		testCal.set(Calendar.SECOND, 0);
		testCal.set(Calendar.MILLISECOND, 1);
		
		diffInTime = dateCal.getTimeInMillis()-testCal.getTimeInMillis();
		
		minDiff = Math.abs(diffInTime);
		
		for(int i=1; i<tests.size(); i++) {
			testCal.setTime(tests.get(i).getDateCollected());
			testCal.set(Calendar.HOUR,0);
			testCal.set(Calendar.MINUTE, 0);
			testCal.set(Calendar.SECOND, 0);
			testCal.set(Calendar.MILLISECOND, 1);
			
			diffInTime = dateCal.getTimeInMillis()-testCal.getTimeInMillis();
			
			diffInTime = Math.abs(diffInTime);
			
			if(diffInTime < minDiff) {
				minDiff = diffInTime;
				min = tests.get(i);
			}
			
			
		}
		
		return min;
		
	}
	
	
	
}
