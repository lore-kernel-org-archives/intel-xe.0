Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B8D41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 12:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616910E437;
	Mon, 15 Dec 2025 12:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SE4wMQwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE210E437
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765800523; x=1797336523;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P/if9h9Ld1ldwPxR7lRUEXfbUBGrek4P4aIz+4Pw7Ts=;
 b=SE4wMQwKdJ09ZcAX1oupRb66/LV1m/Dc0TCqwY5bIDHoQ3X777FEQSsh
 9A0lEEIuDxtI816i3HJlJs6c98k9dX3JOy6UKK0aLiW6zNMM7d+FarHxd
 4pWCCUSFlFXQSQlMFw5fZF1a7FcrEqjeF9cdOWp8WSGHugh8B7vGnrnNK
 v/5Bo4lyVdMOJ5/7k18WXYuQ1RdfVArftSI/5DGu3KDMIB1V4nqKnoWXP
 /UhnZ5bkD8c+Lr4Y1pcjSXUBFa5KTMuro6TUktz30Q+3ahYZojxUqdqLc
 Z5uUUkfaMSfiRIIr2UfpUze7XSiSpV2o0JKErJQJObUyiPnHUaOpORDiS g==;
X-CSE-ConnectionGUID: ccAT5uNZQqWffl9wBgvHAQ==
X-CSE-MsgGUID: pG7D7jzeSX+VAFykBNH5Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66686910"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="66686910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:08:43 -0800
X-CSE-ConnectionGUID: QaSqb/+mSMeDVkQHDI1+VA==
X-CSE-MsgGUID: 7tbr+2XaT9G6Dil+m65buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235095945"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:08:42 -0800
Message-ID: <29b910869c16f7e22ac2481a64227289a550adb6.camel@linux.intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe: Skip exec queue schedule toggle if queue
 is idle during suspend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 13:08:39 +0100
In-Reply-To: <20251212182847.1683222-5-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-5-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> If an exec queue is idle, there is no need to issue a schedule
> disable
> to the GuC when suspending the queue=E2=80=99s execution. Opportunistical=
ly
> skip
> this step if the queue is idle and not a parallel queue. Parallel
> queues
> must have their scheduling state flipped in the GuC due to
> limitations
> in how submission is implemented in run_job().
>=20
> Also if all pagefault queues can skip the schedule disable during a
> switch to dma-fence mode, do not schedule a resume for the pagefault
> queues after the next submission.
>=20
> v2:
> =C2=A0- Don't touch the LRC tail is queue is suspended but enabled in
> run_job
> =C2=A0=C2=A0 (CI)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Not fully up-to-date with the GuC scheduling code, but changes look
sane to me.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
17 ++++++++
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
55
> +++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.c |=C2=A0 2 +-
> =C2=A03 files changed, 70 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 10abed98fb6b..b5ad975d7e97 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -162,4 +162,21 @@ int xe_exec_queue_contexts_hwsp_rebase(struct
> xe_exec_queue *q, void *scratch);
> =C2=A0
> =C2=A0struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> =C2=A0
> +/**
> + * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
> + * @q: The exec_queue
> + *
> + * If an exec queue is not parallel and is idle, the suspend steps
> can be
> + * skipped in the submission backend immediatley signaling the
> suspend fence.
> + * Parallel queues cannot skip this step due to limitations in the
> submission
> + * backend.
> + *
> + * Return: True if exec queue is idle and can skip suspend steps,
> False
> + * otherwise
> + */
> +static inline bool xe_exec_queue_idle_skip_suspend(struct
> xe_exec_queue *q)
> +{
> +	return !xe_exec_queue_is_parallel(q) &&
> xe_exec_queue_is_idle(q);
> +}
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 18cac5594d6a..8bab816da7fd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -75,6 +75,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> =C2=A0#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> =C2=A0#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> =C2=A0#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> +#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 14)
> =C2=A0
> =C2=A0static bool exec_queue_registered(struct xe_exec_queue *q)
> =C2=A0{
> @@ -266,6 +267,21 @@ static void
> clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> =C2=A0	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc-
> >state);
> =C2=A0}
> =C2=A0
> +static bool exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) &
> EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND;
> +}
> +
> +static void set_exec_queue_idle_skip_suspend(struct xe_exec_queue
> *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc-
> >state);
> +}
> +
> +static void clear_exec_queue_idle_skip_suspend(struct xe_exec_queue
> *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc-
> >state);
> +}
> +
> =C2=A0static bool exec_queue_killed_or_banned_or_wedged(struct
> xe_exec_queue *q)
> =C2=A0{
> =C2=A0	return (atomic_read(&q->guc->state) &
> @@ -1118,7 +1134,7 @@ static void submit_exec_queue(struct
> xe_exec_queue *q, struct xe_sched_job *job)
> =C2=A0	if (!job->restore_replay || job->last_replay) {
> =C2=A0		if (xe_exec_queue_is_parallel(q))
> =C2=A0			wq_item_append(q);
> -		else
> +		else if (!exec_queue_idle_skip_suspend(q))
> =C2=A0			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> =C2=A0		job->last_replay =3D false;
> =C2=A0	}
> @@ -1906,9 +1922,10 @@ static void
> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> =C2=A0{
> =C2=A0	struct xe_exec_queue *q =3D msg->private_data;
> =C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +	bool idle_skip_suspend =3D xe_exec_queue_idle_skip_suspend(q);
> =C2=A0
> -	if (guc_exec_queue_allowed_to_change_state(q) &&
> !exec_queue_suspended(q) &&
> -	=C2=A0=C2=A0=C2=A0 exec_queue_enabled(q)) {
> +	if (!idle_skip_suspend &&
> guc_exec_queue_allowed_to_change_state(q) &&
> +	=C2=A0=C2=A0=C2=A0 !exec_queue_suspended(q) && exec_queue_enabled(q)) {
> =C2=A0		wait_event(guc->ct.wq, vf_recovery(guc) ||
> =C2=A0			=C2=A0=C2=A0 ((q->guc->resume_time !=3D RESUME_PENDING
> ||
> =C2=A0			=C2=A0=C2=A0 xe_guc_read_stopped(guc)) &&
> !exec_queue_pending_disable(q)));
> @@ -1927,11 +1944,33 @@ static void
> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> =C2=A0			disable_scheduling(q, false);
> =C2=A0		}
> =C2=A0	} else if (q->guc->suspend_pending) {
> +		if (idle_skip_suspend)
> +			set_exec_queue_idle_skip_suspend(q);
> =C2=A0		set_exec_queue_suspended(q);
> =C2=A0		suspend_fence_signal(q);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void sched_context(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +	struct xe_lrc *lrc =3D q->lrc[0];
> +	u32 action [] =3D {
> +		XE_GUC_ACTION_SCHED_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_parallel(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc),
> !exec_queue_pending_disable(q));
> +
> +	trace_xe_exec_queue_submit(q);
> +
> +	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> =C2=A0static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> *msg)
> =C2=A0{
> =C2=A0	struct xe_exec_queue *q =3D msg->private_data;
> @@ -1939,12 +1978,22 @@ static void
> __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> =C2=A0	if (guc_exec_queue_allowed_to_change_state(q)) {
> =C2=A0		clear_exec_queue_suspended(q);
> =C2=A0		if (!exec_queue_enabled(q)) {
> +			if (exec_queue_idle_skip_suspend(q)) {
> +				struct xe_lrc *lrc =3D q->lrc[0];
> +
> +				clear_exec_queue_idle_skip_suspend(q
> );
> +				xe_lrc_set_ring_tail(lrc, lrc-
> >ring.tail);
> +			}
> =C2=A0			q->guc->resume_time =3D RESUME_PENDING;
> =C2=A0			set_exec_queue_pending_resume(q);
> =C2=A0			enable_scheduling(q);
> +		} else if (exec_queue_idle_skip_suspend(q)) {
> +			clear_exec_queue_idle_skip_suspend(q);
> +			sched_context(q);
> =C2=A0		}
> =C2=A0	} else {
> =C2=A0		clear_exec_queue_suspended(q);
> +		clear_exec_queue_idle_skip_suspend(q);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 290205a266b8..4d9263a1a208 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -205,7 +205,7 @@ static int
> xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> =C2=A0			continue;
> =C2=A0
> =C2=A0		xe_gt_stats_incr(q->gt,
> XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> -		need_resume =3D true;
> +		need_resume |=3D !xe_exec_queue_idle_skip_suspend(q);
> =C2=A0		q->ops->suspend(q);
> =C2=A0	}
> =C2=A0

