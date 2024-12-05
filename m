Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2024DE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 19:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26510EFAF;
	Thu,  5 Dec 2024 19:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArYkRKrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CA610EFAA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733428290; x=1764964290;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aJl7d1zfx+hDVIyZCGKQGKtDeY2PoUVJ8V3Nr9RBMX0=;
 b=ArYkRKrZPqtigqEGefMo1XvhtaeaME2oosLnOZrMdroi+vxB2ntLMW0e
 rv7fJtLHhTpOeodvKdc5GJVvPEhHvDZa4MSCkkP987j/T2n6pzFbUF+RG
 7PGcKGvyH7h8FF+GW4barcFj4KgZG4HwZFHgicuvHvRUPAoTtOG57ALR6
 K1YTKBAoYkTxHrqH89KLUTK1+4rmTwr9lbjECT7PqG6r9xqujCZF5a4rB
 xib3NV2os48d3fm0/1bvj8ddlcbyBm9ULNTqBC4De3tBdTsgNxaI0pbeI
 keHnYNp7PXu7unEJ2CqJd3vvtdcYTDtlU4O0cQhAIBRvBJVN2Lqk1t4P4 w==;
X-CSE-ConnectionGUID: uTWB1yq2Q/aCKsp2XUMXyA==
X-CSE-MsgGUID: aqPAtOmRRM259auVOT1TvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45143716"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="45143716"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:51:30 -0800
X-CSE-ConnectionGUID: optmGsmyR8qHKFreTLDBNg==
X-CSE-MsgGUID: wOU2e4vzRjyL7zR8Wyi/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94678165"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 11:51:29 -0800
Received: from [10.245.80.89] (unknown [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B601F32C94;
 Thu,  5 Dec 2024 19:51:27 +0000 (GMT)
Message-ID: <2264e95d-18a0-4877-a2e4-02a4f91ebaa0@intel.com>
Date: Thu, 5 Dec 2024 20:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Add xe_gt_dbg_printer
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241205182240.3463027-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 05.12.2024 19:22, Lucas De Marchi wrote:
> Like the info/err, add a printer for dbg messages.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 5dc71394372d6..1f27d9f75bae1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -60,6 +60,13 @@ static inline void __xe_gt_printfn_info(struct drm_printer *p, struct va_format
>  	xe_gt_info(gt, "%pV", vaf);
>  }
>  
> +static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_gt *gt = p->arg;
> +
> +	xe_gt_dbg(gt, "%pV", vaf);

I'm afraid it's not that easy as drm_dbg() will likely use this function
as context so all outputs will look the same like:

	[drm:__xe_gt_printfn_dbg [xe]] ...

see my old attempt to add new dbg printer that should work as expected

[1] https://patchwork.freedesktop.org/series/134630/

> +}
> +
>  /**
>   * xe_gt_err_printer - Construct a &drm_printer that outputs to xe_gt_err()
>   * @gt: the &xe_gt pointer to use in xe_gt_err()
> @@ -90,4 +97,19 @@ static inline struct drm_printer xe_gt_info_printer(struct xe_gt *gt)
>  	return p;
>  }
>  
> +/**
> + * xe_gt_dbg_printer - Construct a &drm_printer that outputs to xe_gt_dbg()
> + * @gt: the &xe_gt pointer to use in xe_gt_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_gt_dbg_printer(struct xe_gt *gt)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_gt_printfn_dbg,
> +		.arg = gt,
> +	};
> +	return p;
> +}
> +
>  #endif

