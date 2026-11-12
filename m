Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6E7606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvLKfRpg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372C710FFA5;
	Thu, 12 Nov 2026 09:45:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4F010FF87
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:45:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 174B7654D1;
 Thu, 12 Nov 2026 09:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4271F00A05;
 Thu, 12 Nov 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794476711;
 bh=dtUevx5TPM+fc/vRKfZdIyd+uDBl/q/Lz24z2g1TDao=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=BvLKfRpg8NRvCgvDuRfpd1Dq8IJAjzgoYKnmsXidHQeO0Uc5XaxWOdJh6FeIRxSCg
 GWm+8/qaRLOadeG0MQpyG3HFt3cVnd5AG0m+OqvfDsFLnHYhqeBGiXs2uzVi8Q8xMT
 qMV9Z+O9ScF6oVKsUQ/yMInXNWldUzAR33ADRfV//1fO+WZKPJVKLgY6qc1zeE3QsK
 hveYF9K0QajXuUoSmqV9+BTVRlk3HbSlxrMBd2xFoRB92320DdmXjw0tOWOcst6NKb
 eJNPrSmogtImz5mvimOq/qrO+qOqhASNaXb4Y25GexksEpIIxhaZ9mZE+VNWv5fvRO
 5gusqgfcmqutw==
Message-ID: <sashiko-outbox-210896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 03/10] drm/xe/gt: Introduce FLR helpers
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112091033.1813803-4-raag.jadav@intel.com>
References: <20261112091033.1813803-1-raag.jadav@intel.com>
 <20261112091033.1813803-4-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:45:11 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: scheduler teardown race and work_tdr livelock in
  xe_uc_flr_prepare()
- [Medium] drm/xe: race in xe_uc_flr_prepare() stopping queues before
  GuC CT
- [Medium] drm/xe/uc: race with gt_reset_worker in xe_uc_flr_prepare()
  underflows stopped
--

commit 6346e5e2a24f34768e5d1768ff0c83e0c2d64f19
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Introduce FLR helpers

This commit introduces helper functions across the GT, uC, GuC, HuC, and
GSC layers to prepare for and re-initialize after a PCIe Function Level
Reset (FLR).

> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 300126e6624f6..c4fb34e64cd6d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1736,6 +1736,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	xe_guc_submit_disable(guc);
>  }
> =20
> +/**
> + * xe_guc_flr_prepare() - Prepare GuC for FLR
> + * @guc: The GuC object
> + *
> + * Stop GuC submission and tear down exec queues.
> + */
> +void xe_guc_flr_prepare(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return;
> +
> +	xe_guc_submit_stop(guc);
> +	xe_guc_submit_pause_abort(guc);
> +}

[Severity: Medium]
As reported by Tauro, Riana on v10 [1], can stopping and aborting exec
queues here before stopping GuC CT in uc_flr_sanitize() cause
guc_exec_queue_destroy_async() to run twice on the same queue?

All other submission teardown paths (xe_guc_stop(), guc_submit_fini(), and
xe_guc_submit_wedge()) call xe_guc_ct_stop() to stop CT and cancel
ct->g2h_worker before calling xe_guc_submit_stop(), and call
xe_uc_fw_sanitize() before xe_guc_submit_pause_abort(). Here, ct->g2h_worker
is still active during uc_flr_prepare():

kworker (gt->ordered_wq)          kworker (ct->g2h_worker)
uc_flr_prepare()                  dequeue_one_g2h()
  xe_guc_flr_prepare()              g2h_read()
    xe_guc_submit_stop()
      guc_exec_queue_stop(q)
        /* clears REGISTERED,
         * keeps DESTROYED */
        guc_exec_queue_destroy_async(q)
                                    process_g2h_msg()
                                      xe_guc_deregister_done_handler()
                                        handle_deregister_done()
                                          guc_exec_queue_destroy_async(q)
                                            <-- double destroy

Because guc_exec_queue_stop() clears EXEC_QUEUE_STATE_REGISTERED (along
with PENDING_DISABLE, PENDING_ENABLE, and ENABLED) while leaving
EXEC_QUEUE_STATE_DESTROYED set, a concurrent
xe_guc_deregister_done_handler() passes its state check and queues
guc_exec_queue_destroy_async() a second time, corrupting the work item or
underflowing the queue refcount.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 89040d9fa05ff..2ba57c5c9979b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c

[ ... ]

> @@ -279,6 +281,79 @@ static void uc_reset_wait(struct xe_uc *uc)
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
> +	xe_uc_reset_prepare(uc);
> +
> +	/*
> +	 * We'll be tearing down exec queues which signals the fences and frees=
 the
> +	 * jobs but all of that happens asynchronously, so make sure we don't d=
isrupt
> +	 * the scheduler while jobs are still in-flight.
> +	 */
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
> +	queue_work(gt->ordered_wq, &flr.work);

[Severity: Medium]
Can an in-progress gt_reset_worker on gt->ordered_wq clear
guc->submission_state.stopped before uc_flr_prepare() runs?

CPU0                              kworker (gt->ordered_wq)
                                  gt_reset_worker()
                                    /* passes xe_wedged() check */
xe_gt_flr_prepare()
  xe_uc_flr_prepare()
    xe_uc_reset_prepare()
      /* stopped is already 1 */
    queue_work(..., &flr.work)
                                    do_gt_restart()
                                      xe_uc_start()
                                        xe_guc_submit_start()
                                          atomic_dec(&...->stopped) /* -> 0=
 */
                                  uc_flr_prepare()
                                    xe_guc_flr_prepare()
                                      xe_guc_submit_stop()
                                        xe_gt_assert(..., stopped =3D=3D 1)

When gt_reset_worker finishes before uc_flr_prepare() starts on
gt->ordered_wq, xe_guc_submit_start() decrements stopped back to 0. That
trips the xe_guc_read_stopped(guc) =3D=3D 1 assert in xe_guc_submit_stop(),=
 and
when xe_uc_start() runs after FLR it decrements stopped from 0 to -1,
leaving GuC submission permanently stopped. Calling xe_uc_reset_prepare(uc)
again inside uc_flr_prepare() (as xe_guc_submit_wedge() does on
gt->ordered_wq) would ensure stopped remains set.

> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +}

[Severity: High]
Can queuing uc_flr_sanitize() immediately after uc_flr_prepare() on
gt->ordered_wq livelock work_tdr or leave pending jobs stranded when
in-flight jobs are being torn down?

Inside uc_flr_prepare(), xe_guc_submit_pause_abort() starts each scheduler
and calls guc_exec_queue_kill() -> drm_sched_tdr_queue_imm(), which sets
sched->base.timeout =3D 0 and queues work_tdr on gt->ordered_wq. When
drm_sched_job_timedout() runs ahead of uc_flr_sanitize(),
guc_exec_queue_timedout_job() marks the job's fence with an error via
async irq_work and returns DRM_GPU_SCHED_STAT_NO_HANG:

drivers/gpu/drm/scheduler/sched_main.c:drm_sched_job_timedout() {
	...
		if (status =3D=3D DRM_GPU_SCHED_STAT_NO_HANG)
			drm_sched_job_reinsert_on_false_timeout(sched, job);
	} else {
		spin_unlock(&sched->job_list_lock);
	}

	if (status !=3D DRM_GPU_SCHED_STAT_ENODEV)
		drm_sched_start_timeout_unlocked(sched);
	...
}

drm_sched_job_reinsert_on_false_timeout() puts the job back on
pending_list and queues work_free_job on sched->base.submit_wq (a separate
per-scheduler workqueue, not gt->ordered_wq), and
drm_sched_start_timeout_unlocked() immediately re-queues work_tdr with
delay 0 on gt->ordered_wq behind uc_flr_sanitize():

kworker (gt->ordered_wq)          kworker (sched->submit_wq)
uc_flr_prepare()
  ...
    drm_sched_tdr_queue_imm()
drm_sched_job_timedout()
  /* queues irq_work to signal fence */
  /* reinserts job on pending_list */
  drm_sched_run_free_queue()
  drm_sched_start_timeout_unlocked()
    /* re-queues work_tdr (delay 0)
     * behind uc_flr_sanitize */
uc_flr_sanitize()
  xe_uc_stop()
    ...
      drm_sched_wqueue_stop()
        sched->pause_submit =3D true
        cancel_work_sync(&work_free_job)
                                  /* work_free_job cancelled before
                                   * freeing reinserted job */
drm_sched_job_timedout()
  /* fence is now signaled: returns
   * NO_HANG early, reinserts job;
   * run_free_queue() is a no-op
   * because pause_submit is true;
   * re-queues work_tdr (delay 0) */  <-- infinite 0-delay work_tdr loop

If the re-queued work_tdr instead runs before irq_work signals the fence
(or if work_run_job on submit_wq pops an entity job and queues work_tdr
behind uc_flr_sanitize()), guc_exec_queue_timedout_job() calls
xe_sched_submission_start(sched) after uc_flr_sanitize(), leaving
pause_submit false and tripping the drm_sched_is_stopped() assert in
xe_sched_reinit().

[1] https://lore.kernel.org/r/fcd99d4a-b7b4-4bfd-9e78-65ff1ea2d7d7@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091033.1813=
803-1-raag.jadav@intel.com?part=3D3
