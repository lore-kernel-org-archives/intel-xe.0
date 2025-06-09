Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C003C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 11:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D7710E0BB;
	Mon,  9 Jun 2025 11:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egjqRrTN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB47610E0BB
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749467747; x=1781003747;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=01M60qDx0/9WZ7fqepvzs34Gn33qQOtmOLmBFJ938U4=;
 b=egjqRrTNnRyvS/4qHcRSCqh2BjOpbHGzmY1HdKL6vHOWZt8vMW0TJ0/t
 Y/HKWQYBSq5UWShbiVnTaT7ctjMEvKQLjkAbeedX6EI3d8sJwYcVe7Q1v
 D2Y3pAwLqgpp62Fj4SKz+cf23KMw1USdecZt7fqu8hTDmJ+8M+edKv7/I
 t5KPwmYfJ+koN7NcFT25fNNAr3M+h+C4IfRoQ+0bKPJ/NXWjFKfjV2KIo
 G/jm6Ga4wx+yKJepUVZVQjxVw/uTLmgE7sIFUxxtpdnzCghW8Lgp7jaQM
 JCmXq5VpDkiu92lGtPqYQMSYxZ8F9zoGpwNOP7StWz7aQU6IjSn1GZJ7L A==;
X-CSE-ConnectionGUID: AJwGNpzjS9GtgwZDznKFzw==
X-CSE-MsgGUID: ro6btwb5T+mTL0FEwjaoPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62895630"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="62895630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 04:15:46 -0700
X-CSE-ConnectionGUID: 1DPEj6cFShSEZ8B/Apu7tw==
X-CSE-MsgGUID: LP0326qgQ2qzrLX42BTVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146401426"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2025 04:15:44 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 70F8333BE8;
 Mon,  9 Jun 2025 12:15:42 +0100 (IST)
Message-ID: <a61cdf2b-9314-4a67-b66a-80e3a39b77be@intel.com>
Date: Mon, 9 Jun 2025 13:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
 <20250606001823.1010994-7-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250606001823.1010994-7-tomasz.lis@intel.com>
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



On 06.06.2025 02:18, Tomasz Lis wrote:
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
> 
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
> 
> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>   set_memory_based_intr()
> v3: Renamed parameter, reordered parameters in some functs
> v4: Check if have MEMIRQ, move `xe_gt*` funct to proper file
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c  |  4 ++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 14 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c         | 38 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h         |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    |  4 ++-
>  6 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index c44a523ba906..86b2f9034902 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1038,6 +1038,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>  {
>  	int i;
>  
> -	for (i = 0; i < q->width; ++i)
> +	for (i = 0; i < q->width; ++i) {
> +		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8fa210c0ef1a..0a5f78cf0490 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
> +#include "xe_lrc.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> @@ -709,6 +710,19 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
> + * @gt: the &xe_gt struct instance
> + */
> +void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +}

this function is not very specific to the data maintained by the VF

likely a better fit would be in xe_lrc.c or xe_hw_engine.c as

	xe_hw_engines_update_default_lrc(gt)
or
	xe_lrc_update_defaults(gt)


> +
>  /**
>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>   *   or just mark that a GuC is ready for it.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 6250fe774d89..5ab25a3c24ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> +void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 72690f71289c..c74856f3974a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -898,6 +898,44 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  	return data;
>  }
>  
> +/**
> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
> + * of given engine.
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
> + * for given LRC.
> + * @lrc: the &xe_lrc struct instance
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> +
> +	if (!xe_device_uses_memirq(gt_to_xe(hwe->gt)))
> +		return;
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
> index e7a99cfd0abe..801a6b943f6e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index d54048bc4576..cf07d037a83a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -247,8 +247,10 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +	}
>  }
>  
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)

