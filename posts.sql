-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2019 at 10:24 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kb_storage`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `resolution` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `approved` int(11) DEFAULT '0',
  `auth_id1` int(11) DEFAULT NULL,
  `auth_id2` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `lastemail_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `description`, `resolution`, `user_id`, `approved`, `auth_id1`, `auth_id2`, `creation_time`, `lastemail_time`) VALUES
(1, 'MacOS Flink-1.8.0 WordCount.java Issue', 'I downloaded flink-1.8.0-bin-scala_2.11.tgz from official link and installed apache-maven-3.6.1-bin.tar.gz.\r\n\r\nI have already run Flink on my Mac successfully with the command line\r\n\r\n./bin/start-cluster.sh\r\nI uploaded the flink-1.8.0/examples/batch/WordCount.jar and run successfully.\r\n\r\nI create a project in IntelliJ IDEA to learn writing codes with Flink.\r\n\r\n', 'Review Project Structure and Libraries', 2, NULL, NULL, NULL, NULL, NULL),
(2, 'how to call destructor on some of the objects in a Dynamic Array', 'I finally got around to trying placement new to create an efficient dynamic array. the purpose is to understand how it works, not to replace class vector. The constructor works. A block is allocated but uninitialized. As each element is added, it is initialized. But I don\'t see how to use placement delete to call the destructor on only those elements that exist. Can anyone explain that one? This code works for allocating the elements one by one as the array grows, but the delete is not right.\r\n\r\n\r\n\r\n\r\nI finally got around to trying placement new to create an efficient dynamic array. the purpose is to understand how it works, not to replace class vector. The constructor works. A block is allocated but uninitialized. As each element is added, it is initialized. But I don\'t see how to use placement delete to call the destructor on only those elements that exist. Can anyone explain that one? This code works for allocating the elements one by one as the array grows, but the delete is not right.\r\n\r\ntemplate<typename T>\r\nclass DynArray {\r\nprivate:\r\n  uint32_t capacity;\r\n  uint32_t size;\r\n  T* data;\r\n  void* operator new(size_t sz, T* place) {\r\n    return place;\r\n  }\r\n  void operator delete(void* p, DynArray* place) {\r\n  }\r\n\r\npublic:\r\n  DynArray(uint32_t capacity) :\r\n     capacity(capacity), size(0), data((T*)new char[capacity*sizeof(T)]) {}\r\n  void add(const T& v) {\r\n        new(data+size++) T(v);\r\n  }\r\n  ~DynArray() {\r\n     for (int i = 0; i < size; i++)\r\n       delete (this) &data[i];\r\n     delete [] (char*)data;\r\n  }\r\n};', '1\r\n\r\nYou actually found the only case (at least that I\'m aware of) where you want to invoke the destructor manually:\r\n\r\n  ~DynArray() {\r\n     for (int i = 0; i < size; i++)\r\n       data[i].~T();\r\n     delete [] (char*)data;\r\n  }\r\nCombined with a trivial class and main, you should get the expected results:\r\n\r\nstruct S {\r\n    ~S() { std::cout << __PRETTY_FUNCTION__ << \'\\n\'; }\r\n};\r\n\r\nint main() {\r\n    DynArray<S> da{10};\r\n    da.add(S{});\r\n    return 0;\r\n}\r\nNote that you see the destructor called twice since DynArray takes objects by const reference, thus it has a temporary.\r\n\r\n$./a.out \r\nS::~S()\r\nS::~S()', 2, NULL, NULL, NULL, NULL, NULL),
(3, 'Ubuntu unable to locate package', '1\r\n\r\n\r\nI have installed devstack for openstack on ubuntu system. I am trying to install quantum-lbaas-agent. I get the error Unable to locate package. I tried changing the the sources list in the /etc/apt/sources.list file. I was unable to edit it and hence I changed permissions to 777 for sources.list. I ran sudo apt-get update after changing the permission. I still get the unable to locate package error. I tried running sudo apt-get upgrade as well. Still there was no progress.\r\n\r\nHere is the output of sudo apt-get install quantum-lbaas-agent:\r\n\r\nReading package lists... Done\r\nBuilding dependency tree       \r\nReading state information... Done\r\nE: Unable to locate package quantum-lbaas-agent', 'You can do :\r\n\r\nsudo apt-get purge \r\nThis will clean up the configs which may be stopping you form installing the package', 2, NULL, NULL, NULL, NULL, NULL),
(4, 'Access variable in function which executes after setstate case', 'I need to set the state in reactjs \"sync\". The way I do this is with a callback: bug djjd jdh\r\n\r\nmyFunction(){\r\n    var arr = [];\r\n\r\n    for(var i = 0 ; i > 100; i++){\r\n        arr[i] = i;\r\n    }\r\n\r\n    this.setState({\r\n        someValue: 999\r\n    }, () => {\r\n        //this.arr return undefined\r\n        return this.arr;                \r\n    });\r\n}\r\nI am almost sure this is a scoping issue. I thought if it has the arrow function it should work? I tried using \"this\" and without \"this\", but it is undefined.', '0\r\n\r\ndon\'t use var for define variables (you can read about scoping with var and let)\r\n\r\njust use let in you case problem with var i = 0 ', 2, NULL, NULL, NULL, NULL, NULL),
(5, 'Visual Basic 2010: How to start Windows 7 Sound Application on Recording Tab', 'I am trying to get MasterPeakValue of any connected, active microphone in Visual-Basic 2010. Using the Naudio framework I can do so for the default audio device, but for non default devices, the Windows (7) Sound App on Recording Tab has to be opened. Therefore, I am searching for a way to Open this App on this exact Tab from Visual Basic code.\r\n\r\n', 'Enble open GL', 2, NULL, NULL, NULL, NULL, NULL),
(6, 'Cannot delete Program Files to create a Symlinkâ€¦ Says I need permission from myself?', 'Trying to move my program files to a drive B: and leaving a symlink pointing to it in C:\r\n\r\nI have copied the folder, however when I try to delete the one in C:, windows says I need permission from myself to delete the folder. I have already set myself as owner and given full control. What else am I supposed to do?', 'press Start Menu(Windows Logo) and Typing regedit, run as administrator; Open:\r\n\r\nHKEY_LOCAL_MACHINE->SOFTWARE->Microsoft->Windows->CurrentVersion\r\n\r\nin the right, modify first letter from ProgramFilesDir', 2, NULL, NULL, NULL, NULL, NULL),
(7, 'Binary Data in MySQL [closed]', 'How do I store binary data in MySQL?', 'The answer by phpguy is correct but I think there is a lot of confusion in the additional details there.\r\n\r\nThe basic answer is in a BLOB data type / attribute domain. BLOB is short for Binary Large Object and that column data type is specific for handling binary data.\r\n\r\nSee the relevant manual page for MySQL.', 2, NULL, NULL, NULL, NULL, NULL),
(8, 'Calculate relative time in C#', 'Given a specific DateTime value, how do I display relative time, like:\r\n\r\n2 hours ago\r\n3 days ago\r\na month ago', 'Jeff, because Stack Overflow uses jQuery extensively, I recommend the jquery.timeago plugin.\r\n\r\nBenefits:\r\n\r\nAvoid timestamps dated \"1 minute ago\" even though the page was opened 10 minutes ago; timeago refreshes automatically.\r\nYou can take full advantage of page and/or fragment caching in your web applications, because the timestamps aren\'t calculated on the server.\r\nYou get to use microformats like the cool kids.\r\nJust attach it to your timestamps on DOM ready:\r\n\r\njQuery(document).ready(function() {\r\n    jQuery(\'abbr.timeago\').timeago();\r\n});\r\nThis will turn all abbr elements with a class of timeago and an ISO 8601 timestamp in the title:\r\n\r\n<abbr class=\"timeago\" title=\"2008-07-17T09:24:17Z\">July 17, 2008</abbr>\r\ninto something like this:\r\n\r\n<abbr class=\"timeago\" title=\"July 17, 2008\">4 months ago</abbr>\r\nwhich yields: 4 months ago. As time passes, the timestamps will automatically update.\r\n\r\nDisclaimer: I wrote this plugin, so I\'m biased.', 2, NULL, NULL, NULL, NULL, NULL),
(9, 'Percentage width child element in absolutely positioned parent in case of Internet Explorer 7', 'I have an absolutely positioned div containing several children, one of which is a relatively positioned div. When I use a percentage-based width on the child div, it collapses to \'0\' width on Internet Explorer 7, but not on Firefox or Safari. bug shsh\r\n\r\nIf I use pixel width, it works. If the parent is relatively positioned, the percentage width on the child works.\r\n\r\nIs there something I\'m missing here?\r\nIs there an easy fix for this besides the pixel-based width on the child?\r\nIs there an area of the CSS specification that covers this?', 'The parent div needs to have a defined width, either in pixels or as a percentage. In Internet Explorer 7, the parent div needs a defined width for child percentage divs to work correctly.', 2, NULL, NULL, NULL, NULL, NULL),
(10, 'Convert Decimal to Double?', 'I want to use a track-bar to change a form\'s opacity.\r\n\r\nThis is my code:\r\n\r\ndecimal trans = trackBar1.Value / 5000;\r\nthis.Opacity = trans;\r\nWhen I build the application, it gives the following error:\r\n\r\nCannot implicitly convert type \'decimal\' to \'double\'.\r\n\r\nI tried using trans and double but then the control doesn\'t work. This code worked fine in a past VB.NET project.\r\n\r\n', 'An explicit cast to double like this isn\'t necessary:\r\n\r\ndouble trans = (double) trackBar1.Value / 5000.0;\r\nIdentifying the constant as 5000.0 (or as 5000d) is sufficient:\r\n\r\ndouble trans = trackBar1.Value / 5000.0;\r\ndouble trans = trackBar1.Value / 5000d;', 2, NULL, NULL, NULL, NULL, NULL),
(11, 'How to speed up data transfer while capturing rejected rows from tMySqlOutput?', 'I am transferring data from table in one schema to the table in another schema. I also need to record rows that get rejected in the process, due to one of the many reasons, for example, constraint of NOT NULL failing.\r\n\r\nWhen I attach the reject link with the output component, the transfer speed decreases drastically to 2-3 rows per second. On the other hand, without reject link, I can use \"Extend Insert\" option and the speed increases to 400 rows per second.\r\n\r\nHow can I capture rejected rows without compromising on the performance?\r\n', 'In my opinion there is no perfect choice : in your case I think the best thing to do is trying to catch null fields before inserting , with a tMap placed before tDBOutput : there you can have a filter on your output (\"row.field1 is not null\") , and a second output dedicated to output rejects. This way you can get your rejected data, and still be using the extended insert for better performances.', 2, NULL, NULL, NULL, NULL, NULL),
(12, 'gjfafew fejwavfjwabf waj jfevjv waevjheaf evehbvdas veaebvheavhjreawh vsa', 'bsv d v ha ve aj ve eavd adebaebvae vea\r\nve\r\nr\r\nareve vr vaebvv\r\nvvse vejrv\r\n', 'bdhfv rbejbfre mreajbvaer\r\nererjvbe rmvberbvev\r\nebevjber verm.hgg', 1, NULL, NULL, NULL, NULL, NULL),
(13, 'sdfeshbjBVDSDNBVSN', 'HGGHhghsdhvghshsdhb', 'hghsvdghhshhdhhdhdhdhdhd', 1, NULL, NULL, NULL, NULL, NULL),
(14, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'gggggggggggggggggggggggggggggggggggggggggggggggg', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 1, NULL, NULL, NULL, NULL, NULL),
(15, 'eeeeareeeeeeeeeh`', 'hhhhhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 1, NULL, NULL, NULL, NULL, NULL),
(16, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 1, NULL, NULL, NULL, NULL, NULL),
(17, 'Regular expression to match a line that doesn\'t contain a word', 'I know it\'s possible to match a word and then reverse the matches using other tools (e.g. grep -v). However, is it possible to match lines that do not contain a specific word, e.g. hede, using a regular expression?\r\n\r\nInput:\r\nhoho\r\nhihi\r\nhaha\r\nhede\r\nCode:\r\ngrep \"<Regex for \'doesn\'t contain hede\'>\" input\r\nDesired output:\r\nhoho\r\nhihi\r\nhaha', 'The notion that regex doesn\'t support inverse matching is not entirely true. You can mimic this behavior by using negative look-arounds:\r\n\r\n^((?!hede).)*$\r\nThe regex above will match any string, or line without a line break, not containing the (sub)string \'hede\'. As mentioned, this is not something regex is \"good\" at (or should do), but still, it is possible.\r\n\r\nAnd if you need to match line break chars as well, use the DOT-ALL modifier (the trailing s in the following pattern):\r\n\r\n/^((?!hede).)*$/s\r\nor use it inline:\r\n\r\n/(?s)^((?!hede).)*$/\r\n(where the /.../ are the regex delimiters, i.e., not part of the pattern)\r\n\r\nIf the DOT-ALL modifier is not available, you can mimic the same behavior with the character class [\\s\\S]:\r\n\r\n/^((?!hede)[\\s\\S])*$/', 1, NULL, NULL, NULL, NULL, NULL),
(18, 'Why does Google prepend while(1); to their JSON responses?', '3846\r\n\r\n\r\n1746\r\nWhy does Google prepend while(1); to their (private) JSON responses?\r\n\r\nFor example, here\'s a response while turning a calendar on and off in Google Calendar:\r\n\r\nwhile(1);[[\'u\',[[\'smsSentFlag\',\'false\'],[\'hideInvitations\',\'false\'],\r\n  [\'remindOnRespondedEventsOnly\',\'true\'],\r\n  [\'hideInvitations_remindOnRespondedEventsOnly\',\'false_true\'],\r\n  [\'Calendar ID stripped for privacy\',\'false\'],[\'smsVerifiedFlag\',\'true\']]]]\r\nI would assume this is to prevent people from doing an eval() on it, but all you\'d really have to do is replace the while and then you\'d be set. I would assume the eval prevention is to make sure people write safe JSON parsing code.\r\n\r\nI\'ve seen this used in a couple of other places, too, but a lot more so with Google (Mail, Calendar, Contacts, etc.) Strangely enough, Google Docs starts with &&&START&&& instead, and Google Contacts seems to start with while(1); &&&START&&&.\r\n\r\nWhat\'s going on here?', 'It prevents JSON hijacking, a major JSON security issue that is formally fixed in all major browsers since 2011 with ECMAScript 5.\r\n\r\nContrived example: say Google has a URL like mail.google.com/json?action=inbox which returns the first 50 messages of your inbox in JSON format. Evil websites on other domains can\'t make AJAX requests to get this data due to the same-origin policy, but they can include the URL via a <script> tag. The URL is visited with your cookies, and by overriding the global array constructor or accessor methods they can have a method called whenever an object (array or hash) attribute is set, allowing them to read the JSON content.\r\n\r\nThe while(1); or &&&BLAH&&& prevents this: an AJAX request at mail.google.com will have full access to the text content, and can strip it away. But a <script> tag insertion blindly executes the JavaScript without any processing, resulting in either an infinite loop or a syntax error.\r\n\r\nThis does not address the issue of cross-site request forgery.', 1, NULL, NULL, NULL, NULL, NULL),
(19, 'Change an HTML5 input\'s placeholder color with CSS', 'Chrome supports the placeholder attribute on input[type=text] elements (others probably do too).\r\n\r\nBut the following CSS doesn\'t do anything to the placeholder\'s value:\r\n\r\ninput[placeholder], [placeholder], *[placeholder] {\r\n    color: red !important;\r\n}\r\n<input type=\"text\" placeholder=\"Value\">\r\nValue will still remain grey instead of red.\r\n\r\nIs there a way to change the color of the placeholder text?', 'Implementation\r\nThere are three different implementations: pseudo-elements, pseudo-classes, and nothing.\r\n\r\nWebKit, Blink (Safari, Google Chrome, Opera 15+) and Microsoft Edge are using a pseudo-element: ::-webkit-input-placeholder. [Ref]\r\nMozilla Firefox 4 to 18 is using a pseudo-class: :-moz-placeholder (one colon). [Ref]\r\nMozilla Firefox 19+ is using a pseudo-element: ::-moz-placeholder, but the old selector will still work for a while. [Ref]\r\nInternet Explorer 10 and 11 are using a pseudo-class: :-ms-input-placeholder. [Ref]\r\nApril 2017: Most modern browsers support the simple pseudo-element ::placeholder [Ref]\r\nInternet Explorer 9 and lower does not support the placeholder attribute at all, while Opera 12 and lower do not support any CSS selector for placeholders.\r\n\r\nThe discussion about the best implementation is still going on. Note the pseudo-elements act like real elements in the Shadow DOM. A padding on an input will not get the same background color as the pseudo-element.\r\n\r\nCSS selectors\r\nUser agents are required to ignore a rule with an unknown selector. See Selectors Level 3:\r\n\r\na group of selectors containing an invalid selector is invalid.\r\n\r\nSo we need separate rules for each browser. Otherwise the whole group would be ignored by all browsers.\r\n\r\n::-webkit-input-placeholder { /* WebKit, Blink, Edge */\r\n    color:    #909;\r\n}\r\n:-moz-placeholder { /* Mozilla Firefox 4 to 18 */\r\n   color:    #909;\r\n   opacity:  1;\r\n}\r\n::-moz-placeholder { /* Mozilla Firefox 19+ */\r\n   color:    #909;\r\n   opacity:  1;\r\n}\r\n:-ms-input-placeholder { /* Internet Explorer 10-11 */\r\n   color:    #909;\r\n}\r\n::-ms-input-placeholder { /* Microsoft Edge */\r\n   color:    #909;\r\n}\r\n\r\n::placeholder { /* Most modern browsers support this now. */\r\n   color:    #909;\r\n}\r\n<input placeholder=\"Stack Snippets are awesome!\">\r\nUsage notes\r\nBe careful to avoid bad contrasts. Firefox\'s placeholder appears to be defaulting with a reduced opacity, so needs to use opacity: 1 here.\r\nNote that placeholder text is just cut off if it doesnâ€™t fit â€“ size your input elements in em and test them with big minimum font size settings. Donâ€™t forget translations: some languages need more room for the same word.\r\nBrowsers with HTML support for placeholder but without CSS support for that (like Opera) should be tested too.\r\nSome browsers use additional default CSS for some input types (email, search). These might affect the rendering in unexpected ways. Use the properties -webkit-appearance and -moz-appearance to change that. Example:\r\n    [type=\"search\"] {\r\n        -moz-appearance:    textfield;\r\n        -webkit-appearance: textfield;\r\n        appearance: textfield;\r\n    }', 1, NULL, NULL, NULL, NULL, NULL),
(20, 'How do you get a timestamp in JavaScript?', 'How can I get a timestamp in JavaScript?\r\n\r\nSomething similar to Unix\'s timestamp, that is, a single number that represents the current time and date. Either as a number or a string.', 'Short & Snazzy:\r\n+ new Date()\r\nA unary operator like plus triggers the valueOf method in the Date object and it returns the timestamp (without any alteration).\r\n\r\nDetails:\r\n\r\nOn almost all current browsers you can use Date.now() to get the UTC timestamp in milliseconds; a notable exception to this is IE8 and earlier (see compatibility table).\r\n\r\nYou can easily make a shim for this, though:\r\n\r\nif (!Date.now) {\r\n    Date.now = function() { return new Date().getTime(); }\r\n}\r\nTo get the timestamp in seconds, you can use:\r\n\r\nMath.floor(Date.now() / 1000)\r\nOr alternatively you could use:\r\n\r\nDate.now() / 1000 | 0\r\nWhich should be slightly faster, but also less readable (also see this answer).\r\n\r\nI would recommend using Date.now() (with compatibility shim). It\'s slightly better because it\'s shorter & doesn\'t create a new Date object. However, if you don\'t want a shim & maximum compatibility, you could use the \"old\" method to get the timestamp in milliseconds:\r\n\r\nnew Date().getTime()\r\nWhich you can then convert to seconds like this:\r\n\r\nMath.round(new Date().getTime()/1000)\r\nAnd you can also use the valueOf method which we showed above:\r\n\r\nnew Date().valueOf()\r\nTimestamp in Milliseconds\r\n\r\nvar timeStampInMs = window.performance && window.performance.now && window.performance.timing && window.performance.timing.navigationStart ? window.performance.now() + window.performance.timing.navigationStart : Date.now();\r\n\r\nconsole.log(timeStampInMs, Date.now());', 1, NULL, NULL, NULL, NULL, NULL),
(21, 'example issue', 'hhhhhhhhh hhhhhhhhhh', 'bbbbbbbbbb', 1, NULL, NULL, NULL, NULL, NULL),
(22, 'rrrr', 'rrrrrt', 'frrrr', 1, NULL, NULL, NULL, NULL, NULL),
(23, 'rrrr', 'rrrrrt', 'frrrr', 1, NULL, NULL, NULL, NULL, NULL),
(24, 'issue etetett', 'getegeeggeeg egeg eg eg egegegg', 'gegege eegeghgw hhjwedqwe q', 1, 1, 0, 0, '2019-06-19 13:22:33', 2147483647),
(25, 'ghsggd fddfh fdafhas fsh', 'h fsfsfsh ffh dfshd fdhf hdfhdf gdf hf', 'h fesh afhdshf s fsfhsdhas gjksgbgkksb', 1, 1, 0, 0, '2019-06-19 13:25:54', 2147483647),
(26, 'issue example 1', 'hgdsahgdjad gdsa gajfajjag fjsafgj fg', 'h ggsdjfs gfsgasd hfsgjgfjasgfjsf fsh fasfhjsjgd sfhsf gjas', 1, 0, 5383999, 2176071, '2019-06-19 13:38:08', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);
ALTER TABLE `posts` ADD FULLTEXT KEY `title` (`title`,`description`,`resolution`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
