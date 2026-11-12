Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4DB606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHbQ1xNh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C53410FF88;
	Thu, 12 Nov 2026 10:02:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D9C10FF88
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 10:02:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BC783631B8;
 Thu, 12 Nov 2026 10:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6020F1F00A0A;
 Thu, 12 Nov 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794477751;
 bh=XRb9DU56kUCwMEOz7JTPYLirkcKp31kgouqcUQH7sq8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mHbQ1xNhtAYWFTE6K5ycAJzAWk4CjDW5+2FoTBXKjKtELLUHT0cS7KCO/99XrjcLH
 IAY0RuG4ozOQ9HOZzVNHTd/aMssmVK7GY2dRQilfCer3nz2gRtvt4Mox+YTLyXoFA9
 L4xBFGPbpcQJ/oeEpuQUtccI0rxPfczEg8oJwNwjHPzY4qLI4fVJ/9actFDsOM8QhJ
 BA1cwR9vCRx0GRUqpXniplZqtG8mJDo3ZHq99o4foY84pkdHe6Oj35hJdHWUHqjyx3
 HNyRvd0x5n0v2YdYmO5Ne6pDiGaT4Y1zMu8FLCupuLwqXRBwFY5RxyXB7N3KXmiEOg
 0dpqCdQ9pmEyA==
Message-ID: <sashiko-outbox-210920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112091033.1813803-10-raag.jadav@intel.com>
References: <20261112091033.1813803-1-raag.jadav@intel.com>
 <20261112091033.1813803-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:02:31 +0000
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
- [High] drm/xe/pci: lockless pm_runtime_active() checks in FLR
  callbacks
- [High] drm/xe/pci: broken FLR error handling in xe_pci_reset_done()
- [High] drm/xe: work_tdr infinite loop in xe_uc_flr_prepare() when
  stopping sched
- [Medium] drm/xe/pci: race with xe_wedge_declare() in
  xe_pci_reset_prepare()
- [Medium] drm/xe/pci: unquiesced GTs and post-FLR GuC MMIO timeout in
  xe_pci_reset_prepare()
- [Medium] drm/xe/pci: guc->submission_state.stopped underflow when FLR
  races GT reset
--

commit a6f0e695404c15ff1ce9915094f13ff73d859fb4
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci: Introduce PCIe Function Level Reset

This commit wires up the .reset_prepare and .reset_done PCI error handlers
to support PCIe Function Level Reset (FLR) on discrete GPUs by suspending
execution, resetting hardware state, and re-initializing kernel BOs and
queues across the reset.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index be58fc9e22dc7..d6469171b7f36 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
[ ... ]
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe=
->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err =3D xe_survivability_mode_is_boot_enabled(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: device in survivability mode\n");
> +		return;
> +	}
> +
> +	/* No guarantees by PCI core */
> +	err =3D !pm_runtime_active(&pdev->dev);
> +	if (err) {
> +		xe_err(xe, "PCI reset: unexpected power state\n");
> +		return;
> +	}

[Severity: High]
Can checking pm_runtime_active() locklessly in xe_pci_reset_prepare() and
xe_pci_reset_done() unbalance xe_wedge_get() and xe_wedge_put()?

pci_reset_function() holds only device_lock(&pdev->dev), which does not
serialize runtime PM transitions, and .reset_prepare cannot abort the
reset.

CPU0 (pci_reset_function)         CPU1 (ioctl / work)
xe_pci_reset_prepare()
  !pm_runtime_active() -> true
  return; (no xe_wedge_get)
                                  xe_pm_runtime_get()
                                    pm_runtime_resume()
                                      runtime_status =3D RPM_ACTIVE
xe_pci_reset_done()
  !pm_runtime_active() -> false
  !xe->flr_prepared -> goto out
  xe_wedge_declare()
  xe_wedge_put()  <-- unbalanced put

Because xe_pci_reset_prepare() returned before xe_wedge_get(),
xe_pci_reset_done() drops the permanent reference just taken by
xe_wedge_declare() (leaving xe_wedged(xe) false with xe->wedged.perm =3D=3D=
 1,
or underflowing xe->wedged.ref if wedged.mode =3D=3D XE_WEDGED_MODE_NEVER).

In the reverse direction, if the device is in its autosuspend idle window
(RPM_ACTIVE with usage_count =3D=3D 0), xe_wedge_get() ->
xe_pm_runtime_get_noresume() triggers the drm_WARN() for missing outer
runtime PM protection, and if runtime suspend completes before
xe_pci_reset_done(), xe_pci_reset_done() returns early on
!pm_runtime_active() and leaks the wedge and runtime PM references.
Finally, if the device stays runtime-suspended across the whole reset,
both callbacks return early without wedging or re-initializing the device
even though the PCI reset still wipes VRAM and hardware state.

> +	err =3D xe_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCI reset: device in unexpected state\n");
> +
> +	/* Wedge the device to prevent userspace access but don't send the even=
t yet */
> +	xe_wedge_get(xe);
> +	if (err)
> +		return;

[Severity: Medium]
What happens if xe_wedge_declare() runs concurrently with
xe_pci_reset_prepare()?

CPU0 (PCI reset)                  CPU1 (GT reset / IRQ / RAS)
xe_pci_reset_prepare()
  xe_wedged(xe) -> false
                                  xe_wedge_declare(xe, ...)
                                    xe->wedged.perm =3D 1
                                    xe_gt_wedge_declare(gt)
  xe_wedge_get(xe)
  xe_device_suspend(xe, false, true)
  xe->flr_prepared =3D true
xe_pci_reset_done()
  xe_device_resume(xe, true)
    ...
      guc_exec_queue_reinit_kernel(q)
        atomic_set(&q->guc->state, 0)  <-- clears WEDGED state

An already-running gt_reset_worker() or guc_exec_queue_timedout_job() (or
an IRQ/RAS handler) can call xe_wedge_declare() after the xe_wedged(xe)
check.  Because xe_wedged_permanent(xe) is not re-checked before setting
xe->flr_prepared or running xe_device_resume(xe, true), resume proceeds on
a permanently wedged device: in XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET,
guc_exec_queue_reinit_kernel() zeroes q->guc->state and leaks the queue
reference taken by xe_guc_submit_wedge(), and GuC CT communication later
fails mid-resume with -ENOTRECOVERABLE because xe_wedged_permanent(xe) is
set.

> +	err =3D xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: not supported\n");
> +		return;
> +	}

[Severity: Medium]
When xe_pci_reset_skip(xe) is true (or xe_device_suspend() fails at
xe_pxp_pm_suspend()), does returning here leave the GTs running across the
physical PCI reset and cause GuC MMIO timeouts in xe_pci_reset_done()?

Unlike prepare_device_for_reset(), this path only calls xe_wedge_get(xe),
which blocks new ioctls but does not stop DRM schedulers, TDR handlers, or
GT workers while pci_dev_save_and_disable() clears PCI_COMMAND and resets
the hardware.  After the reset wipes the GuC, xe_pci_reset_done() jumps to
out: and calls xe_wedge_declare(), scheduling gt_wedge_worker ->
xe_guc_submit_wedge() -> xe_guc_softreset().  Because xe_uc_fw_sanitize()
was never run before the reset, guc->fw.__status is still
XE_UC_FIRMWARE_RUNNING, so xe_guc_softreset() sends an MMIO HXG request to
the wiped GuC and times out on every GT.

> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but =
we try to
> +	 * update data structures and cleanup any pending work to avoid side ef=
fects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without ev=
iction.
> +	 */
> +	err =3D xe_device_suspend(xe, false, true);
> +	if (err) {
> +		xe_err(xe, "PCI reset: failed to prepare\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared =3D true;
> +	xe_info(xe, "PCI reset: prepared\n");
> +}

[Severity: High]
Can xe_device_suspend(xe, false, true) -> xe_uc_flr_prepare() cause
sched->base.work_tdr to spin in an infinite 0-delay loop on
gt->ordered_wq when an exec queue has an in-flight job?

In xe_uc_flr_prepare() (added in commit "drm/xe/gt: Introduce FLR
helpers"), uc_flr_prepare kills each queue via
xe_guc_exec_queue_trigger_cleanup(), which sets sched->base.timeout =3D 0
and queues work_tdr on gt->ordered_wq.  xe_uc_flr_prepare() then queues
uc_flr_sanitize right behind work_tdr on gt->ordered_wq:

gt->ordered_wq
  drm_sched_job_timedout() (work_tdr)
    guc_exec_queue_timedout_job()
      xe_sched_job_set_error() (signals job->fence)
      return DRM_GPU_SCHED_STAT_NO_HANG
    drm_sched_job_reinsert_on_false_timeout()
      queues work_free_job on sched->base.submit_wq
    drm_sched_start_timeout_unlocked()
      re-queues work_tdr (delay 0) on gt->ordered_wq
  uc_flr_sanitize()
    ...
      drm_sched_wqueue_stop()
        sched->base.pause_submit =3D true
        cancel_work_sync(&sched->base.work_free_job)
  drm_sched_job_timedout() (work_tdr)
    guc_exec_queue_timedout_job()
      sees DMA_FENCE_FLAG_SIGNALED_BIT -> returns NO_HANG
    drm_sched_job_reinsert_on_false_timeout()
      drm_sched_run_free_queue() (no-op: pause_submit is true)
    drm_sched_start_timeout_unlocked()
      re-queues work_tdr (delay 0)  <-- spins forever

Because uc_flr_sanitize runs on gt->ordered_wq before the separate
sched->base.submit_wq worker runs work_free_job, drm_sched_wqueue_stop()
cancels work_free_job with the signaled job still on pending_list, and
work_tdr re-queues itself with a 0 timeout forever.

> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err =3D xe_survivability_mode_is_boot_enabled(xe) || !pm_runtime_active=
(&pdev->dev);
> +	if (err)
> +		return;
> +
> +	if (!xe->flr_prepared)
> +		goto out;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared =3D false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize =
the device.
> +	 * This will be similar to system resume flow, except we'll also need t=
o recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	err =3D xe_device_resume(xe, true);

[Severity: Medium]
Can guc->submission_state.stopped underflow to -1 if xe_pci_reset_prepare()
races with an already-running gt_reset_worker()?

CPU0 (PCI reset)                  CPU1 (gt->ordered_wq)
                                  gt_reset_worker()
                                    (passes xe_wedged() check)
                                    stopped is 1
xe_pci_reset_prepare()
  xe_wedge_get(xe)
  xe_device_suspend(xe, false, true)
    xe_uc_flr_prepare()
      xe_uc_reset_prepare()
        stopped =3D 1
      queue_work(flr.work)
                                    do_gt_restart()
                                      xe_guc_submit_start()
                                        atomic_dec(&stopped) -> 0
                                  uc_flr_sanitize()
                                    xe_guc_submit_stop()
                                      assert(stopped =3D=3D 1)
xe_pci_reset_done()
  xe_device_resume(xe, true)
    xe_guc_submit_start()
      atomic_dec(&stopped)  <-- underflows 0 to -1

Once guc->submission_state.stopped is -1, xe_guc_read_stopped(guc) remains
permanently non-zero after FLR, so guc_exec_queue_init() immediately stops
the scheduler on every newly created queue and xe_gt_reset_async() rejects
future GT resets.

> +	if (err) {
> +		xe_err(xe, "PCI reset: re-initialization failed\n");
> +		goto out;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_wedge_put(xe);
> +	xe_info(xe, "PCI reset: done\n");
> +
> +	return;
> +out:
> +	/* Most likely the device is unusable and there's nothing we can do abo=
ut it */
> +	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS=
_RESET);
> +	/* Drop local reference */
> +	xe_wedge_put(xe);
> +}

[Severity: High]
Does the error path at out: leave the device unwedged or its GuC
schedulers permanently stopped when xe->wedged.mode is not default?

When xe->wedged.mode =3D=3D XE_WEDGED_MODE_NEVER, xe_wedge_declare() returns
early without calling xe_wedge_get(xe) or xe_gt_wedge_declare(gt), so the
following xe_wedge_put(xe) drops the temporary reference from
xe_pci_reset_prepare() back to 0 and unblocks userspace ioctls on a device
whose VRAM and hardware state were just wiped by the reset.  In addition,
if xe_device_resume(xe, true) fails before xe_uc_start() restarts the
schedulers stopped by uc_flr_sanitize(), neither XE_WEDGED_MODE_NEVER nor
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET calls xe_guc_submit_pause_abort() in
xe_guc_submit_wedge(), leaving kernel and user queue schedulers stopped so
STATIC_MSG_CLEANUP never runs and driver unbind hangs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091033.1813=
803-1-raag.jadav@intel.com?part=3D9
