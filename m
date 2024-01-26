Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558EC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 09:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E810EA10;
	Fri, 26 Jan 2024 09:35:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FA710E1E8;
 Fri, 26 Jan 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706261706; x=1737797706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZiThSy6vzs18hOY3uFd7t3CMKA5BO3HTWJnD2S5BQPA=;
 b=XMZTA/9xQd+3qXx73yG2H6nSGlGb06QSlBtTQPD8HSjGAC4G9SGGtdsS
 adCXEILVfdoUT76cEjSRTu8mdN0NW0PUmylhByfM9WdBUJ9o/jfidxnti
 eCDQoT9mfLlBNSDdavEDEWX6sQhakWrH3Yc4vMPup4Grlz1GCIORti7JC
 OOu7HrltvWME5/QgtqAG5tolPNqigMYrI4XSLB2AbFTLImsOV+3o1VVFV
 OiPz5cgl26L1HBtn2cvZvjdzSIOSQ/h/uG5zlamJwje1WO6N66wuqHG/v
 708yyzywnZRYWJ1bigv9Hx7Eb5klhJZUtSI4bsJk8/WXnLXMO56ac5Zqi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401282986"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401282986"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 01:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906265699"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906265699"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 01:35:04 -0800
Date: Fri, 26 Jan 2024 10:35:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/kunit: Report early kernel taints explicitly
Message-ID: <20240126093502.n4vwmaaekwllxcih@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <20240125165749.15599-7-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240125165749.15599-7-janusz.krzysztofik@linux.intel.com>
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
On 2024-01-25 at 17:52:11 +0100, Janusz Krzysztofik wrote:
> When we find the kernel tainted after loading our kunit test module in
> list only mode, report that taint immediately as the reason for skip
> instead of executing and blaming our ktap parser.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 4f96dafe01..01198e75dc 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1213,6 +1213,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
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
