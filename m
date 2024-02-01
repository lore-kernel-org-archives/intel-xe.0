Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F73C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729F110EED8;
	Thu,  1 Feb 2024 14:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6m/ho4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC2110EE3D;
 Thu,  1 Feb 2024 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706799310; x=1738335310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jb5PZXyN9Hp/RhEOP4GTKYvnbCRUkWFkkeodbGcebSk=;
 b=K6m/ho4j4Do7zbpVdvXGf3Wlpmo6s4DGIKrm1rfHpYk4izCHsEGfmA93
 2A33LPdWy8+d8qXHyqFySeh7mAxU685SCF1se243m6e2WjQzP664tXWZU
 n6ntbZdLtppHszCl2wcqwMjU2wWQv/tvDy9LbYJPLcjzvj+3GROHfcUW1
 VZwfsSne2FkO3FPMB+OBurXDb5AXXomSPJkeMHBQfvJGhpmwz8lPZYs3h
 smpw+xj9QJtJKkwmn9iyoRqTMnJ+2uZnz1VugKoPi06HFHPLAb33HJ2CU
 t43ESdYmIQHvE3I/zvLzhmFDJnTqP0spKwjUFL4FkkcziZiZ1pDA9xTEY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25371288"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="25371288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4405814"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:55:04 -0800
Date: Thu, 1 Feb 2024 15:55:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] lib/kunit: Process module remove error
 after list errors
Message-ID: <20240201145501.5ga7vvpkc6urpwy2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-14-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-14-janusz.krzysztofik@linux.intel.com>
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
On 2024-01-31 at 19:03:53 +0100, Janusz Krzysztofik wrote:
> Skip on any error from test case list gathering first, then, in
> preparation for executing those test cases, on an error from unloading the
> test module loaded in list only mode, so it is more clear if listing the
> test cases was successful or not.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_kmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 53c54b1a0d..741c7fd055 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1225,11 +1225,11 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  		free(case_name);
>  	}
>  
> -	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> -
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
>  	igt_skip_on(igt_list_empty(tests));

This skip_on will prevent module unload below... What about
remembering both and skipping on list_empty() only after module unload?
For example:
    testslist_is_empty = igt_list_empty(tests);
    unload_failed = kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);

    igt_skip_on(testslist_is_empty);
    igt_skip_on_f(unload_failed, "kmod %s unload failed\n", tst->kmod);


Regards,
Kamil

> +
> +	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
>  }
>  
>  static void __igt_kunit(struct igt_ktest *tst,
> -- 
> 2.43.0
> 
