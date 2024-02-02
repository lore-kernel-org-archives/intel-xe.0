Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52DC48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 10:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BFB10E07D;
	Fri,  2 Feb 2024 10:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpC7wQ8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C0010E07D;
 Fri,  2 Feb 2024 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706870298; x=1738406298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sFNwRDf4T56teQDn/AwuKlDKE1pCP++OYpzxUgRovMo=;
 b=jpC7wQ8iwbwyYN7D4Ua7bLbx5ADapfDKgF2dy3/Gg3ZJkiX9koyt6SJd
 WLsHeBNgfdBp5VTm+6QbFbLCV+3kJuzhcTJ7oZqwxuSUROfZPsZGjVWa8
 Cv7ootJg0r7ceiBv/A4Vbs1R60Ns+ETKhCQUJSzYS2iYmlbEi5BNTWN1k
 uwK8CojtLnOb3exRbQPCOW8WvdDGAs800qdWjtI5u1GQTb2Y4zZV5N0yu
 ailUlb0mLnkJ8JHc/Gn9odP+IjGba7UTtd1OuKZb2ELjxZGv/FXAOPA9J
 WhWsO1w0+wduTbVLonH8CTavGR5i/YV0DiJzcfbqk5jDbUFe28TGsdwKg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="394568904"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="394568904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="37476642"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:38:15 -0800
Date: Fri, 2 Feb 2024 11:37:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 3/6] lib/kunit: Unload base KUnit module only
 before reloading it
Message-ID: <20240202103755.ana26d3ijhd2myei@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
 <20240201190237.150754-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201190237.150754-11-janusz.krzysztofik@linux.intel.com>
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
On 2024-02-01 at 19:59:19 +0100, Janusz Krzysztofik wrote:
> In preparation for replacement of the current method of reloading base
> KUnit module with updating the module parameters via sysfs when a new set
> of those parameters is needed, unload the module right before it is now
> reloaded with new parameters, and stop unloading it in other places.
> A follow-up patch will remove all those unloads still left, but even then
> it will be shorter and more clean when based on top of this one.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d1091bdc79..d2c28d0a64 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1130,6 +1130,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  	 * iterating over KTAP results collected from blind execution of all
>  	 * Kunit test cases provided by a Kunit test module.
>  	 */
> +	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>  	if (igt_debug_on(igt_kmod_load("kunit",
>  				       "filter=module=none filter_action=skip")))
>  		return;
> @@ -1167,7 +1168,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  	}
>  
>  	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> -	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>  
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
> @@ -1200,6 +1200,17 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			      t->case_name) {
>  
>  			if (!modprobe.thread) {
> +				/*
> +				 * Since we have successfully loaded the kunit
> +				 * base module with non-default parameters in
> +				 * order to get a list of test cases, now we
> +				 * have to unload it so it is then automatically
> +				 * reloaded with default parameter values when
> +				 * we load the test module again for execution.
> +				 */
> +				igt_skip_on(igt_kmod_unload("kunit",
> +							    KMOD_REMOVE_FORCE));
> +
>  				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
>  				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
>  							  PTHREAD_MUTEX_ROBUST),
> @@ -1364,15 +1375,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  		igt_skip_on(igt_ktest_init(&tst, module_name));
>  		igt_skip_on(igt_ktest_begin(&tst));
>  
> -		/*
> -		 * Since we need to load kunit base module with specific
> -		 * options in order to get a list of test cases, make
> -		 * sure that the module is not loaded.  However, since
> -		 * unload may fail if kunit base module is not loaded,
> -		 * ignore any failures, we'll fail later if still loaded.
> -		 */
> -		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> -
>  		igt_assert(igt_list_empty(&tests));
>  	}
>  
> @@ -1404,7 +1406,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  		kunit_results_free(&tests, &suite_name, &case_name);
>  
>  		igt_ktest_end(&tst);
> -		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>  	}
>  
>  	igt_ktest_fini(&tst);
> -- 
> 2.43.0
> 
