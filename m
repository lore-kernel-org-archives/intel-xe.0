Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A5C5516D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 11:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3A010F221;
	Fri, 31 Jul 2026 11:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icffeNWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AFE10F221
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785496875; x=1817032875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jidUyH/wX5GOXn7uTxUaoNkJ5UNeK/27FjM8HGpeQ9k=;
 b=icffeNWvXREcFYH3rqldqWrmx8ETO13c6M1K0MC/kerS3DByfxWXMDps
 nZm92FBP48Z/2uXOktY9h5Qs69/Ra7entWYNhi/0VZfhwKEviTSN8NcsP
 xIRVTrLaRbw94D/MH9zG3Ps4z/oUtDMBg2lwrz1jKHA4LvpdanZvgO0Hf
 cdzJyJKS3krUYSVrKneFl24+KafPWGHXg2c0Sl+Uk2OFeGKu9l3ayznLV
 pc8EAjYrXbCPwjmAfsf2TCDvK+fSwKgmLZOtSFBd3EnIt0SlsUVEIawE9
 ug89TXsmBxcCDeyj+Th0kfbu13n2rKy+vM9s8UnawK2ngAMoEl6oLFXlF A==;
X-CSE-ConnectionGUID: 83A5T3HqRFmFjAi628iXeA==
X-CSE-MsgGUID: L1Ypu/MdThG9Let2kqqmuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88653767"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="88653767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:21:15 -0700
X-CSE-ConnectionGUID: 5+IMYHPsQ9yaCGJH6FWf7w==
X-CSE-MsgGUID: PEmQsXtNQBiL0HKEb/PVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="257196880"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.78])
 ([10.245.244.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:21:13 -0700
Message-ID: <7f5c825b-970e-4d15-a9b9-8d91c37f2b7f@intel.com>
Date: Fri, 31 Jul 2026 12:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730232712.517989-1-jia.yao@intel.com>
 <20260730232712.517989-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730232712.517989-3-jia.yao@intel.com>
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

On 31/07/2026 00:27, Jia Yao wrote:
> On pre-Xe3p dGFX, GuC/GAM accesses the UM queue ring buffer via
> base_dpa, which is interpreted as a raw device-physical address.
> Unlike the GGTT PTE, there is no flag to indicate whether base_dpa
> points to VRAM or system memory; the hardware assumes it is always
> a VRAM address.
> 
> A separate SYSTEM BO for the UM queues would cause xe_bo_main_addr()
> to return an IOMMU IOVA instead of a true VRAM device-physical address.
> GuC then accesses the wrong memory and forwards all-zero fault
> descriptors to the driver (Faulted Address = 0, ASID = 0).
> 
> Use XE_BO_FLAG_VRAM_IF_DGFX() so that on dGFX the UM queue BO is
> placed directly in VRAM and xe_bo_main_addr() returns the correct
> device-physical address.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: <stable@vger.kernel.org> # v6.12+

> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c     |  6 ------
>   drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++-----
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4f132bf8539d..4286bd05c686 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -732,12 +732,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> -	if (guc->ads.um_queue_bo) {
> -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
> -		if (ret)
> -			return ret;
> -	}
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 3b6e1c45a0e9..57a0614dbf6d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -461,11 +461,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
>   						    GUC_UM_HW_QUEUE_MAX);

If you want we could also make the roundup conditional on igpu, to save 
a small amount of VRAM.

Either way,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
> -		bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
> -						  XE_BO_FLAG_SYSTEM |
> -						  XE_BO_FLAG_GGTT |
> -						  XE_BO_FLAG_GGTT_INVALIDATE |
> -						  XE_BO_FLAG_PINNED_NORESTORE);
> +		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +			       XE_BO_FLAG_GGTT |
> +			       XE_BO_FLAG_GGTT_INVALIDATE |
> +			       XE_BO_FLAG_PINNED_NORESTORE;
> +
> +		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
>   		if (IS_ERR(bo))
>   			return PTR_ERR(bo);
>   

