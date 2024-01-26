Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA0AC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 09:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEAA10EAE8;
	Fri, 26 Jan 2024 09:36:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFCC10E1CB;
 Fri, 26 Jan 2024 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706261762; x=1737797762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UygZDvsBFqmiS4nrhYOrrncEGWG/Y0CoxVyGAUvUlKY=;
 b=kJk0hnC9LZP33mNjpACcoJRJW7Mx/otGDuOn1ZbdTtIh/P2N1vevmSqR
 zmRHN36jKAC1noLtezxUhtJ3b7JONMIOpx5oEe3zhWSeOwJYsYOldJ0QJ
 QsBLOtDgv3y5hzlPZs63QcBAYp9NBgC1HzMMEVV4KTWdaztj1VsdyGBgD
 cLzBzdKPZxZpZDlNtzjqlYzojiJUXCjCQLZqW7O/TKFunbxSvXFftfxkv
 zSGO0qIYLRyh7/Lb9HJmW8ja7cNVA6WWDGisVDfEFzZhEZsL9HJk/4qir
 g8OjooTV/dCeWL7t7zPRqaLWAktFmrOk1AtVqZN7bwxjCyYLeZ1qSPJ0E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2300399"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2300399"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 01:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2690581"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 01:36:00 -0800
Date: Fri, 26 Jan 2024 10:35:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/kunit: Process module remove error after
 list errors
Message-ID: <20240126093557.6t2yj6zreernfcrt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <20240125165749.15599-8-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240125165749.15599-8-janusz.krzysztofik@linux.intel.com>
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Janusz,
On 2024-01-25 at 17:52:12 +0100, Janusz Krzysztofik wrote:
> Skip on any error from test case list gathering phase first, then, in
> preparation for executing those test cases, from unloading the test module
> loaded in list only mode, so it is more clear if listing the test cases
> was successful or not.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 01198e75dc..436aad58b3 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1245,10 +1245,10 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  		free(case_name);
>  	}
>  
> -	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> -
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
> +
> +	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
>  }
>  
>  static void __igt_kunit(struct igt_ktest *tst,
> -- 
> 2.43.0
> 
