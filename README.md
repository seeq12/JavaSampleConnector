# JavaSampleConnector
Sample Java Connector with Asset Indexing Example. The SDK can be downloaded from here [Customer Downloads](https://www.seeq.com/customer-download). 

## Prerequsites
You will need a licensed Seeq Server to test out this connector

## The Build Environment
The Java version of the SDK can be described as batteries included: Tool dependencies including the Java Development Kit (JDK), Maven and Eclipse are included in the java folder of the SDK. This approach provides you with a "known good" toolchain that has been tested and has a high probability of working correctly with your system. You are free to deviate by using a different IDE (like IntelliJ) or an updated version of the JDK, but there is a risk you will encounter incompatibilities.

### To begin using the SDK:

On Windows, launch the Windows Command Prompt. On Linux/OSX, launch a Bash terminal.
Change directory to the java directory within this SDK.
At the prompt, execute the environment script: On Windows, type environment or on Linux/OSX, type . environment.
Throughout this document, we will refer to the build environment, which is simply a command prompt or terminal window where you've executed the environment script as described.

## Verifying your Environment
Before doing anything else, we recommend that you build the connector template and ensure that it is fully working with your private system.

From your build environment, execute the build command. This command will download dependencies from the web, so make sure you have a good internet connection. If it fails for some (non-obvious) reason, email the output (including the error message) to support@seeq.com.

Make sure your private Seeq Server is running on this machine.

From your build environment, execute the ide command. This command will launch Eclipse, which you will use (at least initially) for development and debugging. Launching Eclipse using the ide command ensures that it is using a "known good" version of the JDK and has all requisite environment variables set up.

Take the following steps to configure Eclipse appropriately:

1. Once Eclipse is finished loading, close the Welcome tab.
1. Two projects should appear in the package manager: mycompany-seeq-link-connector-myconnector and seeq-link-sdk-debugging-agent.
1. Wait for building to finish. (There will be progress in the bottom right if it is not finished yet.)
1. Confirm that no compile errors occurred. (Check for a Problems tab at the bottom of the IDE.)
1. Open the src/main/java/com/seeq/link/sdk/debugging/Main.java file in the seeq-link-sdk-debugging-agent project.
1. If you have configured Seeq to use a different location for the data folder than the default, update the snippet starting on line 24 with the proper path. **This step is required to ensure that your agent can find the SSL keys to communicate with Seeq Server.**
1. Set a breakpoint (Run > Toggle Breakpoint) on the first line of the main() function.
1. Right-click seeq-link-sdk-debugging-agent and select Build Path > Configure Build Path...
1. Select Java Build Path from the left-hand menu.
1. Select the Projects tab and then select Classpath.
1. Press Add... and choose the mycompany-seeq-link-connector-myconnector. Click OK and then click Apply and Close. **Steps 8-11 are critical to ensuring your connector's dependencies are correctly loaded during debugging and must be repeated each time that Eclipse is restarted.**
1. Click Run > Debug Configurations.
1. Find Java Application in the list of configurations on the left.
1. Click the New launch configuration button. A new configuration called Main should appear.
1. Click the Debug button to launch the debugger.
1. You should hit the breakpoint you set. This verifies that Eclipse built your project correctly and can launch it in its debugger.
1. With execution paused at the breakpoint, open the src/main/java/MyConnector.java file in the mycompany-seeq-link-connector-myconnector (Ctrl+Shift+R is handy for opening any file) and put a breakpoint on the first line of the initialize() function.
1. Click Run > Resume. You should hit the next breakpoint. This verifies that the debugging agent can load the template connector correctly.
1. Click Run > Remove All Breakpoints and then Run > Resume.
1. Bring up Seeq Workbench and click on the connections section at the top of the screen. You should see My Connector Type: My First Connection in the list of connections, with 5000 items indexed.
1. In Seeq Workbench's Data tab, search for simulated.
1. A list of simulated signals should appear in the results. Click on any of the results.
1. The signal should be added to the Details pane and a repeating waveform should be shown in the trend. This verifies that the template connector is able to index its signals and respond to data queries.
1. Now you're ready to start development!

## Developing your Connector
We recommend that you just modify the template connector directly. This shields you from having to recreate all of the Maven and Eclipse configuration that is required to correctly build and debug a new project. Eclipse has excellent renaming/refactoring features that make it easy. For example, you can click on any item in Eclipse's Package Explorer and select Refactor > Rename to change it to something appropriate for your company and this particular connector.

Note: If you change the name of the connector, you will want to change the groupId, artifactId and name in the pom.xml file that Maven uses to build. Also, you will need to close your build environment and create a new one so that the new name is picked up.

When you need to add other libraries as dependencies, you will need to do so by modifying the pom.xml file to add <dependency> entries there. Since Maven is a popular build and dependency management system for Java, there are lots of resources on the web to help you make those entries correctly. When you add an entry, exit Eclipse and perform the build and ide steps again.

Once you are ready to start developing, just open the MyConnector.java and MyConnection.java files in Eclipse and start reading through the heavily-annotated source code. The template connector uses a small class called DatasourceSimulator. You'll know you've removed all of the template-specific code when you can delete this file from the project and still build without errors.

Any log messages you create using the log() method on ConnectorServiceV2 and DatasourceConnectionServiceV2 will go to the debug console and to the java/seeq-link-sdk-debugging-agent/target/log/jvm-debugging-agent.log file.

## Deploying your Connector
When you are ready to deploy your connector to a production environment, execute the package command. A zip file will be created in the java/packages folder.

Copy this zip file to the Seeq Server you wish to deploy it to. Shut down the server and extract the contents of the zip file into the plugins/connectors folder within Seeq's data folder. (The data folder is usually C:\ProgramData\Seeq\data on Windows and ~/.seeq/data on Ubuntu and OSX.) You should end up with one new folder in plugins/connectors. For example, if you kept the default name for the connector, you would have a plugins/connectors/mycompany-seeq-link-connector-myconnector folder with a jar file inside.

Re-start Seeq Server and your connector should appear in the list of connections just as it had in your development environment.

Once deployed, log messages you create using the log() method on ConnectorServiceV2 and DatasourceConnectionServiceV2 will go to log/jvm-link/jvm-link.log file in the Seeq data folder.