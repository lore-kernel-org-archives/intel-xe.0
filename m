Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A6CCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 04:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3CA10E2DD;
	Sat, 17 Oct 2026 04:24:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7213D10E2DD
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 04:24:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D263439C5;
 Sat, 17 Oct 2026 04:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FEF1F000C4;
 Sat, 17 Oct 2026 04:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792211091;
 bh=hEm8+okrpd2PijP0uKVrqM+ekzy7uAca8w2jUBBY5/0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=V4SauNwUuDFNkk1rowFKSF5rFZqgYHzK18eOyVe4sxU/S2qKsNfVFB/IPuukL6eEG
 Aa5JYuKiO/Bm3x+IfW5X+5r3oIrRQa2zC2d5+RCVcRRKIzUDa7ICZoBLfO8GkENN0e
 4brUszHQR0BwBlLwgLOnNoTLTUm74Owl/W813N49X/KyKff09o7gOCfGFf/ubG9O8O
 RfKUQTZ6Y3LmjlYXzT4ibU3aHuKmSUhXh5S+lwrZeRryDK+I/ahuE1HugcXt+NbxPl
 esauPD9L4Hm2HeSDUzZNRreeuJk2JzIxHRUDtzAyQ6vD4vyN4g8Qlmpgs5Lfhc2scp
 su+ewHAjT1C/Q==
Message-ID: <sashiko-outbox-175288@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261017034842.67054-2-raag.jadav@intel.com>
References: <20261017034842.67054-1-raag.jadav@intel.com>
 <20261017034842.67054-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 04:24:51 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe/gt: deferring wedge in xe_gt_declare_wedged() behind TDR on=
 ordered_wq
- [High] drm/xe/gt: gt_wedge_worker() disabled after GuC and engine devm te=
ardown
- [Medium] drm/xe/gt: missed GT wedge when xe_device_declare_wedged() races=
 with xe_gt_init()
--

commit 7ffca021de25c270cc3b55226256fb5d40b620c4
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit defers GT wedge handling to a worker queued on gt->ordered_wq
and introduces for_each_initialized_gt() so xe_device_declare_wedged() only
wedges initialized GTs.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc9bf6f0b5a79..f084efbb1fcf6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -724,6 +726,9 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt =3D arg;
>  	int i;
> =20
> +	if (disable_work_sync(&gt->wedge.worker))
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +
>  	gt_reset_worker_disable(gt);
> =20
>  	for (i =3D 0; i < XE_ENGINE_CLASS_MAX; ++i)

[Severity: High]
Does disabling gt->wedge.worker in xe_gt_fini() happen too late during
devres teardown?

In xe_gt_init(), xe_gt_fini() is registered via devm_add_action_or_reset()
before gt_init_with_gt_forcewake() and gt_init_with_all_forcewake():

drivers/gpu/drm/xe/xe_gt.c:xe_gt_init() {
	...
	err =3D devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
	if (err)
		return err;
	...
	err =3D gt_init_with_gt_forcewake(gt);
	...
	err =3D gt_init_with_all_forcewake(gt);
}

Inside gt_init_with_all_forcewake(), gt_reset_worker_disable() is
registered last so that devres drains gt->reset.worker before tearing down
GuC submission and hardware state:

drivers/gpu/drm/xe/xe_gt.c:gt_init_with_all_forcewake() {
	...
	/* Last action registered here so devres drains resets before teardown */
	err =3D devm_add_action_or_reset(xe->drm.dev, gt_reset_worker_disable, gt);
	if (err)
		return err;
}

Because devres runs cleanup actions in reverse registration order,
disable_work_sync(&gt->wedge.worker) in xe_gt_fini() runs after
gt_reset_worker_disable(), guc_submit_fini(), guc_action_disable_ct(),
hw_engine_fini(), and guc_fini_hw().

If gt->wedge.worker is pending when teardown begins (or is queued by a
failing gt_reset_worker() while gt_reset_worker_disable() drains it),
gt_wedge_worker() can run concurrently with or after guc_submit_fini() and
guc_fini_hw().

In XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET, xe_guc_submit_wedge() can then
acquire references on queues in guc->submission_state.exec_queue_lookup
after guc_submit_fini() has already finished its loop dropping wedged queue
references, leaking those xe_exec_queue references and triggering the
xa_empty(&guc->submission_state.exec_queue_lookup) assert in
guc_submit_sw_fini():

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
	...
	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
		mutex_lock(&guc->submission_state.lock);
		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
			if (xe_exec_queue_get_unless_zero(q))
				set_exec_queue_wedged(q);
		mutex_unlock(&guc->submission_state.lock);
	}
}

In XE_WEDGED_MODE_UPON_CRITICAL_ERROR, gt_wedge_worker() can also access
GuC CT and submission state after guc_action_disable_ct(),
guc_submit_fini(), and guc_fini_hw() have already torn them down.

Should gt->wedge.worker be disabled alongside gt->reset.worker in
gt_reset_worker_disable() before GuC and engine teardown?

> @@ -784,6 +789,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }
> =20

[Severity: Medium]
What happens if xe_device_declare_wedged() is called while xe_gt_init() is
still in progress?

During xe_gt_init(), gt_init_with_gt_forcewake() and
gt_init_with_all_forcewake() initialize GuC submission, create the
migration and default-LRC kernel exec queues, enable GuC CT communication,
and start async GSC work before gt->initialized is set to true at the end
of xe_gt_init(). Hardware interrupts are also already installed earlier in
xe_device_probe(), and on multi-GT devices earlier GTs may already be
initialized and active while a subsequent GT is inside xe_gt_init().

If xe_device_declare_wedged() runs during this window (for example from
mert_handle_cat_error(), csc_hw_error_work(), gsc_work(), or a timed-out
kernel job), for_each_initialized_gt() in xe_device_declare_wedged() sees
READ_ONCE(gt->initialized) =3D=3D false and skips xe_gt_declare_wedged(gt):

drivers/gpu/drm/xe/xe_device.c:xe_device_declare_wedged() {
	...
	for_each_initialized_gt(gt, xe, id)
		xe_gt_declare_wedged(gt);
}

When xe_gt_init() then finishes and sets WRITE_ONCE(gt->initialized, true)
without checking xe_device_wedged(xe), could that GT miss
xe_gt_declare_wedged() entirely, leaving its GuC CT enabled, GuC firmware
running, and kernel exec queues unwedged?

> @@ -1204,6 +1211,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
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
> @@ -1213,8 +1229,11 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
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
> +
> +	xe_pm_runtime_get_noresume(xe);
> +	if (!queue_work(gt->ordered_wq, &gt->wedge.worker))
> +		xe_pm_runtime_put(xe);
>  }

[Severity: High]
Can queueing gt->wedge.worker onto gt->ordered_wq break TDR handling in
guc_exec_queue_timedout_job(), since TDR also runs on gt->ordered_wq?

In guc_exec_queue_init(), every GuC exec queue's DRM scheduler sets
timeout_wq to gt->ordered_wq, which is a single-threaded ordered workqueue.
When guc_exec_queue_timedout_job() runs on gt->ordered_wq, any work queued
onto gt->ordered_wq cannot execute until guc_exec_queue_timedout_job() (and
any other pending TDR items ahead of it) finishes.

In XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET, guc_exec_queue_timedout_job()
calls guc_submit_hint_wedged() -> xe_device_declare_wedged() ->
xe_gt_declare_wedged():

drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_hint_wedged() {
	...
	if (xe->wedged.mode !=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
		return false;

	if (xe_device_wedged(xe))
		return true;

	xe_device_declare_wedged(xe);

	return true;
}

Previously, xe_gt_declare_wedged() synchronously ran xe_uc_declare_wedged()
-> xe_guc_declare_wedged() -> xe_guc_submit_wedge(), which stopped GuC CT,
took a reference on every registered queue via
xe_exec_queue_get_unless_zero(q), and marked each queue with
set_exec_queue_wedged(q) before returning to guc_exec_queue_timedout_job().

With gt_wedge_worker() queued behind guc_exec_queue_timedout_job() on
gt->ordered_wq, guc_exec_queue_timedout_job() proceeds to signal job fences
and call xe_sched_submission_start(sched) and
xe_guc_exec_queue_trigger_cleanup(q) before xe_guc_submit_wedge() has run:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
	...
	if (!exec_queue_killed(q))
		wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
	else
		wedged =3D xe_device_wedged(xe);
	...
	} else {
		xe_sched_submission_start(sched);
		xe_guc_exec_queue_trigger_cleanup(q);
	}
}

Because sched->base.submit_wq is a separate workqueue from gt->ordered_wq,
__guc_exec_queue_process_msg_cleanup() and job freeing can run on another
CPU before gt_wedge_worker() runs on gt->ordered_wq:

drivers/gpu/drm/xe/xe_guc_submit.c:__guc_exec_queue_process_msg_cleanup() {
	...
	/* A wedged GuC won't answer the H2G, so tear down on the driver side. */
	if (bound && !exec_queue_wedged(q) && exec_queue_registered(q) &&
	    xe_uc_fw_is_running(&guc->fw))
		disable_scheduling_deregister(guc, q);
	else
		guc_exec_queue_destroy_async(q);
}

Since exec_queue_wedged(q) is still false and xe_uc_fw_is_running(&guc->fw)
is still true, won't __guc_exec_queue_process_msg_cleanup() call
disable_scheduling_deregister() and send H2G messages to the wedged GuC
instead of guc_exec_queue_destroy_async(), and allow q->refcount to drop to
zero before xe_guc_submit_wedge() can take its preservation reference?

Similarly, in XE_WEDGED_MODE_UPON_CRITICAL_ERROR, unlike
xe_gt_reset_async() (which calls xe_uc_reset_prepare(&gt->uc) synchronously
before queueing gt->reset.worker so guc->submission_state.stopped wakes
any waiters on guc->ct.wq), xe_gt_declare_wedged() defers
xe_guc_reset_prepare() into gt_wedge_worker().

If xe_device_declare_wedged() is called while guc_exec_queue_timedout_job()
is running or queued ahead of gt->wedge.worker on gt->ordered_wq, won't
guc_exec_queue_timedout_job() block gt_wedge_worker() from setting
guc->submission_state.stopped, causing TDR to either stall for 5 seconds in
wait_event_timeout(guc->ct.wq, ..., HZ * 5) and trigger a spurious GT
reset, or deadlock in xe_sched_submission_stop() ->
cancel_work_sync(&sched->work_process_msg) if
__guc_exec_queue_process_msg_suspend() is sleeping in
wait_event(guc->ct.wq, ...) waiting for xe_guc_read_stopped(guc)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017034842.6705=
4-1-raag.jadav@intel.com?part=3D1
