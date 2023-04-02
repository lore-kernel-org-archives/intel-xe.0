Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7BC7619A
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 11:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5010E2DE;
	Sun,  2 Apr 2023 11:18:00 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811610E2DE
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680434275; x=1711970275;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0C4RjuKrqERw7eIkO9XAyaS9Qsmfc+GR41/m3BEH8Ts=;
 b=JLZFvwJXLIoTLbKBpQqw6tOrRbIib4ia74Ef4zr6HXdYLRuN3BoKQUMv
 Qd1bRHCRWzzlWcxCByMefDiwK/Ky73sl3AJZMguNROYTX0+9v21VilPO9
 ZJ7MOBpTeb/eM0p+DGCl6LT0nr8WyKckhQUOX0VmjCtwY8SHuM5o/42tH
 w8mgoJVb8ETtSlTbpcEnZdWgV1FS7kVPV5HUaCG8Ur9IcB1FnNFL+lqeG
 6H5mDYYdpW1l+i3ESxye6wFB3ql/aqa5rOfe0ccAUWFOVnrFFYfXjDLtb
 vnhTZSbkSkvk9NdvQ1tUOTIcqMJdgqshVGGAjhrqSsgPoj9ueBDxo9N+m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339220251"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="339220251"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 04:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662899727"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="662899727"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2023 04:17:51 -0700
Received: from [10.249.151.88] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.88])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DBCD233734;
 Sun,  2 Apr 2023 12:17:50 +0100 (IST)
Message-ID: <cb9c13f0-fbbf-415b-35a8-0c00bfe1864a@intel.com>
Date: Sun, 2 Apr 2023 13:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal@hardline.pl>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
 <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
 <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 02.04.2023 03:34, Lucas De Marchi wrote:
> On Sat, Apr 01, 2023 at 08:26:24PM +0200, Michał Winiarski wrote:
>> On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
>>> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> > > > new file mode 100644
>>> > > > index 000000000000..4a12aad3f759
>>> > > > --- /dev/null
>>> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> > >
>>> > > There's no need to have this as a separate file.
>>> > > We can move the contents of tests/xe_rtp.c into
>>> tests/xe_rtp_test.c and
>>> > > include tests/xe_rtp_test.c directly in xe_rtp.c
>>> >
>>> > this is not how the tests are currently structured.
>>> >
>>> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>>> > extension of the that file, exporting whatever entrypoint is needed
>>> > for the real test". They are then part of the xe.ko module.
>>> >
>>> > tests/xe_rtp_test.c is the one in the separate test module, and
>>> contains
>>> > the integration with kunit.
>>>
>>> but it's possible to keep everythin in the separate module and not need
>>> the include of tests/xe_rtp.c. I did that on v2.
>>>
>>> Lucas De Marchi
>>
>> From my perspective - the way that the test is implemented carries an
>> additional information.
>> 1) Test is a separate module:
>> Means that we're testing the API exported by the module (that's used by
>> other modules).
>> 2) Test is a file that's a part of a module:
>> Means that we're testing non-static API used internally by the module.
>> 3) Test is a file that's included at the end of a file:
>> Means that we're testing static functions.
>>
>> Forcing everything to be a module doesn't really serve any purpose.
>> It just makes things harder to follow, as it removes this useful
>> additional bit of information.
> 
> I strongly disagree here.  Basing the test location on how much a
> function is exposed is a recipe for having to move the tests from one
> place to another. There are always refactors that make function change
> from non-static -> static, static -> non-static, and to a smaller degree
> exporting it.
> 
> In the end the code will just be inconsistent with the rules you
> outlined.
> 
> Separating everything to a separate module means the test code doesn't
> bloat the xe.ko module. I do think we should group all the tests into a
> single xe_test.ko, but that is a different topic.
> 
> See v2 of this patch series where I move *all* of the rtp tests to the
> separate module and simply use EXPORT_SYMBOL_IF_KUNIT() to export the 2

but having to export static functions simply don't scale, it's fine if
all you test needs is 2 functions, but to have full coverage we might
end with exporting all static functions (and to some extend bloating
xe.ko anyway, both in code and binary)

there is already BKM for testing static functions [1]
so why are we trying to force different (and IMO worst) model ?

[1]
https://docs.kernel.org/dev-tools/kunit/usage.html#testing-static-functions

> functions I need (In this v1 I was using
> EXPORT_SYMBOL_NS_GPL(..., XE_KUNIT) to make sure the tests were in a
> separate namespace, but then I noticed kunit itself has a recommended
> way by using its macro).
> 
> This makes the rule very simple to be followed:
> 
> 1) Place everything you can in the separate test module

but why? as Michal pointed out, this works best for testing already
exported API functions, to test internal static functions, this would be
unnecessary complicated solution

> 2) Place it in end of the file with the #include otherwise

this should be our primary BKM for mock/fake/sw/self/kunit/unit(*) test.

(*) pick one

note that in addition to easy maintenance (it doesn't require writing,
building, distributing and loading separate modules), this single test
file already has access to all required compilation unit static
functions that we want to test.

also from IGT point of view, this would mean that in case of
adding/removing some subtests all we need is just update test filter
rather then updating list of modules to load/unload.

and I wouldn't count this final #include as .ko bloating factor as it
would be primary used in UML build, where we don't care, and for the
target builds this could be easily compiled out.

thanks,
Michal

> 
> Lucas De Marchi
