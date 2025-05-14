Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A323EC3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9CF10E067;
	Wed, 14 May 2025 18:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRSbJYH2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8527A10E067
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747248578; x=1778784578;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C70tCZzdhJon5gcqjXdu/GUwcYBpb6oylLtf1iq2VnY=;
 b=LRSbJYH2HKQmHn4+mjHVPpoacpgZg0kw8Z7eUuShy+uE6rbApsiYCaF4
 iwtVQnydWZQnQf34N8mv4exSdWG/qvhd6NyoDEqWaIrselGhl7qfWXbgf
 zYb/NZt+pZ9ZkQvoA6+gA9lFK6U4Y4gX8Fsr6lGXlr9RSx4F1n7yIOo0r
 BOGdTs/E5hAe1s1mqDO6+4kmAVL4lt9VDoOzFKs6xUPBJpOJYou3+YLk0
 N2LqpbIPvWFjkFlK5JlHWh9gjXbydJxrNFTwJYx/vehDXApa9e20OeYNd
 g3m9128/4WnDXi92zR9ceGUQ4WVHCxeCh9THwNAGRPf2mUYgKeBHnqn2K Q==;
X-CSE-ConnectionGUID: D0kKnQfnTFGSBtPUkUH2Ew==
X-CSE-MsgGUID: RVmV4y8pTl6MG1oMU1wdWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36784674"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="36784674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:49:38 -0700
X-CSE-ConnectionGUID: p6W5Q2GrTcGN0u4x9I3Giw==
X-CSE-MsgGUID: 7I/SR14+Sk+qwvJcU88ToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169205446"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 11:49:36 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E564E34948;
 Wed, 14 May 2025 19:49:34 +0100 (IST)
Message-ID: <0c554f88-cf3e-49cf-9fdc-376c906c2a90@intel.com>
Date: Wed, 14 May 2025 20:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/xe/vf: Post migration, repopulate ring area
 for pending request
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-8-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250513224952.701343-8-tomasz.lis@intel.com>
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



On 14.05.2025 00:49, Tomasz Lis wrote:
> The commands within ring area allocated for a request may contain
> references to GGTT. These references require update after VF
> migration, in order to continue any preempted LRCs, or jobs which
> were emitted to the ring but not sent to GuC yet.
> 
> This change calls the emit function again for all such jobs,
> as part of post-migration recovery.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 23 +++++++++++++++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c485272829a6..238b6691d575 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -766,6 +766,26 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	return fence;
>  }
>  
> +/**
> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
> + * @eq: the &xe_exec_queue struct instance
> + */
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq)

are you sure this function shouldn't be placed in xe_exec_queue.c ?

> +{
> +	struct xe_gpu_scheduler *sched = &eq->guc->sched;
> +	struct xe_sched_job *job;
> +
> +	if (exec_queue_killed_or_banned_or_wedged(eq))

this condition likely can be checked by the caller (in xe_guc_submit.c)

> +		return;
> +
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		if (xe_sched_job_is_error(job))
> +			continue;
> +
> +		eq->ring_ops->emit_job(job);
> +	}
> +}
> +
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2c2d2936440d..55398e292b79 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq);
> +
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index c08c44dbd383..2ff1383f0b1a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -8,6 +8,7 @@
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -16,6 +17,7 @@
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_pm.h"
> +#include "xe_sched_job_types.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
> @@ -266,6 +268,26 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  	}
>  }
>  
> +static void xe_guc_jobs_ring_rebase(struct xe_guc *guc)

and this one in xe_guc_submit.c ?

> +{
> +	struct xe_exec_queue *eq;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
> +		xe_exec_queue_jobs_ring_restore(eq);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
> +static void vf_post_migration_fixup_jobs(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
> +}
> +
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -348,6 +370,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	if (need_fixups) {
>  		vf_post_migration_fixup_contexts(xe);
> +		vf_post_migration_fixup_jobs(xe);

in patch 5/7 you've dropped FIXME so I'm surprised by this step ;)

>  		vf_post_migration_fixup_ctb(xe);
>  	}
>  

