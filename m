Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE19AC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214610EB39;
	Fri, 16 May 2025 17:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMjk8zWe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7232E10EB39
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747414892; x=1778950892;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P9iH/9tVrJcY/OskZNL/sqt53ubqz5VkHcoHQzwKrOY=;
 b=bMjk8zWeyKGyOo2krlyYVw9okmQWQp4/L6EF3KGtSOfzApHpM2lzHwRr
 QmHK6CohC8/kLEjrNcYgcaRiP+XwVTIfHFIIuciGgPtmflsYNvn1KX2cO
 rcsIsArtfBVI/gvtHowUxJxjAI8X1GkHJac3Wu2COq+2wiDfGridXTrC6
 qWAnEJ8n9gKXeHBh85VEgcnA5aKcd04CFduoY5CikgxkimWlIUpLCjB0H
 x9iSIuZE5idfo5mg+i5Mq0FFHUZH9tewp51yz8Nn74ttx/8+NvVpi5GkZ
 8kfZThgZWgdEG+Rqkfvo8Odv9yxVDuSOHTzRx87/USs2KlOXF5qYEUsZQ Q==;
X-CSE-ConnectionGUID: U0HUseFfSEepmEesJTek6Q==
X-CSE-MsgGUID: avOPv5yyQ9qJft5rZ/JFpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60784606"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60784606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:01:32 -0700
X-CSE-ConnectionGUID: 7/Mwc8IRQhScdOtyddxf1w==
X-CSE-MsgGUID: ZCHqXf7eSg+kkHIsPh64UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143629987"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 10:01:29 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 120D834925;
 Fri, 16 May 2025 18:01:27 +0100 (IST)
Message-ID: <deca57da-a92f-4a9e-9de6-637505b392c0@intel.com>
Date: Fri, 16 May 2025 19:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
 <20250515221827.1493032-6-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250515221827.1493032-6-tomasz.lis@intel.com>
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
> All contexts require an update due to GGTT range shift, as that
> affects their HWSP.
> 
> The HW status page of a context contains GGTT references, which
> need to be shifted to a new range (or re-computed using the
> previously updated vma nodes). The references include ring start
> address and indirect state address.
> 
> v2: move some functions to better matched files
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>  7 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ce78cee5dec6..d03600519b27 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1041,3 +1041,11 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	return err;
>  }
> +

public functions require kernel-doc

> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
> +{
> +	int i;
> +
> +	for (i = 0; i < eq->width; ++i)
> +		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 17bc50a7f05a..aeeecd38ba00 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
>  				      struct xe_vm *vm);
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 69ccfb2e1cff..4e1d8a86ed7e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2424,3 +2424,14 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  		guc_exec_queue_print(q, p);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> +

public functions require kernel-doc

> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *eq;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
> +		xe_exec_queue_contexts_hwsp_rebase(eq);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2c2d2936440d..2cc44298465f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -44,4 +44,6 @@ void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..525565480aef 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1184,6 +1184,22 @@ void xe_lrc_destroy(struct kref *ref)
>  	kfree(lrc);
>  }
>  
> +/**
> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
> + * @lrc: the &xe_lrc struct instance
> + */
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> +
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
> +					      __xe_lrc_ring_ggtt_addr(lrc));
> +	} else
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> +}
> +
>  void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>  {
>  	if (xe_lrc_has_indirect_ring_state(lrc))
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index eb6e8de8c939..e7a99cfd0abe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>  u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index ad863be4783e..0e73b79b3a73 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,12 +7,14 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> +#include "xe_lrc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -223,6 +225,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +}
> +
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -303,9 +314,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		goto fail;
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
> -	/* FIXME: add the recovery steps */
> -	if (need_fixups)
> +	if (need_fixups) {
> +		vf_post_migration_fixup_contexts(xe);
> +		/* FIXME: add the recovery steps */
>  		vf_post_migration_fixup_ctb(xe);
> +	}
>  
>  	vf_post_migration_kickstart(xe);
>  	vf_post_migration_notify_resfix_done(xe);

