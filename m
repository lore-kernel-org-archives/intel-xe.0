Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3A8C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 07:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D36E10E58C;
	Thu, 18 Jul 2024 07:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9Au63XW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3810E58C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721287385; x=1752823385;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7Q4KksPF6nRxqnExniY+X/6OsRtIDUHCOTD4HVj9Sa4=;
 b=X9Au63XWcMKigTtrZViS1JvhgcpiByv0cT0XrPwYt2a+RqWR4Q6fjoDM
 sN2ZO1kaYHu/c4eH5/52PHg3W9qLSxkM786A1nok03IBPtoUb2Ic5ld0g
 D6vp5qVc50TO6aEa+zOs+eEvSoxrh9tWEB41m/bfpOK/O22ml5aaPJW4i
 uxmA91lQiHrHFJeFh2aiIcXr116I2UDoqYk1QWgN2t7C646cqPa6HceOJ
 mU++svEZnQBjR4auRvhYVUuhjjsoMDfmNBwbk/ABru6FWvKhAZnuVK6+W
 5mayLA0Dw/r0hB77NxHepVEe+zP46l8BVQw7GUCz9aZ0n8mITaWitwSDE g==;
X-CSE-ConnectionGUID: unrtjXf/TFGiEXoOCo5Clg==
X-CSE-MsgGUID: UrnqJxBCRR66DaOQSpAtew==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29502520"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="29502520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 00:23:05 -0700
X-CSE-ConnectionGUID: ZNMCOem8Scy21O7fX8m3Bw==
X-CSE-MsgGUID: PJVo7bVxToSCzP/AwY4XYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50721849"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 00:23:04 -0700
Message-ID: <b9d16806-e537-48ac-9cbf-5f1f8bed2104@linux.intel.com>
Date: Thu, 18 Jul 2024 09:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] drm/xe/xe_migrate: Handle migration logic for xe2+
 dgfx
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
 <79b3a016e686a662ae68c32b5fc7f0f2ac8043e9.1721250309.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <79b3a016e686a662ae68c32b5fc7f0f2ac8043e9.1721250309.git.akshata.jahagirdar@intel.com>
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


On 7/17/2024 11:10 PM, Akshata Jahagirdar wrote:
> During eviction (vram->sysmem), we use compressed -> uncompressed mapping.
> During restore (sysmem->vram), we need to use mapping from
> uncompressed -> uncompressed.
> Handle logic for selecting the compressed identity map for eviction,
> and selecting uncompressed map for restore operations.
> v2: Move check of xe_migrate_ccs_emit() before calling
> xe_migrate_ccs_copy(). (Nirmoy)
>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c1c751952ce8..c007f68503d4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -705,7 +705,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	u32 flush_flags = 0;
>   
> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
> +	if (!copy_ccs && dst_is_indirect) {
>   		/*
>   		 * If the src is already in vram, then it should already
>   		 * have been cleared by us, or has been populated by the
> @@ -781,6 +781,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>   		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>   	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> +	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
>   
>   	/* Copying CCS between two different BOs is not supported yet. */
>   	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> @@ -807,7 +808,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
>   		struct xe_sched_job *job;
>   		struct xe_bb *bb;
> -		u32 flush_flags;
> +		u32 flush_flags = 0;
>   		u32 update_idx;
>   		u64 ccs_ofs, ccs_size;
>   		u32 ccs_pt;
> @@ -825,6 +826,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		src_L0 = min(src_L0, dst_L0);
>   
>   		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
>   		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>   					      avail_pts);
> @@ -845,7 +847,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		/* Add copy commands size here */
>   		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> -			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
> +			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
>   
>   		bb = xe_bb_new(gt, batch_size, usm);
>   		if (IS_ERR(bb)) {
> @@ -874,11 +876,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		if (!copy_only_ccs)
>   			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
>   
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> -						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> -						  dst_L0_ofs,
> -						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
> -						  src_L0, ccs_ofs, copy_ccs);
> +		if (xe_migrate_needs_ccs_emit(xe))
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> +							  dst_L0_ofs,
> +							  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
> +							  src_L0, ccs_ofs, copy_ccs);
>   
>   		job = xe_bb_create_migration_job(m->q, bb,
>   						 xe_migrate_batch_base(m, usm),
