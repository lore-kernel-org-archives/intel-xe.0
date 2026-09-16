Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7CC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAF210E3C2;
	Wed, 16 Sep 2026 20:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JI20gfj0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9FF10E3C2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:29:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F2F124149E;
 Wed, 16 Sep 2026 20:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAA31F000FF;
 Wed, 16 Sep 2026 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789590542;
 bh=qDq94V803suwwhyftfwPnqRT659S4pIeCWASrBA8TrA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JI20gfj03bHHTpMjVBGnW/g6arD47qM9BjmGfcixD+4SOoNy+tDjGjrDE6QEccCrl
 DK7eGDoLc97o2CpHvJGG3iCGJxYgtGUZxA7lZZFtC86rTqLCx/liTR19VpqC6wCE7/
 hvA5uV5V2dL7lrQmeaheZeLjbofYJcQzKQXLskPwmg+eI3DvFmqs+YKjrOTdZLnjzA
 0e5/6yELsQGrfpYNIzFqj126a1yFVbgJ31tdU/l5xhU/O8v1R5OHHVXx9DfsccXdnz
 XWfe2h+WOt4nmeRaY846dZGH/u1QJkwiGazK8vitT356eKMJfMJiyRe2GoLTt9iShN
 sr1urTkqA/x7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 17/20] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916201139.2374531-39-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:29:02 +0000
Message-Id: <20260916202902.ABAA31F000FF@smtp.kernel.org>
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
- [High] devres: memory leak and dangling devices due to worker racing with=
 devres_release_all
- [High] pm: non-freezable delayed work accesses MMIO during system suspend
- [Medium] pm: asynchronous pm_runtime_put() during device removal causes i=
ncorrect power state
- [Medium] pm: uninterruptible msleep in wait_for_fw() blocks task freezer =
and system suspend
--

commit 2311d189c57553ad608d675783c5e664a010f6ef
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running.

Update the XE PMT probe and access to check for late bind devices,
verify, and wait for the appropriate FW state before probe or access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index d1427ec507285..f905ef51df656 100644
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
Does scheduling this delayed work on the default non-freezable workqueue ri=
sk
MMIO access during system suspend?

If the system enters suspend (S3) while the worker is in its polling loop,
the PCI device is put into the D3 state. Because the worker is on a
non-freezable workqueue, it continues running and calls
xe_sysctrl_is_oobmsm_fw_ready(), which performs MMIO reads on powered-down
hardware.

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
> +	}

[Severity: Medium]
Could this uninterruptible sleep delay task freezing for up to 20 seconds
during system suspend?

If userspace initiates a read on the PMT telemetry sysfs file, calling
xe_pmt_telem_read(), it enters this wait_for_fw() loop. If a system suspend=
 is
triggered concurrently, the uninterruptible msleep() loop prevents the task
from handling the freeze signal before the 20-second freezer timeout expire=
s.

[ ... ]

> @@ -476,12 +544,46 @@ static enum xe_vsec get_platform_info(struct xe_dev=
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

[Severity: Medium]
Is it safe to use an asynchronous runtime put here during the device removal
path?

When device removal triggers this function via devres cleanup, the pending
async idle/suspend work can be cancelled by pm_runtime_disable(), leaving
the hardware in an active power state indefinitely. Should this be a
synchronous put (xe_pm_runtime_put_sync()) instead?

[ ... ]

> @@ -489,11 +591,11 @@ void xe_vsec_init(struct xe_device *xe)
[ ... ]
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
> +

[Severity: High]
Can this worker thread race with devres_release_all() during device unbind?

If the driver is unbound while the worker is in its polling loop,
devres_release_all() splices the devres list and executes
vsec_disable_late_bind_work(), which waits for the worker to finish.

However, the worker calls intel_vsec_register() in cri_late_bind_probe(),
which adds new devres items to the device. Since devres_release_all() only
splices the list once before executing it, any devres items added by the
worker are permanently leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916201139.2374=
531-22-michael.j.ruhl@intel.com?part=3D17
