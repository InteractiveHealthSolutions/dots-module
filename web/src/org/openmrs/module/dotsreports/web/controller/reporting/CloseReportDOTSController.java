package org.openmrs.module.dotsreports.web.controller.reporting;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openmrs.Concept;
import org.openmrs.Location;
import org.openmrs.api.context.Context;
import org.openmrs.module.dotsreports.Oblast;
import org.openmrs.module.dotsreports.reporting.PDFHelper;
import org.openmrs.module.dotsreports.service.TbService;
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

@Controller
public class CloseReportDOTSController {

	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(Context.getDateFormat(), true, 10));
        binder.registerCustomEditor(Concept.class, new ConceptEditor());
        binder.registerCustomEditor(Location.class, new LocationEditor());
    }
	
	@RequestMapping(method=RequestMethod.GET, value="/module/dotsreports/reporting/closeReport")
    public void closeReportGet(ModelMap model) {
        System.out.println("-----Close Report GET-----");
        List<Location> locations = Context.getLocationService().getAllLocations(false);
        List<Oblast> oblasts = Context.getService(TbService.class).getOblasts();
        model.addAttribute("locations", locations);
        model.addAttribute("oblasts", oblasts);
	}

	@RequestMapping(method=RequestMethod.POST)//, value="/module/dotsreports/reporting/closeReport"
    public String closeReportPost(
    		HttpServletRequest request, HttpServletResponse response,
    		@RequestParam("oblast") String oblastId, 
    		@RequestParam("location") String locationId, 
    		@RequestParam("year") Integer year, 
    		@RequestParam("quarter") Integer quarter, 
    		@RequestParam("month") Integer month, 
    		@RequestParam("reportDate") String reportDate, 
    		@RequestParam("table") String table, 
    		@RequestParam("reportName") String reportName, 
    		@RequestParam("formPath") String formPath, 
    		ModelMap model) throws EvaluationException, IOException, ServletException {
        System.out.println("-----Close Report POST-----");
		
		Integer oblast = null;
		Integer location = null;
		String date = reportDate;
		String tableData = null;
		boolean reportStatus = false;
		
		Location report_location = null;
    	String report_oblast = oblastId;
        Integer report_year = year;
        String report_quarter = "";
        String report_month = "";
		
        try {
			if(new PDFHelper().isString(quarter)) { 
				report_quarter = Integer.toString(quarter); 
			}
			if(new PDFHelper().isString(month)) { 
				report_month = Integer.toString(month); 
			}
			if(new PDFHelper().isInt(locationId)) { 
				report_location = Context.getLocationService().getLocation(Integer.parseInt(locationId));
				location = report_location.getId(); 
			}
			if(new PDFHelper().isInt(oblastId)) { 
				oblast = (Context.getService(TbService.class).getOblast(Integer.parseInt(oblastId))).getId(); 
			}
			if(!(reportDate.equals(""))) {
				date = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new SimpleDateFormat("dd.MM.yyyy").parse(reportDate)); 
			}
			if(!(table.equals(""))) {
		    	tableData = new PDFHelper().compressCode(table);
			}
			reportStatus = true;
			
//			System.out.println("---POST CLOSE-----");
//	    	System.out.println("oblast: " + oblast);
//	    	System.out.println("location: " + location);
//			System.out.println("year: " + year);
//			System.out.println("quarter: " + quarter);
//			System.out.println("month: " + month);
//			System.out.println("tableData: " + tableData);
//	    	System.out.println("reportDate: " + date);
//	    	System.out.println("formPath: " + formPath);
//	    	System.out.println("reportStatus: " + reportStatus);
//	    	System.out.println("reportName: " + reportName);
//			System.out.println("\n\n\n");
			
			Context.getService(TbService.class).savePDF(oblast, location.toString(), year, quarter, month, date, tableData, reportStatus, reportName);
			model.addAttribute("reportStatus", reportStatus);
			request.getSession().setAttribute("reportStatus", reportStatus);
			
			System.out.println("---POST CLOSE-----");
		} catch (Exception e) {
			reportStatus = false;
			e.printStackTrace();

			model.addAttribute("ex", e); 
			model.addAttribute("reportStatus", reportStatus);
		} 
        
        
        String url = "";
        if(formPath.equals("tb08Results")) {
        	url = TB08Controller.doTB08(report_location, report_oblast, report_year, report_quarter, report_month, model);
	    }
        else if(formPath.equals("tb07Results")) {
        	url = TB07Controller.doTB03(report_location, report_oblast, report_year, report_quarter, report_month, model);
        }
        else if(formPath.equals("tb03Results")) {
        	url = TB03Controller.doTB03(report_location, report_oblast, report_year, report_quarter, report_month, model);
        }
        else if(formPath.equals("dqResults")) {
        	url = DOTSDQController.doDQ(report_location, report_oblast, report_year, report_quarter, report_month, model);
        }
        
        System.out.println("url: " + url);
		return url;
	}
	
}