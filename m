Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C927FD58B0A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Mar 2026 09:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7129910E228;
	Sun, 15 Mar 2026 09:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5mHX1Pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726C610E228
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Mar 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773568743; x=1805104743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0NW0FMsfzO2KwtxAzh1C1lbvNTuW0waSO22/ybymbjI=;
 b=b5mHX1PjFvUupoAQtKUHClJ28E7CLXRJz+De67vlmo5HfymS2CKhYTtJ
 vFvF/9oe1ArT7sWWzQfdxzBpsA6YDt0pXMNwGSm4k2ZFFna650gdHehiM
 2J4LMX77NdTt6Us9O20+XvWbwdwbVMToZWf1D9gQqMpUfCvTNTDoJbLjZ
 3q0fAHESSYltfENEorY0uQbEthX35hVCqqF33x3KJT0UfZ3QvuPPvzlga
 peqcn+p9h6E4BAiT0zT3P7XyV7DJHG+M9KoR0q0DO8bzeydnItCGvDGE8
 pCCU5I9ERcJ9hKTpVbL8cNf9aiBjKVjYqBOiFGuxqzLfWOeqh7dCRaQ8+ A==;
X-CSE-ConnectionGUID: 1mx+n+xrSSaiQdFjJV7c3w==
X-CSE-MsgGUID: 9rZcgi74RC2Udsvg5PMf0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="62177858"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="62177858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 02:59:01 -0700
X-CSE-ConnectionGUID: /JkAPgY+TSGq7HwxRZMO+A==
X-CSE-MsgGUID: s34ZdRGPTlepDp8igvvqMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="226083445"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 02:59:00 -0700
Date: Sun, 15 Mar 2026 10:58:57 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 03/10] drm/xe/guc_submit: Support cancelling submission
Message-ID: <abaC4Y80fFU18eCx@black.igk.intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
 <20260308135536.3852304-4-raag.jadav@intel.com>
 <91958e39-1ad7-42e6-b4d0-86e2fe38ca30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91958e39-1ad7-42e6-b4d0-86e2fe38ca30@intel.com>
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

On Fri, Mar 13, 2026 at 11:37:03AM -0400, Dong, Zhanjun wrote:
> On 2026-03-08 9:55 a.m., Raag Jadav wrote:
> > In preparation of usecases which require cancelling submission before
> > PCIe FLR, introduce xe_guc_submit_cancel() helper. This cancels and
> > frees any in-flight jobs on the scheduler.
> 
> Could you put more info on why add new cancel functions rather than call
> existing xe_sched_submission_stop?
> From commit message, it looks very similar to stop, which also do stop +
> free action.

IIUC submission_stop() doesn't free any jobs, it just stops the scheduler
and cancels wq used to run jobs. But this leaves the jobs on scheduler's
pending list behind if they're not on the wq yet, which results in timeout.
So perhaps I used the terminology wrong, will update this.

Also, I know it's a bit hacky to directly bork the scheduler's pending list
so this can definitely use some standardization. Open to suggestions.

Raag

> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v3: Cancel in-flight jobs before FLR
> > ---
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 11 +++++++++++
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
> >   4 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 9c8004d5dd91..c012dbe84540 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -90,6 +90,17 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
> >   	drm_sched_fini(&sched->base);
> >   }
> > +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched)
> > +{
> > +	struct drm_gpu_scheduler *base = &sched->base;
> > +	struct drm_sched_job *job, *tmp;
> > +
> > +	list_for_each_entry_safe_reverse(job, tmp, &base->pending_list, list) {
> > +		list_del(&job->list);
> > +		base->ops->free_job(job);
> > +	}
> > +}
> > +
> >   void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
> >   {
> >   	drm_sched_wqueue_start(&sched->base);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 664c2db56af3..ba7892db8428 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -19,6 +19,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> >   		  struct device *dev);
> >   void xe_sched_fini(struct xe_gpu_scheduler *sched);
> > +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched);
> >   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> >   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index de716c1fb18e..cba544cc185c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2399,6 +2399,30 @@ void xe_guc_submit_stop(struct xe_guc *guc)
> >   }
> > +/**
> > + * xe_guc_submit_cancel - Cancel all runs of submission tasks on given GuC.
> > + * @guc: the &xe_guc struct instance whose scheduler is to be cancelled
> > + */
> > +void xe_guc_submit_cancel(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +		/* Prevent redundant attempts to cancel parallel queues */
> > +		if (q->guc->id != index)
> > +			continue;
> > +
> > +		xe_sched_submission_cancel(sched);
> > +	}
> > +
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> >   static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> >   						       struct xe_exec_queue *q)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index b3839a90c142..f361a6d32fd3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -16,6 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> >   int xe_guc_submit_enable(struct xe_guc *guc);
> >   void xe_guc_submit_disable(struct xe_guc *guc);
> > +void xe_guc_submit_cancel(struct xe_guc *guc);
> >   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> >   void xe_guc_submit_reset_wait(struct xe_guc *guc);
> >   void xe_guc_submit_stop(struct xe_guc *guc);
> 
