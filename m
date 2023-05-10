Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE1CC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 13:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD8410E496;
	Wed, 10 May 2023 13:22:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36FC10E496
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683724932; x=1715260932;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=mjIpM/n/jbGlYythR8WVui/R55k1YSE+sIVgTRJcfNs=;
 b=XjPw20ibzg8IcQswXok+C5/HjaLFI1Z6OYW/2uf0UKpP/pPU0hh4bc8o
 PkcR6WLOXiTXs57a48L59paLtaMerkGINFvf7u4Hu2vcsTJiM2W11unXv
 ueGO7S6VYWLPw0t6rNcXeGGZT5t4+n9+Es7xT/iZeG6iHr3en/PQJTF/R
 pSKvFIT9EN52OXZGq8TLx5L9gRCoIaJAEPKU3o4Eu76z8tqzzl6TITA5g
 U4cX0T27NzUPgOyHJF6ik693LL+mcIMHtLnhczEOBWVt7gZDAs0uk/R1y
 DZQgTcpMLdzi49fmtYivs+fGoc+kMJynjoD4zdJOgRgTGF+W/8VLPoYyM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415785048"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="415785048"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 06:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="945701734"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="945701734"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by fmsmga006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:22:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230509222053.1541049-1-gustavo.sousa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509222053.1541049-1-gustavo.sousa@intel.com>
Date: Wed, 10 May 2023 16:22:08 +0300
Message-ID: <87pm78midb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

On Tue, 09 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Make sure all necessary exit functions are also called when
> xe_register_pci_driver() fails.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 6860586ce7f8..9698875852d3 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -53,14 +53,18 @@ static int __init xe_init(void)
>  
>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>  		err = init_funcs[i].init();
> -		if (err) {
> -			while (i--)
> -				init_funcs[i].exit();
> -			return err;
> -		}
> +		if (err)
> +			break;
>  	}
>  
> -	return xe_register_pci_driver();
> +	if (!err)
> +		err = xe_register_pci_driver();

Why aren't xe_register_pci_driver() and xe_unregister_pci_driver()
init/exit functions in the array? It would avoid the special casing
here, and allow some init functions to be called after register.

BR,
Jani.


> +
> +	if (err)
> +		while (i--)
> +			init_funcs[i].exit();
> +
> +	return err;
>  }
>  
>  static void __exit xe_exit(void)

-- 
Jani Nikula, Intel Open Source Graphics Center
