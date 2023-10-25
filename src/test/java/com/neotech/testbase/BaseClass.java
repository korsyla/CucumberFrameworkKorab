package com.neotech.testbase;

import java.time.Duration;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.safari.SafariDriver;
import com.neotech.utilities.ConfigsReader;
import com.neotech.utilities.Constants;

import io.github.bonigarcia.wdm.WebDriverManager;

public class BaseClass {
	
	//*****   FINAL STEP  ********
	//****** THIS BaseClass is  our  PARENT CLASS*******
	//Here we are SETTING UP our browser
	//We are suppose to do those steps before starting our TESTING
	//We call this METHOD before TESTING BEGINS!!!!! -
	/**
	 * Reading the configuration.propertiess file /  
	 * Selecting the type of "browser" based on KEY-VALUE from configuration.propertiess file  / 
	 * Opening one of the browsers based on KEY-VALUE from configuration.propertiess file /
	 * Navigating to the given URL Website from configuration.propertiess file 
	 */
	
	public static WebDriver driver;
	
	
	public static void setUp() throws InterruptedException 
	{
		//This is a combination of ConfigsReader class and Constants class in .Utilities package which are public
		//LETS Read Configuration File
		//This -> ConfigsReader.readProperties() is asking for the location of the file (Constants.CONFIGURATION_FILEPETH)
		//This ONE liner below will read all the key-values info in the configuration.propertiess file 
		ConfigsReader.readProperties(Constants.CONFIGURATION_FILEPETH);
				
		//ConfigsReader.getProperty -> We give the KEY and it returns us the value from configuration.propertiess file
		//We gave browser(key) and it returns chrome(value)
		String browser = ConfigsReader.getProperty("browser");
		//System.out.println("The browser is: " + browser);
				
		//Here, ONE for the browsers will open based on if its chrome or firefox
		if(browser.toLowerCase().equals("chrome")) 
		{
			WebDriverManager.chromedriver().setup();
			driver = new ChromeDriver();
		} 
		else if (browser.toLowerCase().equals("firefox")) 
		{
			WebDriverManager.firefoxdriver().setup();
			driver = new FirefoxDriver();
		}
		else if(browser.toLowerCase().equals("safari")) 
		{
			WebDriverManager.safaridriver().setup();
			driver = new SafariDriver();
		}
		else 
		{
			System.out.println("Browser is NOT supported");
		}


//		Thread.sleep(2000);
		// this implicit time will apply to every driver element
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Constants.IMPLICIT_WAIT_TIME));
		driver.manage().window().maximize();
		//Here we go to the website/url -> https://hrm.neotechacademy.com/
		String website = ConfigsReader.getProperty("url");
		driver.get(website);
		//I Added those last TWO 
//		String username = ConfigsReader.getProperty("username");
//		driver.get(username);
//		String password = ConfigsReader.getProperty("password");
//		driver.get(password);
		
	}
	
	//----------------------------------------------------------------------
	
	//Here we will create a method for .quit since it repeats it self
	//This is done after we done with our TESTING
	//We call this METHOD after we're DONE with TESTING !!!!!!!!!!!!
	
	
	public static void tearDown() 
	{
		if(driver != null) 
		{
			driver.quit();
		}
		
		
	}
	
	

}
