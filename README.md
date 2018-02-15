# fixConrefPush

Sample use of SQF to fix DITA content reference push variations


Robert Anderson wrote about one of the less beautiful feature of DITA, that is *conref push*, see
[DITA's ugliest feature: volume 1](http://metadita.org/toolkit/uglyfeature.html).

One of the proposals to make it mode manageable is to use a single element to 
contain the conref target and the desired push action, before or after, something like:

```xml

<li conaction="pushafter" conref="example.dita#example/b">THIS GOES AFTER B</li>

```

This project demonstrates the use of SQF to propose an automatic change of the document to 
the actual form of expressing the content reference push, for this example that will be

```xml

<li conaction="pushbefore">THIS GOES BEFORE B</li>
<li conaction="mark" conref="example.dita#example/b"/>

```

You can try this either in [oXygen XML Editor](http://www.oxygenxml.com) by cloning this 
project, or online, using the [oXygen XML Web Author](https://www.oxygenxml.com/xml_web_author.html), 
following the link to opens the sample [topic.dita](https://www.oxygenxml.com/webapp-demo-aws/app/oxygen.html?url=github%3A%2F%2FgetFileContent%2Fgeorgebina%2FfixConrefPush%2Fmaster%2Ftopic.dita&tags-mode=full-tags-with-attributes) file. 

From a technology point of view, this project uses [Schematron](http://schematron.com/) to detect the issues and [SQF](http://schematron-quickfix.github.io/sqf/publishing-snapshots/April2015Draft/spec/SQFSpec.html) for providing the automatic conversions.