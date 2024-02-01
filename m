Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F45DC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070ED10EADF;
	Thu,  1 Feb 2024 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RK1qv17H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56F710EEBB;
 Thu,  1 Feb 2024 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706798328; x=1738334328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FbFDWg8SMpEFWSDetFR1Z4CL6bW25jdNY43/QngvBy8=;
 b=RK1qv17HLik0FID68Wx2g2JoZcK1X2ZrP8RdFvWM0R8JEyixwKvgCb6J
 VuQ//GkEUgQ+PQphnrrcD37Vr7MNO/vb+NgGjzrQaif1HsP5bzYNlf05m
 EYawBUZ//d6A11jNuotkN5M1acatZKbA/xO20lh0Wu0QTsXJSl2nKIEV2
 W/cCwCedpOPyRgPp76rp3sAzue6yteZcF6CvFCYwOG1avA6LWrwqA3tJS
 huuN8dkE2TF+cIGa2psCo5fi+++swG74gQy/j1mFTTt5T5d+2EGJLowlJ
 Kiv9CCdfzwGjKrjNiiH/lVliYmlrkKSZ5sd/BMU4Sy+lqvvb5f3vxk7CK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394355937"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="394355937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23113215"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:38:46 -0800
Date: Thu, 1 Feb 2024 15:38:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 5/6] lib/kunit: Report early kernel taints
 explicitly
Message-ID: <20240201143843.j7mv6tnxf6dhsvzq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-13-janusz.krzysztofik@linux.intel.com>
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
On 2024-01-31 at 19:03:52 +0100, Janusz Krzysztofik wrote:
> When we find the kernel tainted after loading a KUnit test module in
> list only mode, report that taint immediately as the reason for skip
> instead of executing and blaming our KTAP parser.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 1d57ea708d..53c54b1a0d 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1165,6 +1165,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  	char *suite_name = NULL, *case_name = NULL;
>  	struct igt_ktap_result *r, *rn;
>  	struct igt_ktap_results *ktap;
> +	unsigned long taints;
>  	int flags, err;
>  
>  	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
> @@ -1192,6 +1193,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  	}
>  
>  	igt_skip_on(modprobe(tst->kmod, opts));
> +	igt_skip_on(igt_kernel_tainted(&taints));
>  
>  	ktap = igt_ktap_alloc(tests);
>  	igt_require(ktap);
> -- 
> 2.43.0
> 
