package org.cts.oneframework.webapicucumber.stepdefinition;

import java.util.HashMap;
import java.util.List;

import org.cts.oneframework.excelreader.ReadExcel;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;

public class DefaultStepDefinition {

	public static ThreadLocal<HashMap<String, String>> currentIterationMap = new ThreadLocal<>();
	private HashMap<String, HashMap<String, String>> excelData = new HashMap<String, HashMap<String, String>>();
	private static String rowName;

	@Before
	public void readScenarioName(cucumber.api.Scenario scenario) {
		//System.out.println(scenario.getName());
		rowName = scenario.getName();
		
	}

	@Given("^A workbook named \"([^\"]*)\" and sheet named \"([^\"]*)\" is read$")
	public synchronized void a_workbook_named_and_sheet_named_is_read(String excelName, String sheetName) {
		//System.out.println(excelName+ sheetName);
		
		List<HashMap<String, String>> data = ReadExcel.readData(excelName, sheetName);
		for (HashMap<String, String> map : data) {
			excelData.put(map.get("TestDataID").trim(), map);
		}
		currentIterationMap.set(excelData.get(rowName));
	}
	
	
}
