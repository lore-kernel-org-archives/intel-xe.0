Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4580C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 09:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4910E45F;
	Thu, 23 Mar 2023 09:21:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AED410E45F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679563277; x=1711099277;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+V3wMuff7d+dIaNDJd6BY+p0smQOPlVXbtNn9t4qp6E=;
 b=WdtoWCIgy7SIwdo+d7DzT61TMawOaN+rW/G0jiDRtoSyWJyd+3xSz0i+
 Bdyy3DHRXYkamsM4vSlXg+y61bV4/V+t7CyUml+814DnTm5K9J+XZlm2W
 V5u1iPNn6CnSYTV8GJaZjV4+vWQ8p7fMWVBB3nJoEgbR//zu5xkToAWib
 QXjm/geyfRGzliE3pGywf45IJNNcbB3NMiV/i3gB2Hb/JVn1hThmfwRvc
 Dd4y2PLXtyzLQevt/n7Cy8Xxb2jL1t44WO84CuLpqj+KlXK9822arCYhY
 2+vmv05yKTR5uH8b30jnTREHxE7A653burVqckguWYzJo8KYY3GVpckJE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319827225"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="319827225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 02:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="806181603"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="806181603"
Received: from auliel-mobl1.ger.corp.intel.com (HELO [10.249.254.186])
 ([10.249.254.186])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 02:21:15 -0700
Message-ID: <7263840f-3315-af68-c5bb-db8074bfb41b@linux.intel.com>
Date: Thu, 23 Mar 2023 10:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20230323081546.1014414-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230323081546.1014414-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use BO's GT to determine dma_offset
 when programming PTEs
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

Hi.

Good catch. Some comments below.

On 3/23/23 09:15, Matthew Brost wrote:
> Rather than using the passed in GT, use the BO's GT determine dma_offset
> when programming PTEs as these two GT's could differ (i.e. mapping a BO
> from a remote GT). The BO's GT is correct GT to use as this where BO
> resides, while the passed in GT is where the mapping is created.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   drivers/gpu/drm/xe/xe_pt.c | 4 +++-
>   3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 764b3ca9fff7..8beb35aa6f15 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -79,6 +79,11 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
>   	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
>   }
>   
> +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)

Kerneldoc.

> +{
XE_WARN_ON_ONCE(!vram) ?
> +	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
> +}
> +
>   static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>   			   u32 bo_flags, u32 *c)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f4303810f213..f9abd8036417 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -105,6 +105,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
>   
>   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   			      u32 bo_flags);
Newline.
> +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
>   
>   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a2e586ebd9a8..6dc31b030687 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -792,10 +792,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>   	int ret;
>   
>   	if (is_vram) {
> +		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
> +
>   		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
>   		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>   			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
> -		xe_walk.dma_offset = gt->mem.vram.io_start -
> +		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
>   			gt_to_xe(gt)->mem.vram.io_start;
>   		xe_walk.cache = XE_CACHE_WB;
>   	} else {

Thanks,

Thomas


