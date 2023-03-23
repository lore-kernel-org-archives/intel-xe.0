Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84519C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0FE10E473;
	Thu, 23 Mar 2023 16:35:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6310E473
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679589349; x=1711125349;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ewOn1iguXzI00MQIMXlVIAIegx1jFI8ULkh6FmR1k+w=;
 b=DNZaMAIOr3NmtNDKZ8o5G5XHxzFi8e6HQiEegiwDPjZF5JD1wfpS9hFz
 kWHnry5LIynm0tOKF5rB8Oe3MJQv0gnHkkka7+tZtDAREmmUZFXrhjOm0
 AZaqeTW9UO5pqtFSkzTt9i937UCDHwU4T1AtOZSuCOT0++kGlpFls1tVn
 r2ikKaAt8QWxcXqvHHs0wUF7bFmus8wAsm0nAR02yoEm5W1Zp8h8YJYp2
 saBXYGZ3guCVmTknrqtdJdYHVzscqCcS/Emvb7iEkUoKHHwVXZGY8nve8
 l+dsQZQWhughSvh+J5zaOAZtZ44Z5zpA5Ztt4szEShkD5D9tv5Rm1kg/L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367285696"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="367285696"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684819416"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="684819416"
Received: from auliel-mobl1.ger.corp.intel.com (HELO [10.249.254.186])
 ([10.249.254.186])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:35:47 -0700
Message-ID: <4bb3ddc7-74c8-cf41-1197-653f13902d01@linux.intel.com>
Date: Thu, 23 Mar 2023 17:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230323162725.1100545-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230323162725.1100545-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use BO's GT to determine
 dma_offset when programming PTEs
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


On 3/23/23 17:27, Matthew Brost wrote:
> Rather than using the passed in GT, use the BO's GT determine dma_offset
> when programming PTEs as these two GT's could differ (i.e. mapping a BO
> from a remote GT). The BO's GT is correct GT to use as this where BO
> resides, while the passed in GT is where the mapping is created.
>
> v2:
>    (Thomas)      - Kernel doc, extra new line
>    (CI)          - Rebase to tip
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_bo.h |  2 ++
>   drivers/gpu/drm/xe/xe_pt.c |  4 +++-
>   3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ab9cd9286f77..3ccc59a372aa 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -79,6 +79,19 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
>   	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
>   }
>   
> +/**
> + * xe_bo_to_gt - Get a GT from a BO's memory location

Nit: Should have brackets: xe_bo_to_gt()

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> + * @bo: The buffer object
> + *
> + * Get a GT from a BO's memory location, should be called on BOs in VRAM only.
> + *
> + * Return: xe_gt object which is closest to the BO
> + */
> +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
> +{
> +	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
> +}
> +
>   static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>   			   u32 bo_flags, u32 *c)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f841e74cd417..486703815949 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -105,6 +105,8 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
>   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   			      u32 bo_flags);
>   
> +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
> +
>   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
>   {
>   	return container_of(bo, struct xe_bo, ttm);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index dfd97b0ec42a..6b2943efcdbc 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -759,10 +759,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>   	int ret;
>   
>   	if (is_vram) {
> +		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
> +
>   		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
>   		if (vma && vma->use_atomic_access_pte_bit)
>   			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
> -		xe_walk.dma_offset = gt->mem.vram.io_start -
> +		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
>   			gt_to_xe(gt)->mem.vram.io_start;
>   		xe_walk.cache = XE_CACHE_WB;
>   	} else {
