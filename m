Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78C606A32D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0rknoJe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE0510E4C0;
	Fri,  6 Nov 2026 22:59:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03B10E4C0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:59:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BA30340DF0;
 Fri,  6 Nov 2026 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829151F0089F;
 Fri,  6 Nov 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794005989;
 bh=VayCsNoqZYkcTONc+scHkZ5oO1O7AKM7e6KPK5ed/68=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=J0rknoJeq9E++0UOUnoUa2WuKpsLruwJiC6ln4hikgCSBRF1X3caNHv6gfhftlzZd
 hs+9rkxGzz5+RGsLOj17DQiAMXZkYGphQPGEWkBWHMorkBcGt+Lzb9+yWk+gAGHt+K
 24ZYstFD3+52EPrzgcy6XWO6mXbGeSSlJiYtlbmzM7u+dvMTAmWplmGl6KbthiUTet
 dUnFYLrOxPaDzjJATD+mVDZ4/38ooFGcglhBq4uUq7gmZuQ/1aGKCu4sm3nfHhyII8
 cQTelqtmb+GRZm3xxEJZ2rpW5SbSmlkUDzbhuiCb96L8XhgmX9F3HVgkfANTELnWJo
 h3YpRJgbHi1Ig==
Message-ID: <sashiko-outbox-202344@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe/wedge: add fault inspection with debugfs
 release
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106221323.1207676-2-daniel.charles@intel.com>
References: <20261106221323.1207676-1-daniel.charles@intel.com>
 <20261106221323.1207676-2-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 22:59:49 +0000
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

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] drm/xe: missing mode-3 checks in
  guc_exec_queue_timedout_job()
- [Medium] drm/xe/wedge: missing FLR and broken wedge state after
  wedge_pause_work()
- [Medium] drm/xe/wedge: missing pause_stopped checks in
  xe_wedge_set_mode()
- [Medium] drm/xe: duplicate queue ref in xe_guc_submit_wedge() after
  mode-3 pause
- [Low] drm/xe/wedge: broken policy update check and rollback in
  xe_wedge_set_mode()
- [Low] drm/xe/wedge: missing FLR flag and GuC RC teardown guard after
  mode-3 pause
--

commit 44e633b18166bf25e1f914f245380a402b7d4114
Author: Alan Previn <alan.previn.teres.alexis@intel.com>

drm/xe/wedge: add fault inspection with debugfs release

This commit adds wedged_mode=3D3 to stop GT submission on a fault without
resetting engines and wait for a debugfs skip or continue response.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e7c2778029ca..30adaf9900cb7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1424,7 +1424,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> =20
> -	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> +	xe_gt_assert(guc_to_gt(guc), READ_ONCE(guc_to_xe(guc)->wedged.mode));
> =20
>  	/*
>  	 * If device is being wedged even before submission_state is
> @@ -1433,7 +1433,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (!guc->submission_state.initialized)
>  		return;
> =20
> -	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
>  		mutex_lock(&guc->submission_state.lock);
>  		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>  			if (xe_exec_queue_get_unless_zero(q))

[Severity: Medium]
Can xe_guc_submit_wedge() take a duplicate reference on every queue in
exec_queue_lookup?

In mode 3, wedge_pause_work() -> xe_gt_wedge_pause() calls
xe_guc_submit_wedge() while leaving xe_wedged(xe) false during inspection
and after XE_WEDGE_REPLY_SKIP.  If prepare_device_for_reset() later runs (f=
or
example from xe_pci_error_detected()), it checks only xe_wedged(xe) and cal=
ls
xe_gt_wedge_declare() on every GT, running xe_guc_submit_wedge() a second
time.  Because set_exec_queue_wedged(q) is not guarded by
!exec_queue_wedged(q) and guc_submit_fini() only calls xe_exec_queue_put(q)
once per wedged entry, every wedged xe_exec_queue and its drm_device
reference are leaked.

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

[Severity: Medium]
Should the killed-queue branch also check
atomic_read(&xe->wedged.declare_pending) and exec_queue_wedged(primary),
matching the trigger_reset guard below?

If a killed queue times out in mode 3 while declare_pending is 1 (before
wedge_pause_work() marks q wedged) or on a secondary queue in a multi-queue
group, wedged remains false.  guc_exec_queue_timedout_job() then calls
disable_scheduling(primary, skip_timeout_check) during inspection, and if
primary is not enabled/pending_disable or disable_scheduling() completes
before GuC CT stops, a killed kernel queue reaches timeout_needs_gt_reset()
and triggers xe_gt_reset_async(q->gt).

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 2f35937c5e661..8bfe0e2775d29 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c

[ ... ]

> +	for_each_initialized_gt(gt, xe, id)
> +		xe_gt_wedge_pause(gt);
> +	WRITE_ONCE(xe->wedged.pause_stopped, true);

[Severity: Low]
Does stopping the GTs here without setting xe->needs_flr_on_fini =3D true s=
kip
Driver-FLR and GuC RC teardown checks when inspection exits via
XE_WEDGE_REPLY_SKIP or driver teardown?

When wedge_declare_now() is not called, xe->needs_flr_on_fini stays unset (=
if
GSC firmware was not loaded) and xe_wedged(xe) stays false, so on unbind
xe_driver_flr_fini() skips FLR on the unreset hardware and
xe_guc_rc_fini_hw() attempts to send H2G over the stopped GuC CT, failing
with -ECANCELED before xe_gt_idle_disable_c6().

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

[Severity: Medium]
Can releasing inspection with XE_WEDGE_REPLY_SKIP hang fdinfo readers and
suspend paths by clearing declare_pending while GTs remain stopped and
queues remain wedged?

On XE_WEDGE_REPLY_SKIP, xe_wedged(xe) remains false and clearing
declare_pending re-opens xe_drm_ioctl().  Destroying a wedged queue via
xe_exec_queue_destroy_ioctl() increments xef->exec_queue.pending_removal,
which never drops to 0 until driver unload because xe_guc_submit_wedge()
still holds a reference on the queue, causing show_run_ticks() to sleep
forever on wait_var_event(&xef->exec_queue.pending_removal).  In addition,
creating and destroying a new queue while xe_guc_read_stopped(guc) is 1
leaks a runtime PM reference (MSG_PM_REF) because guc_exec_queue_init() sto=
ps
the scheduler, and dropping the runtime PM reference at put_runtime_ref
allows suspend to call xe_guc_submit_reset_wait(), which blocks forever in
wait_event(guc->ct.wq, xe_wedged(xe) || !xe_guc_read_stopped(guc)).

[ ... ]

> @@ -160,11 +352,11 @@ static bool wedge_mode_needs_policy_update(struct x=
e_device *xe, enum xe_wedged_
>  	if (xe->wedged.inconsistent_reset)
>  		return true;
> =20
> -	if (xe->wedged.mode =3D=3D mode)
> +	if (READ_ONCE(xe->wedged.mode) =3D=3D mode)
>  		return false;
> =20
> -	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> -	    mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)) ||
> +	    xe_wedge_is_hanging_on_any(mode))
>  		return true;
> =20
>  	return false;

[Severity: Low]
Should wedge_mode_needs_policy_update() compare
xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)) !=3D
xe_wedge_is_hanging_on_any(mode) instead of using ||?

Using || returns true when switching between mode 2 and mode 3 even though
both modes set enable_engine_reset =3D false, waking the device and sending=
 a
redundant policy H2G to each GT.  Also, in xe_wedge_set_mode(), if the
rollback call wedge_mode_set_reset_policy(xe, old_mode) fails on GT0 (id =
=3D=3D
0) after all GTs were already updated to mode's policy,
wedge_mode_set_reset_policy() only sets inconsistent_reset =3D true when
id > 0, leaving inconsistent_reset false while the GTs retain the wrong res=
et
policy.

[ ... ]

> @@ -216,20 +408,46 @@ static int wedge_mode_set_reset_policy(struct xe_de=
vice *xe, enum xe_wedged_mode
>   */
>  int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
>  {
> +	unsigned long flags;
> +	enum xe_wedged_mode old_mode;
> +	bool update_policy;
>  	int ret;
> =20
>  	ret =3D wedge_validate_mode(xe, mode);
>  	if (ret)
>  		return ret;
> =20
> -	if (wedge_mode_needs_policy_update(xe, mode)) {
> +	mutex_lock(&xe->wedged.mode_mutex);
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	if (atomic_read(&xe->wedged.declare_pending) || READ_ONCE(xe->wedged.sh=
utting_down)) {
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +	old_mode =3D READ_ONCE(xe->wedged.mode);
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +
> +	update_policy =3D wedge_mode_needs_policy_update(xe, mode);
> +	if (update_policy) {
>  		ret =3D wedge_mode_set_reset_policy(xe, mode);
>  		if (ret)
> -			return ret;
> +			goto out_unlock;
>  	}
> =20
> -	xe->wedged.mode =3D mode;
> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
> +	if (atomic_read(&xe->wedged.declare_pending)) {
> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
> +		ret =3D update_policy ? wedge_mode_set_reset_policy(xe, old_mode) : 0;
> +		if (!ret)
> +			ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +	WRITE_ONCE(xe->wedged.mode, mode);
> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);

[Severity: Medium]
Does xe_wedge_set_mode() allow changing wedged.mode after mode-3 inspection
has stopped the GTs or while a wedge is already in progress?

xe_wedge_set_mode() only checks declare_pending and shutting_down, without
checking pause_stopped, pause_failed, or xe_wedged(xe), and wedge_request()
passes gts_already_wedged =3D false whenever mode !=3D 3.  If wedged.mode is
changed to 1 or 2 after XE_WEDGE_REPLY_SKIP (when pause_stopped is true), a
subsequent xe_wedge_declare() calls xe_gt_wedge_declare() on GTs that were
already wedged by xe_gt_wedge_pause(), causing xe_guc_submit_wedge() to take
a second leaked reference on every queue in exec_queue_lookup, while a kill=
ed
queue timing out in guc_exec_queue_timedout_job() hits an infinite 0-ms TDR
loop because wedged is false and xe_guc_read_stopped(guc) is 1.  Changing
wedged.mode to 0 while gt->wedge.worker is pending in modes 1 or 2 also
triggers xe_gt_assert(gt, READ_ONCE(xe->wedged.mode)) in gt_wedge_worker(),
and rolling back the policy at wedge_mode_set_reset_policy(xe, old_mode) wh=
en
declare_pending is set races with wedge_pause_work() stopping GuC CT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106221323.1207=
676-1-daniel.charles@intel.com?part=3D1
