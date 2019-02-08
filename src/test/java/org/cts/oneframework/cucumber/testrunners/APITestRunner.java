package org.cts.oneframework.cucumber.testrunners;

import org.cts.oneframework.cucumber.AbstractTestNGCucumberTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(
		features = "src/test/resources/features/WebApi", 
		glue = { "org.cts.oneframework.webapicucumber.stepdefinition" }, 
		plugin = { "pretty", "com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" })
public class APITestRunner extends AbstractTestNGCucumberTest {
}