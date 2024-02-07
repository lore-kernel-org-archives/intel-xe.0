Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92CC4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F9A1131D6;
	Wed,  7 Feb 2024 10:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZGCp66e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA671131DE;
 Wed,  7 Feb 2024 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707300737; x=1738836737;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H1kihLMtVkjPp+b9dcBPRzqMaqOX/4bAiQlWy/mxlKM=;
 b=kZGCp66eN4wdKD8QUk3OKiBGmLqY82hk8fmsdLtmFOAdeg59tIcmlnoA
 LCLhGJZgy3kyx89kp1ACeoG7mq3o1AT+U3bFreNsLZQJAE8M9gsgfifX9
 jZ880xkUCRq2xW8lsIiaKimbP+ktuXHZh+5JQg1PoW7n1iW+rPvUwiF3q
 uIjTALsN9g/fO8hkAqqDilPIQQ1ReDbnHDVmACCmy/NKGAvWgJ29n8raw
 7WPt9zuRtCz1D/R5sH4PhZc5ljPmWVoMXMpsloieKKKQZ48UE+cbtrMJV
 oEb0cPGeOrlwUffa62xiR3Jx8gGhqaHVVUBT1x/7YhIlyhlJX8As8OP7k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1104745"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1104745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1293994"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.22.5])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:12:14 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 8/8] lib/kunit: Perform test suite filtering on
 the kernel side
Date: Wed, 07 Feb 2024 11:12:11 +0100
Message-ID: <4281604.mogB4TqSGs@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240206172106.p2w2ga45a4i2bbkc@kamilkon-desk.igk.intel.com>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <20240206101514.6897-18-janusz.krzysztofik@linux.intel.com>
 <20240206172106.p2w2ga45a4i2bbkc@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

Thanks for your reviews, this one and others of the series.

On Tuesday, 6 February 2024 18:21:06 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-02-06 at 11:00:32 +0100, Janusz Krzysztofik wrote:
> > When getting a list of test cases provided by a KUnit test module, we now
> > set KUnit filters in a way that results in all test cases from all test
> > suites of that module being reported as skipped, then we delete test cases
> > that don't belong to a requested test suite from the list.  Moreover,
> > before executing test cases from that list, we modify KUnit filters in a
> > way that all test cases from all test suites of the test module are
> > executed, but we report only those from the requested test suite.  Since
> > KUnit base module has a capability of filtering test cases by test suite
> > name, which we don't use, our approach to filtering is not optimal.
> > 
> > Limit kernel side processing to test cases that belong to the requested
> > test suite by setting KUnit filter_glob parameter to that test suite name,
> > and drop user side test suite filtering.  With user side post-processing
> > of test case lists limited to SKIP verification, defer cleanup of memory
> > occupied by the list entries to a first igt_fixture section that follows.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 34 +++++++++-------------------------
> >  1 file changed, 9 insertions(+), 25 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 506093c954..9b92696f1f 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -1157,7 +1157,6 @@ static bool kunit_get_tests(struct igt_list_head *tests,
> >  			    const char *suite,
> >  			    const char *opts)
> >  {
> > -	char *suite_name = NULL, *case_name = NULL;
> >  	struct igt_ktap_result *r, *rn;
> >  	struct igt_ktap_results *ktap;
> >  	unsigned long taints;
> > @@ -1179,7 +1178,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
> >  	 * perfectly -- seems to be more safe than extracting a test case list
> >  	 * of unknown length from /dev/kmsg.
> >  	 */
> > -	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip")))
> > +	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
> >  		return false;
> >  
> >  	igt_skip_on(modprobe(tst->kmod, opts));
> > @@ -1194,30 +1193,13 @@ static bool kunit_get_tests(struct igt_list_head *tests,
> >  
> >  	igt_ktap_free(ktap);
> >  
> > -	if (!err)
> > -		igt_list_for_each_entry_safe(r, rn, tests, link) {
> > -			if (igt_debug_on(r->code != IGT_EXIT_SKIP)) {
> > -				err = r->code ?: -EPROTO;
> > -				break;
> > -			}
> > -
> > -			if (!suite)
> > -				continue;
> > -
> > -			if (strcmp(r->suite_name, suite))
> > -				kunit_result_free(&r, &case_name, &suite_name);
> > -		}
> > -
> > -	if (err) {
> > -		kunit_results_free(tests, &case_name, &suite_name);
> > -	} else {
> > -		free(suite_name);
> > -		free(case_name);
> > -	}
> > -
> >  	igt_skip_on_f(err,
> >  		      "KTAP parser failed while getting a list of test cases\n");
> >  
> > +	igt_list_for_each_entry_safe(r, rn, tests, link)
> > +		igt_require_f(r->code == IGT_EXIT_SKIP,
> > +			      "Unexpected non-SKIP result while listing test cases\n");
> > +
> >  	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> >  
> >  	return true;
> > @@ -1225,6 +1207,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
> >  
> >  static void __igt_kunit(struct igt_ktest *tst,
> >  			const char *subtest,
> > +			const char *suite,
> >  			const char *opts,
> >  			struct igt_list_head *tests)
> >  {
> > @@ -1249,7 +1232,8 @@ static void __igt_kunit(struct igt_ktest *tst,
> >  			      t->case_name) {
> >  
> >  			if (!modprobe.thread) {
> > -				igt_require(kunit_set_filtering(NULL, NULL, NULL));
> > +				igt_require(kunit_set_filtering(suite,
> > +								NULL, NULL));
> 
> Can you keep it in one line? 

OK.

Thanks,
Janusz

> With or without it,
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> >  
> >  				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> >  				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> > @@ -1443,7 +1427,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
> >  		if (!kunit_get_tests(&tests, &tst, suite, opts))
> >  			__igt_kunit_legacy(&tst, subtest, opts);
> >  		else
> > -			__igt_kunit(&tst, subtest, opts, &tests);
> > +			__igt_kunit(&tst, subtest, suite, opts, &tests);
> >  	}
> >  
> >  	igt_fixture {
> 




