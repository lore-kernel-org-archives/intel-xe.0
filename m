Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA20CC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 11:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337910E09B;
	Mon,  9 Jun 2025 11:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1Wx3ikE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8F610E02E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749467030; x=1781003030;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rCWrm2nA4pGM19r3/q8vWG30HLPv1VDdtkYr1KtpKXU=;
 b=J1Wx3ikEyMf/xhRHpLJAHF6ytdQ7XzP4aekhGDRRiZRiLbqEm9izzvT1
 /7D+HhSw647UZgT5r3Zi8cbuWEGAR/uWxf8rbtX0AyMPSirdnJlpX51LF
 zNkDpB6YM/LZ0eyTEaZgdFsFGpheeGOSkjI/q7K+7JSiQvZlf/AIlDjWc
 iH8VLpMGD1xx3VL125o7fUyX7/aN/TZvyQiUzqWEN8N/O/Di56d9QHaHa
 2DZaR/XVidS+JWYQ/Kdtcsd7l0QxN48DjD2ryH2prSN9PMVSdHQ8X5oBE
 xLIREsqePa2zjuqwjhxh2z3BBJpOrI55126/mzqqCn5+anewgOlW7KiM9 g==;
X-CSE-ConnectionGUID: FZxQWtVpT/KUbrNqceoFFw==
X-CSE-MsgGUID: WXr3NZXyQD68c3AZkMIBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55203773"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55203773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 04:03:49 -0700
X-CSE-ConnectionGUID: ZByO0EeWRNKQZhzMiAhAbA==
X-CSE-MsgGUID: sZGc1lYYRc++pb4qW1dYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147005329"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 04:03:46 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1BB0A32CB7;
 Mon,  9 Jun 2025 12:03:45 +0100 (IST)
Message-ID: <46b4bb51-c088-44d9-97de-9cc9b8385a62@intel.com>
Date: Mon, 9 Jun 2025 13:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/vf: Rebase HWSP of all contexts after
 migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
 <20250606001823.1010994-6-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250606001823.1010994-6-tomasz.lis@intel.com>
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
> All contexts require an update due to GGTT range shift, as that
> affects their HWSP.
> 
> The HW status page of a context contains GGTT references, which
> need to be shifted to a new range (or re-computed using the
> previously updated vma nodes). The references include ring start
> address and indirect state address.
> 
> v2: move some functions to better matched files
> v3: Add missing kerneldocs
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>  7 files changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..c44a523ba906 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1028,3 +1028,16 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	return err;
>  }
> +
> +/**
> + * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> + * within all LRCs of a queue.
> + * @q: the &xe_exec_queue struct instance containing target LRCs
> + */
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	for (i = 0; i < q->width; ++i)
> +		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 17bc50a7f05a..1d399a33c5c0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
>  				      struct xe_vm *vm);
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0d6d9e07fc48..89b4c09e733a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2449,3 +2449,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  		guc_exec_queue_print(q, p);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> +
> +/**
> + * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
> + * exec queues registered to given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_exec_queue_contexts_hwsp_rebase(q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 45b978b047c9..5b43e6639f52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -45,4 +45,6 @@ void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 63d74e27f54c..72690f71289c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1181,6 +1181,22 @@ void xe_lrc_destroy(struct kref *ref)
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

please run checkpatch.pl as promised!

19c7fdd34f6b drm/xe/vf: Rebase HWSP of all contexts after migration
-:109: CHECK:BRACES: Unbalanced braces around else statement
#109: FILE: drivers/gpu/drm/xe/xe_lrc.c:1196:
+	} else


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
> index 29f3082c8fa5..d54048bc4576 100644
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
> @@ -240,6 +242,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
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
> @@ -325,9 +336,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	}
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

