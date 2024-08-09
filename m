Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C4C531DA
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 11:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA6E10E8D8;
	Fri,  9 Aug 2024 11:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jp8wJn/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFEB10E8D8
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723204559; x=1754740559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3EMDC8P50vG4tRCHlSuaf9MD2IvpfGXzoYvG/aPexEU=;
 b=jp8wJn/bu3e2yParAgU3jR0DEFofp6cGZT+X7e4EASUbGDkRnED+Z8nr
 tmHl/iZLNO7cEAasMbFz2DuvicsJNJWiT5u8RP32UJUrk9o9NQZyFMqmY
 qv0avSCLruALG7i/YBLpNVn/1yhqPp6M+O5z/+MuMks0yswhtdfLTQR5+
 3jFPrHyWUjXJ6TRHesWe8LfPHQi4HtbFb2MuD8a7qyKbRUo5pLa9/5gu4
 3y6bmTMSEIRSS4Q062SnvAOZEMEHl8No5C+J1S/T9EXG4LthTrbKS9Dnb
 AD5a9kTlApSg6L4vdj3r49aDxKtN1kDZJ0ut6Vf0PjSOvjQhzfUBhpKqW w==;
X-CSE-ConnectionGUID: 0+p/vx1CSrSoasERc1UOxQ==
X-CSE-MsgGUID: Gfdxii8URHyKcGZcSQT/2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38880691"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="38880691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:55:59 -0700
X-CSE-ConnectionGUID: Oo6m7NBMScmZyiAnrwJ50A==
X-CSE-MsgGUID: RPBrY36PTOaRNseDWvY2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="95056200"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.117])
 ([10.245.146.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:55:56 -0700
Message-ID: <c61b182f-739e-4b41-803c-123feabc2ab1@linux.intel.com>
Date: Fri, 9 Aug 2024 13:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add has_wmtp GT info
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240809104736.10423-1-nirmoy.das@intel.com>
 <20240809104736.10423-2-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240809104736.10423-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 8/9/2024 12:47 PM, Nirmoy Das wrote:
> Add a GT info member to reflect wmtp feature status.
>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
>   drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++----
>   2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 631928258d71..bba212924e21 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -131,6 +131,8 @@ struct xe_gt {
>   		u8 id;
>   		/** @info.has_indirect_ring_state: GT has indirect ring state support */
>   		u8 has_indirect_ring_state:1;
> +		/** @has_wmtp: gt supports mid-thread preemption */


It should be @info.has_wmtp. I will fix it in future rev.


Thanks,

Nirmoy

> +		bool has_wmtp;
>   	} info;
>   
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 402dfa748e16..7ddffc596dc1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -347,14 +347,11 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>   static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>   				      const struct xe_hw_engine *hwe)
>   {
> -	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> -		return false;
> -
>   	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
>   	    hwe->class != XE_ENGINE_CLASS_RENDER)
>   		return false;
>   
> -	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
> +	return !gt->info.has_wmtp;
>   }
>   
>   void
> @@ -736,6 +733,15 @@ static void read_compute_fuses(struct xe_gt *gt)
>   		read_compute_fuses_from_dss(gt);
>   }
>   
> +static void read_wmtp_fuses(struct xe_gt *gt)
> +{
> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> +		return;
> +
> +	gt->info.has_wmtp = !(xe_mmio_read32(gt, XEHP_FUSE4) &
> +			    CFEG_WMTP_DISABLE);
> +}
> +
>   static void check_gsc_availability(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -766,6 +772,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>   	read_media_fuses(gt);
>   	read_copy_fuses(gt);
>   	read_compute_fuses(gt);
> +	read_wmtp_fuses(gt);
>   	check_gsc_availability(gt);
>   
>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
