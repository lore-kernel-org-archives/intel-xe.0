Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A6606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9bEt2M/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1D610E134;
	Mon,  2 Nov 2026 21:27:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836F710E134
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:27:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EC7A413CB;
 Mon,  2 Nov 2026 21:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DB21F00A16;
 Mon,  2 Nov 2026 21:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793654844;
 bh=O6CjHW14xuVH7oOHlf95p8WwIPTf2kIMPiUciU7I6y0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=R9bEt2M/oe3s383RS7jK6orkP/EeJ6ohoC6AkJXs68cD2kYduGfaCdki4hjHKraS9
 2eafcmv9ZScUw8U8aURxRI6sFmCDsTT59N6CpaUA84MF2G3hb15LNtiem2dBJItkFl
 nWshM5HQgf7LgxuXnIb3NtEl+9jnu1ZvRszVoSpM0vkKMPnWEWlhYj4kvVhtKGzQl2
 XjtFvsrhOWitqh7WBPMOz6T0GuqIuNtJFnpZ5GgewmO6Kxz9L6e6FTqc5qgnftwaWD
 wb/bzUATs9M+F+oTaOZNTiVVMGwSN/fAXsY9tR4iHSickG6s3tSBfqn6/olFSzeooy
 921HF9SVEOApQ==
Message-ID: <sashiko-outbox-194198@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/wedge: request inspection for additional
 fault paths
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102210242.635207-4-daniel.charles@intel.com>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-4-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 21:27:23 +0000
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
- [High] drm/xe: infinite TDR loop in xe_tlb_inval_fence_timeout() on abort=
ed pause
- [High] drm/xe: wedge_request() re-runs mode-3 pause after CONTINUE or SKIP
- [Medium] drm/xe: stale pause_failed in wedge_pause_work() blocks TLB insp=
ection
--

commit dd97fca485155b946444998386ef977057638b19
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe/wedge: request inspection for additional fault paths

This commit extends mode-3 wedge inspection to cover unsuccessful pagefault
service, GuC memory CAT errors, TLB invalidation fence timeouts, and
MMIO-enabled RAS reset requests. It also adds fallback handling for TLB
timeout inspection when runtime PM resume fails.

> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tl=
b_inval.c
> index 293929f92eb0f..ffb839c3b7524 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -17,6 +17,7 @@
>  #include "xe_printk.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_trace.h"
> +#include "xe_wedge.h"
> =20
>  /**
>   * DOC: Xe TLB invalidation
> @@ -84,15 +85,27 @@ static void xe_tlb_inval_fence_timeout(struct work_st=
ruct *work)
>  	int timedout_seqno =3D 0, seqno_recv =3D 0;
> =20
>  	spin_lock_irq(&tlb_inval->pending_lock);
> -	if (tlb_inval->debug_paused)
> -		goto out_unlock;
> +	if (tlb_inval->debug_paused) {
> +		if (!tlb_inval->debug_pause_pending)
> +			goto out_unlock;
> +		if (!READ_ONCE(xe->wedged.pause_failed))
> +			goto out_rearm;
> +		tlb_inval->debug_paused =3D false;
> +		tlb_inval->debug_pause_pending =3D false;
> +	}
>  	spin_unlock_irq(&tlb_inval->pending_lock);
> =20
>  	tlb_inval->ops->flush(tlb_inval);
> =20
>  	spin_lock_irq(&tlb_inval->pending_lock);
> -	if (tlb_inval->debug_paused)
> -		goto out_unlock;
> +	if (tlb_inval->debug_paused) {
> +		if (!tlb_inval->debug_pause_pending)
> +			goto out_unlock;
> +		if (!READ_ONCE(xe->wedged.pause_failed))
> +			goto out_rearm;
> +		tlb_inval->debug_paused =3D false;
> +		tlb_inval->debug_pause_pending =3D false;
> +	}
> =20
>  	list_for_each_entry_safe(fence, next,
>  				 &tlb_inval->pending_fences, link) {
> @@ -106,6 +119,17 @@ static void xe_tlb_inval_fence_timeout(struct work_s=
truct *work)
>  		drm_err(&xe->drm,
>  			"TLB invalidation fence timeout, seqno=3D%d recv=3D%d",
>  			fence->seqno, tlb_inval->seqno_recv);
> +		if (!READ_ONCE(xe->wedged.pause_failed))
> +			xe_wedge_declare_mode3(xe);
> +		if (!READ_ONCE(xe->wedged.pause_failed) &&
> +		    READ_ONCE(xe->wedged.mode) =3D=3D
> +		    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
> +		    atomic_read(&xe->wedged.declare_pending)) {
> +			tlb_inval->debug_paused =3D true;
> +			tlb_inval->debug_pause_pending =3D true;
> +			/* Keep timeout processing until inspection owns the pause. */
> +			goto out_rearm;
> +		}

[Severity: High]
Can xe_tlb_inval_fence_timeout() get stuck in an infinite out_rearm loop if
wedge_pause_work() exits without calling xe_tlb_inval_debug_pause() and
without setting xe->wedged.pause_failed?

When both tlb_inval->debug_paused and tlb_inval->debug_pause_pending are se=
t,
subsequent runs of xe_tlb_inval_fence_timeout() only exit the re-arm loop if
debug_pause_pending is cleared by xe_tlb_inval_debug_pause() or if
xe->wedged.pause_failed becomes true.

However, wedge_pause_work() can finish and reset xe->wedged.declare_pending
to 0 with pause_failed still false in two ways:

1. If xe_wedge_prepare_fini() sets xe->wedged.shutting_down =3D true during
teardown before wedge_pause_work() reaches the for_each_initialized_gt()
loop:

drivers/gpu/drm/xe/xe_wedge.c:wedge_pause_work() {
	if (READ_ONCE(xe->wedged.shutting_down)) {
		if (pm_ref)
			goto put_runtime_ref;
		goto clear_pending;
	}
	...
	if (READ_ONCE(xe->wedged.shutting_down))
		goto put_runtime_ref;
}

2. If wedge_pause_work() has already executed its xe_gt_wedge_pause() loop
and declare_pending is still 1 (for example, after wedge_declare_now() runs
xe_tlb_inval_reset() on XE_WEDGE_REPLY_CONTINUE, or after a concurrent GT
reset clears debug_paused while waiting in wait_event_idle()) when another
TLB fence times out and sets debug_paused =3D true and
debug_pause_pending =3D true.

In both cases, once declare_pending is cleared to 0, debug_paused and
debug_pause_pending remain true while pause_failed is false. Because
debug_paused is true, xe_tlb_inval_done_handler() ignores incoming TLB
completions, and xe_tlb_inval_fence_timeout() re-arms fence_tdr forever
without signaling the expired fences with -ETIME, hanging callers waiting on
pending TLB fences during xe_pci_remove().

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index f7b2ec9d68863..4ed215991cfe1 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -189,7 +189,8 @@ static void wedge_pause_work(struct work_struct *work)
>  	if (!pm_ref) {
>  		xe_warn(xe, "Mode-3 wedge could not retain active runtime PM; resuming=
 for inspection, hardware state may have changed\n");
>  		if (!xe_pm_runtime_resume_and_get(xe)) {
> -			xe_err(xe, "Failed to resume device for mode-3 inspection; aborting p=
ause\n");
> +			xe_err(xe, "Failed to resume device for mode-3 inspection; restoring =
TLB timeout handling\n");
> +			WRITE_ONCE(xe->wedged.pause_failed, true);
>  			goto clear_pending;
>  		}
>  	}
> @@ -197,8 +198,10 @@ static void wedge_pause_work(struct work_struct *wor=
k)
>  	if (READ_ONCE(xe->wedged.shutting_down))
>  		goto put_runtime_ref;
> =20
> +	WRITE_ONCE(xe->wedged.pause_failed, false);

[Severity: Medium]
Once wedge_pause_work() sets xe->wedged.pause_failed =3D true on a runtime =
PM
resume failure, how is pause_failed cleared for subsequent TLB invalidation
timeouts?

In xe_tlb_inval_fence_timeout(), xe_wedge_declare_mode3(xe) is guarded by
!READ_ONCE(xe->wedged.pause_failed):

	if (!READ_ONCE(xe->wedged.pause_failed))
		xe_wedge_declare_mode3(xe);

After xe_tlb_inval_fence_timeout() observes pause_failed =3D=3D true, clears
debug_paused and debug_pause_pending, and signals the expired fences with
-ETIME, nothing resets pause_failed to false except a future execution of
wedge_pause_work(). Because future TLB invalidation timeouts skip calling
xe_wedge_declare_mode3(xe) while pause_failed is true, TLB-triggered mode-3
inspection remains disabled indefinitely after a single failed resume.

In addition, if a later non-TLB fault (such as a pagefault or GuC CAT error)
calls xe_wedge_declare_mode3(xe) -> wedge_request(), pause_failed is still
true until wedge_pause_work() is scheduled and reaches WRITE_ONCE(...,
false), so any concurrent xe_tlb_inval_fence_timeout() will fail pending TLB
fences with -ETIME instead of pausing them for the new inspection.

>  	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_wedge_pause(gt);
> +	WRITE_ONCE(xe->wedged.pause_stopped, true);
> =20
>  	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>  	WRITE_ONCE(xe->wedged.reply, 0);
> @@ -294,6 +297,39 @@ void xe_wedge_declare_mode3(struct xe_device *xe)
>  	wedge_request(xe, DRM_WEDGE_RECOVERY_NONE, true);
>  }
> =20
> +/**
> + * xe_wedge_mode3_wait() - Inspect a recoverable PCI error before reset
> + * @xe: Device with accessible MMIO, kept alive by the caller
> + *
> + * Request or join mode-3 inspection and wait for its worker to finish.
> + * Do not hold mode_mutex while waiting; teardown needs it to abort insp=
ection.
> + * Waiting has no timeout and can stall recovery and removal of devices =
in the
> + * same PCI hierarchy. Other devices can request reset after this callba=
ck
> + * returns; frozen-channel recovery can force reset regardless of our vo=
te.
> + *
> + * Return: true if reset must be declined because inspection stopped the=
 GTs,
> + * the device is wedged, or teardown started. Otherwise, normal recovery=
 may
> + * proceed.
> + */
> +bool xe_wedge_mode3_wait(struct xe_device *xe)
> +{
> +	mutex_lock(&xe->wedged.mode_mutex);
> +	if (READ_ONCE(xe->wedged.mode) !=3D
> +	    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
> +		mutex_unlock(&xe->wedged.mode_mutex);
> +		return false;
> +	}
> +
> +	if (!READ_ONCE(xe->wedged.pause_stopped) && !xe_wedged(xe))
> +		xe_wedge_declare_mode3(xe);

[Severity: High]
Should wedge_request() also check xe->wedged.pause_stopped and xe_wedged(xe)
before setting declare_pending and queuing pause_work?

Here in xe_wedge_mode3_wait(), xe_wedge_declare_mode3(xe) is skipped if
pause_stopped or xe_wedged(xe) is true. However, direct callers of
xe_wedge_declare_mode3() and xe_wedge_declare() (such as
xe_pagefault_queue_work() draining additional failed faults in pf_queue,
xe_guc_exec_queue_memory_cat_error_handler(), or xe_tlb_inval_fence_timeout=
())
go straight to wedge_request(), which only checks shutting_down and
declare_pending.

When wedge_pause_work() finishes after XE_WEDGE_REPLY_CONTINUE or
XE_WEDGE_REPLY_SKIP and resets declare_pending to 0, any subsequent fault
calls wedge_request() and queues wedge_pause_work() again:

1. After XE_WEDGE_REPLY_CONTINUE has already wedged the device and called
xe_tlb_inval_reset(), a second run of wedge_pause_work() calls
xe_gt_wedge_pause() -> xe_tlb_inval_debug_pause(), setting
tlb_inval->debug_paused =3D true again. Even if the user writes
XE_WEDGE_REPLY_CONTINUE a second time, wedge_declare_now() returns early at:

	if (atomic_xchg(&xe->wedged.flag, 1))
		return;

without calling xe_tlb_inval_reset(), leaving TLB invalidations permanently
paused.

2. Each repeated execution of xe_gt_wedge_pause() -> xe_uc_wedge_declare() =
->
xe_guc_submit_wedge() walks guc->submission_state.exec_queue_lookup and tak=
es
another reference on every queue via xe_exec_queue_get_unless_zero(q) before
calling set_exec_queue_wedged(q), whereas guc_submit_fini() only drops one
reference per wedged queue, leaking xe_exec_queue references.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102210242.6352=
07-1-daniel.charles@intel.com?part=3D3
