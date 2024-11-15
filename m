Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47474D6DDD8
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 13:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D373810E09D;
	Fri, 15 Nov 2024 13:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cphlXPyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D36910E09D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731676332; x=1763212332;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ORC/NycHwZz/imRBCsH3cdLlDIKSZ9CuUff97cmwuhU=;
 b=cphlXPyZl8StVDd+1wPRRKzvL5/AtoaXbbIVdpb6J5oaybfNVXG/9YUE
 M2OIwAw7oMSGYTU9/1V5OswrNPiHM6abgBOg4ZooujfG/XBsM2gTQ4JGF
 +fGBDnyk6IAYBuu3/nJ6boCkD65wxM3ugWEjMhH+HhFlbn+zi5prVCe3l
 55ghhWxcn39ZoNdXg6Qh35s/dj7dFyc4rv9KUCoWSOAvm7d4Qu+Y/XbMZ
 fhuycMWeI5L+ECpgMNXL1jodoRTQ7pLQCTWaOkWXMTM3uHJePUH+94QP/
 P9gL35SrxjYDvYxq0K8mDoQvlQBEp/r1f9vdHlCTutVeU/3CUoXyt1N2W Q==;
X-CSE-ConnectionGUID: nPxo/0BVSyC39uV8OIukXA==
X-CSE-MsgGUID: UVhbemJNRpiAUG/e7nlVSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42314885"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="42314885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 05:12:11 -0800
X-CSE-ConnectionGUID: GIc+Ia/WRcSvQ8MIeyl27g==
X-CSE-MsgGUID: fMY0wAgYTJmVpbg7UFBb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88665603"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2024 05:12:10 -0800
Received: from [10.245.80.89] (unknown [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7B27628775;
 Fri, 15 Nov 2024 13:12:09 +0000 (GMT)
Message-ID: <d81e0758-95f7-44bd-a899-252b0b9a60ad@intel.com>
Date: Fri, 15 Nov 2024 14:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com
References: <20241115125614.857611-1-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241115125614.857611-1-raag.jadav@intel.com>
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



On 15.11.2024 13:56, Raag Jadav wrote:
> Log throttle register MMIO reads which will be useful for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 03b225364101..0ce21ffc08dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
>  
>  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	bool media = xe_gt_is_media_type(gt);
>  	u32 reg;
>  
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	if (xe_gt_is_media_type(gt))
> +	xe_pm_runtime_get(xe);
> +	if (media)
>  		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> +	xe_pm_runtime_put(xe);
>  
> +	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);

we prefer GT oriented logs, so this should be:

	xe_gt_dbg(gt, "....

>  	return reg;
>  }
>  

