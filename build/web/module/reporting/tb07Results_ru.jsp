<%@ page contentType="text/html; charset=UTF-8" %>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<html>
<head>
	<title>ТБ 07</title>
</head>
<body>
<style type="text/css">th {vertical-align:top; text-align:left;}
			th, td {font-size:smaller; border: 1px solid #000000}
			border {border: 1px solid #000000}
</style>
<div style="font-size:smaller; width:980px;">
<table border="0" width="100%">
	<tbody>
		<tr>
			<td align="center" style="font-size:14px; font-weight:bold;border:0px" width="90%">Квартальный отчет о реги�?трации вы�?вленных �?лучаев</td>
			<td align="right" style="font-size:14px; font-weight:bold;border:0px" valign="top" width="10%">ТБ 07</td>
		</tr>
	</tbody>
</table>
&nbsp;
<table width="100%" border="1">
<tr>
<td>
�?аименование учреждени�?:__________________</br></br>
Обла�?ть/город/район: <u> ${location } </u></br>
ФИО координатора по ТБ: ___________________ </br>
Подпи�?ь:_________________
</td>

<td>
Случаи, вы�?вленные за<u> ${quarter } </u> квартал <u> ${year } </u> года </br>
Дата отчета: ${reportDate }
</td>
</tr>


</table>



<h5>Таблица 1. В�?е новые �?лучаи и рецидивы (�? бактериологиче�?ким подтверждением или �? клиниче�?ки у�?тановленным диагнозом), вы�?вленные за отчетный период</h5>
	<table border="1" cellpadding="1" cellspacing="1" dir="ltr"
			style="width: 980px;">
			<tbody>
				<tr>
					<td colspan="2" rowspan="1">Тип</td>
					<td colspan="2" rowspan="1" style="text-align: center;">0-4</td>
					<td colspan="2" rowspan="1" style="text-align: center;">5-14</td>
					<td colspan="2" rowspan="1" style="text-align: center;">15-17</td>
					<td colspan="2" rowspan="1" style="text-align: center;">18-19</td>
					<td colspan="2" rowspan="1" style="text-align: center;">20-24</td>
					<td colspan="2" rowspan="1" style="text-align: center;">25-34</td>
					<td colspan="2" rowspan="1" style="text-align: center;">35-44</td>
					<td colspan="2" rowspan="1" style="text-align: center;">45-54</td>
					<td colspan="2" rowspan="1" style="text-align: center;">55-64</td>
					<td colspan="2" rowspan="1" style="text-align: center;">&gt;65</td>
					<td colspan="3" rowspan="1" style="text-align: center;">Итого</td>
				</tr>
				<tr>

					<td style="text-align: center;">&nbsp;</td>
					<td style="text-align: center;">&nbsp;</td>
					<td style="text-align: center;width: 3%">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">M</td>
					<td style="text-align: center;">Ж</td>
					<td style="text-align: center;">Итого</td>
					
				</tr>
				<tr>
					<td rowspan="6">
						<div>�?</div>
						<div>о</div>
						<div>в</div>
						<div>ы</div>
						<div>е</div>
						<div></div>
						<div>�?</div>
						<div>л</div>
						<div>у</div>
						<div>ч</div>
						<div>а</div>
						<div>и</div>
					</td>
					<td>Л ТБ �? БП</td>
					
					<td>${table1.newMalePulmonaryBC04}</td>
					<td>${table1.newFemalePulmonaryBC04}</td>
					
					<td>${table1.newMalePulmonaryBC0514}</td>
					<td>${table1.newFemalePulmonaryBC0514}</td>
					
					<td>${table1.newMalePulmonaryBC1517}</td>
					<td>${table1.newFemalePulmonaryBC1517}</td>
					
					
					<td>${table1.newMalePulmonaryBC1819}</td>
					<td>${table1.newFemalePulmonaryBC1819}</td>
					
					
					<td>${table1.newMalePulmonaryBC2024}</td>
					<td>${table1.newFemalePulmonaryBC2024}</td>
					
					
					<td>${table1.newMalePulmonaryBC2534}</td>
					<td>${table1.newFemalePulmonaryBC2534}</td>
					
					
					<td>${table1.newMalePulmonaryBC3544}</td>
					<td>${table1.newFemalePulmonaryBC3544}</td>
					
					
					<td>${table1.newMalePulmonaryBC4554}</td>
					<td>${table1.newFemalePulmonaryBC4554}</td>
					
					
					<td>${table1.newMalePulmonaryBC5564}</td>
					<td>${table1.newFemalePulmonaryBC5564}</td>
					
					<td>${table1.newMalePulmonaryBC65}</td>
					<td>${table1.newFemalePulmonaryBC65}</td>
					
					<td>${table1.newMalePulmonaryBC}</td>
					<td>${table1.newFemalePulmonaryBC}</td>
					<td>${table1.newPulmonaryBC}</td>                       
				</tr>
				<tr>
					<td>из них ВИЧ </td>
					
					<td>${table1.newMalePulmonaryBCHIV04}</td>
					<td>${table1.newFemalePulmonaryBCHIV04}</td>
					
					<td>${table1.newMalePulmonaryBCHIV0514}</td>
					<td>${table1.newFemalePulmonaryBCHIV0514}</td>
					
					<td>${table1.newMalePulmonaryBCHIV1517}</td>
					<td>${table1.newFemalePulmonaryBCHIV1517}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV1819}</td>
					<td>${table1.newFemalePulmonaryBCHIV1819}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV2024}</td>
					<td>${table1.newFemalePulmonaryBCHIV2024}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV2534}</td>
					<td>${table1.newFemalePulmonaryBCHIV2534}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV3544}</td>
					<td>${table1.newFemalePulmonaryBCHIV3544}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV4554}</td>
					<td>${table1.newFemalePulmonaryBCHIV4554}</td>
					
					
					<td>${table1.newMalePulmonaryBCHIV5564}</td>
					<td>${table1.newFemalePulmonaryBCHIV5564}</td>
					
					<td>${table1.newMalePulmonaryBCHIV65}</td>
					<td>${table1.newFemalePulmonaryBCHIV65}</td>
					
					<td>${table1.newMalePulmonaryBCHIV}</td>
					<td>${table1.newFemalePulmonaryBCHIV}</td>
					<td>${table1.newPulmonaryBCHIV}</td>                
					                   
				</tr>
				<tr>
					<td>Л ТБ �? КУ </td>
					<td>${table1.newMalePulmonaryCD04}</td>
					<td>${table1.newFemalePulmonaryCD04}</td>
					
					<td>${table1.newMalePulmonaryCD0514}</td>
					<td>${table1.newFemalePulmonaryCD0514}</td>
					
					<td>${table1.newMalePulmonaryCD1517}</td>
					<td>${table1.newFemalePulmonaryCD1517}</td>
					
					
					<td>${table1.newMalePulmonaryCD1819}</td>
					<td>${table1.newFemalePulmonaryCD1819}</td>
					
					
					<td>${table1.newMalePulmonaryCD2024}</td>
					<td>${table1.newFemalePulmonaryCD2024}</td>
					
					
					<td>${table1.newMalePulmonaryCD2534}</td>
					<td>${table1.newFemalePulmonaryCD2534}</td>
					
					
					<td>${table1.newMalePulmonaryCD3544}</td>
					<td>${table1.newFemalePulmonaryCD3544}</td>
					
					
					<td>${table1.newMalePulmonaryCD4554}</td>
					<td>${table1.newFemalePulmonaryCD4554}</td>
					
					
					<td>${table1.newMalePulmonaryCD5564}</td>
					<td>${table1.newFemalePulmonaryCD5564}</td>
					
					<td>${table1.newMalePulmonaryCD65}</td>
					<td>${table1.newFemalePulmonaryCD65}</td>
					
					<td>${table1.newMalePulmonaryCD}</td>
					<td>${table1.newFemalePulmonaryCD}</td>
					<td>${table1.newPulmonaryCD}</td>                         
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.newMalePulmonaryCDHIV04}</td>
					<td>${table1.newFemalePulmonaryCDHIV04}</td>
					
					<td>${table1.newMalePulmonaryCDHIV0514}</td>
					<td>${table1.newFemalePulmonaryCDHIV0514}</td>
					
					<td>${table1.newMalePulmonaryCDHIV1517}</td>
					<td>${table1.newFemalePulmonaryCDHIV1517}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV1819}</td>
					<td>${table1.newFemalePulmonaryCDHIV1819}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV2024}</td>
					<td>${table1.newFemalePulmonaryCDHIV2024}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV2534}</td>
					<td>${table1.newFemalePulmonaryCDHIV2534}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV3544}</td>
					<td>${table1.newFemalePulmonaryCDHIV3544}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV4554}</td>
					<td>${table1.newFemalePulmonaryCDHIV4554}</td>
					
					
					<td>${table1.newMalePulmonaryCDHIV5564}</td>
					<td>${table1.newFemalePulmonaryCDHIV5564}</td>
					
					<td>${table1.newMalePulmonaryCDHIV65}</td>
					<td>${table1.newFemalePulmonaryCDHIV65}</td>
					
					<td>${table1.newMalePulmonaryCDHIV}</td>
					<td>${table1.newFemalePulmonaryCDHIV}</td>
					<td>${table1.newPulmonaryCDHIV}</td>                      
				</tr>
				<tr>
					<td>ВЛ ТБ</td>
					<td>${table1.newMaleExtrapulmonary04}</td>
					<td>${table1.newFemaleExtrapulmonary04}</td>
					
					<td>${table1.newMaleExtrapulmonary0514}</td>
					<td>${table1.newFemaleExtrapulmonary0514}</td>
					
					<td>${table1.newMaleExtrapulmonary1517}</td>
					<td>${table1.newFemaleExtrapulmonary1517}</td>
					
					
					<td>${table1.newMaleExtrapulmonary1819}</td>
					<td>${table1.newFemaleExtrapulmonary1819}</td>
					
					
					<td>${table1.newMaleExtrapulmonary2024}</td>
					<td>${table1.newFemaleExtrapulmonary2024}</td>
					
					
					<td>${table1.newMaleExtrapulmonary2534}</td>
					<td>${table1.newFemaleExtrapulmonary2534}</td>
					
					
					<td>${table1.newMaleExtrapulmonary3544}</td>
					<td>${table1.newFemaleExtrapulmonary3544}</td>
					
					
					<td>${table1.newMaleExtrapulmonary4554}</td>
					<td>${table1.newFemaleExtrapulmonary4554}</td>
					
					
					<td>${table1.newMaleExtrapulmonary5564}</td>
					<td>${table1.newFemaleExtrapulmonary5564}</td>
					
					<td>${table1.newMaleExtrapulmonary65}</td>
					<td>${table1.newFemaleExtrapulmonary65}</td>
					
					<td>${table1.newMaleExtrapulmonary}</td>
					<td>${table1.newFemaleExtrapulmonary}</td>
					<td>${table1.newExtrapulmonary}</td>                   
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.newMaleExtrapulmonaryHIV04}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV04}</td>
					
					<td>${table1.newMaleExtrapulmonaryHIV0514}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV0514}</td>
					
					<td>${table1.newMaleExtrapulmonaryHIV1517}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV1517}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV1819}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV1819}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV2024}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV2024}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV2534}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV2534}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV3544}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV3544}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV4554}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV4554}</td>
					
					
					<td>${table1.newMaleExtrapulmonaryHIV5564}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV5564}</td>
					
					<td>${table1.newMaleExtrapulmonaryHIV65}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV65}</td>
					
					<td>${table1.newMaleExtrapulmonaryHIV}</td>
					<td>${table1.newFemaleExtrapulmonaryHIV}</td>
					<td>${table1.newExtrapulmonaryHIV}</td>  
				</tr>
				<tr>
					<td colspan="2" align="left">Итого</td>

					<td>${table1.newMale04}</td>
					<td>${table1.newFemale04}</td>
					
					<td>${table1.newMale0514}</td>
					<td>${table1.newFemale0514}</td>
					
					<td>${table1.newMale1517}</td>
					<td>${table1.newFemale1517}</td>
					
					
					<td>${table1.newMale1819}</td>
					<td>${table1.newFemale1819}</td>
					
					
					<td>${table1.newMale2024}</td>
					<td>${table1.newFemale2024}</td>
					
					
					<td>${table1.newMale2534}</td>
					<td>${table1.newFemale2534}</td>
					
					
					<td>${table1.newMale3544}</td>
					<td>${table1.newFemale3544}</td>
					
					
					<td>${table1.newMale4554}</td>
					<td>${table1.newFemale4554}</td>
					
					
					<td>${table1.newMale5564}</td>
					<td>${table1.newFemale5564}</td>
					
					<td>${table1.newMale65}</td>
					<td>${table1.newFemale65}</td>
					
					<td>${table1.newMale}</td>
					<td>${table1.newFemale}</td>  
					<td>${table1.newAll}</td> 
				</tr>
				<tr>
					<td colspan="2">из них ВИЧ</td>

					<td>${table1.newMaleHIV04}</td>
					<td>${table1.newFemaleHIV04}</td>
					
					<td>${table1.newMaleHIV0514}</td>
					<td>${table1.newFemaleHIV0514}</td>
					
					<td>${table1.newMaleHIV1517}</td>
					<td>${table1.newFemaleHIV1517}</td>
					
					
					<td>${table1.newMaleHIV1819}</td>
					<td>${table1.newFemaleHIV1819}</td>
					
					
					<td>${table1.newMaleHIV2024}</td>
					<td>${table1.newFemaleHIV2024}</td>
					
					
					<td>${table1.newMaleHIV2534}</td>
					<td>${table1.newFemaleHIV2534}</td>
					
					
					<td>${table1.newMaleHIV3544}</td>
					<td>${table1.newFemaleHIV3544}</td>
					
					
					<td>${table1.newMaleHIV4554}</td>
					<td>${table1.newFemaleHIV4554}</td>
					
					
					<td>${table1.newMaleHIV5564}</td>
					<td>${table1.newFemaleHIV5564}</td>
					
					<td>${table1.newMaleHIV65}</td>
					<td>${table1.newFemaleHIV65}</td>
					
					<td>${table1.newMaleHIV}</td>
					<td>${table1.newFemaleHIV}</td>  
					<td>${table1.newAllHIV}</td> 
				</tr>

				<tr>
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
					<td rowspan="6">
						<div>Р</div>
						<div>е</div>
						<div>ц</div>
						<div>и</div>
						<div>д</div>
						<div>и</div>
						<div>в</div>
						<div>ы</div>
					</td>
						<td>Л ТБ �? БП</td>
					<td>${table1.relapseMalePulmonaryBC04}</td>
					<td>${table1.relapseFemalePulmonaryBC04}</td>
					
					<td>${table1.relapseMalePulmonaryBC0514}</td>
					<td>${table1.relapseFemalePulmonaryBC0514}</td>
					
					<td>${table1.relapseMalePulmonaryBC1517}</td>
					<td>${table1.relapseFemalePulmonaryBC1517}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC1819}</td>
					<td>${table1.relapseFemalePulmonaryBC1819}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC2024}</td>
					<td>${table1.relapseFemalePulmonaryBC2024}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC2534}</td>
					<td>${table1.relapseFemalePulmonaryBC2534}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC3544}</td>
					<td>${table1.relapseFemalePulmonaryBC3544}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC4554}</td>
					<td>${table1.relapseFemalePulmonaryBC4554}</td>
					
					
					<td>${table1.relapseMalePulmonaryBC5564}</td>
					<td>${table1.relapseFemalePulmonaryBC5564}</td>
					
					<td>${table1.relapseMalePulmonaryBC65}</td>
					<td>${table1.relapseFemalePulmonaryBC65}</td>
					
					<td>${table1.relapseMalePulmonaryBC}</td>
					<td>${table1.relapseFemalePulmonaryBC}</td>
					<td>${table1.relapsePulmonaryBC}</td>                       
				</tr>
				<tr>
					<td>из них ВИЧ </td>
					
					<td>${table1.relapseMalePulmonaryBCHIV04}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV04}</td>
					
					<td>${table1.relapseMalePulmonaryBCHIV0514}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV0514}</td>
					
					<td>${table1.relapseMalePulmonaryBCHIV1517}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV1517}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV1819}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV1819}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV2024}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV2024}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV2534}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV2534}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV3544}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV3544}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV4554}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV4554}</td>
					
					
					<td>${table1.relapseMalePulmonaryBCHIV5564}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV5564}</td>
					
					<td>${table1.relapseMalePulmonaryBCHIV65}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV65}</td>
					
					<td>${table1.relapseMalePulmonaryBCHIV}</td>
					<td>${table1.relapseFemalePulmonaryBCHIV}</td>
					<td>${table1.relapsePulmonaryBCHIV}</td>          
					                   
				</tr>
				<tr>
					<td>Л ТБ �? КУ </td>
					<td>${table1.relapseMalePulmonaryCD04}</td>
					<td>${table1.relapseFemalePulmonaryCD04}</td>
					
					<td>${table1.relapseMalePulmonaryCD0514}</td>
					<td>${table1.relapseFemalePulmonaryCD0514}</td>
					
					<td>${table1.relapseMalePulmonaryCD1517}</td>
					<td>${table1.relapseFemalePulmonaryCD1517}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD1819}</td>
					<td>${table1.relapseFemalePulmonaryCD1819}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD2024}</td>
					<td>${table1.relapseFemalePulmonaryCD2024}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD2534}</td>
					<td>${table1.relapseFemalePulmonaryCD2534}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD3544}</td>
					<td>${table1.relapseFemalePulmonaryCD3544}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD4554}</td>
					<td>${table1.relapseFemalePulmonaryCD4554}</td>
					
					
					<td>${table1.relapseMalePulmonaryCD5564}</td>
					<td>${table1.relapseFemalePulmonaryCD5564}</td>
					
					<td>${table1.relapseMalePulmonaryCD65}</td>
					<td>${table1.relapseFemalePulmonaryCD65}</td>
					
					<td>${table1.relapseMalePulmonaryCD}</td>
					<td>${table1.relapseFemalePulmonaryCD}</td>
					<td>${table1.relapsePulmonaryCD}</td>                         
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.relapseMalePulmonaryCDHIV04}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV04}</td>
					
					<td>${table1.relapseMalePulmonaryCDHIV0514}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV0514}</td>
					
					<td>${table1.relapseMalePulmonaryCDHIV1517}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV1517}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV1819}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV1819}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV2024}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV2024}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV2534}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV2534}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV3544}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV3544}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV4554}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV4554}</td>
					
					
					<td>${table1.relapseMalePulmonaryCDHIV5564}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV5564}</td>
					
					<td>${table1.relapseMalePulmonaryCDHIV65}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV65}</td>
					
					<td>${table1.relapseMalePulmonaryCDHIV}</td>
					<td>${table1.relapseFemalePulmonaryCDHIV}</td>
					<td>${table1.relapsePulmonaryCDHIV}</td>  
					                   
				</tr>
				</tr>
				<tr>
					<td>ВЛ ТБ</td>
					<td>${table1.relapseMaleExtrapulmonary04}</td>
					<td>${table1.relapseFemaleExtrapulmonary04}</td>
					
					<td>${table1.relapseMaleExtrapulmonary0514}</td>
					<td>${table1.relapseFemaleExtrapulmonary0514}</td>
					
					<td>${table1.relapseMaleExtrapulmonary1517}</td>
					<td>${table1.relapseFemaleExtrapulmonary1517}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary1819}</td>
					<td>${table1.relapseFemaleExtrapulmonary1819}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary2024}</td>
					<td>${table1.relapseFemaleExtrapulmonary2024}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary2534}</td>
					<td>${table1.relapseFemaleExtrapulmonary2534}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary3544}</td>
					<td>${table1.relapseFemaleExtrapulmonary3544}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary4554}</td>
					<td>${table1.relapseFemaleExtrapulmonary4554}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonary5564}</td>
					<td>${table1.relapseFemaleExtrapulmonary5564}</td>
					
					<td>${table1.relapseMaleExtrapulmonary65}</td>
					<td>${table1.relapseFemaleExtrapulmonary65}</td>
					
					<td>${table1.relapseMaleExtrapulmonary}</td>
					<td>${table1.relapseFemaleExtrapulmonary}</td>
					<td>${table1.relapseExtrapulmonary}</td>                   
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.relapseMaleExtrapulmonaryHIV04}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV04}</td>
					
					<td>${table1.relapseMaleExtrapulmonaryHIV0514}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV0514}</td>
					
					<td>${table1.relapseMaleExtrapulmonaryHIV1517}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV1517}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV1819}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV1819}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV2024}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV2024}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV2534}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV2534}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV3544}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV3544}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV4554}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV4554}</td>
					
					
					<td>${table1.relapseMaleExtrapulmonaryHIV5564}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV5564}</td>
					
					<td>${table1.relapseMaleExtrapulmonaryHIV65}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV65}</td>
					
					<td>${table1.relapseMaleExtrapulmonaryHIV}</td>
					<td>${table1.relapseFemaleExtrapulmonaryHIV}</td>
					<td>${table1.relapseExtrapulmonaryHIV}</td> 
					                   
				</tr>
				<tr>
					<td colspan="2" align="left">Итого</td>
					<td>${table1.relapseMale04}</td>
					<td>${table1.relapseFemale04}</td>
					
					<td>${table1.relapseMale0514}</td>
					<td>${table1.relapseFemale0514}</td>
					
					<td>${table1.relapseMale1517}</td>
					<td>${table1.relapseFemale1517}</td>
					
					
					<td>${table1.relapseMale1819}</td>
					<td>${table1.relapseFemale1819}</td>
					
					
					<td>${table1.relapseMale2024}</td>
					<td>${table1.relapseFemale2024}</td>
					
					
					<td>${table1.relapseMale2534}</td>
					<td>${table1.relapseFemale2534}</td>
					
					
					<td>${table1.relapseMale3544}</td>
					<td>${table1.relapseFemale3544}</td>
					
					
					<td>${table1.relapseMale4554}</td>
					<td>${table1.relapseFemale4554}</td>
					
					
					<td>${table1.relapseMale5564}</td>
					<td>${table1.relapseFemale5564}</td>
					
					<td>${table1.relapseMale65}</td>
					<td>${table1.relapseFemale65}</td>
					
					<td>${table1.relapseMale}</td>
					<td>${table1.relapseFemale}</td>  
					<td>${table1.relapseAll}</td> 
				</tr>
				<tr>
					<td colspan="2">из них ВИЧ</td>

					<td>${table1.relapseMaleHIV04}</td>
					<td>${table1.relapseFemaleHIV04}</td>
					
					<td>${table1.relapseMaleHIV0514}</td>
					<td>${table1.relapseFemaleHIV0514}</td>
					
					<td>${table1.relapseMaleHIV1517}</td>
					<td>${table1.relapseFemaleHIV1517}</td>
					
					
					<td>${table1.relapseMaleHIV1819}</td>
					<td>${table1.relapseFemaleHIV1819}</td>
					
					
					<td>${table1.relapseMaleHIV2024}</td>
					<td>${table1.relapseFemaleHIV2024}</td>
					
					
					<td>${table1.relapseMaleHIV2534}</td>
					<td>${table1.relapseFemaleHIV2534}</td>
					
					
					<td>${table1.relapseMaleHIV3544}</td>
					<td>${table1.relapseFemaleHIV3544}</td>
					
					
					<td>${table1.relapseMaleHIV4554}</td>
					<td>${table1.relapseFemaleHIV4554}</td>
					
					
					<td>${table1.relapseMaleHIV5564}</td>
					<td>${table1.relapseFemaleHIV5564}</td>
					
					<td>${table1.relapseMaleHIV65}</td>
					<td>${table1.relapseFemaleHIV65}</td>
					
					<td>${table1.relapseMaleHIV}</td>
					<td>${table1.relapseFemaleHIV}</td>  
					<td>${table1.relapseAllHIV}</td> 
				</tr>
				<tr>
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
					<td rowspan="6">
						<div>И</div>
						<div>т</div>
						<div>о</div>
						<div>г</div>
						<div>о</div>
						<div>=</div>
						<div>�?С</div>
						<div>+</div>
						<div>Р</div>
					</td>
					<td>Л ТБ �? БП</td>
					<td>${table1.newMalePulmonaryBC04 + table1.relapseMalePulmonaryBC04 }</td>
					<td>${table1.newFemalePulmonaryBC04 + table1.relapseFemalePulmonaryBC04 }</td>
					<td>${table1.newMalePulmonaryBC0514 + table1.relapseMalePulmonaryBC0514 }</td>
					<td>${table1.newFemalePulmonaryBC0514 + table1.relapseFemalePulmonaryBC0514 }</td>
					<td>${table1.newMalePulmonaryBC1517 + table1.relapseMalePulmonaryBC1517 }</td>
					<td>${table1.newFemalePulmonaryBC1517 + table1.relapseFemalePulmonaryBC1517 }</td>
					<td>${table1.newMalePulmonaryBC1819 + table1.relapseMalePulmonaryBC1819 }</td>
					<td>${table1.newFemalePulmonaryBC1819 + table1.relapseFemalePulmonaryBC1819 }</td>
					<td>${table1.newMalePulmonaryBC2024 + table1.relapseMalePulmonaryBC2024 }</td>
					<td>${table1.newFemalePulmonaryBC2024 + table1.relapseFemalePulmonaryBC2024 }</td>
					<td>${table1.newMalePulmonaryBC2534 + table1.relapseMalePulmonaryBC2534 }</td>
					<td>${table1.newFemalePulmonaryBC2534 + table1.relapseFemalePulmonaryBC2534 }</td>
					<td>${table1.newMalePulmonaryBC3544 + table1.relapseMalePulmonaryBC3544 }</td>
					<td>${table1.newFemalePulmonaryBC3544 + table1.relapseFemalePulmonaryBC3544 }</td>
					<td>${table1.newMalePulmonaryBC4554 + table1.relapseMalePulmonaryBC4554 }</td>
					<td>${table1.newFemalePulmonaryBC4554 + table1.relapseFemalePulmonaryBC4554 }</td>
					<td>${table1.newMalePulmonaryBC5564 + table1.relapseMalePulmonaryBC5564 }</td>
					<td>${table1.newFemalePulmonaryBC5564 + table1.relapseFemalePulmonaryBC5564 }</td>
					<td>${table1.newMalePulmonaryBC65 + table1.relapseMalePulmonaryBC65 }</td>
					<td>${table1.newFemalePulmonaryBC65 + table1.relapseFemalePulmonaryBC65 }</td>
					<td>${table1.newMalePulmonaryBC + table1.relapseMalePulmonaryBC }</td>
					<td>${table1.newFemalePulmonaryBC + table1.relapseFemalePulmonaryBC }</td>
					<td>${table1.newPulmonaryBC + table1.relapsePulmonaryBC }</td>
					
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.newMalePulmonaryBCHIV04 + table1.relapseMalePulmonaryBCHIV04 }</td>
					<td>${table1.newFemalePulmonaryBCHIV04 + table1.relapseFemalePulmonaryBCHIV04 }</td>
					<td>${table1.newMalePulmonaryBCHIV0514 + table1.relapseMalePulmonaryBCHIV0514 }</td>
					<td>${table1.newFemalePulmonaryBCHIV0514 + table1.relapseFemalePulmonaryBCHIV0514 }</td>
					<td>${table1.newMalePulmonaryBCHIV1517 + table1.relapseMalePulmonaryBCHIV1517 }</td>
					<td>${table1.newFemalePulmonaryBCHIV1517 + table1.relapseFemalePulmonaryBCHIV1517 }</td>
					<td>${table1.newMalePulmonaryBCHIV1819 + table1.relapseMalePulmonaryBCHIV1819 }</td>
					<td>${table1.newFemalePulmonaryBCHIV1819 + table1.relapseFemalePulmonaryBCHIV1819 }</td>
					<td>${table1.newMalePulmonaryBCHIV2024 + table1.relapseMalePulmonaryBCHIV2024 }</td>
					<td>${table1.newFemalePulmonaryBCHIV2024 + table1.relapseFemalePulmonaryBCHIV2024 }</td>
					<td>${table1.newMalePulmonaryBCHIV2534 + table1.relapseMalePulmonaryBCHIV2534 }</td>
					<td>${table1.newFemalePulmonaryBCHIV2534 + table1.relapseFemalePulmonaryBCHIV2534 }</td>
					<td>${table1.newMalePulmonaryBCHIV3544 + table1.relapseMalePulmonaryBCHIV3544 }</td>
					<td>${table1.newFemalePulmonaryBCHIV3544 + table1.relapseFemalePulmonaryBCHIV3544 }</td>
					<td>${table1.newMalePulmonaryBCHIV4554 + table1.relapseMalePulmonaryBCHIV4554 }</td>
					<td>${table1.newFemalePulmonaryBCHIV4554 + table1.relapseFemalePulmonaryBCHIV4554 }</td>
					<td>${table1.newMalePulmonaryBCHIV5564 + table1.relapseMalePulmonaryBCHIV5564 }</td>
					<td>${table1.newFemalePulmonaryBCHIV5564 + table1.relapseFemalePulmonaryBCHIV5564 }</td>
					<td>${table1.newMalePulmonaryBCHIV65 + table1.relapseMalePulmonaryBCHIV65 }</td>
					<td>${table1.newFemalePulmonaryBCHIV65 + table1.relapseFemalePulmonaryBCHIV65 }</td>
					<td>${table1.newMalePulmonaryBCHIV + table1.relapseMalePulmonaryBCHIV }</td>
					<td>${table1.newFemalePulmonaryBCHIV + table1.relapseFemalePulmonaryBCHIV }</td>
					<td>${table1.newPulmonaryBCHIV + table1.relapsePulmonaryBCHIV }</td>
					                   
				</tr>
				<tr>
					<td>Л ТБ �? КУ </td>
					<td>${table1.newMalePulmonaryCD04 + table1.relapseMalePulmonaryCD04 }</td>
					<td>${table1.newFemalePulmonaryCD04 + table1.relapseFemalePulmonaryCD04 }</td>
					<td>${table1.newMalePulmonaryCD0514 + table1.relapseMalePulmonaryCD0514 }</td>
					<td>${table1.newFemalePulmonaryCD0514 + table1.relapseFemalePulmonaryCD0514 }</td>
					<td>${table1.newMalePulmonaryCD1517 + table1.relapseMalePulmonaryCD1517 }</td>
					<td>${table1.newFemalePulmonaryCD1517 + table1.relapseFemalePulmonaryCD1517 }</td>
					<td>${table1.newMalePulmonaryCD1819 + table1.relapseMalePulmonaryCD1819 }</td>
					<td>${table1.newFemalePulmonaryCD1819 + table1.relapseFemalePulmonaryCD1819 }</td>
					<td>${table1.newMalePulmonaryCD2024 + table1.relapseMalePulmonaryCD2024 }</td>
					<td>${table1.newFemalePulmonaryCD2024 + table1.relapseFemalePulmonaryCD2024 }</td>
					<td>${table1.newMalePulmonaryCD2534 + table1.relapseMalePulmonaryCD2534 }</td>
					<td>${table1.newFemalePulmonaryCD2534 + table1.relapseFemalePulmonaryCD2534 }</td>
					<td>${table1.newMalePulmonaryCD3544 + table1.relapseMalePulmonaryCD3544 }</td>
					<td>${table1.newFemalePulmonaryCD3544 + table1.relapseFemalePulmonaryCD3544 }</td>
					<td>${table1.newMalePulmonaryCD4554 + table1.relapseMalePulmonaryCD4554 }</td>
					<td>${table1.newFemalePulmonaryCD4554 + table1.relapseFemalePulmonaryCD4554 }</td>
					<td>${table1.newMalePulmonaryCD5564 + table1.relapseMalePulmonaryCD5564 }</td>
					<td>${table1.newFemalePulmonaryCD5564 + table1.relapseFemalePulmonaryCD5564 }</td>
					<td>${table1.newMalePulmonaryCD65 + table1.relapseMalePulmonaryCD65 }</td>
					<td>${table1.newFemalePulmonaryCD65 + table1.relapseFemalePulmonaryCD65 }</td>
					<td>${table1.newMalePulmonaryCD + table1.relapseMalePulmonaryCD }</td>
					<td>${table1.newFemalePulmonaryCD + table1.relapseFemalePulmonaryCD }</td>
					<td>${table1.newPulmonaryCD + table1.relapsePulmonaryCD }</td>
					
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.newMalePulmonaryCDHIV04 + table1.relapseMalePulmonaryCDHIV04 }</td>
					<td>${table1.newFemalePulmonaryCDHIV04 + table1.relapseFemalePulmonaryCDHIV04 }</td>
					<td>${table1.newMalePulmonaryCDHIV0514 + table1.relapseMalePulmonaryCDHIV0514 }</td>
					<td>${table1.newFemalePulmonaryCDHIV0514 + table1.relapseFemalePulmonaryCDHIV0514 }</td>
					<td>${table1.newMalePulmonaryCDHIV1517 + table1.relapseMalePulmonaryCDHIV1517 }</td>
					<td>${table1.newFemalePulmonaryCDHIV1517 + table1.relapseFemalePulmonaryCDHIV1517 }</td>
					<td>${table1.newMalePulmonaryCDHIV1819 + table1.relapseMalePulmonaryCDHIV1819 }</td>
					<td>${table1.newFemalePulmonaryCDHIV1819 + table1.relapseFemalePulmonaryCDHIV1819 }</td>
					<td>${table1.newMalePulmonaryCDHIV2024 + table1.relapseMalePulmonaryCDHIV2024 }</td>
					<td>${table1.newFemalePulmonaryCDHIV2024 + table1.relapseFemalePulmonaryCDHIV2024 }</td>
					<td>${table1.newMalePulmonaryCDHIV2534 + table1.relapseMalePulmonaryCDHIV2534 }</td>
					<td>${table1.newFemalePulmonaryCDHIV2534 + table1.relapseFemalePulmonaryCDHIV2534 }</td>
					<td>${table1.newMalePulmonaryCDHIV3544 + table1.relapseMalePulmonaryCDHIV3544 }</td>
					<td>${table1.newFemalePulmonaryCDHIV3544 + table1.relapseFemalePulmonaryCDHIV3544 }</td>
					<td>${table1.newMalePulmonaryCDHIV4554 + table1.relapseMalePulmonaryCDHIV4554 }</td>
					<td>${table1.newFemalePulmonaryCDHIV4554 + table1.relapseFemalePulmonaryCDHIV4554 }</td>
					<td>${table1.newMalePulmonaryCDHIV5564 + table1.relapseMalePulmonaryCDHIV5564 }</td>
					<td>${table1.newFemalePulmonaryCDHIV5564 + table1.relapseFemalePulmonaryCDHIV5564 }</td>
					<td>${table1.newMalePulmonaryCDHIV65 + table1.relapseMalePulmonaryCDHIV65 }</td>
					<td>${table1.newFemalePulmonaryCDHIV65 + table1.relapseFemalePulmonaryCDHIV65 }</td>
					<td>${table1.newMalePulmonaryCDHIV + table1.relapseMalePulmonaryCDHIV }</td>
					<td>${table1.newFemalePulmonaryCDHIV + table1.relapseFemalePulmonaryCDHIV }</td>
					<td>${table1.newPulmonaryCDHIV + table1.relapsePulmonaryCDHIV }
				</tr>
				<tr>
					<td>ВЛ ТБ</td>
					<td>${table1.newMaleExtrapulmonary04 + table1.relapseMaleExtrapulmonary04 }</td>
					<td>${table1.newFemaleExtrapulmonary04 + table1.relapseFemaleExtrapulmonary04 }</td>
					<td>${table1.newMaleExtrapulmonary0514 + table1.relapseMaleExtrapulmonary0514 }</td>
					<td>${table1.newFemaleExtrapulmonary0514 + table1.relapseFemaleExtrapulmonary0514 }</td>
					<td>${table1.newMaleExtrapulmonary1517 + table1.relapseMaleExtrapulmonary1517 }</td>
					<td>${table1.newFemaleExtrapulmonary1517 + table1.relapseFemaleExtrapulmonary1517 }</td>
					<td>${table1.newMaleExtrapulmonary1819 + table1.relapseMaleExtrapulmonary1819 }</td>
					<td>${table1.newFemaleExtrapulmonary1819 + table1.relapseFemaleExtrapulmonary1819 }</td>
					<td>${table1.newMaleExtrapulmonary2024 + table1.relapseMaleExtrapulmonary2024 }</td>
					<td>${table1.newFemaleExtrapulmonary2024 + table1.relapseFemaleExtrapulmonary2024 }</td>
					<td>${table1.newMaleExtrapulmonary2534 + table1.relapseMaleExtrapulmonary2534 }</td>
					<td>${table1.newFemaleExtrapulmonary2534 + table1.relapseFemaleExtrapulmonary2534 }</td>
					<td>${table1.newMaleExtrapulmonary3544 + table1.relapseMaleExtrapulmonary3544 }</td>
					<td>${table1.newFemaleExtrapulmonary3544 + table1.relapseFemaleExtrapulmonary3544 }</td>
					<td>${table1.newMaleExtrapulmonary4554 + table1.relapseMaleExtrapulmonary4554 }</td>
					<td>${table1.newFemaleExtrapulmonary4554 + table1.relapseFemaleExtrapulmonary4554 }</td>
					<td>${table1.newMaleExtrapulmonary5564 + table1.relapseMaleExtrapulmonary5564 }</td>
					<td>${table1.newFemaleExtrapulmonary5564 + table1.relapseFemaleExtrapulmonary5564 }</td>
					<td>${table1.newMaleExtrapulmonary65 + table1.relapseMaleExtrapulmonary65 }</td>
					<td>${table1.newFemaleExtrapulmonary65 + table1.relapseFemaleExtrapulmonary65 }</td>
					<td>${table1.newMaleExtrapulmonary + table1.relapseMaleExtrapulmonary }</td>
					<td>${table1.newFemaleExtrapulmonary + table1.relapseFemaleExtrapulmonary }</td>
					<td>${table1.newExtrapulmonary + table1.relapseExtrapulmonary }</td>
					
				</tr>
				<tr>
					<td>из них ВИЧ</td>
					<td>${table1.newMaleExtrapulmonaryHIV04 + table1.relapseMaleExtrapulmonaryHIV04 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV04 + table1.relapseFemaleExtrapulmonaryHIV04 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV0514 + table1.relapseMaleExtrapulmonaryHIV0514 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV0514 + table1.relapseFemaleExtrapulmonaryHIV0514 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV1517 + table1.relapseMaleExtrapulmonaryHIV1517 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV1517 + table1.relapseFemaleExtrapulmonaryHIV1517 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV1819 + table1.relapseMaleExtrapulmonaryHIV1819 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV1819 + table1.relapseFemaleExtrapulmonaryHIV1819 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV2024 + table1.relapseMaleExtrapulmonaryHIV2024 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV2024 + table1.relapseFemaleExtrapulmonaryHIV2024 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV2534 + table1.relapseMaleExtrapulmonaryHIV2534 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV2534 + table1.relapseFemaleExtrapulmonaryHIV2534 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV3544 + table1.relapseMaleExtrapulmonaryHIV3544 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV3544 + table1.relapseFemaleExtrapulmonaryHIV3544 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV4554 + table1.relapseMaleExtrapulmonaryHIV4554 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV4554 + table1.relapseFemaleExtrapulmonaryHIV4554 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV5564 + table1.relapseMaleExtrapulmonaryHIV5564 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV5564 + table1.relapseFemaleExtrapulmonaryHIV5564 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV65 + table1.relapseMaleExtrapulmonaryHIV65 }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV65 + table1.relapseFemaleExtrapulmonaryHIV65 }</td>
					<td>${table1.newMaleExtrapulmonaryHIV + table1.relapseMaleExtrapulmonaryHIV }</td>
					<td>${table1.newFemaleExtrapulmonaryHIV + table1.relapseFemaleExtrapulmonaryHIV }</td>
					<td>${table1.newExtrapulmonaryHIV + table1.relapseExtrapulmonaryHIV }
				</tr>
				<tr>
					<td colspan="2" align="left">Итого</td>

					<td>${table1.newMale04 + table1.relapseMale04 }</td>
					<td>${table1.newFemale04 + table1.relapseFemale04 }</td>
					<td>${table1.newMale0514 + table1.relapseMale0514 }</td>
					<td>${table1.newFemale0514 + table1.relapseFemale0514 }</td>
					<td>${table1.newMale1517 + table1.relapseMale1517 }</td>
					<td>${table1.newFemale1517 + table1.relapseFemale1517 }</td>
					<td>${table1.newMale1819 + table1.relapseMale1819 }</td>
					<td>${table1.newFemale1819 + table1.relapseFemale1819 }</td>
					<td>${table1.newMale2024 + table1.relapseMale2024 }</td>
					<td>${table1.newFemale2024 + table1.relapseFemale2024 }</td>
					<td>${table1.newMale2534 + table1.relapseMale2534 }</td>
					<td>${table1.newFemale2534 + table1.relapseFemale2534 }</td>
					<td>${table1.newMale3544 + table1.relapseMale3544 }</td>
					<td>${table1.newFemale3544 + table1.relapseFemale3544 }</td>
					<td>${table1.newMale4554 + table1.relapseMale4554 }</td>
					<td>${table1.newFemale4554 + table1.relapseFemale4554 }</td>
					<td>${table1.newMale5564 + table1.relapseMale5564 }</td>
					<td>${table1.newFemale5564 + table1.relapseFemale5564 }</td>
					<td>${table1.newMale65 + table1.relapseMale65 }</td>
					<td>${table1.newFemale65 + table1.relapseFemale65 }</td>
					<td>${table1.newMale + table1.relapseMale }</td>
					<td>${table1.newFemale + table1.relapseFemale }</td>		
					<td>${table1.newAll + table1.relapseAll }</td>
				</tr>
				<tr>
					<td colspan="2">из них ВИЧ</td>

					<td>${table1.newMaleHIV04 + table1.relapseMaleHIV04 }</td>
					<td>${table1.newFemaleHIV04 + table1.relapseFemaleHIV04 }</td>
					<td>${table1.newMaleHIV0514 + table1.relapseMaleHIV0514 }</td>
					<td>${table1.newFemaleHIV0514 + table1.relapseFemaleHIV0514 }</td>
					<td>${table1.newMaleHIV1517 + table1.relapseMaleHIV1517 }</td>
					<td>${table1.newFemaleHIV1517 + table1.relapseFemaleHIV1517 }</td>
					<td>${table1.newMaleHIV1819 + table1.relapseMaleHIV1819 }</td>
					<td>${table1.newFemaleHIV1819 + table1.relapseFemaleHIV1819 }</td>
					<td>${table1.newMaleHIV2024 + table1.relapseMaleHIV2024 }</td>
					<td>${table1.newFemaleHIV2024 + table1.relapseFemaleHIV2024 }</td>
					<td>${table1.newMaleHIV2534 + table1.relapseMaleHIV2534 }</td>
					<td>${table1.newFemaleHIV2534 + table1.relapseFemaleHIV2534 }</td>
					<td>${table1.newMaleHIV3544 + table1.relapseMaleHIV3544 }</td>
					<td>${table1.newFemaleHIV3544 + table1.relapseFemaleHIV3544 }</td>
					<td>${table1.newMaleHIV4554 + table1.relapseMaleHIV4554 }</td>
					<td>${table1.newFemaleHIV4554 + table1.relapseFemaleHIV4554 }</td>
					<td>${table1.newMaleHIV5564 + table1.relapseMaleHIV5564 }</td>
					<td>${table1.newFemaleHIV5564 + table1.relapseFemaleHIV5564 }</td>
					<td>${table1.newMaleHIV65 + table1.relapseMaleHIV65 }</td>
					<td>${table1.newFemaleHIV65 + table1.relapseFemaleHIV65 }</td>
					<td>${table1.newMaleHIV + table1.relapseMaleHIV }</td>
					<td>${table1.newFemaleHIV + table1.relapseFemaleHIV }</td>		
					<td>${table1.newAllHIV + table1.relapseAllHIV }</td>
				</tr>


			</tbody>
		</table>
<p><p>Из чи�?ла в�?ех новых �?лучаев (�? бактериологиче�?ким подтверждением или �? клиниче�?ки у�?тановленным диагнозом), вы�?вленных за квартал: женщины детородного возра�?та (15-49)  _______, из них беременные ____; контактные ______; мигранты ________; 
медработники ПМСП  ______; медработники ТБ �?лужбы  ________.  
Из чи�?ла контингента, �?о�?то�?щих на учете: умерло в�?его _________, из них: дети  ________, женщины детородного возра�?та ___________. </p>
		
</div>

<h5>Таблица 2. В�?е повторные �?лучаи (�? бактериологиче�?ким подтверждением или �? клиниче�?ки у�?тановленным диагнозом), вы�?вленные за отчетный период</h5>
<table style="width: 900px;" border="1">
<tbody>
<tr>
<td>&nbsp;</td>
<td style="text-align: center;" colspan="3">По�?ле не�?ффективного<br/>лечени�?</td>
<td style="text-align: center;" colspan="3">По�?ле отрыва от лечени�?</td>
<td style="text-align: center;" colspan="3">Другие</td>
<td style="text-align: center;" colspan="3">Итого</td>
<td colspan="3">
<p style="text-align: center;">Итого</p>
<p style="text-align: center;">(T.1+T.2)</p>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="center">M</td>
<td align="center">Ж</td>
<td align="center">Итого</td>
<td align="center">M</td>
<td align="center">Ж</td>
<td align="center">Итого</td>
<td align="center">M</td>
<td align="center">Ж</td>
<td align="center">Итого</td>
<td align="center">M</td>
<td align="center">Ж</td>
<td align="center">Итого</td>
<td align="center">M</td>
<td align="center">Ж</td>
<td align="center">Итого</td>
</tr>
<tr>
<td>
<p>Л ТБ �? БП</p>
</td>
<td>${table1.failureMalePulmonaryBC}</td>
<td>${table1.failureFemalePulmonaryBC}</td>
<td>${table1.failurePulmonaryBC}</td>
<td>${table1.defaultMalePulmonaryBC}</td>
<td>${table1.defaultFemalePulmonaryBC}</td>
<td>${table1.defaultPulmonaryBC}</td>
<td>${table1.otherMalePulmonaryBC}</td>
<td>${table1.otherFemalePulmonaryBC}</td>
<td>${table1.otherPulmonaryBC}</td>
<td>${table1.retreatmentMalePulmonaryBC}</td>
<td>${table1.retreatmentFemalePulmonaryBC}</td>
<td>${table1.retreatmentPulmonaryBC}</td>
<td>${table1.totalMalePulmonaryBC}</td>
<td>${table1.totalFemalePulmonaryBC}</td>
<td>${table1.totalPulmonaryBC}</td>
                      
</tr>
<tr>
<td>из них ВИЧ</td>
<td>${table1.failureMalePulmonaryBCHIV}</td>
<td>${table1.failureFemalePulmonaryBCHIV}</td>
<td>${table1.failurePulmonaryBCHIV}</td>
<td>${table1.defaultMalePulmonaryBCHIV}</td>
<td>${table1.defaultFemalePulmonaryBCHIV}</td>
<td>${table1.defaultPulmonaryBCHIV}</td>
<td>${table1.otherMalePulmonaryBCHIV}</td>
<td>${table1.otherFemalePulmonaryBCHIV}</td>
<td>${table1.otherPulmonaryBCHIV}</td>
<td>${table1.retreatmentMalePulmonaryBCHIV}</td>
<td>${table1.retreatmentFemalePulmonaryBCHIV}</td>
<td>${table1.retreatmentPulmonaryBCHIV}</td>
<td>${table1.totalMalePulmonaryBCHIV}</td>
<td>${table1.totalFemalePulmonaryBCHIV}</td>
<td>${table1.totalPulmonaryBCHIV}</td>
</tr>
<tr>
<td>Л ТБ �? КУ </td>
<td>${table1.failureMalePulmonaryCD}</td>
<td>${table1.failureFemalePulmonaryCD}</td>
<td>${table1.failurePulmonaryCD}</td>
<td>${table1.defaultMalePulmonaryCD}</td>
<td>${table1.defaultFemalePulmonaryCD}</td>
<td>${table1.defaultPulmonaryCD}</td>
<td>${table1.otherMalePulmonaryCD}</td>
<td>${table1.otherFemalePulmonaryCD}</td>
<td>${table1.otherPulmonaryCD}</td>
<td>${table1.retreatmentMalePulmonaryCD}</td>
<td>${table1.retreatmentFemalePulmonaryCD}</td>
<td>${table1.retreatmentPulmonaryCD}</td>
<td>${table1.totalMalePulmonaryCD}</td>
<td>${table1.totalFemalePulmonaryCD}</td>
<td>${table1.totalPulmonaryCD}</td>
</tr>
<tr>
<td>из них ВИЧ&nbsp;</td>
<td>${table1.failureMalePulmonaryCDHIV}</td>
<td>${table1.failureFemalePulmonaryCDHIV}</td>
<td>${table1.failurePulmonaryCDHIV}</td>
<td>${table1.defaultMalePulmonaryCDHIV}</td>
<td>${table1.defaultFemalePulmonaryCDHIV}</td>
<td>${table1.defaultPulmonaryCDHIV}</td>
<td>${table1.otherMalePulmonaryCDHIV}</td>
<td>${table1.otherFemalePulmonaryCDHIV}</td>
<td>${table1.otherPulmonaryCDHIV}</td>
<td>${table1.retreatmentMalePulmonaryCDHIV}</td>
<td>${table1.retreatmentFemalePulmonaryCDHIV}</td>
<td>${table1.retreatmentPulmonaryCDHIV}</td>
<td>${table1.totalMalePulmonaryCDHIV}</td>
<td>${table1.totalFemalePulmonaryCDHIV}</td>
<td>${table1.totalPulmonaryCDHIV}</td>
</tr>
<tr>
<td>ВЛ ТБ</td>
<td>${table1.failureMaleExtrapulmonary}</td>
<td>${table1.failureFemaleExtrapulmonary}</td>
<td>${table1.failureExtrapulmonary}</td>
<td>${table1.defaultMaleExtrapulmonary}</td>
<td>${table1.defaultFemaleExtrapulmonary}</td>
<td>${table1.defaultExtrapulmonary}</td>
<td>${table1.otherMaleExtrapulmonary}</td>
<td>${table1.otherFemaleExtrapulmonary}</td>
<td>${table1.otherExtrapulmonary}</td>
<td>${table1.retreatmentMaleExtrapulmonary}</td>
<td>${table1.retreatmentFemaleExtrapulmonary}</td>
<td>${table1.retreatmentExtrapulmonary}</td>
<td>${table1.totalMaleExtrapulmonary}</td>
<td>${table1.totalFemaleExtrapulmonary}</td>
<td>${table1.totalExtrapulmonary}</td>
</tr>
<tr>
<td>из них ВИЧ</td>
<td>${table1.failureMaleExtrapulmonaryHIV}</td>
<td>${table1.failureFemaleExtrapulmonaryHIV}</td>
<td>${table1.failureExtrapulmonaryHIV}</td>
<td>${table1.defaultMaleExtrapulmonaryHIV}</td>
<td>${table1.defaultFemaleExtrapulmonaryHIV}</td>
<td>${table1.defaultExtrapulmonaryHIV}</td>
<td>${table1.otherMaleExtrapulmonaryHIV}</td>
<td>${table1.otherFemaleExtrapulmonaryHIV}</td>
<td>${table1.otherExtrapulmonaryHIV}</td>
<td>${table1.retreatmentMaleExtrapulmonaryHIV}</td>
<td>${table1.retreatmentFemaleExtrapulmonaryHIV}</td>
<td>${table1.retreatmentExtrapulmonaryHIV}</td>
<td>${table1.totalMaleExtrapulmonaryHIV}</td>
<td>${table1.totalFemaleExtrapulmonaryHIV}</td>
<td>${table1.totalExtrapulmonaryHIV}</td>
<tr>
<td style="margin-left: 30px; text-align: center;"><strong>Итого</strong></td>
<td>${table1.failureMale}</td>
<td>${table1.failureFemale}</td>
<td>${table1.failureAll}</td>
<td>${table1.defaultMale}</td>
<td>${table1.defaultFemale}</td>
<td>${table1.defaultAll}</td>
<td>${table1.otherMale}</td>
<td>${table1.otherFemale}</td>
<td>${table1.otherAll}</td>
<td>${table1.retreatmentMale}</td>
<td>${table1.retreatmentFemale}</td>
<td>${table1.retreatmentAll}</td>
<td>${table1.totalMale}</td>
<td>${table1.totalFemale}</td>
<td>${table1.totalAll}</td>
</tr>

<tr>
<td style="text-align: center;"><strong>из них ВИЧ</strong></td>
<td>${table1.failureMaleHIV}</td>
<td>${table1.failureFemaleHIV}</td>
<td>${table1.failureAllHIV}</td>
<td>${table1.defaultMaleHIV}</td>
<td>${table1.defaultFemaleHIV}</td>
<td>${table1.defaultAllHIV}</td>
<td>${table1.otherMaleHIV}</td>
<td>${table1.otherFemaleHIV}</td>
<td>${table1.otherAllHIV}</td>
<td>${table1.retreatmentMaleHIV}</td>
<td>${table1.retreatmentFemaleHIV}</td>
<td>${table1.retreatmentAllHIV}</td>
<td>${table1.totalMaleHIV}</td>
<td>${table1.totalFemaleHIV}</td>
<td>${table1.totalAllHIV}</td>
</tr>




</tbody>
</table>

<br/><br/>
<h5>Таблица 3. Меропри�?ти�? ТБ/ВИЧ �?реди в�?ех �?лучаев ТБ, вы�?вленных за отчетный период</h5>
<table style="width: 900px;" border="1">
<tbody>	
<tr>
<td align="center">Чи�?ло �?лучаев ТБ,<br/>проте�?тированных на ВИЧ, в�?его</td>
<td align="center">из проте�?тированных<br/>подтверждён ВИЧ, в�?его</td>
<td align="center">из подтвержденных получают<br/>�?РТ, в�?его</td>
<td align="center">из подтвержденных получают<br/>ПЛК, в�?его</td>
</tr>
<tr>
<td align="center">${table1.hivTested }</td>
<td align="center">${table1.hivPositive }</td>
<td align="center">${table1.artStarted }</td>
<td align="center">${table1.pctStarted }</td>
</tr>
</tbody>
</table>
	

</body>
</html>
