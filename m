Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3B606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZqaRkNl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5510E134;
	Mon,  2 Nov 2026 21:27:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C6210E4EB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:27:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F518600D1;
 Mon,  2 Nov 2026 21:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4941F00A16;
 Mon,  2 Nov 2026 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793654864;
 bh=NDkEf3PsfLoKSYdOz0KQSOe06nLHbYgrJfEnSf0DMZQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SZqaRkNl052L5EU31vtDhaT8YAaq/ZysqS+7zm1xHgTDhFs9Pkp10dx7MmZtYo9lr
 ZXoYtSPJbLx9lcgg8IvoSd03ZNXmmjFtgevyfOdflM16jmrQ3HEgD70nImcVjdQBAQ
 rL1wnykAEEMzW66St/K4O+vOjdBMXEZ6j+CoOqiH53scSSz0lla4rK3P2MC3LUcYmi
 k+TvUmkZBikfjty//t5G6qf44z5mH78Ye3HS20m8bSPFYnRkPyTHPJ49YRgXfVcU4i
 phWh4Bnxg6pXul8PaandSz0ix5RmhTAM9jkErRpB4Mxp51TgovuY9pP+reqoZ4NPJr
 dWPbEo1Iw/GUw==
Message-ID: <sashiko-outbox-194199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe/wedge: add fault inspection with debugfs
 release
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102210242.635207-2-daniel.charles@intel.com>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-2-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 21:27:44 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/xe/wedge: exec_queue ref leak on repeated xe_guc_submit_wedge()
- [High] drm/xe/wedge: suspend deadlock and RPM corruption after mode-3 skip
- [Medium] drm/xe/wedge: GT reset race in xe_gt_wedge_pause() and gt_reset_=
worker()
- [Medium] drm/xe/wedge: teardown race on shutting_down in xe_wedge_prepare=
_fini()
--

commit efc71b82b1b8d7ea492bbcdc755faa39da7e7570
Author: Alan Previn <alan.previn.teres.alexis@intel.com>

drm/xe/wedge: add fault inspection with debugfs release

This commit introduces wedged_mode=3D3 to pause GT submission and block new
Xe ioctls after a hang so hardware state can be inspected before releasing
via debugfs. It extends the GuC no-reset policy to cover mode 3 and adds a
worker that waits for a skip or continue command from wedged_pause_resume.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index be79a0da2f2ff..1633b203255a3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1207,10 +1207,25 @@ void xe_gt_wedge_declare(struct xe_gt *gt)
[ ... ]
> +void xe_gt_wedge_pause(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, READ_ONCE(gt_to_xe(gt)->wedged.mode) =3D=3D
> +		     XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE);
> +	xe_uc_reset_prepare(&gt->uc);
> +	xe_uc_wedge_declare(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e7c2778029ca..57e258283935a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1424,7 +1424,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
[ ... ]
> @@ -1433,7 +1433,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (!guc->submission_state.initialized)
>  		return;
> =20
> -	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
>  		mutex_lock(&guc->submission_state.lock);
>  		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>  			if (xe_exec_queue_get_unless_zero(q))
[ ... ]
> @@ -1672,7 +1672,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  	if (!exec_queue_killed(q))
>  		wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
>  	else
> -		wedged =3D xe_wedged(xe);
> +		wedged =3D xe_wedged(xe) ||
> +			 (READ_ONCE(xe->wedged.mode) =3D=3D
> +			  XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
> +			  exec_queue_wedged(q));
> =20
>  	/*
>  	 * Only tag as GPU hang if this is the original timeout, not a
> @@ -1726,6 +1729,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  			goto handle_vf_resume;
>  		if (!ret || xe_guc_read_stopped(guc)) {
>  trigger_reset:
> +			if (READ_ONCE(xe->wedged.mode) =3D=3D
> +			    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
> +			    (exec_queue_wedged(q) || exec_queue_wedged(primary))) {
> +				wedged =3D true;
> +				goto complete_jobs;
> +			}
>  			if (!ret)
>  				xe_gt_warn(guc_to_gt(guc),
>  					   "Schedule disable failed to respond, guc_id=3D%d",

[Severity: Medium]
Can a concurrent job timeout on a killed queue still trigger a full hardware
GT reset during mode-3 inspection?

In xe_gt_wedge_pause(), xe_uc_reset_prepare() runs first, setting
guc->submission_state.stopped =3D 1 and waking guc->ct.wq. Then
xe_uc_wedge_declare() -> xe_guc_wedge_declare() calls xe_guc_ct_stop(),
which takes ct->lock and sleeps in cancel_work_sync() before
xe_guc_submit_wedge() sets EXEC_QUEUE_STATE_WEDGED on the queues:

xe_gt_wedge_pause()
  xe_uc_reset_prepare()
    xe_guc_reset_prepare()
      xe_guc_submit_reset_prepare() /* sets stopped =3D 1, wakes guc->ct.wq=
 */
  xe_uc_wedge_declare()
    xe_guc_wedge_declare()
      xe_guc_ct_stop()              /* sleeps in cancel_work_sync() */
      xe_guc_submit_wedge()         /* sets EXEC_QUEUE_STATE_WEDGED */

If a killed queue is concurrently waiting in guc_exec_queue_timedout_job()
on guc->ct.wq, it wakes up as soon as xe_guc_read_stopped(guc) becomes true
and jumps to trigger_reset before xe_guc_submit_wedge() has marked the
queues wedged (and similarly if a killed queue enters
guc_exec_queue_timedout_job() after declare_pending is set but before
xe_guc_submit_wedge() runs). At trigger_reset, both exec_queue_wedged(q)
and exec_queue_wedged(primary) are still false, so it falls through to
xe_gt_reset_async(primary->gt).

In addition, gt_reset_worker() in drivers/gpu/drm/xe/xe_gt.c only checks
xe_wedged(gt_to_xe(gt)):

drivers/gpu/drm/xe/xe_gt.c:gt_reset_worker() {
	...
	if (xe_wedged(gt_to_xe(gt)))
		goto err_pm_put;
	...
}

Since xe_wedged(xe) remains false during mode-3 inspection and after a
skip reply, wouldn't gt_reset_worker() proceed to run do_gt_reset() and
do_gt_restart(), wiping out the fault state under inspection?

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 2f35937c5e661..c22c3544adcaa 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
[ ... ]
> +static void wedge_pause_work(struct work_struct *work)
> +{
[ ... ]
> +	for_each_initialized_gt(gt, xe, id)
> +		xe_gt_wedge_pause(gt);
> +
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	WRITE_ONCE(xe->wedged.reply, 0);
> +	xe->wedged.wait_active =3D true;
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +
> +	xe_err(xe, "GT submission stopped for mode-3 hardware debugging.\n"
> +	       "New DRM ioctls are blocked while waiting for 'wedged_pause_resu=
me'.\n"
> +	       "Skip: 0x%08x; continue into permanent wedge: 0x%08x.\n"
> +	       "Skip does not restart GTs or recover the fault.\n",
> +	       XE_WEDGE_REPLY_SKIP, XE_WEDGE_REPLY_CONTINUE);
> +
> +	wait_event_idle(xe->wedged.pause_waitq,
> +			wedge_reply_ready(xe) || READ_ONCE(xe->wedged.shutting_down));
> +
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	xe->wedged.wait_active =3D false;
> +	reply =3D READ_ONCE(xe->wedged.reply);
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +
> +	if (!READ_ONCE(xe->wedged.shutting_down) && reply =3D=3D XE_WEDGE_REPLY=
_CONTINUE)
> +		wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true);
> +	else
> +		xe_info(xe, "Inspection released without permanent wedge; GTs remain s=
topped\n");
> +put_runtime_ref:
> +	xe_pm_runtime_put(xe);
> +clear_pending:
> +	atomic_set(&xe->wedged.declare_pending, 0);
> +}

[Severity: High]
What happens if system suspend or runtime suspend runs during mode-3
inspection or after XE_WEDGE_REPLY_SKIP?

In wedge_pause_work(), xe_gt_wedge_pause() calls xe_uc_reset_prepare(),
which sets guc->submission_state.stopped =3D 1, and xe_uc_wedge_declare(),
which stops GuC CT and marks queues wedged. However, while waiting in
wait_event_idle(), or after the user writes XE_WEDGE_REPLY_SKIP,
wedge_declare_now() is not called, so xe_wedged(xe) remains false and
xe->needs_flr_on_fini is not set. On XE_WEDGE_REPLY_SKIP, wedge_pause_work()
also drops its runtime PM reference at put_runtime_ref.

If system suspend runs while paused or after XE_WEDGE_REPLY_SKIP (or D3cold
runtime suspend runs after the runtime PM reference is dropped),
xe_gt_suspend() -> xe_uc_suspend() -> uc_reset_wait() -> xe_guc_reset_wait()
calls xe_guc_submit_reset_wait():

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_reset_wait() {
	wait_event(guc->ct.wq, xe_wedged(guc_to_xe(guc)) ||
		   !xe_guc_read_stopped(guc));
}

Because xe_wedged(xe) is false and xe_guc_read_stopped(guc) stays 1
permanently, won't xe_guc_submit_reset_wait() (and the loop in
uc_reset_wait()) sleep uninterruptibly forever?

Also, on platforms where D3cold is disallowed, dropping the runtime PM
reference on XE_WEDGE_REPLY_SKIP allows xe_pm_runtime_suspend() ->
xe_gt_runtime_suspend() -> xe_guc_ct_runtime_suspend() to hit the
g2h->info.space =3D=3D credits assert if any G2H credits were outstanding, =
and
a subsequent xe_pm_runtime_resume() -> xe_guc_runtime_resume() will re-enab=
le
GuC CT and submission even though GTs are supposed to remain stopped.

> +
> +static void wedge_request(struct xe_device *xe, unsigned long method, bo=
ol mode3_only)
> +{
> +	unsigned long flags;
> +	enum xe_wedged_mode mode;
> +	bool pm_ref;
> +
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	mode =3D READ_ONCE(xe->wedged.mode);
> +	if (READ_ONCE(xe->wedged.shutting_down) ||
> +	    (mode3_only && mode !=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT=
_FOR_RELEASE)) {
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		return;
> +	}
> +
> +	if (mode !=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		wedge_declare_now(xe, method, false);
> +		return;
> +	}
> +
> +	if (atomic_read(&xe->wedged.declare_pending)) {
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		return;
> +	}
> +
> +	atomic_set(&xe->wedged.declare_pending, 1);
> +	pm_ref =3D xe_pm_runtime_get_if_active(xe);
> +	if (WARN_ON_ONCE(!queue_work(xe->wedged.pause_workqueue, &xe->wedged.pa=
use_work))) {
> +		xe_err(xe, "Mode-3 inspection work already queued\n");
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		if (pm_ref)
> +			xe_pm_runtime_put(xe);
> +		return;
> +	}
> +	xe->wedged.pause_pm_ref =3D pm_ref;
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +}

[Severity: High]
Does this leak xe_exec_queue references if xe_guc_submit_wedge() runs more
than once?

When wedge_pause_work() finishes, it resets xe->wedged.declare_pending to 0:

1. If the user writes XE_WEDGE_REPLY_SKIP, xe->wedged.flag remains 0 and
   declare_pending becomes 0, which also re-opens the ioctl gate in
   xe_drm_ioctl() while GTs remain stopped. Any subsequent timeout on
   another non-killed queue in guc_exec_queue_timedout_job() sees
   !exec_queue_killed(q) (since xe_guc_submit_wedge() only sets
   EXEC_QUEUE_STATE_WEDGED) and calls guc_submit_hint_wedged() ->
   xe_wedge_declare() -> wedge_request(), queueing wedge_pause_work() a
   second time.
2. Even if the user writes XE_WEDGE_REPLY_CONTINUE (setting
   xe->wedged.flag =3D 1), wedge_request() does not check xe_wedged(xe)
   before handling mode 3, so any later xe_wedge_declare() or
   xe_wedge_declare_mode3() call after declare_pending is cleared will
   queue wedge_pause_work() again.

Each run of wedge_pause_work() calls xe_gt_wedge_pause() ->
xe_uc_wedge_declare() -> xe_guc_wedge_declare() -> xe_guc_submit_wedge():

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
	...
	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
		mutex_lock(&guc->submission_state.lock);
		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
			if (xe_exec_queue_get_unless_zero(q))
				set_exec_queue_wedged(q);
		mutex_unlock(&guc->submission_state.lock);
	}
	...
}

Because xe_guc_submit_wedge() takes a new reference with
xe_exec_queue_get_unless_zero(q) without checking if exec_queue_wedged(q)
is already set, while guc_submit_fini() only calls xe_exec_queue_put(q) once
per wedged entry during teardown:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_fini() {
	...
	mutex_lock(&guc->submission_state.lock);
	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
		if (exec_queue_wedged(q)) {
			mutex_unlock(&guc->submission_state.lock);
			xe_exec_queue_put(q);
			mutex_lock(&guc->submission_state.lock);
		}
	}
	mutex_unlock(&guc->submission_state.lock);
}

won't every repeated call to xe_guc_submit_wedge() leak a reference on all
registered queues in exec_queue_lookup?

[ ... ]
> +void xe_wedge_prepare_fini(struct xe_device *xe)
> +{
> +	unsigned long flags;
> +	bool mode3;
> +
> +	mutex_lock(&xe->wedged.mode_mutex);
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	mode3 =3D READ_ONCE(xe->wedged.mode) =3D=3D
> +		XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE;
> +	if (mode3)
> +		WRITE_ONCE(xe->wedged.shutting_down, true);
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +	if (mode3 && xe->wedged.pause_workqueue) {
> +		wake_up_all(&xe->wedged.pause_waitq);
> +		flush_work(&xe->wedged.pause_work);
> +	}
> +	mutex_unlock(&xe->wedged.mode_mutex);
> +}

[Severity: Medium]
Why is xe->wedged.shutting_down only set when xe->wedged.mode is currently
mode 3?

xe_wedge_prepare_fini() is called at the start of xe_pci_remove() (before
drm_dev_unplug() removes debugfs), at the start of xe_device_shutdown()
(where debugfs is not removed), and in xe_device_probe() error cleanup
before drm_dev_unregister().

If xe->wedged.mode is not 3 when xe_wedge_prepare_fini() runs,
xe->wedged.shutting_down is left false. A concurrent write to the
wedged_mode debugfs file can then call xe_wedge_set_mode(), see
shutting_down =3D=3D false, and switch the device into mode 3 after
xe_wedge_prepare_fini() has already returned. Similarly, if
wedge_pause_work() clears declare_pending just before exit and a concurrent
xe_wedge_set_mode() changes wedged.mode away from 3 before
xe_wedge_prepare_fini() acquires mode_mutex, xe_wedge_prepare_fini() will
see mode3 =3D=3D false and skip flushing pause_work.

Should xe_wedge_prepare_fini() unconditionally set shutting_down =3D true a=
nd
flush pause_work whenever pause_workqueue is initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102210242.6352=
07-1-daniel.charles@intel.com?part=3D1
