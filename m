Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E2606A334
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DMFNCupJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABA610E230;
	Tue,  3 Nov 2026 06:49:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F97A10E230
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:48:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C288438B1;
 Tue,  3 Nov 2026 06:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08AB1F0093A;
 Tue,  3 Nov 2026 06:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793688535;
 bh=9D8dBOOIZAILeNzWTf1D6dFluu71P+BJYb3xijnGrjg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DMFNCupJKqYu3GOi3OZBM2bK309v7CoPhkK4oHpMK8DzZSBd2pqzj4FjuTfGmWIsF
 ecP9Es1ucxHhxGY0rYruBHAg3E1O9MxZIjiigb2o3lQTeQhmaH5ZtEqdRkP5Bd3jG+
 +fcSyFAxpeOTrrDFpUW60Nyt/65hr3quI1QvIRHggqGUeH4VwoPDcKZjlEBTVHz7B4
 anLl8HEjesjkwBW8Kk4OC59/nVfYk9IkCmu/z/wnX76SX1CHWk5qxAennu4FJcCneQ
 E/LAxjXHc7o/w0k56dUWgQ1Ddls1vl88uEXepAaJcc1smb6f3TXbfFG7oPZow7ah3L
 9GDzhgQxnthqw==
Message-ID: <sashiko-outbox-194672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060649.1015468-8-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
 <20261103060649.1015468-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:48:55 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe: work_tdr livelock and scheduler race in xe_device_suspend(=
) FLR path
- [High] drm/xe: missing ULLS teardown and synchronization across FLR in xe=
_device_suspend()
- [High] drm/xe: missing re-initialization of xe->cpu_bind->q in xe_device_=
resume()
--

commit c9d7243b4c02644f3740b46ba51d0f51d005d2ba
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pm: Introduce xe_device_suspend/resume()

This commit extracts the system suspend and resume logic from xe_pm.c into
common xe_device_suspend() and xe_device_resume() helpers in xe_device.c,
adding an flr parameter to support PCIe FLR preparation and
re-initialization alongside system suspend and resume.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 07a7ab6ac0832..c54a42cdf9a47 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

[ ... ]

> @@ -1384,3 +1386,150 @@ void xe_device_exit(void)
>  		wait_var_event(&xe_device_count, !atomic_read(&xe_device_count));
>  	}
>  }
> +
> +/**
> + * xe_device_suspend() - Common helper for system suspend and FLR prepare
> + * @xe: xe device instance
> + * @flr: indicate FLR prepare
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_device_suspend(struct xe_device *xe, bool flr)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	err =3D xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_suspend_prepare(gt);
> +
> +	if (flr) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_flr_prepare(gt);

[Severity: High]
Can this FLR preparation path livelock on sched->base.work_tdr or leave the
scheduler running when xe_device_resume() later calls xe_sched_reinit()?

In xe_gt_flr_prepare() -> xe_uc_flr_prepare(), uc_flr_prepare() and
uc_flr_sanitize() are queued and flushed back-to-back on gt->ordered_wq:

	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
	queue_work(gt->ordered_wq, &flr.work);
	flush_work(&flr.work);
	destroy_work_on_stack(&flr.work);

	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
	queue_work(gt->ordered_wq, &flr.work);
	flush_work(&flr.work);
	destroy_work_on_stack(&flr.work);

When an exec queue has jobs in flight, uc_flr_prepare() ->
xe_guc_flr_prepare() -> xe_guc_submit_pause_abort() starts submission and
calls guc_exec_queue_kill() -> xe_guc_exec_queue_trigger_cleanup() ->
xe_sched_tdr_queue_imm(), which sets sched->base.timeout =3D 0 and queues
sched->base.work_tdr (drm_sched_job_timedout) on gt->ordered_wq with delay =
0.

When drm_sched_job_timedout() runs on gt->ordered_wq before
uc_flr_sanitize(), guc_exec_queue_timedout_job() marks the job fence with
-ETIME, calls xe_sched_submission_start(), and returns
DRM_GPU_SCHED_STAT_NO_HANG. drm_sched_job_timedout() then calls
drm_sched_job_reinsert_on_false_timeout(), which puts the signaled job back
on sched->base.pending_list and queues work_free_job on
sched->base.submit_wq (a separate workqueue from gt->ordered_wq), followed
immediately by drm_sched_start_timeout_unlocked(). Unless work_free_job on
submit_wq has already completed on another CPU and removed the job from
pending_list before that call, drm_sched_start_timeout() sees
sched->base.timeout =3D=3D 0 and a non-empty pending_list, re-queueing work=
_tdr
with delay 0 on gt->ordered_wq behind uc_flr_sanitize().

Next on gt->ordered_wq, uc_flr_sanitize() -> xe_uc_stop() -> xe_guc_stop() =
->
xe_guc_submit_stop() -> guc_exec_queue_stop() calls
xe_sched_submission_stop(), which sets sched->base.pause_submit =3D true and
cancels work_free_job. If work_free_job had not run yet on submit_wq, the
signaled job remains on sched->base.pending_list. When the re-queued
work_tdr runs, guc_exec_queue_timedout_job() sees DMA_FENCE_FLAG_SIGNALED_B=
IT
set and returns DRM_GPU_SCHED_STAT_NO_HANG without starting the scheduler;
drm_sched_job_reinsert_on_false_timeout() re-adds the job to pending_list
while drm_sched_run_free_queue() is a no-op because drm_sched_is_stopped() =
is
true, and drm_sched_start_timeout_unlocked() re-queues work_tdr with delay 0
in an infinite loop on gt->ordered_wq.

Conversely, if a job was still in entity->job_queue when uc_flr_prepare()
ran, work_run_job on sched->base.submit_wq can pop the job into pending_list
and queue work_tdr on gt->ordered_wq after uc_flr_sanitize() was queued.
After uc_flr_sanitize() stops the scheduler, work_tdr runs
guc_exec_queue_timedout_job(), which calls xe_sched_submission_start() and
leaves pause_submit =3D=3D false, triggering:

	xe_gt_assert(ge->q->gt, drm_sched_is_stopped(&sched->base));

in xe_sched_reinit() during xe_device_resume(xe, true).

[Severity: High]
What stops tile->migrate->ulls.exit_work from racing with FLR preparation
and re-initialization or leaving stale ULLS state after reset?

On DGFX platforms, GPU page faults (xe_pagefault_service()) and SVM
prefetches (xe_vm_prefetch()) call xe_migrate_ulls_enter(), which sets
m->ulls.enabled =3D true under m->job_mutex, submits a ULLS_ENTER job to m-=
>q,
and schedules m->ulls.exit_work (xe_migrate_ulls_exit()) on
system_percpu_wq. Neither xe_device_suspend(xe, true) nor
xe_device_resume(xe, true) (via xe_gt_reinit() -> xe_migrate_reinit())
disables or flushes m->ulls.exit_work, takes m->job_mutex, or resets
m->ulls.enabled (unlike xe_migrate_fini()).

This appears to allow three failure modes across FLR:

1. If m->ulls.exit_work fires while m->q->guc->sched is stopped (after
uc_flr_sanitize() during the FLR window, or in xe_device_resume(xe, true)
before xe_migrate_reinit()), xe_migrate_ulls_exit() sees
xe_exec_queue_is_idle(m->q, 1) and calls __xe_migrate_job_push(m, job,
ULLS_EXIT), which arms the job via xe_sched_job_arm() ->
xe_lrc_init_seqno_fence(), incrementing m->q->lrc[0]->fence_ctx.next_seqno
and queueing the job on m->q->entity. When xe_migrate_reinit() ->
xe_exec_queue_reinit(m->q) -> xe_lrc_ctx_init() runs without m->job_mutex,
it writes lrc->fence_ctx.next_seqno - 1 into __xe_lrc_seqno_map(lrc) and
__xe_lrc_start_seqno_map(lrc), marking the unexecuted ULLS_EXIT job's seqno
as completed in the hardware seqno page before the job is emitted in
xe_guc_submit_start().

2. If m->ulls.exit_work fires during xe_uc_flr_prepare() between
xe_guc_submit_pause_abort() (which sets EXEC_QUEUE_STATE_KILLED on m->q) and
uc_flr_sanitize(), guc_exec_queue_run_job() sees
exec_queue_killed_or_banned_or_wedged(m->q), skips q->ring_ops->emit_job(jo=
b)
(leaving job->ptrs[0].head =3D=3D 0), and places the unsignaled ULLS_EXIT j=
ob on
sched->base.pending_list. During xe_device_resume(xe, true), after
xe_lrc_ctx_init() writes MI_ARB_ON_OFF into the ring, xe_guc_submit_start()
-> guc_exec_queue_start(m->q) finds that pending job and rewinds
lrc->ring.tail, RING_HEAD, and RING_TAIL to job->ptrs[0].head (0),
overwriting the ring state initialized by xe_lrc_ctx_init().

3. If m->ulls.exit_work has not fired before FLR resume completes,
m->ulls.enabled remains true even though the hardware reset wiped engine
state, causing subsequent xe_migrate_ulls_enter() calls to skip submitting a
ULLS_ENTER job.

[ ... ]

> +int xe_device_resume(struct xe_device *xe, bool flr)
> +{
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	err =3D xe_pcode_ready(xe, true);
> +	if (err)
> +		return err;
> +
> +	assert_lmem_ready(xe);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
> +	if (flr) {
> +		err =3D xe_bo_restore_map(xe);
> +		if (err)
> +			return err;
> +
> +		for_each_gt(gt, xe, id) {
> +			err =3D xe_gt_reinit(gt);
> +			if (err)
> +				return err;
> +		}
> +	}

[Severity: High]
Does the FLR re-initialization branch also need to re-initialize
xe->cpu_bind->q?

During probe, xe_device_probe() -> xe_cpu_bind_init() creates the device-wi=
de
kernel bind queue xe->cpu_bind->q with EXEC_QUEUE_FLAG_KERNEL |
EXEC_QUEUE_FLAG_MIGRATE, and guc_exec_queue_init() inserts it into
guc->submission_state.exec_queue_lookup.

During xe_device_suspend(xe, true), xe_gt_flr_prepare() ->
xe_uc_flr_prepare() -> xe_guc_flr_prepare() -> xe_guc_submit_pause_abort()
iterates over guc->submission_state.exec_queue_lookup and calls
guc_exec_queue_kill() on every queue, which sets EXEC_QUEUE_STATE_KILLED on
xe->cpu_bind->q and zeroes its scheduler timeout.

In xe_device_resume(xe, true), xe_gt_reinit() only re-initializes
tile->migrate->q via xe_migrate_reinit() -> xe_exec_queue_reinit(m->q),
leaving xe->cpu_bind->q with EXEC_QUEUE_STATE_KILLED set. When a subsequent
pipelined page-table update is scheduled on xe->cpu_bind->q (via
xe_vm_rebind(), xe_vma_rebind(), xe_vm_range_rebind(), or
xe_vm_range_unbind() -> xe_cpu_bind_update_pgtables_job()),
guc_exec_queue_run_job() sees exec_queue_killed_or_banned_or_wedged(q) as
true:

	if (is_pt_job(job)) {
		xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));

		run_pt_job(guc_to_xe(guc), job,
			   killed_or_banned_or_wedged_or_error);

and passes force_clear =3D true to run_pt_job() ->
xe_cpu_bind_update_pgtables_execute(), clearing page table entries instead =
of
populating them while still committing the VMA as present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060649.1015=
468-1-raag.jadav@intel.com?part=3D7
