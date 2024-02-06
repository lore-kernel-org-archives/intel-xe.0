Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3764C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 17:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C030112D08;
	Tue,  6 Feb 2024 17:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uo6lUp3n";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 06 Feb 2024 17:30:03 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E8F112D0B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707240603; x=1738776603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LdGUJYzo4IfnCpqgntcolIXsGD+raZTOzGxTJAyIwNw=;
 b=Uo6lUp3nqi8VALy4obIXjUYP21EpLi2zn3vMUXcskEBmRzJxSVaFGuVw
 ZYSKCixErwO4SQFnSqPilfV1NdvjjGQe2XTpa1+4MX4iHFV2x//JnHs3a
 /gaGK3JjiuT3GKO3yUCbK/UJznb/g9zAei/J5Tt2SkzOnxbamiSY3VUJQ
 zf0CBWyj/iEHLGgsA0AhtEFRCFSsrTEBLJ+NtQfBeWJEIq3+sKIEirNHD
 ZbUpTxAs6skqaWPHX8bcN5hROVghEP48RmuLgUs85J87W8W7MbkS8gmO7
 amOFRUwpJzOVCG2j4Ey2WzU/LTBrsLYt2TJYOhVpirR/hNUFVVmp/Bgkj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="684190"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="684190"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5695152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 09:22:55 -0800
Date: Tue, 6 Feb 2024 18:22:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 1/8] lib/kunit: Enter legacy path only if
 applying filters fails
Message-ID: <20240206172252.rb6tdxkbwbkgjwf5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <20240206101514.6897-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240206101514.6897-11-janusz.krzysztofik@linux.intel.com>
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
On 2024-02-06 at 11:00:25 +0100, Janusz Krzysztofik wrote:
> If loading the base KUnit module in list mode succeeds but our KTAP
> parser or test suite filtering returns an empty list of test cases then,
> instead of calling igt_skip, we now unintentionally fall back to legacy
> mode as if the module didn't support filter parameters.
> 
> Fall back to legacy path only when kunit_get_tests() fails to load the
> base KUnit module with non-default filters, and not when it returns an
> empty list of test cases.
> 
> As an additional benefit from this approach, we now have a single TODO
> place in the code to be fixed when the fallback is no longer needed.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 250ab2107b..ec9f77ba11 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1087,7 +1087,7 @@ static void __igt_kunit_legacy(struct igt_ktest *tst,
>  	igt_skip_on_f(ret, "KTAP parser failed\n");
>  }
>  
> -static void kunit_get_tests(struct igt_list_head *tests,
> +static bool kunit_get_tests(struct igt_list_head *tests,
>  			    struct igt_ktest *tst,
>  			    const char *filter,
>  			    const char *opts)
> @@ -1112,19 +1112,10 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  	 * however, parsing a KTAP report -- something that we already can do
>  	 * perfectly -- seems to be more safe than extracting a test case list
>  	 * of unknown length from /dev/kmsg.
> -	 *
> -	 * TODO: drop the following workaround, which is required by LTS kernel
> -	 *       v6.1 not capable of listing test cases when built as a module.
> -	 * If loading the kunit module with required parameters fails then
> -	 * assume that we are running on a kernel with missing test case listing
> -	 * capabilities.  Dont's skip but just return with empty list of test
> -	 * cases, that should tell the caller to use a legacy method of
> -	 * iterating over KTAP results collected from blind execution of all
> -	 * Kunit test cases provided by a Kunit test module.
>  	 */
>  	if (igt_debug_on(igt_kmod_load("kunit",
>  				       "filter=module=none filter_action=skip")))
> -		return;
> +		return false;
>  
>  	igt_skip_on(modprobe(tst->kmod, opts));
>  
> @@ -1163,6 +1154,8 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
> +
> +	return true;
>  }
>  
>  static void __igt_kunit(struct igt_ktest *tst,
> @@ -1375,15 +1368,14 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  	 * and for documentation.
>  	 */
>  	igt_subtest_with_dynamic(name) {
> -		kunit_get_tests(&tests, &tst, filter, opts);
>  		/*
> -		 * TODO: drop the __igt_kunit() legacy processing path, required
> -		 *	 by kernels v6.1-v6.5 with DRM Kunit support but not
> -		 *	 capable of listing test cases when built as a module,
> -		 *	 as soon as no longer required by major Linux
> -		 *	 distributions, now usually based on LTS kernel v6.1.
> +		 * TODO: As soon as no longer needed by major Linux
> +		 *	 distributions, replace the fallback to
> +		 *	 __igt_kunit_legacy() processing path, required by
> +		 *	 LTS kernels not capable of using KUnit filters for
> +		 *	 listing test cases in KTAP format, with igt_require.
>  		 */
> -		if (igt_debug_on(igt_list_empty(&tests)))
> +		if (!kunit_get_tests(&tests, &tst, filter, opts))
>  			__igt_kunit_legacy(&tst, name, opts);
>  		else
>  			__igt_kunit(&tst, name, opts, &tests);
> -- 
> 2.43.0
> 
