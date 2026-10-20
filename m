Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CCB606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHsgO/WE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC5710F3BB;
	Tue, 20 Oct 2026 08:30:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D1010F3BB
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:30:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BACDA60A6A;
 Tue, 20 Oct 2026 08:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3E81F000C6;
 Tue, 20 Oct 2026 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792485018;
 bh=b1sX0tmY/Ld4y0aFERJQRpCjpLvO3E0Mbnkn3NclCC4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mHsgO/WEojHtYbAKbQWUhOXV7SHX/DaXTMsj6C0mP5+viFQSaawd3Dn6iVitcPMYv
 Yr0AEUZcOFu8NS7IvTCExE5YAlN9uSI9G6OUzxi+KMibFTYr+Kx3rSaDl833ZrXbMx
 q9Rg2EkjzuR27xWRuGsq2G2GpwpGP/WVY3b4w5LYJ9kC+sy7asS2iVXM3JH3k7MUjT
 89C9d6WZ0eHnm4Csh0zLeQXvbSWy8ElZNG5RI0lNpeIvNEAmdlaWCIwkUZxW1e5AtE
 VN4LcampljqN8WREtfozOg0TFU2CfH5VA7jWm0EDIIFwHXJ6LdwW0msQ51wtG7JT5a
 1LovgTy89u8Fg==
Message-ID: <sashiko-outbox-178553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261020023641.200658-2-raag.jadav@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
 <20261020023641.200658-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:30:17 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe/gt: for_each_initialized_gt() skips active GT during xe_gt_=
init()
- [High] drm/xe/gt: race between synchronous wedge state and deferred gt_we=
dge_worker()
--

commit 19edca009f0bb14e1051fc3ff32676af39bd1d12
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a worker on the GT ordered workqueue to handle GT
wedging asynchronously so the scheduler is not disrupted while jobs are in
flight. It also introduces for_each_initialized_gt() to skip uninitialized
GTs when declaring the device wedged during probe.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 4caf86be8c29c..b83ea856a6fc8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1436,7 +1436,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    WEDGED_URL, XE_BUG_URL);
>  	}
> =20
> -	for_each_gt(gt, xe, id)
> +	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
> =20
>  	if (xe_device_wedged(xe)) {

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc9bf6f0b5a79..8dac5679d158d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -784,6 +790,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }
> =20

[Severity: High]
Can for_each_initialized_gt() skip a GT that is currently executing inside
xe_gt_init(), leaving its GuC CT, GuC submission, and kernel exec queues
unwedged?

Inside xe_gt_init(), gt_init_with_all_forcewake() initializes GuC
submission via xe_uc_init_post_hwconfig() -> xe_guc_submit_init(), creates
kernel exec queues in xe_gsc_init_post_hwconfig() and xe_migrate_init(),
and calls xe_uc_load_hw() to enable GuC CT communication, submit WA/NOP
jobs in xe_gt_record_default_lrcs(), enable GuC submission in
xe_guc_post_load_init(), and start async GSC loading in
xe_gsc_load_start(). However, gt->initialized is not set to true until the
end of xe_gt_init().

In addition, xe_device_probe() calls xe_irq_install() (which schedules
tile->csc_hw_error_work in xe_hw_error_init()) before the xe_gt_init()
loop, and commit ("drm/xe/ras: Move xe_ras_process_errors() to xe_ras")
calls xe_ras_process_errors() in xe_ras_init() prior to xe_gt_init().

If xe_device_declare_wedged() is called while gt->initialized is still
false=E2=80=94for example, if gt_reset_worker() fails during
gt_init_with_all_forcewake():

drivers/gpu/drm/xe/xe_gt.c:gt_reset_worker() {
    ...
err_out:
	xe_force_wake_put(gt_to_fw(gt), fw_ref);
	XE_WARN_ON(xe_uc_start(&gt->uc));

err_fail:
	xe_log_err_fatal(gt, GT, err, "reset failed\n");
	xe_device_declare_wedged(gt_to_xe(gt));
    ...
}

or via csc_hw_error_work or xe_mert_irq_handler() during
xe_gt_record_default_lrcs()=E2=80=94then xe_device_declare_wedged() sets
xe->wedged.flag =3D 1 globally, but for_each_initialized_gt() skips gt.

When that happens, xe_uc_reset_prepare() and gt_wedge_worker() never run on
gt: guc->submission_state.stopped remains 0, xe_uc_fw_is_running(&guc->fw)
remains true, and GuC CT is not stopped, while __guc_ct_send_locked()
rejects all H2G messages with -ENOTRECOVERABLE due to xe_device_wedged(xe).
Any registered kernel exec queue cleaned up via xe_exec_queue_put() ->
__guc_exec_queue_process_msg_cleanup() enters
disable_scheduling_deregister(), where wait_event_timeout() on guc->ct.wq
is not woken by xe_guc_read_stopped(guc) and xe_guc_ct_send() drops the
GUC_CONTEXT_DISABLE H2G with -ENOTRECOVERABLE.

Similarly, if xe_device_declare_wedged() is triggered after
xe_gt_record_default_lrcs() completes (such as during non-fatal
xe_huc_auth(), xe_gsc_load_start(), xe_gt_record_user_engines(),
xe_eu_stall_init(), xe_gt_sriov_vf_init(), or on another GT), xe_gt_init()
finishes without checking xe_device_wedged(xe) and sets gt->initialized =3D
true with xe->wedged.flag =3D=3D 1 while xe_gt_declare_wedged() was never
called on that GT (and with commit "drm/xe: Make xe_device_declare_wedged()
IRQ safe", subsequent xe_device_declare_wedged() calls return early on
atomic_xchg(&xe->wedged.flag, 1) without wedging the GT).

> @@ -1204,6 +1212,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>  	return NULL;
>  }
> =20
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt =3D container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +}
> +
>  /**
>   * xe_gt_declare_wedged() - Declare GT wedged
>   * @gt: the GT object
> @@ -1213,8 +1230,12 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>   */
>  void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
> -	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	xe_gt_assert(gt, xe->wedged.mode);
> +	xe_uc_reset_prepare(&gt->uc);
> +
> +	xe_pm_runtime_get_noresume(xe);
> +	if (!queue_work(gt->ordered_wq, &gt->wedge.worker))
> +		xe_pm_runtime_put(xe);
>  }

[Severity: High]
Does setting xe->wedged.flag =3D 1 and calling xe_uc_reset_prepare()
synchronously while deferring xe_uc_declare_wedged() to gt->ordered_wq race
with TDR and exec queue cleanup?

In xe_device_declare_wedged() -> xe_gt_declare_wedged(), xe->wedged.flag is
set to 1 (causing __guc_ct_send_locked() and g2h_read() to fail with
-ENOTRECOVERABLE) and xe_uc_reset_prepare() synchronously sets
guc->submission_state.stopped =3D 1 and wakes guc->ct.wq. Meanwhile,
xe_uc_declare_wedged() -> xe_guc_declare_wedged() -> xe_guc_submit_wedge()
is queued on the single-threaded gt->ordered_wq behind any currently
executing or pending guc_exec_queue_timedout_job() TDR works.

In XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET, when
guc_exec_queue_timedout_job() calls guc_submit_hint_wedged() ->
xe_device_declare_wedged(), gt_wedge_worker() is queued behind the running
TDR on gt->ordered_wq. Before gt_wedge_worker() can run,
guc_exec_queue_timedout_job() signals all pending job fences via
xe_sched_job_set_error(), restarts the per-queue sched->base.submit_wq via
xe_sched_submission_start(), and queues TDR cleanup via
xe_guc_exec_queue_trigger_cleanup().

On sched->base.submit_wq, drm_sched_free_job_work() frees the signaled jobs
and drops their exec_queue references. If the last reference is dropped
before gt_wedge_worker() executes, guc_exec_queue_destroy() queues CLEANUP
on sched->base.submit_wq:

drivers/gpu/drm/xe/xe_guc_submit.c:__guc_exec_queue_process_msg_cleanup() {
    ...
	if (bound && !exec_queue_wedged(q) && exec_queue_registered(q) &&
	    xe_uc_fw_is_running(&guc->fw))
		disable_scheduling_deregister(guc, q);
	else
		guc_exec_queue_destroy_async(q);
    ...
}

Because gt_wedge_worker() has not run yet, !exec_queue_wedged(q) and
xe_uc_fw_is_running(&guc->fw) are still true, so it calls
disable_scheduling_deregister(guc, q). Inside
disable_scheduling_deregister(), wait_event_timeout() on guc->ct.wq wakes
immediately with ret > 0 because xe_uc_reset_prepare() already set
xe_guc_read_stopped(guc) to 1. It then sets EXEC_QUEUE_STATE_PENDING_DISABLE
and EXEC_QUEUE_STATE_DESTROYED and calls xe_guc_ct_send(), which fails with
-ENOTRECOVERABLE because xe->wedged.flag is 1.

When gt_wedge_worker() finally runs xe_guc_submit_wedge(), q->refcount is
already 0 so xe_exec_queue_get_unless_zero(q) fails, and
xe_guc_submit_stop() is not called in XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET.
As a result, guc_exec_queue_destroy_async(q) is never invoked, leaving
xef->exec_queue.pending_removal permanently elevated (hanging
show_run_ticks() in wait_var_event()) and triggering
xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q)) if the queued
work_tdr runs on gt->ordered_wq.

In XE_WEDGED_MODE_UPON_CRITICAL_ERROR, any in-flight or already-queued
guc_exec_queue_timedout_job() on gt->ordered_wq ahead of gt_wedge_worker()
sees:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
    ...
	if (!exec_queue_killed(q))
		wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
	else
		wedged =3D xe_device_wedged(xe);
    ...
			if (!ret || xe_guc_read_stopped(guc))
				goto trigger_reset;
    ...
}

Because xe_guc_submit_pause_abort() in gt_wedge_worker() has not set
exec_queue_killed(q) yet, guc_submit_hint_wedged() returns false even
though xe_device_wedged(xe) is true. It then wakes from
wait_event_timeout(guc->ct.wq, ...) with xe_guc_read_stopped(guc) =3D=3D 1 =
and
takes the goto trigger_reset branch, capturing a "Schedule disable failed to
respond" devcoredump and jumping to rearm instead of completing the
timed-out job.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020023641.2006=
58-1-raag.jadav@intel.com?part=3D1
