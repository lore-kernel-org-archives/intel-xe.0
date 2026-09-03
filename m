Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD96C624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F1910E464;
	Thu,  3 Sep 2026 20:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWr3TSyF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D110E464
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:28:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2680E60219;
 Thu,  3 Sep 2026 20:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A5A1F000E9;
 Thu,  3 Sep 2026 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467288;
 bh=eEemYMwAB3058LQa9VzXyDXUIRkEQel5asSBhz8YLAM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fWr3TSyF9PUFnIOtpsX30Y+sNanCN0eRqJOClhUDaKmHMi0Ej2q5KdKKvYObIccAv
 0RAPrhfMmq3AkbjK3lcUyRiVkVpOhmlXBgbvl8V6UJmFusDB00ULNdQnMP56gxuqPv
 MVH30BBhBjSO4TtA8C6d9rIDbSd0+RoEyQtTVFn4skXreqo9gMAvjctrP/ykt0Bhvv
 2Id5QOdZv1P19Dd2/kDWUrtUAzE4c3nJ3gNuvBQVV1DGVmrCViA2EDtvMiy2NXx3zp
 5Q9ronJes8Yg6YjQxujJpTdJl0+FncDYLCWOAMVZ0nJ0pqxWtCGhYnGYV3nThr4FYH
 CNGfEUdTXiSjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/18] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-35-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:28:08 +0000
Message-Id: <20260903202808.A8A5A1F000E9@smtp.kernel.org>
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
- [High] Asynchronous `devm` registration race causes memory leak and Use-A=
fter-Free of the auxiliary device.
- [High] Asynchronous runtime PM put during devm teardown leaves hardware i=
n an incorrect power state.
- [High] Delayed work accesses hardware MMIO during system suspend.
--

commit 1b67a780c3fbc619f441f6dfdc210d11c50f6476
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

CRI FW is loaded on power on. Because of this, access to the FW cannot
be done until it is running. Update the XE PMT probe and access to check
for late bind devices, verify, and wait for the appropriate FW state
before probe or access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 336c4b7d284bc..48cacd23b071e 100644
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
> +	if (xe_is_oobmsm_fw_ready(xe)) {
[Severity: High]
Does this code access hardware MMIO during system suspend?

If a system suspend (e.g., S3) is initiated while the worker is actively
polling, the device is forced into a suspended state (D3) by the system PM
core, bypassing the runtime PM usage count held by the worker.

Because the work is on a non-freezable workqueue and not explicitly
cancelled in the driver's system suspend callbacks, the worker can wake up
while the hardware is powered down and call xe_is_oobmsm_fw_ready().
Reading MMIO from a device in the D3 state causes master aborts, unhandled
PCI errors, or silent 0xFFFFFFFF reads leading to undefined behavior.

> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
[ ... ]
> @@ -464,12 +534,44 @@ static enum xe_vsec get_platform_info(struct xe_dev=
ice *xe)
[ ... ]
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
[ ... ]
> +	intel_vsec_register(dev, info);
[Severity: High]
Can this asynchronous devm registration leak the auxiliary device?

Because intel_vsec_register() attaches its own devres actions to the parent
device (xe->drm.dev), calling it from a delayed worker can race with the
parent device teardown.

If the worker evaluates the firmware as ready and calls
intel_vsec_register() while the parent's devres list has already been
spliced during unbinding, these new devm actions are left behind on the
empty devres_head and are never executed. This causes a permanent memory
leak of the auxiliary device, and subsequent accesses can lead to a
use-after-free since the parent xe_device has been freed.

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
Does blocking to cancel the work here open the devres race window mentioned
above?

Since devres_release_all() has already spliced the devres list by the time
this devm action executes, any concurrent worker that bypassed the
cancellation check will attach its new devres actions to the already
spliced parent list.

> +		xe_pm_runtime_put(xe);
[Severity: High]
Could this asynchronous PM put leave the hardware active?

Using xe_pm_runtime_put() (which executes asynchronously) immediately before
device removal allows the pending async idle/suspend work to be cancelled
by the core teardown's pm_runtime_disable().

According to the PM subsystem guidelines, this requires a synchronous put
(like pm_runtime_put_sync()) to ensure the hardware is suspended before
teardown continues.

> +}
[ ... ]
> @@ -477,30 +579,45 @@ void xe_vsec_init(struct xe_device *xe)
[ ... ]
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
[Severity: High]
Is it safe to schedule this work on a non-freezable workqueue without
suspend hooks?

As noted earlier, scheduling this on the default workqueue allows the
worker to execute during system suspend. This permits hardware MMIO
accesses when the device is in a suspended state (D3).

> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D15
