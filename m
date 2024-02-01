Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE79EC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7938210EE8D;
	Thu,  1 Feb 2024 14:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJJpZfWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A810EE8A;
 Thu,  1 Feb 2024 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797852; x=1738333852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ei9nGRLm4P2vNaSCEWPlJl2ZAeD1VrgwWmbYTKxO4Pc=;
 b=YJJpZfWQhtUdQEcitxdt2MMLz+l3wkAfrAKkTTiIrk7+xx7Pxb0T5UCg
 M4UOUMZQ+cBp/5bgcCvXxJry2qDWL1UN6FnAK9H/SpFK7aFm/Jzvom6Jz
 Kh+B3vXxwj6NHID9yZsSsG2iwxCEAhCLm/V1AOPTfmNFRc0Fu1X5OH6m/
 IurSW6upl6gawJxGk5z1sfsb4J2lGLhpJ3o16j312GDffX+4eE/n66HH7
 28xHUX5/5DJ9/cbAzn4mFAoHRnCcHt59Xie5D/5fLF4IgieS0DskJRP+C
 fQQk3lo5zX6e5YC22n0eKw9C5blCW+AFL11v5NOZdKQe9yjisRYKXLV9R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401036212"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401036212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4425193"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:30:51 -0800
Date: Thu, 1 Feb 2024 15:30:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 1/6] lib/kunit: Skip on empty list of test cases
Message-ID: <20240201143031.zxwkycbnjtagioyg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-9-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-9-janusz.krzysztofik@linux.intel.com>
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
On 2024-01-31 at 19:03:48 +0100, Janusz Krzysztofik wrote:
> If loading the base KUnit module in list mode succeeds but our KTAP
> parser or test suite filter returns an empty list of test cases then,
> instead of calling igt_skip, we now unintentionally fall back to legacy
> mode as if the module didn't support filter parameters.  Fix it.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 250ab2107b..ad69173151 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1163,6 +1163,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
> +	igt_skip_on(igt_list_empty(tests));
>  }
>  
>  static void __igt_kunit(struct igt_ktest *tst,
> -- 
> 2.43.0
> 
