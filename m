Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9992CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 08:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5C10FF63;
	Fri,  9 Oct 2026 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyQ6xq1Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEE410FF63
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 08:02:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 99D7E602C3;
 Fri,  9 Oct 2026 08:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AB31F000FF;
 Fri,  9 Oct 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791532965;
 bh=sVwdGQYZyI4UXeFxf15h1eC9ZJXu2JjlHMzEsMZpuns=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TyQ6xq1ZGmiH89vGW+myGTBCkmBNNYu2J9vp2nr+HuHn66gBvE5B+nftqWSgrc6pH
 MHRe2LvZMHVWGmVxgk7GeiT+0uC0nv36FSDzaLOfmy+RMbAfH7jcEXwBbaXkob9yQO
 58m9Gz31TagfuP/6xu5/G3fG/iy2q7OKkTB9Q9pkZTVQ4gGlhsnUWwh8QBzBxYxjor
 AAT+/0Ug59EGjqv26DH2ZhjyqQq3x+XR1J3oTlnCWD2viC2RQFP0kOC316EFKOQb4n
 0OXm1Z1qSmSf8koZiBhbpbTHbW1JWkFU/wL+g9k6+PAMZTT++/bPUcIbldiY+oEtwU
 lNSuAl2W0/vNw==
Message-ID: <sashiko-outbox-165051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009075224.1316885-2-varun.gupta@intel.com>
References: <20261009075224.1316885-2-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:02:44 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: early MSI workqueues wedge device before cleanup handler=
s are registered
--

commit 64d5d3713cb5cf15e2cdb1f9711919646d7c8e35
Author: Varun Gupta <varun.gupta@intel.com>
drm/xe: Add wa_14028434957 to Graphics Version 35.11

This patch prevents the SNIB AER latch from swallowing back-to-back=20
uncorrectable non-fatal errors by intercepting the MSI and reusing the=20
existing GFSP error containment logic. Because GFSP mailbox queries can=20
sleep, handling is deferred to a workqueue to ensure hardirq safety,=20
wedging the device if a reset is required.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index 5f2abc9485ff5..bde707a3fb641 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
[ ... ]
> @@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct *wo=
rk)
>  	xe_survivability_mode_runtime_enable(xe);
>  }
> =20
> +static void nonfatal_msi_work(struct work_struct *work)
> +{
> +	struct xe_drm_ras *ras =3D container_of(work, typeof(*ras), nonfatal_ms=
i_work);
> +	struct xe_device *xe =3D container_of(ras, typeof(*xe), ras);
> +
> +	guard(xe_pm_runtime)(xe);
> +	enum xe_ras_recovery_action action =3D xe_ras_process_errors(xe);
> +
> +	/*
> +	 * TODO: Request an SBR instead of wedging, once VR driver
> +	 * quiescing support is in place.
> +	 */
> +	if (action !=3D XE_RAS_RECOVERY_ACTION_RECOVERED)
> +		xe_device_declare_wedged(xe);

[Severity: Medium]
Can this workqueue race with driver probe?

Looking at xe_irq_install(), it calls xe_hw_error_init() which processes=20
pre-existing hardware errors via process_hw_errors(). This immediately queu=
es=20
nonfatal_msi_work if non-fatal errors are already pending.

If the work executes concurrently with xe_device_probe(), it will call=20
xe_device_declare_wedged(xe) which acquires a PM runtime reference=20
(xe_pm_runtime_get_noresume) and sends a wedged uevent.=20

However, xe_device_wedged_fini isn't registered until the very end of probe=
,=20
and drm_dev_register() hasn't finished yet.=20

If probe fails in between, could the PM runtime reference leak? Is it safe=
=20
to send a wedged uevent on an unregistered DRM device?

> +}
> +
[ ... ]
> @@ -436,6 +464,15 @@ static void hw_error_source_handler(struct xe_tile *=
tile, const enum hardware_er
>  	 * here for those platforms.
>  	 */
>  	if (xe->info.has_sysctrl) {
> +		/*
> +		 * Defer non-fatal MSI handling to process context because the GFSP
> +		 * query can sleep.
> +		 */
> +		if (hw_err =3D=3D HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434=
957)) {
> +			schedule_work(&xe->ras.nonfatal_msi_work);

[Severity: Medium]
Could this execute too early during initialization?

As noted above, if a non-fatal error is present during module load, this=20
schedules the work early in the initialization sequence before cleanup=20
handlers are fully established in xe_device_probe().

> +			return;
> +		}
> +
>  		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>  		return;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009075224.1316=
885-2-varun.gupta@intel.com?part=3D1
