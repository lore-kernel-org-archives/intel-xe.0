Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362B606A329
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5er9Zgu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673010F3A2;
	Tue,  3 Nov 2026 06:39:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043810F382
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:39:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 89E93437D1;
 Tue,  3 Nov 2026 06:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2F01F00919;
 Tue,  3 Nov 2026 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793687982;
 bh=G5g6OHAvhFvLQB2K7sOfQW5BOFoHbh5oczACGAHuXc4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=b5er9Zguu+OKj7y/1nycqRQkWpWhUV7Lja4TFZTFRtFk06XpVmjSj1cn7upduj0qP
 0MAlVLDKy2NiUbHbSP+roDKVgn8pRLMEf/N3l6WHAmR9GmtsGfG3CphCi+d4d5Hkpl
 P+ZmhJycEN+JGY1lV7a9glQMEblkN+bY6ovDs0+IhXZFNqN4dyJjP1a9PluBxwv14y
 F5ln/zUCS0EZun9r/5sqUfcwbr/aIbsJFTJSd+odjrCnz3CGCG8geKWVRzyuj5o9xS
 7QIKZ+uJcJq0YKSbuX+uzAqTRPMH9KQJz915fEpbF7v2E15HQzvavollov+Xnl+gaG
 kMYosSjFI6bhg==
Message-ID: <sashiko-outbox-194653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 03/10] drm/xe/gt: Introduce FLR helpers
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060649.1015468-4-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
 <20261103060649.1015468-4-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:39:41 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe: scheduler teardown race and work_tdr livelock in xe_uc_flr=
_prepare()
- [Medium] drm/xe: missing xe_tlb_inval_reset() in xe_gt_flr_prepare()
--

commit f6d30be6992dd944414ef4237e3194f7481c3b3d
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Introduce FLR helpers

This commit introduces flr_prepare() and reinit() helpers for GT and its
uCs (GuC, HuC, and GSC) to prepare and re-initialize state before and
after a PCIe FLR.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index be79a0da2f2ff..0e0eb8de3a98e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -906,6 +906,29 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
> =20
> +/**
> + * xe_gt_flr_prepare() - Prepare GT for FLR
> + * @gt: the GT object
> + *
> + * Prepare all GT uCs for FLR.
> + */
> +void xe_gt_flr_prepare(struct xe_gt *gt)
> +{
> +	xe_gt_sanitize(gt);
> +	xe_uc_flr_prepare(&gt->uc);
> +}

[Severity: Medium]
Should xe_gt_flr_prepare() also call xe_tlb_inval_reset(&gt->tlb_inval)
after xe_uc_flr_prepare(&gt->uc)?

In xe_uc_flr_prepare(), uc_flr_sanitize() calls xe_uc_stop() and
xe_uc_sanitize(), which stop and disable GuC CT communication via
xe_guc_ct_stop() and xe_guc_ct_disable(). Once GuC CT is disabled, no G2H
TLB invalidation completions can arrive.

Both gt_reset_worker() and gt_wedge_worker() call
xe_tlb_inval_reset(&gt->tlb_inval) after stopping uC communication:

drivers/gpu/drm/xe/xe_gt.c:gt_reset_worker() {
	...
	xe_uc_stop(&gt->uc);

	xe_tlb_inval_reset(&gt->tlb_inval);
}

drivers/gpu/drm/xe/xe_gt.c:gt_wedge_worker() {
	...
	xe_uc_wedge_declare(&gt->uc);
	xe_tlb_inval_reset(&gt->tlb_inval);
	xe_pm_runtime_put(gt_to_xe(gt));
}

Without xe_tlb_inval_reset(&gt->tlb_inval), if a GGTT or PPGTT TLB
invalidation is in flight when xe_gt_flr_prepare() runs,could its fence
remain unsignaled on gt->tlb_inval.pending_fences (blocking waiters in
xe_tlb_inval_fence_wait()) while gt->tlb_inval.fence_tdr stays armed on
gt->ordered_wq across the FLR?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 89040d9fa05ff..f5433025325cd 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c

[ ... ]

> @@ -279,6 +281,78 @@ static void uc_reset_wait(struct xe_uc *uc)
>  		goto again;
>  }
> =20
> +static void uc_flr_prepare(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr =3D container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc =3D flr->uc;
> +
> +	xe_gt_assert(uc_to_gt(uc), xe_wedged(uc_to_xe(uc)));
> +
> +	xe_uc_reset_prepare(uc);
> +	xe_guc_flr_prepare(&uc->guc);
> +}
> +
> +static void uc_flr_sanitize(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr =3D container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc =3D flr->uc;
> +
> +	/* TODO: Sanitize GSC firmware */
> +	xe_gt_assert(uc_to_gt(uc), IS_DGFX(uc_to_xe(uc)));
> +	xe_gt_assert(uc_to_gt(uc), !xe_uc_fw_is_loadable(&uc->gsc.fw));
> +
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);
> +}
> +
> +/**
> + * xe_uc_flr_prepare() - Prepare uCs for FLR
> + * @uc: The uC object
> + *
> + * Tear down pending work and stop all uCs.
> + */
> +void xe_uc_flr_prepare(struct xe_uc *uc)
> +{
> +	struct xe_uc_flr flr =3D { .uc =3D uc };
> +	struct xe_gt *gt =3D uc_to_gt(uc);
> +
> +	/*
> +	 * We'll be tearing down exec queues which signals all fences and frees=
 the
> +	 * jobs but all of that happens asynchronously, so make sure we don't d=
isrupt
> +	 * the scheduler while jobs are still in-flight.
> +	 */
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +}

[Severity: High]
Can queuing uc_flr_sanitize() on gt->ordered_wq right after uc_flr_prepare()
race with the per-scheduler submit_wq and irq_work, leading to a work_tdr
livelock on gt->ordered_wq or leaving schedulers unstopped?

Inside uc_flr_prepare(), xe_guc_flr_prepare() calls
xe_guc_submit_pause_abort(), which for each exec queue starts submission on
sched->base.submit_wq (a dedicated workqueue separate from gt->ordered_wq)
and triggers immediate TDR on gt->ordered_wq:

uc_flr_prepare()
  xe_guc_flr_prepare()
    xe_guc_submit_pause_abort()
      xe_sched_submission_start(sched)
      guc_exec_queue_kill(q)
        xe_guc_exec_queue_trigger_cleanup(q)
          drm_sched_tdr_queue_imm(&sched->base)

When sched->base.work_tdr (drm_sched_job_timedout()) executes on
gt->ordered_wq ahead of uc_flr_sanitize(), guc_exec_queue_timedout_job()
marks pending jobs with an error, schedules an asynchronous irq_work via
xe_hw_fence_irq_run() to signal job->fence, and returns
DRM_GPU_SCHED_STAT_NO_HANG.

Then drm_sched_job_timedout() reinserts the job onto sched->pending_list,
queues work_free_job on sched->submit_wq, and immediately restarts the
timeout on gt->ordered_wq:

drivers/gpu/drm/scheduler/sched_main.c:drm_sched_job_timedout() {
	...
		if (status =3D=3D DRM_GPU_SCHED_STAT_NO_HANG)
			drm_sched_job_reinsert_on_false_timeout(sched, job);
	} else {
		spin_unlock(&sched->job_list_lock);
	}

	if (status !=3D DRM_GPU_SCHED_STAT_ENODEV)
		drm_sched_start_timeout_unlocked(sched);
}

Because irq_work and work_free_job (on sched->base.submit_wq) have not yet
signaled and freed the job when drm_sched_start_timeout_unlocked() runs,
sched->base.pending_list is still non-empty and sched->base.timeout is 0, so
mod_delayed_work() queues sched->base.work_tdr at the tail of
gt->ordered_wq behind uc_flr_sanitize().

Next on gt->ordered_wq, uc_flr_sanitize() runs xe_uc_stop() ->
xe_guc_stop() -> xe_guc_submit_stop() -> drm_sched_wqueue_stop(), which sets
sched->base.pause_submit =3D true and cancels work_run_job and work_free_job
on sched->base.submit_wq without canceling sched->base.work_tdr.

If work_free_job was canceled before removing the reinserted job from
sched->base.pending_list (or ran before irq_work signaled job->fence), what
happens when the re-queued work_tdr runs on gt->ordered_wq after
uc_flr_sanitize()?

1. Once job->fence is signaled, guc_exec_queue_timedout_job() returns
   DRM_GPU_SCHED_STAT_NO_HANG early, drm_sched_job_reinsert_on_false_timeou=
t()
   puts the job back on pending_list, drm_sched_run_free_queue() does nothi=
ng
   because drm_sched_is_stopped(sched) is true, and
   drm_sched_start_timeout_unlocked() re-queues work_tdr with timeout =3D=
=3D 0
   in a tight loop on gt->ordered_wq.

2. If job->fence is not yet signaled when the re-queued work_tdr runs (or if
   an entity job was popped by work_run_job before it was stopped and queued
   work_tdr behind uc_flr_sanitize()), guc_exec_queue_timedout_job() calls
   xe_sched_submission_start(sched), leaving pause_submit =3D=3D false after
   xe_gt_flr_prepare() finishes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060649.1015=
468-1-raag.jadav@intel.com?part=3D3
