Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237C3606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AynupB8i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06E910E6E3;
	Mon,  2 Nov 2026 22:46:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7906F10E6E3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:46:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2AE8C42E2E;
 Mon,  2 Nov 2026 22:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D781F00A16;
 Mon,  2 Nov 2026 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793659576;
 bh=DLhZ74nt5hsElw553lAZSl7/3dpJGibgNyvTTrPB2uI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=AynupB8iAmyqUreJOU8SRO8b+0s4X0wxojFHeH/Fr3mLtwZTVefOUPO1LCyvdTAm6
 GBWWYb+SABNSOhZENBfNXknDotFEgTiIUnotHR9jTZYDUv0J6DxxC59IcOqofTTnbX
 Wfo168SeatDsr1ahNI9dHbjrvcaIxeb1bWYYCZhD20f/PKAwpsIhenk2lMkRu/U07U
 KTtwCbwLv0VKnzT66W4lHakTJgGtpfFKjKnh9fJGOPMEOpGT2lerL8mlp8aoUzDQgE
 vTozW7cf21W4q11DEC9rf1GHIH5ONsynFsneKKQVkmn3pOqajeuujw+XqsEsUyVe+O
 Lfi9OavBdzVaw==
Message-ID: <sashiko-outbox-194300@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 12/16] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-30-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-30-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:46:15 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] drm/xe/vsec: devres race and leak in cri_late_bind_probe_work() on=
 remove
- [High] drm/xe/vsec: cri_late_bind_probe_work() accesses MMIO during syste=
m suspend
- [Medium] drm/xe/vsec: lock inversion holding pmt.lock in cri_late_bind_pr=
obe()
- [Medium] drm/xe/vsec: 20s uninterruptible msleep() in wait_for_fw() under=
 SRCU
- [Medium] drm/xe/vsec: inconsistent locking and CRI_IDX_TELEM_DISCOVERY ra=
ce on probe
- [Low] drm/xe/vsec: missing kernel-doc Return description for xe_vsec_init=
()
--

commit de390f347a84cad7bb93f5a65e0c5583258f4dc3
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit updates the Xe PMT probe and access paths to check for
Crescent Island late-bind firmware readiness, scheduling delayed work
when firmware is not yet initialized at probe time and waiting for
firmware readiness before PMT telemetry or register access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 0f6e3be520c09..5384fef5e5ac5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return -ENODEV;
>  }
> =20
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, pmt.work.=
work);
> +
> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	xe->pmt.retry_count++;
> +
> +	/* wait up to 20 seconds */
> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BI=
ND_DELAY_MSEC)))
> +		xe_pm_runtime_put(xe);
> +}

[Severity: High]
As reported by Sashiko on v5 [1], can cri_late_bind_probe_work() wake up
during system suspend (such as S2idle, S3, or hibernation) and perform
MMIO accesses on a powered-down PCI device?

In xe_vsec_init(), when xe_sysctrl_is_oobmsm_fw_ready() is false, the
driver takes a runtime PM reference via xe_pm_runtime_get_noresume() and
queues xe->pmt.work onto system_percpu_wq via schedule_delayed_work(),
re-arming every 100ms for up to 20 seconds.

While the runtime PM reference prevents runtime suspend, it does not
prevent system suspend (xe_pci_suspend() -> xe_pm_suspend()) because
DPM_FLAG_NO_DIRECT_COMPLETE is set on discrete graphics devices. Unlike
xe->late_bind, which xe_pm_suspend() flushes via
xe_late_bind_wait_for_worker_completion(), neither xe_pm_suspend() nor
xe_pci_suspend() cancels or flushes xe->pmt.work before disabling the
PCI device and placing it into PCI_D3cold.

Since system_percpu_wq is not freezable, won't cri_late_bind_probe_work()
continue running while the device is in D3cold and touch MMIO in
xe_sysctrl_is_oobmsm_fw_ready(), xe->soc_remapper.set_telem_region(), and
intel_vsec_register()?

> +static bool wait_for_fw(struct xe_device *xe)
> +{
> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> +
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
> +		return true;
> +
> +	while (retries--) {
> +		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}
> +
>  /**
>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a b=
uffer
>   * @dev: valid Xe device
> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
> =20
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}

[Severity: Medium]
As reported by Sashiko on v2 [2], does calling wait_for_fw() inside
xe_pmt_telem_read(), xe_pmt_read_reg(), and xe_pmt_write_reg() stall
device unplug and leave userspace tasks in uninterruptible sleep for up
to 20 seconds?

Each of those functions enters the DRM SRCU read-side critical section
via drm_dev_enter(&xe->drm, &idx) before calling wait_for_fw(). When
xe_sysctrl_is_oobmsm_fw_ready() returns false on Crescent Island (for
instance while firmware is reloading after D3cold exit, or if late
binding failed while xe->pmt.base_offset remains set), wait_for_fw()
loops up to 200 times calling msleep(100) without checking for pending
signals, task freezing, or device unplug.

Holding the drm_dev_enter() SRCU lock across 20 seconds of msleep() will
block drm_dev_unplug() in synchronize_srcu() for up to 20 seconds during
hot-unplug or driver unbind. In addition, sleeping in TASK_UNINTERRUPTIBLE
for 20 seconds makes userspace readers of PMT sysfs or debugfs files (such
as pcode_info) unkillable and can cause try_to_freeze_tasks() to time out
and abort system suspend.

>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
>  		memcpy_fromio(data, telem_addr, count);
>  	}
> =20
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
> =20
>  dev_exit:
> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 g=
uid, u32 *reg, u32 offset)
>  	disc_addr +=3D inst + offset;
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}

[ ... ]

> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct xe_dev=
ice *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
> =20
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev =3D xe->drm.dev;
> +	enum xe_vsec platform;
> +
> +	platform =3D get_platform_info(xe);
> +	if (platform !=3D XE_VSEC_CRI)
> +		return;
> +
> +	info =3D &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}

[Severity: Medium]
As reported by Sashiko on v11 [3], can holding xe->pmt.lock across
intel_vsec_register() in cri_late_bind_probe() cause a lock inversion
with the driver core and kernfs locks?

In cri_late_bind_probe(), xe->pmt.lock is held while calling
intel_vsec_register() -> intel_vsec_add_aux() -> auxiliary_device_add().
That path acquires device_lock(&auxdev->dev) and synchronously runs
pmt_telem_probe() (acquiring ep_lock) and pmt_crashlog_probe(), which
register sysfs attributes for each discovery entry:

  xe->pmt.lock -> &auxdev->dev.mutex -> ep_lock

Conversely, when userspace accesses PMT sysfs attributes via
intel_pmt_read(), clear_show(), or trigger_store(), kernfs holds an
active reference (kn->dep_map) and calls xe_pmt_telem_read(),
xe_pmt_read_reg(), or xe_pmt_write_reg(), which acquires xe->pmt.lock:

  kn->dep_map -> xe->pmt.lock

If a multi-entry probe fails mid-way on the abort_probe or
fail_add_endpoint error path while cri_late_bind_probe() holds
xe->pmt.lock (or when pmt_telem_remove() / pmt_crashlog_remove() later
runs under &auxdev->dev.mutex and ep_lock), intel_pmt_dev_destroy()
removes the sysfs attributes and waits in kernfs_drain() on kn->dep_map,
inverting the lock order against any concurrent sysfs reader waiting on
xe->pmt.lock.

[Severity: Medium]
Also, why does cri_late_bind_probe() duplicate the CRI setup from
xe_vsec_init() with different locking, and can xe_pmt_telem_read()
corrupt CRI discovery reads by changing the SoC remapper index?

On Crescent Island, discovery headers and telemetry data share the same
MMIO window at CRI_PMT_OFFSET indexed by
xe->soc_remapper.set_telem_region(). In xe_vsec_init(), CRI_IDX_TELEM_DISCO=
VERY
is set and intel_vsec_register() is called without holding xe->pmt.lock.
Once pmt_telem_probe() registers the first telemetry endpoint, a
concurrent xe_pmt_telem_read() (from udev or debugfs) can acquire
xe->pmt.lock and change the remapper index to mem_region while subsequent
telemetry entries and cri_crashlog discovery headers are still being read
from CRI_PMT_OFFSET.

Furthermore, because xe_pmt_telem_read() leaves the remapper index set to
mem_region instead of restoring CRI_IDX_TELEM_DISCOVERY, if the
intel_pmt_telemetry or intel_pmt_crashlog auxiliary drivers bind after any
xe_pmt_telem_read() call (for example when loaded as modules), won't their
discovery reads at CRI_PMT_OFFSET read telemetry data instead of discovery
headers?

> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	/*
> +	 * If the queued work is canceled, the runtime reference needs to be
> +	 * released here.
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
>   * @xe: valid xe instance
>   */
> -void xe_vsec_init(struct xe_device *xe)
> +int xe_vsec_init(struct xe_device *xe)

[Severity: Low]
Since xe_vsec_init() now returns an int and drivers/gpu/drm/xe/xe_vsec.c
is included in Documentation/gpu/xe/xe_vsec.rst, should a Return: section
be added to the xe_vsec_init() kernel-doc comment (and -ENODATA added to
the Return: list of xe_pmt_read_reg()) to avoid kernel-doc warnings?

>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev =3D xe->drm.dev;
> @@ -490,11 +592,11 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	platform =3D get_platform_info(xe);
>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
> -		return;
> +		return 0;
> =20
>  	info =3D &xe_vsec_info[platform];
>  	if (!info->headers)
> -		return;
> +		return 0;
> =20
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	case XE_VSEC_CRI:
>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count =3D 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}

[Severity: High]
As reported by Sashiko on v2 [2], can cancelling xe->pmt.work via a devm
action race with devres_release_all() and leak the PMT auxiliary devices
and their MMIO resources on driver unbind or probe failure?

When xe_pci_remove() runs (or if xe_device_probe() fails after
xe_vsec_init(), or during xe_pci_error_slot_reset()), xe_device_remove()
and xe_pm_fini() run before devres_release_all(dev) without stopping
xe->pmt.work.

Inside devres_release_all(dev), remove_nodes() splices all currently
registered devres entries (including vsec_disable_late_bind_work) from
dev->devres_head onto a local todo list before release_nodes() executes
any callbacks:

  devres_release_all(dev)
    remove_nodes(dev, ..., &todo)  /* moves dev->devres_head to todo */
    release_nodes(dev, &todo)
      ...
      vsec_disable_late_bind_work(xe)
        disable_delayed_work_sync(&xe->pmt.work)

If cri_late_bind_probe_work() is already running on another CPU when
remove_nodes() drains dev->devres_head (while release_nodes() is running
earlier actions or waiting in disable_delayed_work_sync()) and sees
xe_sysctrl_is_oobmsm_fw_ready(xe) =3D=3D true, it calls:

  cri_late_bind_probe(xe)
    intel_vsec_register(dev, info)
      intel_vsec_add_aux(dev, ...)
        devm_add_action_or_reset(parent, intel_vsec_remove_aux, auxdev)

Because dev->devres_head was already moved to todo, the newly appended
intel_vsec_remove_aux devres actions are left on dev->devres_head and
never executed. Doesn't this leave the intel_vsec.telemetry and
intel_vsec.crashlog auxiliary devices and their resource reservations
registered on the unbound device (causing subsequent driver re-probes to
fail with -EBUSY and exposing dangling sysfs callbacks after xe_device is
freed), as well as calling xe_pm_runtime_put() after xe_pm_fini()?

[1] https://lore.kernel.org/r/20260903202808.A8A5A1F000E9@smtp.kernel.org
[2] https://lore.kernel.org/r/20260812195421.15EE31F000E9@smtp.kernel.org
[3] https://lore.kernel.org/r/20260923181115.2514193-39-michael.j.ruhl@inte=
l.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D12
