Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CABC4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 10:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F3510E75D;
	Tue, 21 Jul 2026 10:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ycp2cEpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF810E75D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784628594; x=1816164594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3rF6AaNAT9HeL7DPZ4ZuPNABsF8EqWLUa20lfdnMjSo=;
 b=Ycp2cEpw4P3a157yWsrlwVTpUt8nUb/peUQmopwks1Hrrsgx1kozx9FL
 Er8VafBihr76IzyuN/v6kEN37ENFVl8l6PEzfO+/1U6/sE4FJXa6gV9Fr
 XlSNbJX/bsgJhvzSsKkoKNkiO52q8h++OCzAB/9mGpFiMpwegGZuNd1F+
 oKjjZFgshUWDhIE5yBfA0hYryt55mnqdYgzHijL3M7Qg711USlwG8OAOL
 QElmur5kHpMU5X1GZMNuloMR6xgjFfJ3SiY5sADOdSyjiekvdFuaXqbGK
 GBX4WDNVth5wgT4zz9jIpdmQ5GwkXGQKYi177V9YiIyNDssT0LbpnBy6/ w==;
X-CSE-ConnectionGUID: qP4TcTGjSdCvXaARo/ubXQ==
X-CSE-MsgGUID: XCHtE7qPRD27Qi1fBNFhUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72759253"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="72759253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:09:54 -0700
X-CSE-ConnectionGUID: zxswh+Q2SPm3ZfbkRcU1JA==
X-CSE-MsgGUID: flwqdWu0T+WddAHfkjOg+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="282219570"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.58])
 ([10.245.245.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:09:53 -0700
Message-ID: <ce3ba637-8484-44c0-b08a-1d809ba73a67@intel.com>
Date: Tue, 21 Jul 2026 11:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc_ads: allocate UM queues in a separate UC BO
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20260713004048.1245794-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260713004048.1245794-1-jia.yao@intel.com>
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

On 13/07/2026 01:40, Jia Yao wrote:
> On integrated graphics, the GPU updates the HWQ tail pointer
> (non-posted, strongly ordered) before the fault descriptor data reaches
> DRAM (posted WB through L3, weakly ordered).  GuC reads the ring after
> seeing the tail update but before the L3 write is flushed, resulting in
> an all-zero descriptor being forwarded to the driver as a spurious page
> fault.  In the worst case this triggers a P2I timeout on an unrelated
> context.
> 
> On discrete graphics, xe_bo_main_addr() returns a CPU DMA IOVA for
> SYSTEM BOs.  On platforms with limited DRAM (e.g. BMG with 4 GB) the
> IOVA can alias a PCI MMIO reserved window, so GPU writes to the fault
> ring go nowhere and GuC reads all-zeros.
> 
> Additionally, xe_guc_ads_populate() zeroes the entire ADS blob on every
> GT reset, destroying any fault descriptor written between GDRST and GuC
> restart.
> 
> Fix all three by allocating the UM queues in a separate BO
> (ads->um_queue_bo):
> 
> - UC mapping (XE_BO_FLAG_NEEDS_UC) makes GPU writes bypass L3 and land
>    in DRAM before the tail-pointer update reaches GuC.  On dGFX, PCIe
>    writes are already strongly ordered, so UC is a harmless no-op.
> 
> - VRAM placement on dGFX (XE_BO_FLAG_VRAM_IF_DGFX) gives a well-defined
>    DPA, sidestepping the IOVA aliasing issue.
> 
> - A separate BO is never touched by xe_guc_ads_populate()'s memset.

Now that we have clarification from hw side, doing uc for the fault 
queue looks like the safest thing.

I think maybe just simplify the commit message with something like:

"HW unit related to fault queue is not always coherent, with that ensure 
we use uncached memory on the CPU side."

?

Also I guess we need Fixes: tag + maybe stable cc?

> 
> v2: also fix dGFX (VRAM placement + UC flag); remove now-dead
>      guc_ads_um_queues_size/offset helpers
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 65 ++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_guc_ads_types.h | 10 ++++-
>   2 files changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..e321fab2ee1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -155,16 +155,6 @@ static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(ads->capture_size);
>   }
>   
> -static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> -{
> -	struct xe_device *xe = ads_to_xe(ads);
> -
> -	if (!xe->info.has_usm)
> -		return 0;
> -
> -	return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
> -}
> -
>   static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
>   {
>   	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
> @@ -205,22 +195,12 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(offset);
>   }
>   
> -static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> -{
> -	u32 offset;
> -
> -	offset = guc_ads_capture_offset(ads) +
> -		 guc_ads_capture_size(ads);
> -
> -	return PAGE_ALIGN(offset);
> -}
> -
>   static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
>   {
>   	size_t offset;
>   
> -	offset = guc_ads_um_queues_offset(ads) +
> -		guc_ads_um_queues_size(ads);
> +	offset = guc_ads_capture_offset(ads) +
> +		 guc_ads_capture_size(ads);
>   
>   	return PAGE_ALIGN(offset);
>   }
> @@ -409,6 +389,30 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	ads->bo = bo;
>   
> +	/*
> +	 * UM queues are in a separate UC BO (not the main ADS blob) so that
> +	 * xe_guc_ads_populate() cannot zero fault descriptors written between
> +	 * GDRST and GuC restart.  UC ensures GPU descriptor writes bypass L3
> +	 * and reach DRAM before GuC reads the ring.  On dGFX, VRAM is used so
> +	 * the DPA is well-defined; SYSTEM BOs use a CPU DMA IOVA that may
> +	 * alias a PCI MMIO region on platforms with limited DRAM.
> +	 */

I think this comment and maybe also below can be simplied? "hw unit 
related to queue is not always coherent..."

Otherwise LGTM.

> +	if (xe->info.has_usm) {
> +		u32 um_flags = XE_BO_FLAG_GGTT |
> +			       XE_BO_FLAG_GGTT_INVALIDATE |
> +			       XE_BO_FLAG_PINNED_NORESTORE |
> +			       XE_BO_FLAG_NEEDS_UC |
> +			       XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +
> +		bo = xe_managed_bo_create_pin_map(xe, tile,
> +					  GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX,
> +					  um_flags);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		ads->um_queue_bo = bo;
> +	}
> +
>   	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
> @@ -820,9 +824,9 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>   
>   static void guc_um_init_params(struct xe_guc_ads *ads)
>   {
> -	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
>   	struct xe_guc *guc = ads_to_guc(ads);
>   	struct xe_device *xe = ads_to_xe(ads);
> +	struct xe_bo *um_bo = ads->um_queue_bo;
>   	u64 base_dpa;
>   	u32 base_ggtt;
>   	bool with_dpa;
> @@ -830,8 +834,14 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>   
>   	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
>   
> -	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
> -	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
> +	if (um_bo) {
> +		/* All USM platforms: UM queues in dedicated um_queue_bo */
> +		base_ggtt = xe_bo_ggtt_addr(um_bo);
> +		base_dpa = xe_bo_main_addr(um_bo, PAGE_SIZE);
> +	} else {
> +		/* Platform does not support USM: no UM queues, nothing to do */
> +		return;
> +	}
>   
>   	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>   		/*
> @@ -912,6 +922,11 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>   	xe_gt_assert(gt, ads->bo);
>   
>   	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, xe_bo_size(ads->bo));
> +	/*
> +	 * um_queue_bo is not zeroed here. GuC resets the queue head/tail to
> +	 * zero via MMIO on every restart, so the ring contents are never read
> +	 * until GPU hardware produces a new entry. No CPU zeroing needed.
> +	 */
>   	guc_policies_init(ads);
>   	fill_engine_enable_masks(gt, &info_map);
>   	guc_mmio_reg_state_init(ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 48a8e092023f..cced8a7b4885 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -14,8 +14,16 @@ struct xe_bo;
>    * struct xe_guc_ads - GuC additional data structures (ADS)
>    */
>   struct xe_guc_ads {
> -	/** @bo: Xe BO for GuC ads blob */
> +	/** @bo: Xe BO for GuC ads blob (WB cached) */
>   	struct xe_bo *bo;
> +	/**
> +	 * @um_queue_bo: Dedicated UC BO for the HW fault ring (UM queues).
> +	 * Separate from the main ADS blob to avoid being zeroed by
> +	 * xe_guc_ads_populate() during GT reset. UC-mapped so GPU writes
> +	 * bypass L3 and are visible in DRAM before GuC reads the ring.
> +	 * VRAM on dGFX for a well-defined DPA; NULL if no USM support.
> +	 */
> +	struct xe_bo *um_queue_bo;
>   	/** @golden_lrc_size: golden LRC size */
>   	size_t golden_lrc_size;
>   	/** @regset_size: size of register set passed to GuC for save/restore */

