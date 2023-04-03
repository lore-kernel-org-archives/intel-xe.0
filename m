Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10896C761A6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 07:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E221510E197;
	Mon,  3 Apr 2023 07:38:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8E110E197
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680507524; x=1712043524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gZhzvrXYIiHI+Qq11qCLEFczF4VWU/kc4QY8OrrGNMk=;
 b=ehgQbNJRu5zjjCFDMXi9cp0UcTmBMgIAE6yNXUq9lKdeCRwBgfwWvZGF
 QB7ARvwWN/5mqIwIdQe04L7gpsH98rxKinCDzpOumtj6y6jAwSHNJJulb
 tAmcLaoAn+ewTKpKQkh1qpGbkKIedvnUHfumoVYGbJtay33xAdTh8Owl0
 op7SxYdDP5fKs8p1I4QTNKQYQCTqGQPldzEwTS4jO9t9iT0eRgepQt9c2
 swUncM4u9ZljXgt20fgTIbrDlTusw5Pvj9JvYBUwvL86f8EMBAWOR1SeJ
 DKGPQpkEX33zXHMiywTs70FrONW+G4cRvmlyqOt+hlGrhJlpFQ91T+Yp3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="340563393"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="340563393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 00:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="860083059"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="860083059"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 00:38:03 -0700
Received: from [10.249.151.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 82F1427BC9;
 Mon,  3 Apr 2023 08:38:02 +0100 (IST)
Message-ID: <0ce8d4fe-59e9-d950-4e0d-d70e74e395a6@intel.com>
Date: Mon, 3 Apr 2023 09:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
 <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
 <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
 <cb9c13f0-fbbf-415b-35a8-0c00bfe1864a@intel.com>
 <20230402215431.lhqn4qtqawbrefmb@ldmartin-desk2.lan>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230402215431.lhqn4qtqawbrefmb@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 02.04.2023 23:54, Lucas De Marchi wrote:
> On Sun, Apr 02, 2023 at 01:17:50PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 02.04.2023 03:34, Lucas De Marchi wrote:
>>> On Sat, Apr 01, 2023 at 08:26:24PM +0200, Michał Winiarski wrote:
>>>> On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
>>>>> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>>>>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>>>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>>>> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>>>> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>> > > > new file mode 100644
>>>>> > > > index 000000000000..4a12aad3f759
>>>>> > > > --- /dev/null
>>>>> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>> > >
>>>>> > > There's no need to have this as a separate file.
>>>>> > > We can move the contents of tests/xe_rtp.c into
>>>>> tests/xe_rtp_test.c and
>>>>> > > include tests/xe_rtp_test.c directly in xe_rtp.c
>>>>> >
>>>>> > this is not how the tests are currently structured.
>>>>> >
>>>>> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>>>>> > extension of the that file, exporting whatever entrypoint is needed
>>>>> > for the real test". They are then part of the xe.ko module.
>>>>> >
>>>>> > tests/xe_rtp_test.c is the one in the separate test module, and
>>>>> contains
>>>>> > the integration with kunit.
>>>>>
>>>>> but it's possible to keep everythin in the separate module and not
>>>>> need
>>>>> the include of tests/xe_rtp.c. I did that on v2.
>>>>>
>>>>> Lucas De Marchi
>>>>
>>>> From my perspective - the way that the test is implemented carries an
>>>> additional information.
>>>> 1) Test is a separate module:
>>>> Means that we're testing the API exported by the module (that's used by
>>>> other modules).
>>>> 2) Test is a file that's a part of a module:
>>>> Means that we're testing non-static API used internally by the module.
>>>> 3) Test is a file that's included at the end of a file:
>>>> Means that we're testing static functions.
>>>>
>>>> Forcing everything to be a module doesn't really serve any purpose.
>>>> It just makes things harder to follow, as it removes this useful
>>>> additional bit of information.
>>>
>>> I strongly disagree here.  Basing the test location on how much a
>>> function is exposed is a recipe for having to move the tests from one
>>> place to another. There are always refactors that make function change
>>> from non-static -> static, static -> non-static, and to a smaller degree
>>> exporting it.
>>>
>>> In the end the code will just be inconsistent with the rules you
>>> outlined.
>>>
>>> Separating everything to a separate module means the test code doesn't
>>> bloat the xe.ko module. I do think we should group all the tests into a
>>> single xe_test.ko, but that is a different topic.
>>>
>>> See v2 of this patch series where I move *all* of the rtp tests to the
>>> separate module and simply use EXPORT_SYMBOL_IF_KUNIT() to export the 2
>>
>> but having to export static functions simply don't scale, it's fine if
>> all you test needs is 2 functions, but to have full coverage we might
>> end with exporting all static functions (and to some extend bloating
>> xe.ko anyway, both in code and binary)
> 
> ... the fallacy of full code coverage.

so having full coverage is not our goal any more ?
then others work like [2] seems unnecessary

[2] https://patchwork.freedesktop.org/series/115513/

> 
>>
>> there is already BKM for testing static functions [1]
>> so why are we trying to force different (and IMO worst) model ?
> 
> it's fine as long as the test is small and you really want/need to test
> that single function rather than a higher order interface to it.
> 
>>
>> [1]
>> https://docs.kernel.org/dev-tools/kunit/usage.html#testing-static-functions
> 
> "If we do not want to expose functions or variables for testing ...".
> There are several sections before that one.
> 
> It will depend on the test. Some may be inevitable and simpler to
> include in the file. With the dowside of bloating the module.

but what exactly bothers you by "bloating the module"

- additional single #include at end of .c file
- multiple xxx_IF_KUNIT macros across all over .c file
- bigger footprint of the xe.ko due to export tables
- bigger footprint of the xe.ko due to inclusion of test functions
- bigger footprint of the xe.ko due to inclusion of test suites
- additional headers to expose test functions
- ...

> 
>>
>>> functions I need (In this v1 I was using
>>> EXPORT_SYMBOL_NS_GPL(..., XE_KUNIT) to make sure the tests were in a
>>> separate namespace, but then I noticed kunit itself has a recommended
>>> way by using its macro).
>>>
>>> This makes the rule very simple to be followed:
>>>
>>> 1) Place everything you can in the separate test module
>>
>> but why? as Michal pointed out, this works best for testing already
>> exported API functions, to test internal static functions, this would be
>> unnecessary complicated solution
> 
> then provide a better test on the interface rather than on the static
> function. If really needed/wanted, then including it on the bottom of
> the file can be done.

majority (if not all) of our functions are not module exported, thus
testing them will look almost exactly as static

> 
>>
>>> 2) Place it in end of the file with the #include otherwise
>>
>> this should be our primary BKM for mock/fake/sw/self/kunit/unit(*) test.
>>
>> (*) pick one
>>
>> note that in addition to easy maintenance (it doesn't require writing,
>> building, distributing and loading separate modules), this single test
>> file already has access to all required compilation unit static
>> functions that we want to test.
>>
>> also from IGT point of view, this would mean that in case of
>> adding/removing some subtests all we need is just update test filter
>> rather then updating list of modules to load/unload.
> 
> you are making this up as "it's harder to maintain" to justify your bias.
> There is 1 single call you make, using the already provided kunit.py.
> Developers can run it on their machines and so can CI.

it's not about how you run such test, as in both cases this will be
exactly the same kunit.py line

problem is during creation of such test where you need to:
- provide new .h with prototypes for the otherwise static functions
- tag (bloat) static functions with VISIBLE_IF_KUNIT
- export (bloat) static functions with EXPORT_SYMBOL_IF_KUNIT
- create new .c with test module
- update Makefile with new module definition
- update IGT to consider new test module
- update CI to run new module
- update any scripts to load/unload new module
- ..


> 
>> and I wouldn't count this final #include as .ko bloating factor as it
>> would be primary used in UML build, where we don't care, and for the
>> target builds this could be easily compiled out.
> 
> then you can't get the prebuilt kernel to be executed "in production"
> and sanity check it still passes the sw tests.

but really why you need to rerun those tests ?
if you don't trust results from kunit.py UML run, then maybe

a) we should drop it from our build step
b) change kunit config from UML to x64 or something
c) notify kunit maintainers about problems/gaps with UML runs

as I don't expect any differences between UML and 'production' build
then I can see no point in running them twice or more

thanks,
Michal

> 
> Lucas De Marchi
> 
>>
>> thanks,
>> Michal
>>
>>>
>>> Lucas De Marchi
