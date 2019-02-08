package org.cts.oneframework.cucumber.stepdefinition;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.cts.oneframework.excelreader.ReadExcel;

import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;

public class DefaultStepDefinition {

	private static ThreadLocal<LinkedHashMap<Integer, HashMap<String, String>>> excelData = new ThreadLocal<LinkedHashMap<Integer, HashMap<String, String>>>() {
		@Override
		protected LinkedHashMap<Integer, HashMap<String, String>> initialValue() {
			return new LinkedHashMap<>();
		}
	};

	private static ThreadLocal<String> rowName = new ThreadLocal<>();

	private static ThreadLocal<Integer> rowCounter = new ThreadLocal<Integer>() {
		@Override
		protected Integer initialValue() {
			return 0;
		}
	};

	@Before
	public void readScenarioName(Scenario scenario) {
		rowName.set(scenario.getName());
		rowCounter.set(rowCounter.get() + 1);
	}

	@Given("^A workbook named \"([^\"]*)\" and sheet named \"([^\"]*)\" is read$")
	public synchronized void a_workbook_named_and_sheet_named_is_read(String excelName, String sheetName) {
		int counter = 0;
		List<HashMap<String, String>> data = ReadExcel.readData(excelName, sheetName);
		for (HashMap<String, String> map : data) {
			if (map.get("TestDataID").equals(rowName.get()))
				excelData.get().put(++counter, map);
		}
	}

	public static HashMap<String, String> getRowData() {
		return excelData.get().get(rowCounter.get());
	}

	public static HashMap<String, String> getRowData(int rowInstance) {
		return excelData.get().get(rowInstance);
	}
}
