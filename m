Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F7C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 17:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9810FBB4;
	Tue,  6 Feb 2024 17:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYYhR8eI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8B3112BE3;
 Tue,  6 Feb 2024 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707239975; x=1738775975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pEXG1bKKdlBOrnBM/DLjFDyXgYtOkw8d6kqMWOA1T1g=;
 b=TYYhR8eIwukuT4Si7HgXxWqluJJe7zxS90m5w6kGQxzCfFYrNF4ujTV5
 cchJsfZJNXTjNfIz7RDP9YSXiQNONhI2xck9tYeo9yHBpgD59iocBgLFP
 dfdcRmNKXI9zf3u8PRBNzxh4Xo/jDJEutUteCOen7FxeZk4uUElnhl6If
 ITf7yUEI8iJsAY3Jt6EPteGa3kLT9VLB3NbePLr+KZVBMvHbFF6It/DVj
 sFVW7ZQR8r6XjiOsfVFMBujrSnUB1VsIYcMFcV4akVvp9+U/APmaunHo3
 mjS6tcMwe3XKcNiq9ut4obKiv2C0YyCpT8culc41c74ilFH9ZUXFILAio w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="395219740"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="395219740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1114296"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 09:19:31 -0800
Date: Tue, 6 Feb 2024 18:19:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 7/8] lib/kunit: Fix API documentation
Message-ID: <20240206171910.skca2rwcx2itagih@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <20240206101514.6897-17-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240206101514.6897-17-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,
On 2024-02-06 at 11:00:31 +0100, Janusz Krzysztofik wrote:
> The only IGT KUnit global function igt_kunit() accepts a "name" argument
> documented as "the name of subtest, if different from that derived from
> module name".  But in practice, we use that argument, if not NULL, as a
> name of test suite to be executed.  We pass that value to kunit_get_tests()
> as a filter that selects only test cases from that test suite.  We also
> use that string, if not NULL, as subtest name, which we otherwise just
> derive from module name.
> 
> Fix the documentation, and also use better names for the argument and a
> local variable initialized as its copy.  For clarity, propagate those
> new names as argument names down to lower level functions.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 52 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index b5acc5a2a6..506093c954 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1019,7 +1019,7 @@ static void kunit_results_free(struct igt_list_head *results,
>  }
>  
>  static void __igt_kunit_legacy(struct igt_ktest *tst,
> -			       const char *name,
> +			       const char *subtest,
>  			       const char *opts)
>  {
>  	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
> @@ -1058,8 +1058,8 @@ static void __igt_kunit_legacy(struct igt_ktest *tst,
>  		r = igt_list_first_entry(&results, r, link);
>  
>  		igt_dynamic_f("%s%s%s",
> -			      strcmp(r->suite_name, name) ?  r->suite_name : "",
> -			      strcmp(r->suite_name, name) ? "-" : "",
> +			      strcmp(r->suite_name, subtest) ?  r->suite_name : "",
> +			      strcmp(r->suite_name, subtest) ? "-" : "",
>  			      r->case_name) {
>  
>  			if (r->code == IGT_EXIT_INVALID) {
> @@ -1154,7 +1154,7 @@ static void __igt_kunit_legacy(struct igt_ktest *tst,
>  
>  static bool kunit_get_tests(struct igt_list_head *tests,
>  			    struct igt_ktest *tst,
> -			    const char *filter,
> +			    const char *suite,
>  			    const char *opts)
>  {
>  	char *suite_name = NULL, *case_name = NULL;
> @@ -1201,10 +1201,10 @@ static bool kunit_get_tests(struct igt_list_head *tests,
>  				break;
>  			}
>  
> -			if (!filter)
> +			if (!suite)
>  				continue;
>  
> -			if (strcmp(r->suite_name, filter))
> +			if (strcmp(r->suite_name, suite))
>  				kunit_result_free(&r, &case_name, &suite_name);
>  		}
>  
> @@ -1224,7 +1224,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
>  }
>  
>  static void __igt_kunit(struct igt_ktest *tst,
> -			const char *name,
> +			const char *subtest,
>  			const char *opts,
>  			struct igt_list_head *tests)
>  {
> @@ -1244,8 +1244,8 @@ static void __igt_kunit(struct igt_ktest *tst,
>  
>  	igt_list_for_each_entry(t, tests, link) {
>  		igt_dynamic_f("%s%s%s",
> -			      strcmp(t->suite_name, name) ?  t->suite_name : "",
> -			      strcmp(t->suite_name, name) ? "-" : "",
> +			      strcmp(t->suite_name, subtest) ?  t->suite_name : "",
> +			      strcmp(t->suite_name, subtest) ? "-" : "",
>  			      t->case_name) {
>  
>  			if (!modprobe.thread) {
> @@ -1380,29 +1380,33 @@ static void __igt_kunit(struct igt_ktest *tst,
>  /**
>   * igt_kunit:
>   * @module_name: the name of the module
> - * @name: the name of subtest, if different from that derived from module name
> + * @suite: the name of test suite to be executed, also used as subtest name;
> + *	   if NULL then test cases from all test suites provided by the module
> + *	   are executed as dynamic sub-subtests of one IGT subtest, which name
> + *	   is derived from the module name by cutting off its optional trailing
> + *	   _test or _kunit suffix
>   * @opts: options to load the module
>   *
>   * Loads the test module, parses its (k)tap dmesg output, then unloads it
>   */
> -void igt_kunit(const char *module_name, const char *name, const char *opts)
> +void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  {
>  	struct igt_ktest tst = { .kmsg = -1, };
> -	const char *filter = name;
> +	const char *subtest = suite;
>  	IGT_LIST_HEAD(tests);
>  
>  	/*
> -	 * If the caller (an IGT test) provides no subtest name then we
> -	 * take the module name, drop the trailing "_test" or "_kunit"
> +	 * If the caller (an IGT test) provides no test suite name then
> +	 * we take the module name, drop the trailing "_test" or "_kunit"
>  	 * suffix, if any, and use the result as our IGT subtest name.
>  	 */
> -	if (!name) {
> -		name = strdup(module_name);
> -		if (!igt_debug_on(!name)) {
> -			char *suffix = strstr(name, "_test");
> +	if (!subtest) {
> +		subtest = strdup(module_name);
> +		if (!igt_debug_on(!subtest)) {
> +			char *suffix = strstr(subtest, "_test");
>  
>  			if (!suffix)
> -				suffix = strstr(name, "_kunit");
> +				suffix = strstr(subtest, "_kunit");
>  
>  			if (suffix)
>  				*suffix = '\0';
> @@ -1410,7 +1414,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  	}
>  
>  	igt_fixture {
> -		igt_require(name);
> +		igt_require(subtest);
>  
>  		igt_skip_on(igt_ktest_init(&tst, module_name));
>  		igt_skip_on(igt_ktest_begin(&tst));
> @@ -1428,7 +1432,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  	 * proper namespace for dynamic subtests, with is required for CI
>  	 * and for documentation.
>  	 */
> -	igt_subtest_with_dynamic(name) {
> +	igt_subtest_with_dynamic(subtest) {
>  		/*
>  		 * TODO: As soon as no longer needed by major Linux
>  		 *	 distributions, replace the fallback to
> @@ -1436,10 +1440,10 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  		 *	 LTS kernels not capable of using KUnit filters for
>  		 *	 listing test cases in KTAP format, with igt_require.
>  		 */
> -		if (!kunit_get_tests(&tests, &tst, filter, opts))
> -			__igt_kunit_legacy(&tst, name, opts);
> +		if (!kunit_get_tests(&tests, &tst, suite, opts))
> +			__igt_kunit_legacy(&tst, subtest, opts);
>  		else
> -			__igt_kunit(&tst, name, opts, &tests);
> +			__igt_kunit(&tst, subtest, opts, &tests);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.43.0
> 
