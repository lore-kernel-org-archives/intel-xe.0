Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECA2CD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 17:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19610E1D2;
	Thu, 21 May 2026 17:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SViPrI0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B59B10E1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779383237; x=1810919237;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ugbeN2jtHUSTcQ497xSY4KAxjDkxiNhaARCuk08QBEs=;
 b=SViPrI0D8GqzTlN7aXTrcczhNLBA128vwBifChLRrdAp2wMdmxD3LqLm
 5KnWUge5tIs6cijH75NugY8FFbr5gGB2YEIjkPL76YeVSrhytFc2uFXVR
 W2kn/51nNTuShhBl24mJATYJqFePJrc9hPFLEpgeFRlSPUcuuDHOD15Hv
 mJ4BPLP9x+Opax8wayydQivri+6jcETYbQudwq2J5siTojxnPormOA/xq
 VqEjqYDj4YXIMbrRoFwyya0AXDfi3Bb5C2CtxVlz4/JLmwBZPBmUIBMik
 dVaieRt6gDqZSU2qRxxf12NdoFPU29Kp9u5M3vJnpBtckOQfLQXmlQc59 A==;
X-CSE-ConnectionGUID: nF/1eZysRam57rdavUBShw==
X-CSE-MsgGUID: iEOcwoHXTS+JqtLztMYE6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80363603"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="80363603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:07:16 -0700
X-CSE-ConnectionGUID: xAqh50h4QeWOIBV8DqqUew==
X-CSE-MsgGUID: 1Xz14Tt4SG6KA8vHCv3sIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="239561269"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.79])
 ([10.245.244.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:07:14 -0700
Message-ID: <2ffc43e3-560e-406a-9bb6-5dde24b1f897@intel.com>
Date: Thu, 21 May 2026 18:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use PDE mask for 2M page reclaim entries
To: Brian Nguyen <brian3.nguyen@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Zongyao Bai <zongyao.bai@intel.com>
References: <20260520234946.1055572-2-brian3.nguyen@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260520234946.1055572-2-brian3.nguyen@intel.com>
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

On 21/05/2026 00:49, Brian Nguyen wrote:
> 2M pages use PDE encoding where the physical address occupies bits [51:21],
> but generate_reclaim_entry() uses XE_PTE_ADDR_MASK (bits [51:12]) for all
> leaf entries. Add XE_PDE_ADDR_MASK and select the correct mask based on
> whether the entry is a 2M PDE.

Are you not also missing the PDE 64K handling? AFACT there is only PS64? 
Does it not incorrectly treat it as 4K? With PDE 64K the pt is_compact, 
IIRC so you have like 32 entries for the entire thing, which each entry 
being 64K. So I think here you are only reclaming 4K from each entry? I 
might have missed something though.

> 
> Fixes: 83b914f972bb ("drm/xe: Fix page reclaim entry handling for large pages")
> Cc: stable@vger.kernel.org
> Suggested-by: Zongyao Bai <zongyao.bai@intel.com>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 1 +
>   drivers/gpu/drm/xe/xe_pt.c            | 8 ++++++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4d83461e538b..22a6c197ed96 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -10,6 +10,7 @@
>   #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>   
>   #define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> +#define XE_PDE_ADDR_MASK	GENMASK_ULL(51, 21)
>   #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
>   
>   #define GUC_GGTT_TOP		0xFEE00000
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2669ff5ee747..ae5ed0370d72 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1615,7 +1615,11 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>   {
>   	struct xe_gt *gt = tile->primary_gt;
>   	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> -	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> +	bool is_2m = xe_child->level == 1 && (pte & XE_PDE_PS_2M);
> +	/* 2M pages are encoded as PDEs, other reclaimable pages use PTE encoding */
> +	u64 addr_mask = is_2m ? XE_PDE_ADDR_MASK : XE_PTE_ADDR_MASK;
> +	u64 phys_addr = pte & addr_mask;
> +	/* Page address is relative to 4K page regardless of entry level */
>   	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
>   	int num_entries = prl->num_entries;
>   	u32 reclamation_size;
> @@ -1641,7 +1645,7 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>   		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
>   		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
>   		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
> -	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
> +	} else if (is_2m) {
>   		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
>   		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
>   		xe_tile_assert(tile, phys_addr % SZ_2M == 0);

