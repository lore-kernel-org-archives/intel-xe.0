Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AFBC624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46E910EF19;
	Tue,  1 Sep 2026 20:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b7iI4esb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06510EF19
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:14:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8DC1C60237;
 Tue,  1 Sep 2026 20:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5DF1F00A3D;
 Tue,  1 Sep 2026 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788293658;
 bh=zh1zmaK4ZpOh/Z9SeY7d7kIEHslk4c9Y83Jih+97E6w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=b7iI4esbvAf4bMREkaGEdDHsKykqwuGfy2OEw/Q4+eexJtu7FCVZrDpOpsy7NkSpu
 LtU/Yek+F/k27lnhX9omwKHdyF7LpSuTfSA5Sf1vVzMwn1sAVz19GD+tXuHqae5Pcz
 S37jIGcQ7IqF0SFkgr133bBthEC+9bOmRDp3mGdIc9oWzl1cBJi3DG9cRlbh10AA83
 UyVgSksk5VI+5Lj9j/7SOcxifxsysgt4VCMvcss5vffQ66jXLJ5U/Z0ztJSb3kaGs3
 /OfARmYyoEN/Fl2CjP/tUk+xKC3GNkIixtWmdr3DP2AacFsQXpXrdkwzNvqs8/Bshc
 CtI6DsjgDeS7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/18] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-35-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:14:16 +0000
Message-Id: <20260901201418.1E5DF1F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Concurrent execution of late bind probe workqueue and device u=
nbind causes a Use-After-Free of xe_device and permanent resource leaks of =
auxiliary devices.
- [High] Asynchronous runtime PM put in the device managed teardown path le=
ads to a race condition with pm_runtime_disable().
- [High] Hardware polling workqueue is not freezable, leading to invalid MM=
IO reads and premature registration during system suspend.
- [Medium] Uninterruptible sleep up to 20 seconds in sysfs read path blocks=
 processes unkillably and delays device unplug.
--

commit f93021b7cc83d19c50481c3a86129f5d21804f97
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

CRI FW is loaded on power on, meaning access to the FW cannot be done until
it is running. This patch updates the XE PMT probe to check for late bind
devices and wait for the appropriate FW state before probe or access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index e58fea788ace5..8284977377bdb 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -270,6 +280,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return -ENODEV;
>  }
> =20
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, pmt.work.=
work);
> +
> +	if (xe_is_oobmsm_fw_ready(xe)) {
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
> +		if (xe_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
                 ^^^^^^^^

[Severity: Medium]
Does this force an uninterruptible sleep in a loop that blocks userspace
sysfs reads for a prolonged period?

When a user process reads a VSEC sysfs file (triggering xe_pmt_telem_read())
while the firmware is wedged or not ready, it can be blocked in 'D' state
(uninterruptible sleep) for up to 20 seconds, preventing it from being
killed with SIGKILL.

Additionally, because drm_dev_enter() is held by the callers, device unplug
(e.g., drm_dev_unplug()) will also be blocked for up to 20 seconds waiting
for the read to finish.

> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}
> +

[ ... ]

> @@ -442,12 +512,44 @@ static enum xe_vsec get_platform_info(struct xe_dev=
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
> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
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
> +		xe_pm_runtime_put(xe);
                 ^^^^^^^^^^^^^^^^^

[Severity: High]
Does this asynchronous runtime PM put in the device managed teardown path
lead to a race condition with pm_runtime_disable()?

This is where the asynchronous put is invoked on the teardown path, allowing
the device removal to proceed before the suspend actually finishes.

When the device is unbound or removed, the devm action
vsec_disable_late_bind_work() calls xe_pm_runtime_put(), and then the
driver core calls pm_runtime_disable(). This leaves the hardware in an
incorrect active power state because the async suspend is cancelled before
executing.

As explicitly stated in the PM subsystem guidelines, a synchronous put
(pm_runtime_put_sync()) is required during teardown paths.

[Severity: Critical]
Does concurrent execution of the late bind probe workqueue and device unbind
cause a Use-After-Free of xe_device and permanent resource leaks of
auxiliary devices?

If the device is unbound while cri_late_bind_probe_work() is running,
devres_release_all() splices the devres list to a local 'todo' list and
runs vsec_disable_late_bind_work(), which blocks here waiting for the work
to finish.

The work then calls intel_vsec_register() in cri_late_bind_probe(), which
adds new devm actions to the now-empty devres list asynchronously.

Because devres_release_all() has already spliced the list, these new actions
are never processed, and the VSEC devices are left registered but pointing
to freed xe_device memory, leading to an exploitable Use-After-Free when
sysfs is accessed on the orphaned VSEC auxiliary devices.

> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface

[ ... ]

> @@ -455,30 +557,45 @@ void xe_vsec_init(struct xe_device *xe)
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
>  		if (IS_SRIOV_VF(xe))
> -			return;
> +			return 0;
>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>  		info->priv_data =3D &xe_bmg_pmt_cb;
>  		break;
> =20
>  	case XE_VSEC_CRI:
>  		if (IS_SRIOV_VF(xe))
> -			return;
> +			return 0;
> +
>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count =3D 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
                         ^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Is the hardware polling workqueue freezable, or could this lead to invalid
MMIO reads and premature registration during system suspend?

The delayed work is scheduled on a non-freezable workqueue, meaning it can
continue to poll after the device is suspended by system PM.

If the system enters sleep (S3) during the 20-second late-bind polling
window, the workqueue can fire while the GPU is powered off.

Reading MMIO will return 0xFFFFFFFF, which falsely satisfies the firmware
readiness check, causing premature VSEC registration and dropping the PM
reference while suspended, leading to crashes or bad hardware state.

> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}
> +
>  		info->priv_data =3D &xe_cri_pmt_cb;
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D15
