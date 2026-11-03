Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E422606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRIvLObS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1BA10F3A4;
	Tue,  3 Nov 2026 06:46:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489E810F3A2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:46:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 27D1440D73;
 Tue,  3 Nov 2026 06:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DCD1F000C1;
 Tue,  3 Nov 2026 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793688382;
 bh=2joZP0maykx1UZfqponMJiEL4exbnfKgBFDEYQpihG4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HRIvLObSfAr/jPXsguzrZavlzAdPLHxlaUlRKeT2EQIdnkU6FzktH9LhPMzPBq8De
 h4VOgUJtcWHKfwsP5b3m5M2B2l9sAet8LWa4IMPig6fgojOoLkMsSCttsDvV/kfJp6
 u+25N2VwQRlBUwAmaKs2ci9YonoBw9xmEngXWVL4RSEN0uY6zCJWmgufZFkjDaFu29
 3D61VaFU1/kFF+uMIEv+apDAzDdODMkeEjpbKlKUgDxX+CkLz2taA8vFTZ5NUmY9E3
 bA3HhEhM3L/hwrb2Y4VltFDtbQ0OB6dQ3YawmWkP5V5HaXx6+q7ZlPIM/xF2bKTsX3
 lDSZ0Yp1pd4ig==
Message-ID: <sashiko-outbox-194668@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060649.1015468-10-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
 <20261103060649.1015468-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:46:21 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] drm/xe/pci: lockless pm_runtime_active() checks in FLR callbacks
- [High] drm/xe/pci: broken FLR error handling under non-default wedged.mode
- [High] drm/xe/pci: missing xe->cpu_bind->q re-initialization on FLR resume
- [High] drm/xe/migrate: unreset ULLS state and exit_work across PCIe FLR
- [Medium] drm/xe/pci: uninitialized wedge and PM access in survivability m=
ode
--

commit cf08cadf19ba560845f140c4f8eb3d6efc8fd9de
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci: Introduce PCIe Function Level Reset

This commit adds PCIe Function Level Reset (FLR) support via the
reset_prepare and reset_done PCI error handlers. It suspends GT activity
without VRAM eviction before the reset and re-initializes hardware state,
kernel BOs, and kernel queues afterwards.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 6a942cb6f69d9..fe8d83da1e8b6 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c

[ ... ]

> @@ -149,9 +195,99 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>  		xe_wedge_put(xe);
>  }
> =20
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
> +	/* No guarantees by PCI core */
> +	if (!pm_runtime_active(&pdev->dev)) {
> +		xe_err(xe, "PCI reset: unexpected power state\n");
> +		return;
> +	}

[Severity: High]
Can checking pm_runtime_active(&pdev->dev) locklessly in both
xe_pci_reset_prepare() and xe_pci_reset_done() without holding a runtime PM
reference cause unbalanced xe_wedge_get() and xe_wedge_put() calls or leave
the device unwedged after a reset?

There appear to be several paths where this goes wrong:

1. Because reset_prepare returns void, returning early when
!pm_runtime_active(&pdev->dev) is true does not stop the PCI core
(pci_dev_save_and_disable() -> __pci_reset_function_locked() ->
pci_dev_restore()) from transitioning the function to PCI_D0 and resetting
the hardware, wiping VRAM (which is not evicted in D3hot when
!xe->d3cold.allowed), GGTT mappings, and GuC state. If the device is still
runtime-suspended when xe_pci_reset_done() runs, xe_pci_reset_done() also
returns early without calling xe_wedge_declare(), leaving the wiped GPU
unwedged on the next runtime resume.

2. If !pm_runtime_active(&pdev->dev) is true in xe_pci_reset_prepare() (for
example, during RPM_RESUMING, a failed RPM_SUSPENDING transition, or a
concurrent runtime resume from an ioctl or sysfs read since xe_wedge_get()
was skipped) and runtime_status becomes RPM_ACTIVE before xe_pci_reset_done=
()
runs, xe_pci_reset_done() sees pm_runtime_active(&pdev->dev) as true and
!xe->flr_prepared, jumps to out:, and calls xe_wedge_put(xe) without a
matching xe_wedge_get(xe). That drops the permanent reference just acquired
by xe_wedge_declare() (or immediately underflows xe->wedged.ref).

3. Conversely, if pm_runtime_active(&pdev->dev) is true while
dev->power.usage_count is 0 during the autosuspend window, xe_wedge_get(xe)
calls xe_pm_runtime_get_noresume(xe), which triggers drm_WARN() for missing
outer runtime PM protection. If autosuspend transitions runtime_status to
RPM_SUSPENDING or RPM_SUSPENDED between the lockless pm_runtime_active()
check and xe_wedge_get(xe), runtime suspend runs concurrently with
xe_pci_reset_prepare(), and xe_pci_reset_done() returns early at
!pm_runtime_active(&pdev->dev), leaking the wedge and runtime PM references
and leaving xe->flr_prepared set to true.

> +
> +	err =3D xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCI reset: device in unexpected state\n");
> +
> +	/* Wedge the device to prevent userspace access but don't send the even=
t yet */
> +	xe_wedge_get(xe);
> +	if (err)
> +		return;

[Severity: Medium]
Should xe_pci_reset_prepare() and xe_pci_reset_done() return immediately wh=
en
xe_survivability_mode_is_boot_enabled(xe) is true, before calling
xe_wedge_get(xe)?

When boot survivability mode is enabled during probe, xe_device_probe_early=
()
returns early before calling xe_wedge_init(xe), and __xe_pci_probe() returns
0 before calling xe_device_probe(xe) and xe_pm_init(xe):

drivers/gpu/drm/xe/xe_device.c:xe_device_probe_early()
	err =3D xe_pcode_probe_early(xe);
	if (err) {
		int save_err =3D err;

		/*
		 * In Boot Survivability mode, no drm card is exposed and driver
		 * is loaded with bare minimum to allow for firmware to be
		 * flashed through mei. Return success, if survivability mode
		 * is enabled due to pcode failure.
		 */
		err =3D xe_survivability_mode_boot_enable(xe);
		if (err)
			return err;

		return save_err;
	}

	err =3D wait_for_lmem_ready(xe);
	if (err)
		return err;

	err =3D xe_wedge_init(xe);

Because xe_pm_init(xe) was never called, runtime PM remains disabled
(dev->power.disable_depth > 0), so pm_runtime_active(&pdev->dev) returns
true. Calling xe_wedge_get(xe) then invokes xe_pm_runtime_get_noresume(xe) =
->
pm_runtime_get_if_in_use(), which fails with -EINVAL and triggers drm_WARN()
for missing outer runtime PM protection, and xe_pci_reset_done() subsequent=
ly
calls xe_wedge_declare() and xe_wedge_put() on an uninitialized xe->wedged
struct.

> +
> +	err =3D xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: not supported\n");
> +		return;
> +	}
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but =
we try to
> +	 * update data structures and cleanup any pending work to avoid side ef=
fects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without ev=
iction.
> +	 */
> +	err =3D xe_device_suspend(xe, true);

[Severity: High]
What happens if Ultra Low Latency Submission (ULLS) mode is active on
tile->migrate when a PCIe FLR occurs?

When xe_migrate_ulls_enter(m) is called from page fault or SVM prefetch
paths, it takes a runtime PM reference via xe_pm_runtime_get_noresume(xe),
submits a ULLS_ENTER job to keep m->q spinning on a semaphore in m->q->lrc[=
0],
sets m->ulls.enabled =3D true, and schedules m->ulls.exit_work.

Neither xe_device_suspend(xe, true) nor xe_device_resume(xe, true) ->
xe_gt_reinit() -> xe_migrate_reinit(m) cancels m->ulls.exit_work, resets
m->ulls.enabled to false, or drops the ULLS runtime PM reference:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_reinit()
int xe_migrate_reinit(struct xe_migrate *m)
{
	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
	return xe_exec_queue_reinit(m->q);
}

After the hardware reset and xe_exec_queue_reinit(m->q) -> xe_lrc_ctx_init()
wipe m->q->lrc[0] and terminate the spinning context on the copy engine,
m->ulls.enabled remains true. Won't the next job pushed via
xe_migrate_job_push() (tagged ULLS_ACTIVE) or xe_migrate_ulls_exit() (tagged
ULLS_EXIT) have xe_sched_job_ulls_is_chained(job) =3D=3D true, causing
submit_exec_queue() to suppress XE_GUC_ACTION_SCHED_CONTEXT and ring-tail
updates while waiting on a semaphore that no job is parked on, hanging
tile->migrate->q and wedging the device?

> +	if (err) {
> +		xe_err(xe, "PCI reset: failed to prepare\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared =3D true;
> +	xe_info(xe, "PCI reset: prepared\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	int err;
> +
> +	/* No guarantees by PCI core */
> +	if (!pm_runtime_active(&pdev->dev))
> +		return;
> +
> +	err =3D xe_pci_reset_skip(xe);
> +	if (err)
> +		goto out;
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

[Severity: High]
Does xe_device_resume(xe, true) leave the device-wide kernel bind queue
(xe->cpu_bind->q) in the killed state after a PCIe FLR?

During xe_pci_reset_prepare(), xe_device_suspend(xe, true) calls
xe_gt_flr_prepare() -> xe_uc_flr_prepare() -> xe_guc_flr_prepare() ->
xe_guc_submit_pause_abort(), which iterates over all queues in
guc->submission_state.exec_queue_lookup and calls guc_exec_queue_kill(q) on
each one, including xe->cpu_bind->q. That sets EXEC_QUEUE_STATE_KILLED in
xe->cpu_bind->q->guc->state and sets sched.base.timeout =3D 0, while the
hardware reset wipes the VRAM backing xe->cpu_bind->q->lrc[0].

During xe_device_resume(xe, true), xe_gt_reinit() only re-initializes
tile->migrate->q via xe_migrate_reinit() -> xe_exec_queue_reinit(m->q) and
never calls xe_exec_queue_reinit(xe->cpu_bind->q). Once the device is
unwedged, when a pipelined CPU page-table bind job is submitted on
xe->cpu_bind->q via xe_cpu_bind_update_pgtables_job(), won't
guc_exec_queue_run_job() see exec_queue_killed_or_banned_or_wedged(q) as tr=
ue
and pass force_clear =3D true to run_pt_job(), clearing page tables instead=
 of
populating them?

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

[Severity: High]
What happens in this error path when xe->wedged.mode is non-default
(XE_WEDGED_MODE_NEVER or XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)?

1. When xe->wedged.mode is XE_WEDGED_MODE_NEVER (via module parameter
wedged_mode=3D0 or debugfs), xe_wedge_declare() returns early without calli=
ng
xe_wedge_get(xe) or xe_gt_wedge_declare(gt):

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare()
	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_NEVER) {
		xe_dbg(xe, "Wedged mode is forcibly disabled\n");
		return;
	}

The subsequent xe_wedge_put(xe) then drops the temporary reference taken in
xe_pci_reset_prepare(), reducing xe->wedged.ref to 0 and unblocking userspa=
ce
IOCTLs on a device whose VRAM and hardware state were wiped by FLR and whose
GTs and IRQs remain suspended.

2. If xe_device_resume(xe, true) fails before xe_uc_start() restarts the DRM
schedulers that were stopped in xe_device_suspend(xe, true) ->
xe_gt_flr_prepare() -> xe_uc_flr_prepare() -> uc_flr_sanitize() ->
xe_uc_stop() -> xe_guc_submit_stop(), and xe->wedged.mode is either
XE_WEDGED_MODE_NEVER or XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET (where
xe_guc_submit_wedge() skips xe_guc_submit_pause_abort()), the schedulers for
all queues remain stopped (drm_sched_is_stopped(&sched->base) =3D=3D true).=
 When
those queues are later destroyed on file close or driver unbind,
guc_exec_queue_destroy() queues STATIC_MSG_CLEANUP, which
xe_sched_process_msg_queue() ignores while the scheduler is stopped, leaking
the queues and their drm_dev_get() references and hanging module unload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060649.1015=
468-1-raag.jadav@intel.com?part=3D9
