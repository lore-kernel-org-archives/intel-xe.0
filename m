Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07877C98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF2010E15E;
	Wed, 23 Sep 2026 18:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wskjf1DB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498A410E15E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:31:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F923600AA;
 Wed, 23 Sep 2026 18:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2503E1F00893;
 Wed, 23 Sep 2026 18:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790188290;
 bh=PsCX+aspObmDk7zsw+XSl/R8wrwfl7TzcvdvYzpCOMY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Wskjf1DBDFDeNH6ezpQyT/6K0wh2cU81Oudn69sk9BEHQ8BsT48CxPYQbg0ORZEX1
 GMMkomMFJeVFex1QMlaFwpqXdwQV99/aTtKR+wod7eqNJ1uInw+wvNQe2vjyMOrQ8d
 F/20ZwIqom0NkTKXiPWd9xfILLCIAgBRLjxf3TSmEsEceY5uly2FlZXO3buteBzehj
 Va/HLJj7Obpl4EdJDPGB30UNnwUHkFGJpvtegd0hlMMm3Wp9NLEp5/HpBl5JDnLVAp
 Ietv/3JD7hsM2AGo8IHgFTsa8lMo9wzxWLg17LhdN8BJZW/DPBBKB63imqQQEmYPSd
 rVYusPb3zUOyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260923181115.2514193-39-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:31:29 +0000
Message-Id: <20260923183130.2503E1F00893@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] core: devres leak and UAF due to concurrent delayed work
- [High] pm: invalid hardware access during suspend from non-freezable work=
queue
- [Medium] locking: SRCU read lock held across 20s msleep blocks hotunplug
- [Medium] locking: lock inversion between pmt.lock and device core locks
- [Medium] task: 20s uninterruptible msleep enables local DoS
--

commit 0381c7581cc6bd07b52526c81bae84b56ea49be4
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running. This commit updates the XE PMT probe and
access to check for late bind devices, verify, and wait for the
appropriate FW state before probe or access.

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

[Severity: High]
Can this result in hardware hangs or master aborts during system suspend?

This delayed work is queued on system_wq, which lacks the WQ_FREEZABLE flag.
Because the driver's system suspend path does not cancel or flush this work,
the worker thread could wake up during or after suspend.

If that happens, xe_sysctrl_is_oobmsm_fw_ready() will attempt to read MMIO
registers while the PCI device is powered down in D3cold.

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
> +
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

[Severity: Medium]
Could this uninterruptible sleep cause localized task lockups?

If user-space initiates a read on PMT telemetry and the firmware never
completes, this will loop on msleep() for up to 20 seconds. The thread
will be blocked in uninterruptible sleep (TASK_UNINTERRUPTIBLE) and will
ignore all signals, including SIGKILL, until the timeout expires.

Could this be exploited by a local user to intentionally block multiple
threads, leading to inflated load averages or resource exhaustion?

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
[ ... ]
> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
> =20
> +	if (!wait_for_fw(xe)) {

[Severity: Medium]
Does holding the DRM SRCU read lock across this 20-second wait block
device hot-unplug?

User-space reads to PMT telemetry enter xe_pmt_telem_read(), which calls
drm_dev_enter() and acquires the SRCU read lock before reaching here.

If a device hot-unplug occurs while wait_for_fw() is sleeping for 20
seconds, drm_dev_unplug() will call synchronize_srcu(). This will block
the unplug process and critical kernel teardown paths until the timeout
expires and the SRCU reader exits.

> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
> +
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
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

[Severity: Medium]
Is there a lock inversion here between pmt.lock and the driver core locks?

This function acquires xe->pmt.lock via guard(mutex) and then calls
intel_vsec_register(), which interacts with the driver core to add
devices and trigger probes, acquiring driver core locks like device_lock.

When user-space accesses PMT sysfs files, the driver core acquires its
locks first (e.g., kernfs and device_lock), and then calls
xe_pmt_telem_read(), which acquires pmt.lock.

This circular dependency could lead to a lockdep splat or an AB-BA
self-deadlock.

> +}
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

[Severity: High]
Can this concurrent delayed work cause a devres leak and a Use-After-Free
of the parent device?

During device unbind, devres_release_all() splices the devres_head list
and iterates over it. It calls this devm action, which blocks here on
disable_delayed_work_sync().

Meanwhile, the delayed work can call cri_late_bind_probe(), which calls
intel_vsec_register(). This dynamically allocates and appends new devm
resources to the now-empty devres_head.

When the work finishes, devres_release_all() returns without checking
devres_head again. The new resources are permanently leaked. Also, because
the parent device is freed, the orphaned auxiliary devices will hold
dangling pointers to it.

> +		xe_pm_runtime_put(xe);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181115.2514=
193-22-michael.j.ruhl@intel.com?part=3D17
