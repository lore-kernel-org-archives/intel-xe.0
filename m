Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE303C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8610EB44;
	Fri, 16 May 2025 17:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv3cJEfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE410EB44
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415724; x=1778951724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O1McbOuiBItMr/yERHD2y3PiysdvkVJhG7LpC2W0DfM=;
 b=Kv3cJEfY3M9kv0IEDMqtAWBXIz4kJKp+UVx2mIdL22W2CBi/ixWeAZJ1
 6KtSmv5875jAHxmVMtc9HE/awOUM2CtcjQFe1zIDqQR3MfYZNmKVuPxkE
 1W+vdjjUiCL+abdSkJ0PhpSqpAE/ekdorfDuB54kvrmW8rhApN1zwhFXI
 RJ5kIdQwpJPbZVv1VlFoiho9zz+dWLowVPb77k/Y7CG5jg2cTONhPPc79
 PHl3KzQB+iWYw/nuFe7LylzY2t8iNPgexzOWcMNwrtMdZtiGnj7KQ0OpV
 z6tQQ8ar3nGCAXOK3cz48BqiizSYkoTD2o4K13Lgy18UH/lF0BUWA+78X Q==;
X-CSE-ConnectionGUID: g33nDgtyT9SewNFIiqWkwA==
X-CSE-MsgGUID: Ng15Wfi2RT6yNUh9N019pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53066413"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="53066413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:15:24 -0700
X-CSE-ConnectionGUID: AT0HRwC0QHSzmAF+GAkF0g==
X-CSE-MsgGUID: B7/vp4iLQ0KJ2rMQcx/BVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="139633449"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 16 May 2025 10:15:22 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 13BD23492C;
 Fri, 16 May 2025 18:15:17 +0100 (IST)
Message-ID: <63ecf78f-2c43-4f95-af4b-bc63a2fdddb9@intel.com>
Date: Fri, 16 May 2025 19:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
 <20250515221827.1493032-7-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250515221827.1493032-7-tomasz.lis@intel.com>
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



On 16.05.2025 00:18, Tomasz Lis wrote:
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
> 
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
> 
> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>   set_memory_based_intr()
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
>  drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
>  4 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d03600519b27..9814e29a09e1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1046,6 +1046,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)

btw
in this file all struct xe_exec_queue params are named as "q" not "eq"
please use the same naming

>  {
>  	int i;
>  
> -	for (i = 0; i < eq->width; ++i)
> +	for (i = 0; i < eq->width; ++i) {
> +		xe_lrc_update_memirq_regs_with_address(eq->hwe, eq->lrc[i]);
>  		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 525565480aef..dc748f6df8ff 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  	return data;
>  }
>  
> +/**
> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
> + *   of given engine.
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 *regs;
> +
> +	if (!gt->default_lrc[hwe->class])
> +		return;
> +
> +	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
> +	set_memory_based_intr(regs, hwe);
> +}
> +
> +/**
> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
> + *   for given LRC.
> + * @hwe: the &xe_hw_engine struct instance
> + * @lrc: the &xe_lrc struct instance
> + */
> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)

as we have lrc here, shouldn't be a first param like most of other
functions in xe_lrc.c ?

> +{
> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
> +			     xe_memirq_enable_ptr(memirq));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> +			     xe_memirq_status_ptr(memirq, hwe));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
> +			     xe_memirq_source_ptr(memirq, hwe));
> +}
> +
>  static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  {
>  	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7a99cfd0abe..3f0ae3affafe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0e73b79b3a73..3ac042da4b87 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +}
> +
>  static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +	}
>  }
>  
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)

