/*
 * Jakefile
 * app
 *
 * Created by Evadne Wu on May 17, 2011.
 * Copyright 2011, Monoceros All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("app", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "app.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("app");
    task.setIdentifier("com.monoceros.app");
    task.setVersion("1.0");
    task.setAuthor("Monoceros");
    task.setEmail("hi@monoceroi.com");
    task.setSummary("app");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["app"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "app", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "app", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "app"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "app"), FILE.join("Build", "Deployment", "app")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "app"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "app"), FILE.join("Build", "Desktop", "app", "app.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "app", "app.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "app"));
    print("----------------------------");
}
