Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24BCCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 07:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E510FEE1;
	Fri,  9 Oct 2026 07:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Poe5v/oN";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839DD10FEE1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 07:13:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0212A602CA;
 Fri,  9 Oct 2026 07:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8363C1F000FF;
 Fri,  9 Oct 2026 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791530023;
 bh=+aofBrIEss1661wY/uLETDv0t13guDxyl/3PYXWLxmk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Poe5v/oNgcHa1qrZU3wwPKhMUds1A1zPhaJd+FOqhwinINzH1WjndFL+zhdo28cVl
 YuO0J6aQNn9dHEmBC4krCbgdyn4l0ihV5qn1zZVKgBHNmbyDhUarFtV4oB2To7aNG/
 +IMj7ukOFsOOH8MuXLxfkuYScsdCLmYmgvk9V5pJOaAEAeybbg2pyRdcl5nxOn5UvF
 duZlF8H02qr6T96Tq2ttBwg3JV9bKJJQebDBp0D4kLf6zDgh23IvywU8nYR18cQepb
 PQiyHxemIftPG5R22k+h4g+HZOZBjp54XGdJDfMFmpTH/5Zvgn2It/11uKCCHynS8z
 xFiMtyg/jPr/w==
Message-ID: <sashiko-outbox-164984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009065748.1304076-2-varun.gupta@intel.com>
References: <20261009065748.1304076-2-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:13:43 +0000
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
- [High] drm: missing error return after drmm_add_action_or_reset() failure=
 leads to leaked work and UAF
- [High] xe: Use-after-free/MMIO fault due to deferred workqueue cancellati=
on in drmm
- [High] xe: nonfatal_msi_work accesses MMIO without waking device, causing=
 suspended MMIO accesses
- [High] drm/xe: UAF and uninitialized work_struct in csc_hw_error_work
--

commit c1e7bdf12138e40e4c7ecaaa2d05a9ee296aa085
Author: Varun Gupta <varun.gupta@intel.com>
Subject: drm/xe: Add wa_14028434957 to Graphics Version 35.11

This patch bypasses a faulty AER path by intercepting uncorrectable=20
non-fatal MSI errors and routing them to a deferred workqueue. The new=20
workqueue reuses the GFSP error containment logic and wedges the device=20
if a reset is required.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index 5f2abc9485ff5..847ca1ae411ef 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
[ ... ]
> @@ -173,6 +177,27 @@ static void csc_hw_error_work(struct work_struct *wo=
rk)
>  	xe_survivability_mode_runtime_enable(xe);
>  }
> =20
> +static void nonfatal_msi_work(struct work_struct *work)
> +{
> +	struct xe_drm_ras *ras =3D container_of(work, typeof(*ras), nonfatal_ms=
i_work);
> +	struct xe_device *xe =3D container_of(ras, typeof(*xe), ras);
> +	enum xe_ras_recovery_action action =3D xe_ras_process_errors(xe);

[Severity: High]
Does this workqueue execution need to resume the device first?

Because this runs asynchronously in a worker thread, the runtime PM=20
reference from the interrupt might already be released, allowing the device=
=20
to auto-suspend to D3. The nested call to xe_sysctrl_send_command() uses=20
guard(xe_pm_runtime_noresume)(xe), which blocks future suspends but does=20
not wake a device that is already suspended. This means MMIO accesses=20
to SYSCTRL_MB_CTRL might target suspended hardware.

Other workers like xe_sysctrl_work() seem to use guard(xe_pm_runtime)(xe)=20
to explicitly wake the device.

> +
> +	/*
> +	 * TODO: Request an SBR instead of wedging, once VR driver
> +	 * quiescing support is in place.
> +	 */
> +	if (action !=3D XE_RAS_RECOVERY_ACTION_RECOVERED)
> +		xe_device_declare_wedged(xe);
> +}
> +
> +static void hw_error_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	cancel_work_sync(&xe->ras.nonfatal_msi_work);

[Severity: High]
Should this function also cancel csc_hw_error_work?

The code initializes csc_hw_error_work in xe_hw_error_init(), but it=20
doesn't appear to be cancelled during teardown. With a fini function now=20
added, leaving csc_hw_error_work uncancelled might allow it to run after=20
the xe_device structures are freed.

Also, it looks like csc_hw_error_work is only initialized for the root tile=
=20
in xe_hw_error_init():

    struct xe_tile *tile =3D xe_device_get_root_tile(xe);
    ...
    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);

If a non-root tile receives a hardware error and schedules this work, might=
=20
it operate on an uninitialized work_struct?

> +}
> +
[ ... ]
> @@ -436,6 +461,15 @@ static void hw_error_source_handler(struct xe_tile *=
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

[Severity: High]
Could this work execute after the MMIO mappings have been unmapped?

Since hw_error_fini() is registered as a drmm action, its execution is=20
deferred until the last DRM reference is dropped (like when userspace=20
closes the device file). However, devres actions unmap the device's MMIO=20
mappings synchronously during PCI unbind.=20

If this work is queued just before the IRQ is torn down and executes after=
=20
the unbind finishes, the nested xe_ras_process_errors() could attempt to=20
access unmapped MMIO regions via xe_sysctrl_send_command(), resulting in a=
=20
fatal page fault.

> +			return;
> +		}
> +
>  		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>  		return;
>  	}
> @@ -546,6 +580,11 @@ void xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> =20
> +	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
> +
> +	if (drmm_add_action_or_reset(&xe->drm, hw_error_fini, xe))
> +		drm_err(&xe->drm, "Failed to register hw_error_fini\n");

[Severity: High]
Is a return statement missing here?

If drmm_add_action_or_reset() fails, it logs an error but initialization=20
continues. This means the driver can be fully initialized without=20
hw_error_fini() being registered. If nonfatal_msi_work gets scheduled,=20
it will never be cancelled on teardown, potentially leading to a=20
use-after-free regression.

> +
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009065748.1304=
076-2-varun.gupta@intel.com?part=3D1
