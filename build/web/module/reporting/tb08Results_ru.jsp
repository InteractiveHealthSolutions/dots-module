<%@ page contentType="text/html; charset=UTF-8" %>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<html>
	<head>
		<title>ТБ 08</title>
	</head>
	<body>
		<style>
			th {vertical-align:top; text-align:center;}
			th, td {font-size:smaller;border: 1px solid #000000}
			border {border: 1px solid #000000}

		</style>
		<div style="font-size:smaller; width:980px;">
			<table width="100%" border="0">
			<tr>
				<td align="left" width="90%" style="font-size:14px; font-weight:bold;border:0px">&nbsp;   
				</td>
				<td align="right" width="10%" style="font-size:14px; font-weight:bold;border:0px">ТБ 08</td>
			</tr>
			<tr><td style="font-size:14px; font-weight:bold;border:0px">&nbsp;</td><td style="font-size:14px; font-weight:bold;border:0px">&nbsp;</td></tr>
			<tr>
				
				<td width="90%" align="center" style="font-size:14px; font-weight:bold;border:0px">
						Квартальный отчет о результатах лечения случаев ТБ, выявленных 12-15 месяцев назад
				</td>
				<td width="10%" align="right" style="font-size:14px; font-weight:bold;border:0px;" valign="top" border="0">&nbsp;</td>
			</tr></table>
			<br/><br/>
		<table border="1" width="100%">
		<tr>
		<td>
		Наименование учреждения:______________________ <br/>
		Область/район:  <u> ${ location } </u><br/>
		ФИО координатора по ТБ: ____________________Подпись: ____________<br/>
		</td>
		
		<td>
		Случаи ТБ, выявленные за <u> ${ quarter } </u> квартал  <u> ${ year } </u> года <br/>
		Дата отчета: ${reportDate }
		</td>
		</tr>
		</table>	
		<br/><br/>	
			
	
		<table border="1" cellpadding="1" cellspacing="1" style="width: 900px;">
			<tbody>
				<tr>
					<td rowspan="2">
						&nbsp;</td>
					<td rowspan="2">
						&nbsp;</td>
					<td rowspan="2" style="text-align: center;">
						Выявлено, всего</td>
					<td rowspan="2">
						<div style="text-align: center;">
							Когорта, подлежащая оценке &nbsp;</div>
						
					</td>
					<td rowspan="2" style="text-align: center;">
						Излечен</td>
					<td rowspan="2">
						<div style="text-align: center;">
							Лечение&nbsp;</div>
						<div style="text-align: center;">
							завершено &nbsp;</div>
					</td>
					<td colspan="2" rowspan="1">
						<div style="text-align: center;">
							Умер &nbsp;</div>
						<p style="text-align: center;">
							&nbsp;</p>
					</td>
					<td rowspan="2" style="text-align: center;">
						Неэффективное<br/> лечение</td>
					<td rowspan="2" style="text-align: center;">
						Потерян для<br/>последующего<br/>наблюдения</td>
					
					<td rowspan="2">
						<div style="text-align: center;">
							Итого &nbsp;</div>
						<div style="text-align: center;">
							(3+4+5+6+7+8)&nbsp;</div>
						
					</td>
					<td rowspan="2">
						<div style="text-align: center;">
							Начал лечение по  </div>
						<div style="text-align: center;">
							Режиму II&nbsp;</div>
					</td>
					<td rowspan="2">
						<div style="text-align: center;">
							Диагноз </div>
						<div style="text-align: center;">
							снят&nbsp;</div>
					</td>
					<td rowspan="2">
						<div style="text-align: center;">
							Не имеют   &nbsp;</div>
						<div style="text-align: center;">
							результат&nbsp;</div>
						
					</td>
					
				</tr>
				<tr align="center">
					<td>
						от ТБ</td>
					<td>
						от других<br/>причин</td>
					
				</tr>
				<tr align="center">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>
						1</td>
					<td>
						2</td>
					<td>
						3</td>
					<td>
						4</td>
					<td>
						5</td>
					<td>
						6</td>
					<td>
						7</td>
					<td>
						8</td>
					<td>
						9</td>
					<td>
						10</td>
					<td>
						11</td>
					<td>
						12</td>
					
				</tr>
				<tr>
					<td style="font: bold;">
						1</td>
					<td style="font: bold;">
						Новые случаи</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				
					
					
				</tr>
				<tr>
					<td>
						1.1</td>
					<td>
						Л ТБ с БП &nbsp;</td>
					<td>
						${table1.newPulmonaryBCDetected }</td>
					<td>
						${table1.newPulmonaryBCEligible }</td>
					<td>
						${table1.newPulmonaryBCCured }</td>
					<td>
						${table1.newPulmonaryBCCompleted }</td>
					<td>
						${table1.newPulmonaryBCDiedTB }</td>
					<td>
						${table1.newPulmonaryBCDiedNotTB}</td>
					<td>
						${table1.newPulmonaryBCFailed }</td>
					<td>
						${table1.newPulmonaryBCDefaulted }</td>
					<td>
						${table1.newPulmonaryBCEligible }</td>
					<td>
						${table1.newPulmonaryBCSLD }</td>
					<td>
						${table1.newPulmonaryBCCanceled }</td>
					<td>
						${table1.newPulmonaryBCDetected - (table1.newPulmonaryBCEligible + table1.newPulmonaryBCSLD + table1.newPulmonaryBCCanceled) }</td>
				</tr>
				<tr>
					<td>
						1.1.1</td>
					<td>
						0-4&nbsp;</td>
					<td>
						${table1.newPulmonaryBCDetected04 }</td>
					<td>
						${table1.newPulmonaryBCEligible04 }</td>
					<td>
						${table1.newPulmonaryBCCured04 }</td>
					<td>
						${table1.newPulmonaryBCCompleted04 }</td>
					<td>
						${table1.newPulmonaryBCDiedTB04 }</td>
					<td>
						${table1.newPulmonaryBCDiedNotTB04}</td>
					<td>
						${table1.newPulmonaryBCFailed04 }</td>
					<td>
						${table1.newPulmonaryBCDefaulted04 }</td>
					<td>
						${table1.newPulmonaryBCEligible04 }</td>
					<td>
						${table1.newPulmonaryBCSLD04 }</td>
					<td>
						${table1.newPulmonaryBCCanceled04 }</td>
					
					<td>
						${table1.newPulmonaryBCDetected04 - (table1.newPulmonaryBCEligible04 + table1.newPulmonaryBCSLD04 + table1.newPulmonaryBCCanceled04) }</td>
					
				</tr>
				<tr>
					<td>
						1.1.2</td>
					<td>
						5-14&nbsp;</td>
					<td>
						${table1.newPulmonaryBCDetected0514 }</td>
					<td>
						${table1.newPulmonaryBCEligible0514 }</td>
					<td>
						${table1.newPulmonaryBCCured0514 }</td>
					<td>
						${table1.newPulmonaryBCCompleted0514 }</td>
					<td>
						${table1.newPulmonaryBCDiedTB0514 }</td>
					<td>
						${table1.newPulmonaryBCDiedNotTB0514}</td>
					<td>
						${table1.newPulmonaryBCFailed0514 }</td>
					<td>
						${table1.newPulmonaryBCDefaulted0514 }</td>
					<td>
						${table1.newPulmonaryBCEligible0514 }</td>
					<td>
						${table1.newPulmonaryBCSLD0514 }</td>
					<td>
						${table1.newPulmonaryBCCanceled0514 }</td>
						<td>
						${table1.newPulmonaryBCDetected0514 - (table1.newPulmonaryBCEligible0514 + table1.newPulmonaryBCSLD0514 + table1.newPulmonaryBCCanceled0514) }</td>
				</tr>
				<tr>
					<td>
						1.1.3</td>
					<td>
						15-17&nbsp;</td>
					<td>
						${table1.newPulmonaryBCDetected1517 }</td>
					<td>
						${table1.newPulmonaryBCEligible1517 }</td>
					<td>
						${table1.newPulmonaryBCCured1517 }</td>
					<td>
						${table1.newPulmonaryBCCompleted1517 }</td>
					<td>
						${table1.newPulmonaryBCDiedTB1517 }</td>
					<td>
						${table1.newPulmonaryBCDiedNotTB1517}</td>
					<td>
						${table1.newPulmonaryBCFailed1517 }</td>
					<td>
						${table1.newPulmonaryBCDefaulted1517 }</td>
					<td>
						${table1.newPulmonaryBCEligible1517 }</td>
					<td>
						${table1.newPulmonaryBCSLD1517 }</td>
					<td>
						${table1.newPulmonaryBCCanceled1517 }</td>
					<td>
						${table1.newPulmonaryBCDetected1517 - (table1.newPulmonaryBCEligible1517 + table1.newPulmonaryBCSLD1517 + table1.newPulmonaryBCCanceled1517) }</td>
				</tr>
				<tr>
					<td>
						1.2</td>
					<td>
						Л ТБ с КУ </td>
					<td>
						${table1.newPulmonaryCDDetected }</td>
					<td>
						${table1.newPulmonaryCDEligible }</td>
					<td>
						${table1.newPulmonaryCDCured }</td>
					<td>
						${table1.newPulmonaryCDCompleted }</td>
					<td>
						${table1.newPulmonaryCDDiedTB }</td>
					<td>
						${table1.newPulmonaryCDDiedNotTB}</td>
					<td>
						${table1.newPulmonaryCDFailed }</td>
					<td>
						${table1.newPulmonaryCDDefaulted }</td>
					<td>
						${table1.newPulmonaryCDEligible }</td>
					<td>
						${table1.newPulmonaryCDSLD }</td>
					<td>
						${table1.newPulmonaryCDCanceled }</td>
					<td>
						${table1.newPulmonaryCDDetected - (table1.newPulmonaryCDEligible + table1.newPulmonaryCDSLD + table1.newPulmonaryCDCanceled ) }</td>
					
				</tr>
				<tr>
					<td>
						1.2.1</td>
					<td>
						0-4</td>
					<td>
						${table1.newPulmonaryCDDetected04 }</td>
					<td>
						${table1.newPulmonaryCDEligible04 }</td>
					<td>
						${table1.newPulmonaryCDCured04 }</td>
					<td>
						${table1.newPulmonaryCDCompleted04 }</td>
					<td>
						${table1.newPulmonaryCDDiedTB04 }</td>
					<td>
						${table1.newPulmonaryCDDiedNotTB}</td>
					<td>
						${table1.newPulmonaryCDFailed04 }</td>
					<td>
						${table1.newPulmonaryCDDefaulted04 }</td>
					<td>
						${table1.newPulmonaryCDEligible04 }</td>
					<td>
						${table1.newPulmonaryCDSLD04 }</td>
					<td>
						${table1.newPulmonaryCDCanceled04 }</td>
					<td>
						${table1.newPulmonaryCDDetected04 - (table1.newPulmonaryCDEligible04 + table1.newPulmonaryCDSLD04 + table1.newPulmonaryCDCanceled04 ) }</td>
				</tr>
				<tr>
					<td>
						1.2.2</td>
					<td>
						5-14</td>
					<td>
						${table1.newPulmonaryCDDetected0514 }</td>
					<td>
						${table1.newPulmonaryCDEligible0514 }</td>
					<td>
						${table1.newPulmonaryCDCured0514 }</td>
					<td>
						${table1.newPulmonaryCDCompleted0514 }</td>
					<td>
						${table1.newPulmonaryCDDiedTB0514 }</td>
					<td>
						${table1.newPulmonaryCDDiedNotTB}</td>
					<td>
						${table1.newPulmonaryCDFailed0514 }</td>
					<td>
						${table1.newPulmonaryCDDefaulted0514 }</td>
					<td>
						${table1.newPulmonaryCDEligible0514 }</td>
					<td>
						${table1.newPulmonaryCDSLD0514 }</td>
					
					<td>
						${table1.newPulmonaryCDCanceled0514 }</td>
					<td>
						${table1.newPulmonaryCDDetected0514 - (table1.newPulmonaryCDEligible0514 + table1.newPulmonaryCDSLD0514 + table1.newPulmonaryCDCanceled0514 ) }</td>
					
				</tr>
				<tr>
					<td>
						1.2.3</td>
					<td>
						15-17</td>
					<td>
						${table1.newPulmonaryCDDetected1517 }</td>
					<td>
						${table1.newPulmonaryCDEligible1517 }</td>
					<td>
						${table1.newPulmonaryCDCured1517 }</td>
					<td>
						${table1.newPulmonaryCDCompleted1517 }</td>
					<td>
						${table1.newPulmonaryCDDiedTB1517 }</td>
					<td>
						${table1.newPulmonaryCDDiedNotTB}</td>
					<td>
						${table1.newPulmonaryCDFailed1517 }</td>
					<td>
						${table1.newPulmonaryCDDefaulted1517 }</td>
					<td>
						${table1.newPulmonaryCDEligible1517 }</td>
					<td>
						${table1.newPulmonaryCDSLD1517 }</td>
					<td>
						${table1.newPulmonaryCDCanceled1517 }</td>
					<td>
						${table1.newPulmonaryCDDetected0514 - (table1.newPulmonaryCDEligible0514 + table1.newPulmonaryCDSLD0514 + table1.newPulmonaryCDCanceled0514 ) }</td>
						
				</tr>
				<tr>
					<td>
						&nbsp;1.3</td>
					<td>
						ВЛ ТБ</td>
					<td>
						${table1.newExtrapulmonaryDetected }</td>
					<td>
						${table1.newExtrapulmonaryEligible }</td>
					<td>
						${table1.newExtrapulmonaryCured }</td>
					<td>
						${table1.newExtrapulmonaryCompleted }</td>
					<td>
						${table1.newExtrapulmonaryDiedTB }</td>
					<td>
						${table1.newExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.newExtrapulmonaryFailed }</td>
					<td>
						${table1.newExtrapulmonaryDefaulted }</td>
					<td>
						${table1.newExtrapulmonaryEligible }</td>
					<td>
						${table1.newExtrapulmonarySLD }</td>
					<td>
						${table1.newExtrapulmonaryCanceled }</td>
					<td>
						${table1.newExtrapulmonaryDetected - (table1.newExtrapulmonaryEligible + table1.newExtrapulmonarySLD + table1.newExtrapulmonaryCanceled ) }</td>
				</tr>
				<tr>
					<td>
						1.3.1</td>
					<td>
						0-4</td>
					<td>
						${table1.newExtrapulmonaryDetected04 }</td>
					<td>
						${table1.newExtrapulmonaryEligible04 }</td>
					<td>
						${table1.newExtrapulmonaryCured04 }</td>
					<td>
						${table1.newExtrapulmonaryCompleted04 }</td>
					<td>
						${table1.newExtrapulmonaryDiedTB04 }</td>
					<td>
						${table1.newExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.newExtrapulmonaryFailed04 }</td>
					<td>
						${table1.newExtrapulmonaryDefaulted04 }</td>
					<td>
						${table1.newExtrapulmonaryEligible04 }</td>
					<td>
						${table1.newExtrapulmonarySLD04 }</td>
					<td>
						${table1.newExtrapulmonaryCanceled04 }</td>
					<td>
						${table1.newExtrapulmonaryDetected04 - (table1.newExtrapulmonaryEligible04 + table1.newExtrapulmonarySLD04 + table1.newExtrapulmonaryCanceled04 ) }</td>
					
				</tr>
				<tr>
					<td>
						1.3.2</td>
					<td>
						5-14</td>
					<td>
						${table1.newExtrapulmonaryDetected0514 }</td>
					<td>
						${table1.newExtrapulmonaryEligible0514 }</td>
					<td>
						${table1.newExtrapulmonaryCured0514 }</td>
					<td>
						${table1.newExtrapulmonaryCompleted0514 }</td>
					<td>
						${table1.newExtrapulmonaryDiedTB0514 }</td>
					<td>
						${table1.newExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.newExtrapulmonaryFailed0514 }</td>
					<td>
						${table1.newExtrapulmonaryDefaulted0514 }</td>
					<td>
						${table1.newExtrapulmonaryEligible0514 }</td>
					<td>
						${table1.newExtrapulmonarySLD0514 }</td>
					<td>
						${table1.newExtrapulmonaryCanceled0514 }</td>
					<td>
						${table1.newExtrapulmonaryDetected0514 - (table1.newExtrapulmonaryEligible0514 + table1.newExtrapulmonarySLD0514 + table1.newExtrapulmonaryCanceled0514 ) }</td>
				</tr>
				<tr>
					<td>
						1.3.3</td>
					<td>
						15-17</td>
					<td>
						${table1.newExtrapulmonaryDetected1517 }</td>
					<td>
						${table1.newExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.newExtrapulmonaryCured1517 }</td>
					<td>
						${table1.newExtrapulmonaryCompleted1517 }</td>
					<td>
						${table1.newExtrapulmonaryDiedTB1517 }</td>
					<td>
						${table1.newExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.newExtrapulmonaryFailed1517 }</td>
					<td>
						${table1.newExtrapulmonaryDefaulted1517 }</td>
					<td>
						${table1.newExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.newExtrapulmonarySLD1517 }</td>
					<td>
						${table1.newExtrapulmonaryCanceled1517 }</td>
					<td>
						${table1.newExtrapulmonaryDetected1517 - (table1.newExtrapulmonaryEligible1517 + table1.newExtrapulmonarySLD1517 + table1.newExtrapulmonaryCanceled1517 ) }</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td style="font: bold;">
						Итого(1.1+1.2+1.3)</td>
					<td>
						${ table1.newPulmonaryBCDetected + table1.newPulmonaryCDDetected + table1.newExtrapulmonaryDetected }</td>
					<td>
						${ table1.newPulmonaryBCEligible + table1.newPulmonaryCDEligible + table1.newExtrapulmonaryEligible }</td>
					<td>
						${ table1.newPulmonaryBCCured + table1.newPulmonaryCDCured + table1.newExtrapulmonaryCured }</td></td>
					<td>
						${ table1.newPulmonaryBCCompleted + table1.newPulmonaryCDCompleted + table1.newExtrapulmonaryCompleted }</td>
					<td>
						${ table1.newPulmonaryBCDiedTB + table1.newPulmonaryCDDiedTB + table1.newExtrapulmonaryDiedTB }</td>
					<td>
						${ table1.newPulmonaryBCDiedNotTB + table1.newPulmonaryCDDiedNotTB + table1.newExtrapulmonaryDiedNotTB }</td>
					<td>
						${ table1.newPulmonaryBCFailed + table1.newPulmonaryCDFailed + table1.newExtrapulmonaryFailed }</td>
					<td>
						${ table1.newPulmonaryBCDefaulted + table1.newPulmonaryCDDefaulted + table1.newExtrapulmonaryDefaulted }</td>
					<td>
						${ table1.newPulmonaryBCEligible + table1.newPulmonaryCDEligible + table1.newExtrapulmonaryEligible }</td>
					<td>
						${ table1.newPulmonaryBCSLD + table1.newPulmonaryCDSLD + table1.newExtrapulmonarySLD }</td>
					<td>
						${ table1.newPulmonaryBCCanceled + table1.newPulmonaryCDCanceled + table1.newExtrapulmonaryCanceled }</td>
					<td>
						${ table1.newPulmonaryBCDetected + table1.newPulmonaryCDDetected + table1.newExtrapulmonaryDetected - (table1.newPulmonaryBCEligible + table1.newPulmonaryCDEligible + table1.newExtrapulmonaryEligible + table1.newPulmonaryBCSLD + table1.newPulmonaryCDSLD + table1.newExtrapulmonarySLD + table1.newPulmonaryBCCanceled + table1.newPulmonaryCDCanceled + table1.newExtrapulmonaryCanceled) }</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						0-4</td>
					<td>
						${ table1.newPulmonaryBCDetected04 + table1.newPulmonaryCDDetected04 + table1.newExtrapulmonaryDetected04 }</td>
					<td>
						${ table1.newPulmonaryBCEligible04 + table1.newPulmonaryCDEligible04 + table1.newExtrapulmonaryEligible04 }</td>
					<td>
						${ table1.newPulmonaryBCCured04 + table1.newPulmonaryCDCured04 + table1.newExtrapulmonaryCured04 }</td></td>
					<td>
						${ table1.newPulmonaryBCCompleted04 + table1.newPulmonaryCDCompleted04 + table1.newExtrapulmonaryCompleted04 }</td>
					<td>
						${ table1.newPulmonaryBCDiedTB04 + table1.newPulmonaryCDDiedTB04 + table1.newExtrapulmonaryDiedTB04 }</td>
					<td>
						${ table1.newPulmonaryBCDiedNotTB04 + table1.newPulmonaryCDDiedNotTB04 + table1.newExtrapulmonaryDiedNotTB04 }</td>
					<td>
						${ table1.newPulmonaryBCFailed04 + table1.newPulmonaryCDFailed04 + table1.newExtrapulmonaryFailed04 }</td>
					<td>
						${ table1.newPulmonaryBCDefaulted04 + table1.newPulmonaryCDDefaulted04 + table1.newExtrapulmonaryDefaulted04 }</td>
					<td>
						${ table1.newPulmonaryBCEligible04 + table1.newPulmonaryCDEligible04 + table1.newExtrapulmonaryEligible04 }</td>
					<td>
						${ table1.newPulmonaryBCSLD04 + table1.newPulmonaryCDSLD04 + table1.newExtrapulmonarySLD04 }</td>
					<td>
						${ table1.newPulmonaryBCCanceled04 + table1.newPulmonaryCDCanceled04 + table1.newExtrapulmonaryCanceled04 }</td>
					<td>
						${ table1.newPulmonaryBCDetected04 + table1.newPulmonaryCDDetected04 + table1.newExtrapulmonaryDetected04 - (table1.newPulmonaryBCEligible04 + table1.newPulmonaryCDEligible04 + table1.newExtrapulmonaryEligible04 + table1.newPulmonaryBCSLD04 + table1.newPulmonaryCDSLD04 + table1.newExtrapulmonarySLD04 + table1.newPulmonaryBCCanceled04 + table1.newPulmonaryCDCanceled04 + table1.newExtrapulmonaryCanceled04) }</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						5-14</td>
					<td>
						${ table1.newPulmonaryBCDetected0514 + table1.newPulmonaryCDDetected0514 + table1.newExtrapulmonaryDetected0514 }</td>
					<td>
						${ table1.newPulmonaryBCEligible0514 + table1.newPulmonaryCDEligible0514 + table1.newExtrapulmonaryEligible0514 }</td>
					<td>
						${ table1.newPulmonaryBCCured0514 + table1.newPulmonaryCDCured0514 + table1.newExtrapulmonaryCured0514 }</td></td>
					<td>
						${ table1.newPulmonaryBCCompleted0514 + table1.newPulmonaryCDCompleted0514 + table1.newExtrapulmonaryCompleted0514 }</td>
					<td>
						${ table1.newPulmonaryBCDiedTB0514 + table1.newPulmonaryCDDiedTB0514 + table1.newExtrapulmonaryDiedTB0514 }</td>
					<td>
						${ table1.newPulmonaryBCDiedNotTB0514 + table1.newPulmonaryCDDiedNotTB0514 + table1.newExtrapulmonaryDiedNotTB0514 }</td>
					<td>
						${ table1.newPulmonaryBCFailed0514 + table1.newPulmonaryCDFailed0514 + table1.newExtrapulmonaryFailed0514 }</td>
					<td>
						${ table1.newPulmonaryBCDefaulted0514 + table1.newPulmonaryCDDefaulted0514 + table1.newExtrapulmonaryDefaulted0514 }</td>
					<td>
						${ table1.newPulmonaryBCEligible0514 + table1.newPulmonaryCDEligible0514 + table1.newExtrapulmonaryEligible0514 }</td>
					<td>
						${ table1.newPulmonaryBCSLD0514 + table1.newPulmonaryCDSLD0514 + table1.newExtrapulmonarySLD0514 }</td>
					<td>
						${ table1.newPulmonaryBCCanceled0514 + table1.newPulmonaryCDCanceled0514 + table1.newExtrapulmonaryCanceled0514 }</td>
					<td>
						${ table1.newPulmonaryBCDetected0514 + table1.newPulmonaryCDDetected0514 + table1.newExtrapulmonaryDetected0514 - (table1.newPulmonaryBCEligible0514 + table1.newPulmonaryCDEligible0514 + table1.newExtrapulmonaryEligible0514 + table1.newPulmonaryBCSLD0514 + table1.newPulmonaryCDSLD0514 + table1.newExtrapulmonarySLD0514 + table1.newPulmonaryBCCanceled0514 + table1.newPulmonaryCDCanceled0514 + table1.newExtrapulmonaryCanceled0514) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						15-17</td>
					<td>
						${ table1.newPulmonaryBCDetected1517 + table1.newPulmonaryCDDetected1517 + table1.newExtrapulmonaryDetected1517 }</td>
					<td>
						${ table1.newPulmonaryBCEligible1517 + table1.newPulmonaryCDEligible1517 + table1.newExtrapulmonaryEligible1517 }</td>
					<td>
						${ table1.newPulmonaryBCCured1517 + table1.newPulmonaryCDCured1517 + table1.newExtrapulmonaryCured1517 }</td></td>
					<td>
						${ table1.newPulmonaryBCCompleted1517 + table1.newPulmonaryCDCompleted1517 + table1.newExtrapulmonaryCompleted1517 }</td>
					<td>
						${ table1.newPulmonaryBCDiedTB1517 + table1.newPulmonaryCDDiedTB1517 + table1.newExtrapulmonaryDiedTB1517 }</td>
					<td>
						${ table1.newPulmonaryBCDiedNotTB1517 + table1.newPulmonaryCDDiedNotTB1517 + table1.newExtrapulmonaryDiedNotTB1517 }</td>
					<td>
						${ table1.newPulmonaryBCFailed1517 + table1.newPulmonaryCDFailed1517 + table1.newExtrapulmonaryFailed1517 }</td>
					<td>
						${ table1.newPulmonaryBCDefaulted1517 + table1.newPulmonaryCDDefaulted1517 + table1.newExtrapulmonaryDefaulted1517 }</td>
					<td>
						${ table1.newPulmonaryBCEligible1517 + table1.newPulmonaryCDEligible1517 + table1.newExtrapulmonaryEligible1517 }</td>
					<td>
						${ table1.newPulmonaryBCSLD1517 + table1.newPulmonaryCDSLD1517 + table1.newExtrapulmonarySLD1517 }</td>
					<td>
						${ table1.newPulmonaryBCCanceled1517 + table1.newPulmonaryCDCanceled1517 + table1.newExtrapulmonaryCanceled1517 }</td>
					<td>
						${ table1.newPulmonaryBCDetected1517 + table1.newPulmonaryCDDetected1517 + table1.newExtrapulmonaryDetected1517 - (table1.newPulmonaryBCEligible1517 + table1.newPulmonaryCDEligible1517 + table1.newExtrapulmonaryEligible1517 + table1.newPulmonaryBCSLD1517 + table1.newPulmonaryCDSLD1517 + table1.newExtrapulmonarySLD1517 + table1.newPulmonaryBCCanceled1517 + table1.newPulmonaryCDCanceled1517 + table1.newExtrapulmonaryCanceled1517) }</td>
				</tr>
				<tr>
					<td style="font: bold;">
						2</td>
					<td style="font: bold;">
						Рецидивы</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr>
					<td>
						2.1</td>
					<td>
						Л ТБ с БП </td>
					<td>
						${table1.relapsePulmonaryBCDetected }</td>
					<td>
						${table1.relapsePulmonaryBCEligible }</td>
					<td>
						${table1.relapsePulmonaryBCCured }</td>
					<td>
						${table1.relapsePulmonaryBCCompleted }</td>
					<td>
						${table1.relapsePulmonaryBCDiedTB }</td>
					<td>
						${table1.relapsePulmonaryBCDiedNotTB}</td>
					<td>
						${table1.relapsePulmonaryBCFailed }</td>
					<td>
						${table1.relapsePulmonaryBCDefaulted }</td>
					<td>
						${table1.relapsePulmonaryBCEligible }</td>
					<td>
						${table1.relapsePulmonaryBCSLD }</td>
					<td>
						${table1.relapsePulmonaryBCCanceled }</td>
					<td>
						${table1.relapsePulmonaryBCDetected - (table1.relapsePulmonaryBCEligible + table1.relapsePulmonaryBCSLD + table1.relapsePulmonaryBCCanceled) }</td>
					
				</tr>
				<tr>
					<td>2.1.1</td>
					<td>
						0-4</td>
					<td>
						${table1.relapsePulmonaryBCDetected04 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible04 }</td>
					<td>
						${table1.relapsePulmonaryBCCured04 }</td>
					<td>
						${table1.relapsePulmonaryBCCompleted04 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedTB04 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedNotTB04}</td>
					<td>
						${table1.relapsePulmonaryBCFailed04 }</td>
					<td>
						${table1.relapsePulmonaryBCDefaulted04 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible04 }</td>
					<td>
						${table1.relapsePulmonaryBCSLD04 }</td>
					<td>
						${table1.relapsePulmonaryBCCanceled04 }</td>
					<td>
						${table1.relapsePulmonaryBCDetected04 - (table1.relapsePulmonaryBCEligible04 + table1.relapsePulmonaryBCSLD04 + table1.relapsePulmonaryBCCanceled04) }</td>
					
				</tr>
				<tr>
					<td>
						2.1.2</td>
					<td>
						5-14</td>
					<td>
						${table1.relapsePulmonaryBCDetected0514 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible0514 }</td>
					<td>
						${table1.relapsePulmonaryBCCured0514 }</td>
					<td>
						${table1.relapsePulmonaryBCCompleted0514 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedTB0514 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedNotTB0514}</td>
					<td>
						${table1.relapsePulmonaryBCFailed0514 }</td>
					<td>
						${table1.relapsePulmonaryBCDefaulted0514 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible0514 }</td>
					<td>
						${table1.relapsePulmonaryBCSLD0514 }</td>
					<td>
						${table1.relapsePulmonaryBCCanceled0514 }</td>
					<td>
						${table1.relapsePulmonaryBCDetected0514 - (table1.relapsePulmonaryBCEligible0514 + table1.relapsePulmonaryBCSLD0514 + table1.relapsePulmonaryBCCanceled0514) }</td>
					
				</tr>
				<tr>
					<td>
						2.1.3</td>
					<td>
						15-17</td>
					<td>
						${table1.relapsePulmonaryBCDetected1517 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible1517 }</td>
					<td>
						${table1.relapsePulmonaryBCCured1517 }</td>
					<td>
						${table1.relapsePulmonaryBCCompleted1517 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedTB1517 }</td>
					<td>
						${table1.relapsePulmonaryBCDiedNotTB1517}</td>
					<td>
						${table1.relapsePulmonaryBCFailed1517 }</td>
					<td>
						${table1.relapsePulmonaryBCDefaulted1517 }</td>
					<td>
						${table1.relapsePulmonaryBCEligible1517 }</td>
					<td>
						${table1.relapsePulmonaryBCSLD1517 }</td>
					<td>
						${table1.relapsePulmonaryBCCanceled1517 }</td>
					<td>
						${table1.relapsePulmonaryBCDetected1517 - (table1.relapsePulmonaryBCEligible1517 + table1.relapsePulmonaryBCSLD1517 + table1.relapsePulmonaryBCCanceled1517) }</td>
					
				</tr>
				<tr>
					<td>
						2.2</td>
					<td>
						Л ТБ с КУ </td>
					<td>
						${table1.relapsePulmonaryCDDetected }</td>
					<td>
						${table1.relapsePulmonaryCDEligible }</td>
					<td>
						${table1.relapsePulmonaryCDCured }</td>
					<td>
						${table1.relapsePulmonaryCDCompleted }</td>
					<td>
						${table1.relapsePulmonaryCDDiedTB }</td>
					<td>
						${table1.relapsePulmonaryCDDiedNotTB}</td>
					<td>
						${table1.relapsePulmonaryCDFailed }</td>
					<td>
						${table1.relapsePulmonaryCDDefaulted }</td>
					<td>
						${table1.relapsePulmonaryCDEligible }</td>
					<td>
						${table1.relapsePulmonaryCDSLD }</td>
					<td>
						${table1.relapsePulmonaryCDCanceled }</td>
					<td>
						${table1.relapsePulmonaryCDDetected - (table1.relapsePulmonaryCDEligible + table1.relapsePulmonaryCDSLD + table1.relapsePulmonaryCDCanceled) }</td>
					
				</tr>
				<tr>
					<td>
						2.2.1</td>
					<td>
						0-4</td>
					<td>
						${table1.relapsePulmonaryCDDetected04 }</td>
					<td>
						${table1.relapsePulmonaryCDEligible04 }</td>
					<td>
						${table1.relapsePulmonaryCDCured04 }</td>
					<td>
						${table1.relapsePulmonaryCDCompleted04 }</td>
					<td>
						${table1.relapsePulmonaryCDDiedTB04 }</td>
					<td>
						${table1.relapsePulmonaryCDDiedNotTB}</td>
					<td>
						${table1.relapsePulmonaryCDFailed04 }</td>
					<td>
						${table1.relapsePulmonaryCDDefaulted04 }</td>
					<td>
						${table1.relapsePulmonaryCDEligible04 }</td>
					<td>
						${table1.relapsePulmonaryCDSLD04 }</td>
					<td>
						${table1.relapsePulmonaryCDCanceled04 }</td>
					<td>
						${table1.relapsePulmonaryCDDetected04 - (table1.relapsePulmonaryCDEligible04 + table1.relapsePulmonaryCDSLD04 + table1.relapsePulmonaryCDCanceled04) }</td>
					
				</tr>
				<tr>
					<td>
						2.2.2</td>
					<td>
						5-14</td>
					<td>
						${table1.relapsePulmonaryCDDetected0514 }</td>
					<td>
						${table1.relapsePulmonaryCDEligible0514 }</td>
					<td>
						${table1.relapsePulmonaryCDCured0514 }</td>
					<td>
						${table1.relapsePulmonaryCDCompleted0514 }</td>
					<td>
						${table1.relapsePulmonaryCDDiedTB0514 }</td>
					<td>
						${table1.relapsePulmonaryCDDiedNotTB}</td>
					<td>
						${table1.relapsePulmonaryCDFailed0514 }</td>
					<td>
						${table1.relapsePulmonaryCDDefaulted0514 }</td>
					<td>
						${table1.relapsePulmonaryCDEligible0514 }</td>
					<td>
						${table1.relapsePulmonaryCDSLD0514 }</td>
					<td>
						${table1.relapsePulmonaryCDCanceled0514 }</td>
					<td>
						${table1.relapsePulmonaryCDDetected0514 - (table1.relapsePulmonaryCDEligible0514 + table1.relapsePulmonaryCDSLD0514 + table1.relapsePulmonaryCDCanceled0514) }</td>
				</tr>
				<tr>
					<td>
						2.2.3</td>
					<td>
						15-17</td>
					<td>
						${table1.relapseExtrapulmonaryDetected1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCured1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCompleted1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedTB1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.relapseExtrapulmonaryFailed1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDefaulted1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.relapseExtrapulmonarySLD1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCanceled1517 }</td>
					<td>
						${table1.relapsePulmonaryCDDetected1517 - (table1.relapsePulmonaryCDEligible1517 + table1.relapsePulmonaryCDSLD1517 + table1.relapsePulmonaryCDCanceled1517) }</td>
					
				</tr>
				<tr>
					<td>
						2.3</td>
					<td>
						ВЛ ТБ </td>
					<td>
						${table1.relapseExtrapulmonaryDetected }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible }</td>
					<td>
						${table1.relapseExtrapulmonaryCured }</td>
					<td>
						${table1.relapseExtrapulmonaryCompleted }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedTB }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.relapseExtrapulmonaryFailed }</td>
					<td>
						${table1.relapseExtrapulmonaryDefaulted }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible }</td>
					<td>
						${table1.relapseExtrapulmonarySLD }</td>
					<td>
						${table1.relapseExtrapulmonaryCanceled }</td>
					<td>
						${table1.relapseExtrapulmonaryDetected - (table1.relapseExtrapulmonaryEligible + table1.relapseExtrapulmonarySLD + table1.relapseExtrapulmonaryCanceled) }</td>
					
				</tr>
				<tr>
					<td>
						2.3.1</td>
					<td>
						0-4</td>
					<td>
						${table1.relapseExtrapulmonaryDetected04 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible04 }</td>
					<td>
						${table1.relapseExtrapulmonaryCured04 }</td>
					<td>
						${table1.relapseExtrapulmonaryCompleted04 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedTB04 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.relapseExtrapulmonaryFailed04 }</td>
					<td>
						${table1.relapseExtrapulmonaryDefaulted04 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible04 }</td>
					<td>
						${table1.relapseExtrapulmonarySLD04 }</td>
					<td>
						${table1.relapseExtrapulmonaryCanceled04 }</td>
					<td>
						${table1.relapseExtrapulmonaryDetected04 - (table1.relapseExtrapulmonaryEligible04 + table1.relapseExtrapulmonarySLD04 + table1.relapseExtrapulmonaryCanceled04) }</td>
					
				</tr>
				<tr>
					<td>
						2.3.2</td>
					<td>
						5-14</td>
					<td>
						${table1.relapseExtrapulmonaryDetected0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryCured0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryCompleted0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedTB0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.relapseExtrapulmonaryFailed0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryDefaulted0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible0514 }</td>
					<td>
						${table1.relapseExtrapulmonarySLD0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryCanceled0514 }</td>
					<td>
						${table1.relapseExtrapulmonaryDetected0514 - (table1.relapseExtrapulmonaryEligible0514 + table1.relapseExtrapulmonarySLD0514 + table1.relapseExtrapulmonaryCanceled0514) }</td>
				</tr>
				<tr>
					<td>
						2.3.3</td>
					<td>
						15-17</td>
					<td>
						${table1.relapseExtrapulmonaryDetected1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCured1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCompleted1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedTB1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDiedNotTB}</td>
					<td>
						${table1.relapseExtrapulmonaryFailed1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDefaulted1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${table1.relapseExtrapulmonarySLD1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryCanceled1517 }</td>
					<td>
						${table1.relapseExtrapulmonaryDetected1517 - (table1.relapseExtrapulmonaryEligible1517 + table1.relapseExtrapulmonarySLD1517 + table1.relapseExtrapulmonaryCanceled1517) }</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td style="font:bold;">
					Итого(2.1+2.2+2.3)</td>
					<td>
						${ table1.relapsePulmonaryBCDetected + table1.relapsePulmonaryCDDetected + table1.relapseExtrapulmonaryDetected }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible + table1.relapsePulmonaryCDEligible + table1.relapseExtrapulmonaryEligible }</td>
					<td>
						${ table1.relapsePulmonaryBCCured + table1.relapsePulmonaryCDCured + table1.relapseExtrapulmonaryCured }</td></td>
					<td>
						${ table1.relapsePulmonaryBCCompleted + table1.relapsePulmonaryCDCompleted + table1.relapseExtrapulmonaryCompleted }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedTB + table1.relapsePulmonaryCDDiedTB + table1.relapseExtrapulmonaryDiedTB }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedNotTB + table1.relapsePulmonaryCDDiedNotTB + table1.relapseExtrapulmonaryDiedNotTB }</td>
					<td>
						${ table1.relapsePulmonaryBCFailed + table1.relapsePulmonaryCDFailed + table1.relapseExtrapulmonaryFailed }</td>
					<td>
						${ table1.relapsePulmonaryBCDefaulted + table1.relapsePulmonaryCDDefaulted + table1.relapseExtrapulmonaryDefaulted }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible + table1.relapsePulmonaryCDEligible + table1.relapseExtrapulmonaryEligible }</td>
					<td>
						${ table1.relapsePulmonaryBCSLD + table1.relapsePulmonaryCDSLD + table1.relapseExtrapulmonarySLD }</td>
					<td>
						${ table1.relapsePulmonaryBCCanceled + table1.relapsePulmonaryCDCanceled + table1.relapseExtrapulmonaryCanceled }</td>
					<td>
						${ table1.relapsePulmonaryBCDetected + table1.relapsePulmonaryCDDetected + table1.relapseExtrapulmonaryDetected - (table1.relapsePulmonaryBCEligible + table1.relapsePulmonaryCDEligible + table1.relapseExtrapulmonaryEligible + table1.relapsePulmonaryBCSLD + table1.relapsePulmonaryCDSLD + table1.relapseExtrapulmonarySLD + table1.relapsePulmonaryBCCanceled + table1.relapsePulmonaryCDCanceled + table1.relapseExtrapulmonaryCanceled) }</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						0-4</td>
					<td>
						${ table1.relapsePulmonaryBCDetected04 + table1.relapsePulmonaryCDDetected04 + table1.relapseExtrapulmonaryDetected04 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible04 + table1.relapsePulmonaryCDEligible04 + table1.relapseExtrapulmonaryEligible04 }</td>
					<td>
						${ table1.relapsePulmonaryBCCured04 + table1.relapsePulmonaryCDCured04 + table1.relapseExtrapulmonaryCured04 }</td></td>
					<td>
						${ table1.relapsePulmonaryBCCompleted04 + table1.relapsePulmonaryCDCompleted04 + table1.relapseExtrapulmonaryCompleted04 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedTB04 + table1.relapsePulmonaryCDDiedTB04 + table1.relapseExtrapulmonaryDiedTB04 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedNotTB04 + table1.relapsePulmonaryCDDiedNotTB04 + table1.relapseExtrapulmonaryDiedNotTB04 }</td>
					<td>
						${ table1.relapsePulmonaryBCFailed04 + table1.relapsePulmonaryCDFailed04 + table1.relapseExtrapulmonaryFailed04 }</td>
					<td>
						${ table1.relapsePulmonaryBCDefaulted04 + table1.relapsePulmonaryCDDefaulted04 + table1.relapseExtrapulmonaryDefaulted04 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible04 + table1.relapsePulmonaryCDEligible04 + table1.relapseExtrapulmonaryEligible04 }</td>
					<td>
						${ table1.relapsePulmonaryBCSLD04 + table1.relapsePulmonaryCDSLD04 + table1.relapseExtrapulmonarySLD04 }</td>
					<td>
						${ table1.relapsePulmonaryBCCanceled04 + table1.relapsePulmonaryCDCanceled04 + table1.relapseExtrapulmonaryCanceled04 }</td>
					<td>
						${ table1.relapsePulmonaryBCDetected04 + table1.relapsePulmonaryCDDetected04 + table1.relapseExtrapulmonaryDetected04 - (table1.relapsePulmonaryBCEligible04 + table1.relapsePulmonaryCDEligible04 + table1.relapseExtrapulmonaryEligible04 + table1.relapsePulmonaryBCSLD04 + table1.relapsePulmonaryCDSLD04 + table1.relapseExtrapulmonarySLD04 + table1.relapsePulmonaryBCCanceled04 + table1.relapsePulmonaryCDCanceled04 + table1.relapseExtrapulmonaryCanceled04) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						5-14</td>
					<td>
						${ table1.relapsePulmonaryBCDetected0514 + table1.relapsePulmonaryCDDetected0514 + table1.relapseExtrapulmonaryDetected0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible0514 + table1.relapsePulmonaryCDEligible0514 + table1.relapseExtrapulmonaryEligible0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCCured0514 + table1.relapsePulmonaryCDCured0514 + table1.relapseExtrapulmonaryCured0514 }</td></td>
					<td>
						${ table1.relapsePulmonaryBCCompleted0514 + table1.relapsePulmonaryCDCompleted0514 + table1.relapseExtrapulmonaryCompleted0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedTB0514 + table1.relapsePulmonaryCDDiedTB0514 + table1.relapseExtrapulmonaryDiedTB0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedNotTB0514 + table1.relapsePulmonaryCDDiedNotTB0514 + table1.relapseExtrapulmonaryDiedNotTB0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCFailed0514 + table1.relapsePulmonaryCDFailed0514 + table1.relapseExtrapulmonaryFailed0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCDefaulted0514 + table1.relapsePulmonaryCDDefaulted0514 + table1.relapseExtrapulmonaryDefaulted0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible0514 + table1.relapsePulmonaryCDEligible0514 + table1.relapseExtrapulmonaryEligible0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCSLD0514 + table1.relapsePulmonaryCDSLD0514 + table1.relapseExtrapulmonarySLD0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCCanceled0514 + table1.relapsePulmonaryCDCanceled0514 + table1.relapseExtrapulmonaryCanceled0514 }</td>
					<td>
						${ table1.relapsePulmonaryBCDetected0514 + table1.relapsePulmonaryCDDetected0514 + table1.relapseExtrapulmonaryDetected0514 - (table1.relapsePulmonaryBCEligible0514 + table1.relapsePulmonaryCDEligible0514 + table1.relapseExtrapulmonaryEligible0514 + table1.relapsePulmonaryBCSLD0514 + table1.relapsePulmonaryCDSLD0514 + table1.relapseExtrapulmonarySLD0514 + table1.relapsePulmonaryBCCanceled0514 + table1.relapsePulmonaryCDCanceled0514 + table1.relapseExtrapulmonaryCanceled0514) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						15-17</td>
					<td>
						${ table1.relapsePulmonaryBCDetected1517 + table1.relapsePulmonaryCDDetected1517 + table1.relapseExtrapulmonaryDetected1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible1517 + table1.relapsePulmonaryCDEligible1517 + table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCCured1517 + table1.relapsePulmonaryCDCured1517 + table1.relapseExtrapulmonaryCured1517 }</td></td>
					<td>
						${ table1.relapsePulmonaryBCCompleted1517 + table1.relapsePulmonaryCDCompleted1517 + table1.relapseExtrapulmonaryCompleted1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedTB1517 + table1.relapsePulmonaryCDDiedTB1517 + table1.relapseExtrapulmonaryDiedTB1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCDiedNotTB1517 + table1.relapsePulmonaryCDDiedNotTB1517 + table1.relapseExtrapulmonaryDiedNotTB1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCFailed1517 + table1.relapsePulmonaryCDFailed1517 + table1.relapseExtrapulmonaryFailed1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCDefaulted1517 + table1.relapsePulmonaryCDDefaulted1517 + table1.relapseExtrapulmonaryDefaulted1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCEligible1517 + table1.relapsePulmonaryCDEligible1517 + table1.relapseExtrapulmonaryEligible1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCSLD1517 + table1.relapsePulmonaryCDSLD1517 + table1.relapseExtrapulmonarySLD1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCCanceled1517 + table1.relapsePulmonaryCDCanceled1517 + table1.relapseExtrapulmonaryCanceled1517 }</td>
					<td>
						${ table1.relapsePulmonaryBCDetected1517 + table1.relapsePulmonaryCDDetected1517 + table1.relapseExtrapulmonaryDetected1517 - (table1.relapsePulmonaryBCEligible1517 + table1.relapsePulmonaryCDEligible1517 + table1.relapseExtrapulmonaryEligible1517 + table1.relapsePulmonaryBCSLD1517 + table1.relapsePulmonaryCDSLD1517 + table1.relapseExtrapulmonarySLD1517 + table1.relapsePulmonaryBCCanceled1517 + table1.relapsePulmonaryCDCanceled1517 + table1.relapseExtrapulmonaryCanceled1517) }</td>
					
				</tr>
				<tr>
					<td style="font: bold;">
						3</td>
					<td style="font: bold;">
						После неэффективн ого лечения</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					
				</tr>
				<tr>
					<td>
						3.1</td>
					<td>
						Л ТБ с БП  </td>
					<td>
						${table1.failurePulmonaryBCDetected }</td>
					<td>
						${table1.failurePulmonaryBCEligible }</td>
					<td>
						${table1.failurePulmonaryBCCured }</td>
					<td>
						${table1.failurePulmonaryBCCompleted }</td>
					<td>
						${table1.failurePulmonaryBCDiedTB }</td>
					<td>
						${table1.failurePulmonaryBCDiedNotTB }</td>
					<td>
						${table1.failurePulmonaryBCFailed }</td>
					<td>
						${table1.failurePulmonaryBCDefaulted}</td>

					<td>
						${table1.failurePulmonaryBCEligible }</td>
					<td>
						${table1.failurePulmonaryBCSLD}</td>
					<td>
						${table1.failurePulmonaryBCCanceled }</td>
					<td>
						${table1.failurePulmonaryBCDetected  - (table1.failurePulmonaryBCEligible + table1.failurePulmonaryBCSLD + table1.failurePulmonaryBCCanceled ) }</td>
						
				</tr>
				<tr>
					<td>
						3.2</td>
					<td>
						Л ТБ с КУ</td>
					<td>
						${table1.failurePulmonaryCDDetected }</td>
					<td>
						${table1.failurePulmonaryCDEligible }</td>
					<td>
						${table1.failurePulmonaryCDCured }</td>
					<td>
						${table1.failurePulmonaryCDCompleted }</td>
					<td>
						${table1.failurePulmonaryCDDiedTB }</td>
					<td>
						${table1.failurePulmonaryCDDiedNotTB }</td>
					<td>
						${table1.failurePulmonaryCDFailed }</td>
					<td>
						${table1.failurePulmonaryCDDefaulted}</td>

					<td>
						${table1.failurePulmonaryCDEligible }</td>
					<td>
						${table1.failurePulmonaryCDSLD}</td>
					<td>
						${table1.failurePulmonaryCDCanceled }</td>
					<td>
						${table1.failurePulmonaryCDDetected  - (table1.failurePulmonaryCDEligible + table1.failurePulmonaryCDSLD + table1.failurePulmonaryCDCanceled ) }</td>
						
				</tr>
				<tr>
					<td>
						3.3</td>
					<td>
						ВЛ ТБ</td>
					<td>
						${table1.failureExtrapulmonaryDetected }</td>
					<td>
						${table1.failureExtrapulmonaryEligible }</td>
					<td>
						${table1.failureExtrapulmonaryCured }</td>
					<td>
						${table1.failureExtrapulmonaryCompleted }</td>
					<td>
						${table1.failureExtrapulmonaryDiedTB }</td>
					<td>
						${table1.failureExtrapulmonaryDiedNotTB }</td>
					<td>
						${table1.failureExtrapulmonaryFailed }</td>
					<td>
						${table1.failureExtrapulmonaryDefaulted}</td>

					<td>
						${table1.failureExtrapulmonaryEligible }</td>
					
					<td>
						${table1.failureExtrapulmonarySLD}</td>	
					<td>
						${table1.failureExtrapulmonaryCanceled }</td>
					<td>
						${table1.failureExtrapulmonaryDetected  - (table1.failureExtrapulmonaryEligible + table1.failureExtrapulmonarySLD + table1.failureExtrapulmonaryCanceled ) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td style="font: bold;">
						<b>Итого</b></td>
					<td>
						${ table1.failurePulmonaryBCDetected + table1.failurePulmonaryCDDetected + table1.failureExtrapulmonaryDetected }</td>
					<td>
						${ table1.failurePulmonaryBCEligible + table1.failurePulmonaryCDEligible + table1.failureExtrapulmonaryEligible }</td>
					<td>
						${ table1.failurePulmonaryBCCured + table1.failurePulmonaryCDCured + table1.failureExtrapulmonaryCured }</td></td>
					<td>
						${ table1.failurePulmonaryBCCompleted + table1.failurePulmonaryCDCompleted + table1.failureExtrapulmonaryCompleted }</td>
					<td>
						${ table1.failurePulmonaryBCDiedTB + table1.failurePulmonaryCDDiedTB + table1.failureExtrapulmonaryDiedTB }</td>
					<td>
						${ table1.failurePulmonaryBCDiedNotTB + table1.failurePulmonaryCDDiedNotTB + table1.failureExtrapulmonaryDiedNotTB }</td>
					<td>
						${ table1.failurePulmonaryBCFailed + table1.failurePulmonaryCDFailed + table1.failureExtrapulmonaryFailed }</td>
					<td>
						${ table1.failurePulmonaryBCDefaulted + table1.failurePulmonaryCDDefaulted + table1.failureExtrapulmonaryDefaulted }</td>
					<td>
						${ table1.failurePulmonaryBCEligible + table1.failurePulmonaryCDEligible + table1.failureExtrapulmonaryEligible }</td>
					<td>
						${ table1.failurePulmonaryBCSLD + table1.failurePulmonaryCDSLD + table1.failureExtrapulmonarySLD }</td>
					<td>
						${ table1.failurePulmonaryBCCanceled + table1.failurePulmonaryCDCanceled + table1.failureExtrapulmonaryCanceled }</td>
					<td>
						${  table1.failurePulmonaryBCDetected + table1.failurePulmonaryCDDetected + table1.failureExtrapulmonaryDetected - (table1.failurePulmonaryBCEligible + table1.failurePulmonaryCDEligible + table1.failureExtrapulmonaryEligible  + table1.failurePulmonaryBCSLD + table1.failurePulmonaryCDSLD + table1.failureExtrapulmonarySLD + table1.failurePulmonaryBCCanceled + table1.failurePulmonaryCDCanceled + table1.failureExtrapulmonaryCanceled) }</td>
					
					
				</tr>
				<tr>
					<td style="font: bold;">
						4</td>
					<td style="font: bold;">
						После отрыва от лечения</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr>
					<td>
						4.1</td>
					<td>
						Л ТБ с БП  </td>
					<td>
						${table1.defaultPulmonaryBCDetected }</td>
					<td>
						${table1.defaultPulmonaryBCEligible }</td>
					<td>
						${table1.defaultPulmonaryBCCured }</td>
					<td>
						${table1.defaultPulmonaryBCCompleted }</td>
					<td>
						${table1.defaultPulmonaryBCDiedTB }</td>
					<td>
						${table1.defaultPulmonaryBCDiedNotTB }</td>
					<td>
						${table1.defaultPulmonaryBCFailed }</td>
					<td>
						${table1.defaultPulmonaryBCDefaulted}</td>

					<td>
						${table1.defaultPulmonaryBCEligible }</td>
					<td>
						${table1.defaultPulmonaryBCSLD}</td>
					<td>
						${table1.defaultPulmonaryBCCanceled }</td>
					<td>
						${table1.defaultPulmonaryBCDetected - (table1.defaultPulmonaryBCEligible + table1.defaultPulmonaryBCSLD + table1.defaultPulmonaryBCCanceled) }</td>
						
				</tr>
				<tr>
					<td>
						4.2</td>
					<td>
						Л ТБ с КУ</td>
					<td>
						${table1.defaultPulmonaryCDDetected }</td>
					<td>
						${table1.defaultPulmonaryCDEligible }</td>
					<td>
						${table1.defaultPulmonaryCDCured }</td>
					<td>
						${table1.defaultPulmonaryCDCompleted }</td>
					<td>
						${table1.defaultPulmonaryCDDiedTB }</td>
					<td>
						${table1.defaultPulmonaryCDDiedNotTB }</td>
					<td>
						${table1.defaultPulmonaryCDFailed }</td>
					<td>
						${table1.defaultPulmonaryCDDefaulted}</td>

					<td>
						${table1.defaultPulmonaryCDEligible }</td>
					<td>
						${table1.defaultPulmonaryCDSLD}</td>
					<td>
						${table1.defaultPulmonaryCDCanceled }</td>
					<td>
						${table1.defaultPulmonaryCDDetected - (table1.defaultPulmonaryCDEligible + table1.defaultPulmonaryCDSLD + table1.defaultPulmonaryCDCanceled) }</td>
						
				</tr>
				<tr>
					<td>
						4.3</td>
					<td>
						ВЛ ТБ</td>
					<td>
						${table1.defaultExtrapulmonaryDetected }</td>
					<td>
						${table1.defaultExtrapulmonaryEligible }</td>
					<td>
						${table1.defaultExtrapulmonaryCured }</td>
					<td>
						${table1.defaultExtrapulmonaryCompleted }</td>
					<td>
						${table1.defaultExtrapulmonaryDiedTB }</td>
					<td>
						${table1.defaultExtrapulmonaryDiedNotTB }</td>
					<td>
						${table1.defaultExtrapulmonaryFailed }</td>
					<td>
						${table1.defaultExtrapulmonaryDefaulted}</td>

					<td>
						${table1.defaultExtrapulmonaryEligible }</td>
					<td>
						${table1.defaultExtrapulmonarySLD}</td>	
					<td>
						${table1.defaultExtrapulmonaryCanceled }</td>
					<td>
						${table1.defaultExtrapulmonaryDetected - (table1.defaultExtrapulmonaryEligible + table1.defaultExtrapulmonarySLD + table1.defaultExtrapulmonaryCanceled) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td style="font: bold;">
						<b>Итого</b></td>
					<td>
						${ table1.defaultPulmonaryBCDetected + table1.defaultPulmonaryCDDetected + table1.defaultExtrapulmonaryDetected }</td>
					<td>
						${ table1.defaultPulmonaryBCEligible + table1.defaultPulmonaryCDEligible + table1.defaultExtrapulmonaryEligible }</td>
					<td>
						${ table1.defaultPulmonaryBCCured + table1.defaultPulmonaryCDCured + table1.defaultExtrapulmonaryCured }</td></td>
					<td>
						${ table1.defaultPulmonaryBCCompleted + table1.defaultPulmonaryCDCompleted + table1.defaultExtrapulmonaryCompleted }</td>
					<td>
						${ table1.defaultPulmonaryBCDiedTB + table1.defaultPulmonaryCDDiedTB + table1.defaultExtrapulmonaryDiedTB }</td>
					<td>
						${ table1.defaultPulmonaryBCDiedNotTB + table1.defaultPulmonaryCDDiedNotTB + table1.defaultExtrapulmonaryDiedNotTB }</td>
					<td>
						${ table1.defaultPulmonaryBCFailed + table1.defaultPulmonaryCDFailed + table1.defaultExtrapulmonaryFailed }</td>
					<td>
						${ table1.defaultPulmonaryBCDefaulted + table1.defaultPulmonaryCDDefaulted + table1.defaultExtrapulmonaryDefaulted }</td>
					<td>
						${ table1.defaultPulmonaryBCEligible + table1.defaultPulmonaryCDEligible + table1.defaultExtrapulmonaryEligible }</td>
					<td>
						${ table1.defaultPulmonaryBCSLD + table1.defaultPulmonaryCDSLD + table1.defaultExtrapulmonarySLD }</td>
					<td>
						${ table1.defaultPulmonaryBCCanceled + table1.defaultPulmonaryCDCanceled + table1.defaultExtrapulmonaryCanceled }</td>
					<td> 
						${table1.defaultPulmonaryBCDetected + table1.defaultPulmonaryCDDetected + table1.defaultExtrapulmonaryDetected - (table1.defaultPulmonaryBCEligible + table1.defaultPulmonaryCDEligible + table1.defaultExtrapulmonaryEligible  + table1.defaultPulmonaryBCSLD + table1.defaultPulmonaryCDSLD + table1.defaultExtrapulmonarySLD + table1.defaultPulmonaryBCCanceled + table1.defaultPulmonaryCDCanceled + table1.defaultExtrapulmonaryCanceled) } </td>
					
					
				</tr>
				<tr>
					<td style="font: bold;">
						5</td>
					<td style="font: bold;">
						Другие</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					
				</tr>
				<tr>
					<td>
						5.1</td>
					<td>
						Л ТБ с БП  </td>
					<td>
						${table1.otherPulmonaryBCDetected }</td>
					<td>
						${table1.otherPulmonaryBCEligible }</td>
					<td>
						${table1.otherPulmonaryBCCured }</td>
					<td>
						${table1.otherPulmonaryBCCompleted }</td>
					<td>
						${table1.otherPulmonaryBCDiedTB }</td>
					<td>
						${table1.otherPulmonaryBCDiedNotTB }</td>
					<td>
						${table1.otherPulmonaryBCFailed }</td>
					<td>
						${table1.otherPulmonaryBCDefaulted}</td>

					<td>
						${table1.otherPulmonaryBCEligible }</td>
					
					<td>
						${table1.otherPulmonaryBCSLD}</td>
					<td>
						${table1.otherPulmonaryBCCanceled }</td>
					<td>
						${table1.otherPulmonaryBCDetected - (table1.otherPulmonaryBCEligible + table1.otherPulmonaryBCSLD + table1.otherPulmonaryBCCanceled ) }</td>
						
				</tr>
				<tr>
					<td>
						5.2</td>
					<td>
						Л ТБ с КУ</td>
					<td>
						${table1.otherPulmonaryCDDetected }</td>
					<td>
						${table1.otherPulmonaryCDEligible }</td>
					<td>
						${table1.otherPulmonaryCDCured }</td>
					<td>
						${table1.otherPulmonaryCDCompleted }</td>
					<td>
						${table1.otherPulmonaryCDDiedTB }</td>
					<td>
						${table1.otherPulmonaryCDDiedNotTB }</td>
					<td>
						${table1.otherPulmonaryCDFailed }</td>
					<td>
						${table1.otherPulmonaryCDDefaulted}</td>

					<td>
						${table1.otherPulmonaryCDEligible }</td>
					<td>
						${table1.otherPulmonaryCDSLD}</td>
					<td>
						${table1.otherPulmonaryCDCanceled }</td>
					<td>
						${table1.otherPulmonaryCDDetected - (table1.otherPulmonaryCDEligible + table1.otherPulmonaryCDSLD + table1.otherPulmonaryCDCanceled ) }</td>
						
				</tr>
				<tr>
					<td>
						5.3</td>
					<td>
						ВЛ ТБ</td>
					<td>
						${table1.otherExtrapulmonaryDetected }</td>
					<td>
						${table1.otherExtrapulmonaryEligible }</td>
					<td>
						${table1.otherExtrapulmonaryCured }</td>
					<td>
						${table1.otherExtrapulmonaryCompleted }</td>
					<td>
						${table1.otherExtrapulmonaryDiedTB }</td>
					<td>
						${table1.otherExtrapulmonaryDiedNotTB }</td>
					<td>
						${table1.otherExtrapulmonaryFailed }</td>
					<td>
						${table1.otherExtrapulmonaryDefaulted}</td>

					<td>
						${table1.otherExtrapulmonaryEligible }</td>
					
					<td>
						${table1.otherExtrapulmonarySLD}</td>
					<td>
						${table1.otherExtrapulmonaryCanceled }</td>
					<td>
						${table1.otherExtrapulmonaryDetected - (table1.otherExtrapulmonaryEligible + table1.otherExtrapulmonarySLD + table1.otherExtrapulmonaryCanceled ) }</td>
						
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td style="font: bold;">
						<b>Итого</b></td>
					<td>
						${ table1.otherPulmonaryBCDetected + table1.otherPulmonaryCDDetected + table1.otherExtrapulmonaryDetected }</td>
					<td>
						${ table1.otherPulmonaryBCEligible + table1.otherPulmonaryCDEligible + table1.otherExtrapulmonaryEligible }</td>
					<td>
						${ table1.otherPulmonaryBCCured + table1.otherPulmonaryCDCured + table1.otherExtrapulmonaryCured }</td></td>
					<td>
						${ table1.otherPulmonaryBCCompleted + table1.otherPulmonaryCDCompleted + table1.otherExtrapulmonaryCompleted }</td>
					<td>
						${ table1.otherPulmonaryBCDiedTB + table1.otherPulmonaryCDDiedTB + table1.otherExtrapulmonaryDiedTB }</td>
					<td>
						${ table1.otherPulmonaryBCDiedNotTB + table1.otherPulmonaryCDDiedNotTB + table1.otherExtrapulmonaryDiedNotTB }</td>
					<td>
						${ table1.otherPulmonaryBCFailed + table1.otherPulmonaryCDFailed + table1.otherExtrapulmonaryFailed }</td>
					<td>
						${ table1.otherPulmonaryBCDefaulted + table1.otherPulmonaryCDDefaulted + table1.otherExtrapulmonaryDefaulted }</td>
					<td>
						${ table1.otherPulmonaryBCEligible + table1.otherPulmonaryCDEligible + table1.otherExtrapulmonaryEligible }</td>
					<td>
						${ table1.otherPulmonaryBCSLD + table1.otherPulmonaryCDSLD + table1.otherExtrapulmonarySLD }</td>
					
					<td>
						${ table1.otherPulmonaryBCCanceled + table1.otherPulmonaryCDCanceled + table1.otherExtrapulmonaryCanceled }</td>
					<td> 
						${table1.otherPulmonaryBCDetected + table1.otherPulmonaryCDDetected + table1.otherExtrapulmonaryDetected - (table1.otherPulmonaryBCEligible + table1.otherPulmonaryCDEligible + table1.otherExtrapulmonaryEligible  + table1.otherPulmonaryBCSLD + table1.otherPulmonaryCDSLD + table1.otherExtrapulmonarySLD + table1.otherPulmonaryBCCanceled + table1.otherPulmonaryCDCanceled + table1.otherExtrapulmonaryCanceled) } </td>
					
					
				</tr>
				
				<tr>
				     <td>&nbsp;
						</td>
					<td style="font: bold;">
						Итого (3 + 4 + 5)</td>
					
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					<td>
						&nbsp;</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						Л ТБ с БП  </td>
					<td>
						${table1.failurePulmonaryBCDetected + table1.defaultPulmonaryBCDetected + table1.otherPulmonaryBCDetected }</td>
					<td>
						${table1.failurePulmonaryBCEligible + table1.defaultPulmonaryBCEligible + table1.otherPulmonaryBCEligible }</td>
					<td>
						${table1.failurePulmonaryBCCured + table1.defaultPulmonaryBCCured + table1.otherPulmonaryBCCured }</td>
					<td>
						${table1.failurePulmonaryBCCompleted + table1.defaultPulmonaryBCCompleted + table1.otherPulmonaryBCCompleted }</td>
					<td>
						${table1.failurePulmonaryBCDiedTB + table1.defaultPulmonaryBCDiedTB + table1.otherPulmonaryBCDiedTB }</td>
					<td>
						${table1.failurePulmonaryBCDiedNotTB + table1.defaultPulmonaryBCDiedNotTB + table1.otherPulmonaryBCDiedNotTB }</td>
					<td>
						${table1.failurePulmonaryBCFailed + table1.defaultPulmonaryBCFailed + table1.otherPulmonaryBCFailed }</td>
					<td>
						${table1.failurePulmonaryBCDefaulted + table1.defaultPulmonaryBCDefaulted + table1.otherPulmonaryBCDefaulted }</td>
					
					<td>
						${table1.failurePulmonaryBCEligible + table1.defaultPulmonaryBCEligible + table1.otherPulmonaryBCEligible }</td>
					
					<td>
						${table1.failurePulmonaryBCSLD + table1.defaultPulmonaryBCSLD + table1.otherPulmonaryBCSLD }</td>
					<td>
						${table1.failurePulmonaryBCCanceled + table1.defaultPulmonaryBCCanceled + table1.otherPulmonaryBCCanceled }</td>
					<td>
						${table1.failurePulmonaryBCDetected + table1.defaultPulmonaryBCDetected + table1.otherPulmonaryBCDetected - (table1.failurePulmonaryBCEligible + table1.defaultPulmonaryBCEligible + table1.otherPulmonaryBCEligible + table1.failurePulmonaryBCSLD + table1.defaultPulmonaryBCSLD + table1.otherPulmonaryBCSLD + table1.failurePulmonaryBCCanceled + table1.defaultPulmonaryBCCanceled + table1.otherPulmonaryBCCanceled ) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						Л ТБ с КУ </td>
					<td>
						${table1.failurePulmonaryCDDetected + table1.defaultPulmonaryCDDetected + table1.otherPulmonaryCDDetected }</td>
					<td>
						${table1.failurePulmonaryCDEligible + table1.defaultPulmonaryCDEligible + table1.otherPulmonaryCDEligible }</td>
					<td>
						${table1.failurePulmonaryCDCured + table1.defaultPulmonaryCDCured + table1.otherPulmonaryCDCured }</td>
					<td>
						${table1.failurePulmonaryCDCompleted + table1.defaultPulmonaryCDCompleted + table1.otherPulmonaryCDCompleted }</td>
					<td>
						${table1.failurePulmonaryCDDiedTB + table1.defaultPulmonaryCDDiedTB + table1.otherPulmonaryCDDiedTB }</td>
					<td>
						${table1.failurePulmonaryCDDiedNotTB + table1.defaultPulmonaryCDDiedNotTB + table1.otherPulmonaryCDDiedNotTB }</td>
					<td>
						${table1.failurePulmonaryCDFailed + table1.defaultPulmonaryCDFailed + table1.otherPulmonaryCDFailed }</td>
					<td>
						${table1.failurePulmonaryCDDefaulted + table1.defaultPulmonaryCDDefaulted + table1.otherPulmonaryCDDefaulted }</td>
					
					<td>
						${table1.failurePulmonaryCDEligible + table1.defaultPulmonaryCDEligible + table1.otherPulmonaryCDEligible }</td>
					
					<td>
						${table1.failurePulmonaryCDSLD + table1.defaultPulmonaryCDSLD + table1.otherPulmonaryCDSLD }</td>
					<td>
						${table1.failurePulmonaryCDCanceled + table1.defaultPulmonaryCDCanceled + table1.otherPulmonaryCDCanceled }</td>
					<td>
						${table1.failurePulmonaryCDDetected + table1.defaultPulmonaryCDDetected + table1.otherPulmonaryCDDetected - (table1.failurePulmonaryCDEligible + table1.defaultPulmonaryCDEligible + table1.otherPulmonaryCDEligible + table1.failurePulmonaryCDSLD + table1.defaultPulmonaryCDSLD + table1.otherPulmonaryCDSLD + table1.failurePulmonaryCDCanceled + table1.defaultPulmonaryCDCanceled + table1.otherPulmonaryCDCanceled ) }</td>
					
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						ВЛ ТБ</td>
					<td>
						${table1.failureExtrapulmonaryDetected + table1.defaultExtrapulmonaryDetected + table1.otherExtrapulmonaryDetected }</td>
					<td>
						${table1.failureExtrapulmonaryEligible + table1.defaultExtrapulmonaryEligible + table1.otherExtrapulmonaryEligible }</td>
					<td>
						${table1.failureExtrapulmonaryCured + table1.defaultExtrapulmonaryCured + table1.otherExtrapulmonaryCured }</td>
					<td>
						${table1.failureExtrapulmonaryCompleted + table1.defaultExtrapulmonaryCompleted + table1.otherExtrapulmonaryCompleted }</td>
					<td>
						${table1.failureExtrapulmonaryDiedTB + table1.defaultExtrapulmonaryDiedTB + table1.otherExtrapulmonaryDiedTB }</td>
					<td>
						${table1.failureExtrapulmonaryDiedNotTB + table1.defaultExtrapulmonaryDiedNotTB + table1.otherExtrapulmonaryDiedNotTB }</td>
					<td>
						${table1.failureExtrapulmonaryFailed + table1.defaultExtrapulmonaryFailed + table1.otherExtrapulmonaryFailed }</td>
					<td>
						${table1.failureExtrapulmonaryDefaulted + table1.defaultExtrapulmonaryDefaulted + table1.otherExtrapulmonaryDefaulted }</td>
					
					<td>
						${table1.failureExtrapulmonaryEligible + table1.defaultExtrapulmonaryEligible + table1.otherExtrapulmonaryEligible }</td>
					<td>
						${table1.failureExtrapulmonarySLD + table1.defaultExtrapulmonarySLD + table1.otherExtrapulmonarySLD }</td>
					<td>
						${table1.failureExtrapulmonaryCanceled + table1.defaultExtrapulmonaryCanceled + table1.otherExtrapulmonaryCanceled }</td>
					<td>
						${table1.failurePulmonaryCDDetected + table1.defaultPulmonaryCDDetected + table1.otherPulmonaryCDDetected - (table1.failurePulmonaryCDEligible + table1.defaultPulmonaryCDEligible + table1.otherPulmonaryCDEligible + table1.failurePulmonaryCDSLD + table1.defaultPulmonaryCDSLD + table1.otherPulmonaryCDSLD + table1.failurePulmonaryCDCanceled + table1.defaultPulmonaryCDCanceled + table1.otherPulmonaryCDCanceled ) }</td>
				</tr>
				<tr>
					<td>&nbsp;
						</td>
					<td style="font: bold;">
						Итого (3.1+3.2+3.3+<br/>4.1.4.2.4.3<br/>+5.1+5.2+5.3) </td>
					
					<td>
						${table1.failureAllDetected + table1.defaultAllDetected + table1.otherAllDetected }</td>
					<td>
						${table1.failureAllEligible + table1.defaultAllEligible + table1.otherAllEligible }</td>
					<td>
						${table1.failureAllCured + table1.defaultAllCured + table1.otherAllCured }</td>
					<td>
						${table1.failureAllCompleted + table1.defaultAllCompleted + table1.otherAllCompleted }</td>
					<td>
						${table1.failureAllDiedTB + table1.defaultAllDiedTB + table1.otherAllDiedTB }</td>
					<td>
						${table1.failureAllDiedNotTB + table1.defaultAllDiedNotTB + table1.otherAllDiedNotTB }</td>
					<td>
						${table1.failureAllFailed + table1.defaultAllFailed + table1.otherAllFailed }</td>
					<td>
						${table1.failureAllDefaulted + table1.defaultAllDefaulted + table1.otherAllDefaulted }</td>
					<td>
						${table1.failureAllEligible + table1.defaultAllEligible + table1.otherAllEligible }</td>
					<td>
						${table1.failureAllSLD + table1.defaultAllSLD + table1.otherAllSLD }</td>
					<td>
						${table1.failureAllCanceled + table1.defaultAllCanceled + table1.otherAllCanceled }</td>
					
					<td>
						${table1.failureAllDetected + table1.defaultAllDetected + table1.otherAllDetected - (table1.failureAllEligible + table1.defaultAllEligible + table1.otherAllEligible + table1.failureAllSLD + table1.defaultAllSLD + table1.otherAllSLD + table1.failureAllCanceled + table1.defaultAllCanceled + table1.otherAllCanceled ) }</td>
					
				</tr>
				<%-- <tr>
					<td>&nbsp;
						</td>
					<td style="font: bold;">
						Итого (1+2+3+4+5) </td>
					
					<td>
						${table1.allDetected }</td>
					<td>
						${table1.allEligible }</td>
					<td>
						${table1.allCured }</td>
					<td>
						${table1.allCompleted }</td>
					<td>
						${table1.allDiedTB }</td>
					<td>
						${table1.allDiedNotTB }</td>
					<td>
						${table1.allFailed }</td>
					<td>
						${table1.allDefaulted }</td>
					
					<td>
						${table1.allEligible }</td>
					<td>
						${table1.allSLD }</td>
					<td>
						${table1.allCanceled }</td>
					
					<td>
						${table1.allDetected - (table1.allEligible + table1.allSLD + table1.allCanceled) }</td>
					
					
				</tr> --%>
				
			</tbody>
		</table>
		</div>
		
	</body>
</html>
			
