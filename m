Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703EBC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 15:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B64A10E0A2;
	Thu,  1 Feb 2024 15:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9uKEq2p";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 15:45:22 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0568710E0EE
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706802322; x=1738338322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYvjp2MyV5Laqb+fLkWsnkrxo4saB18rpmOes5Msc3Q=;
 b=d9uKEq2pK4K97UBfFwoFo89cb6/RXUN1WJTJ/9VRCWz6s1Je56tX9YJU
 7dkcYzYcbNNwHu7tz9rYNWzUoqxkkyfJeoqL95upTMnNyCVN/i7Ul8y0u
 G6YKp7n03meVR8MCHD0gSMnnGOSXhao5tFipbjocm5uDtM2+Kdiam1et3
 zZY4w8ET11MJbuRdO/HGpXAwxTIk16AHS77VdSZE0DhMncOqFkB6i5Vhe
 mnuxZ5UKvK6MntAPLgJr7pC65XhRRM+33EgVKOiH6V2iZJDcYV2GfVVXf
 y8K/Zv0mJGBVwEKlK0Kcl8NlKPzMgSEvrlf569vtpgv52zhVVKB78AgbJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="118229"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="118229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932205815"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932205815"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:38:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= CI.xeBAT: failure for lib/kunit: Support writable
 filter* parameters of kunit module (rev2)
Date: Thu, 01 Feb 2024 16:38:06 +0100
Message-ID: <3066928.kC03pvyZki@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <dmwvmczxregptoifkjgyje2cramo5ztnzkkrcasz4mpnjhel6p@qwcz6rlu6gwi>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <2945385.o0KrE1Onz3@jkrzyszt-mobl2.ger.corp.intel.com>
 <dmwvmczxregptoifkjgyje2cramo5ztnzkkrcasz4mpnjhel6p@qwcz6rlu6gwi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thursday, 1 February 2024 15:13:31 CET Lucas De Marchi wrote:
> On Thu, Feb 01, 2024 at 12:06:35PM +0100, Janusz Krzysztofik wrote:
> >On Wednesday, 31 January 2024 21:51:15 CET Lucas De Marchi wrote:
> >> On Wed, Jan 31, 2024 at 08:22:35PM +0100, Janusz Krzysztofik wrote:
> >> >On Wednesday, 31 January 2024 19:36:57 CET Patchwork wrote:
> >> >> == Series Details ==
> >> >>
> >> >> Series: lib/kunit: Support writable filter* parameters of kunit module
> >> >(rev2)
> >> >> URL   : https://patchwork.freedesktop.org/series/129174/
> >> >> State : failure
> >> >>
> >> >> == Summary ==
> >> >>
> >> >> CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10613_BAT
> >> >> ====================================================
> >> >>
> >> >> Summary
> >> >> -------
> >> >>
> >> >>   **FAILURE**
> >> >>
> >> >>   Serious unknown changes coming with XEIGTPW_10613_BAT absolutely need to
> >> >be
> >> >>   verified manually.
> >> >>
> >> >>   If you think the reported changes have nothing to do with the changes
> >> >>   introduced in XEIGTPW_10613_BAT, please notify your bug team (I915-ci-
> >> >infra@lists.freedesktop.org) to allow them
> >> >>   to document this new failure mode, which will reduce false positives in
> >> >CI.
> >> >>
> >> >>
> >> >>
> >> >> Participating hosts (4 -> 4)
> >> >> ------------------------------
> >> >>
> >> >>   No changes in participating hosts
> >> >>
> >> >> Possible new issues
> >> >> -------------------
> >> >>
> >> >>   Here are the unknown changes that may have been introduced in
> >> >XEIGTPW_10613_BAT:
> >> >>
> >> >> ### IGT changes ###
> >> >>
> >> >> #### Possible regressions ####
> >> >>
> >> >>   * igt@xe_live_ktest@bo:
> >> >>     - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
> >> >>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
> >> >igt@xe_live_ktest@bo.html
> >> >>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
> >> >igt@xe_live_ktest@bo.html
> >> >
> >> >Hi Lucas,
> >> >
> >> >We've got an empty list of test cases because the current algorithm of IGT
> >> >KUnit implementation expects subtest name provided via struct kunit_tests
> >> >to be the same as name of a test suite provided by the KUnit test module.  As
> >> >a special case, if the module provides only one test suite (most do) and the
> >> >name of it is the same as the module name with the _test or _kunit suffix
> >> >truncated (also the most common case) then subtest name may be omitted (i.e.,
> >> >.name field may be NULL).
> >> >
> >> >I have to document the above, but we also have to use the same names on both
> >> >sides (KUnit test module and its corresponding IGT test).  Now we don't, e.g.
> >> >test suite named "xe_bo" is provided by xe_bo_test module while subtest name
> >> >"bo" is specified for that module in IGT xe_live_ktest.
> >>
> >> in the end we want to have only one module: xe_live_test.ko and then
> >> filter out by the testunit. From what I've seen previously in igt, it
> >> would be a matter of always reloading the same module, but passing a
> >> different name.
> >
> >As long as the module will provide several test suites, each of those test
> >suites can be mapped to a separate subtest with the same name as the test
> >suite, and with its test cases discovered and executed automatically by IGT as
> >dynamic sub-subtests, still selectable individually via IGT --dynamic command
> >line option.  For that to work this way, populating .name fields of the struct
> >kunit_tests table with subtest names that are the same as test suite names is
> >mandatory, otherwise IGT will expose one subtest, named after the module name,
> >with dynamic sub-subtests named <suite_name>-<case_name>.
> 
> that's what I did when I submitted the module rename:
> https://lore.kernel.org/igt-dev/20231205224926.2188996-1-lucas.demarchi@intel.com/
> 
> This one is to be applied on top of these fixes to kunit handling.

Do your subtest names match test suite names used in xe_live_test.ko?  AFAICS, 
https://patchwork.freedesktop.org/series/126786/ referred in the IGT patch 
you've pointed out didn't touch test suite names while combining source files 
of several now separate modules into that one module, and test suite names 
still reported by those separate modules don't match -- they start with xe_ 
prefix.  We need to have those mismatches fixed on one side or another.

Thanks,
Janusz

> 
> Lucas De Marchi
> 




