Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F7606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KId/KDRk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68410E345;
	Thu, 22 Oct 2026 05:33:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4910E345
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:33:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A1B8A43F72;
 Thu, 22 Oct 2026 05:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534A71F000C1;
 Thu, 22 Oct 2026 05:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792647203;
 bh=oHU3KihSaFCzuANKlMbvlfU854TWgGiT3BdtXRyfbTU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KId/KDRk2A3fwp5W4NRsiW8p0mZNBPgsNOdnlprOJoxwCvmUGtfDU6grHYCI70YOp
 Xp6Xw1Gz/ax5mGc/qdVsYAEIH/h3CT6Y3SJ8kt3DoQ16oBP5JtjLUugNli9PK91FtT
 bOpVWBlDUenZXk5oL3Uq027qrDYeew5irxfB4fed/x7FvIaMxWVQnFOIx3Reu4Wokn
 fDinRdwSOYd3ZU/yjwJTfAlxBrBNYDKwq82gumgSP8SEvi0I3PuAKtH7ZW0VgvYnwe
 QyTsx/y/2x4RZFYppMTMztO/UaAQRCtydXsTmrE30wcMESnIg5SbLGAZb3dI4q5tIw
 WNVk1tWeMphjA==
Message-ID: <sashiko-outbox-181032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 8/9] drm/xe: Introduce xe_wedge
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261022051303.282805-9-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
 <20261022051303.282805-9-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 05:33:22 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: xe_wedge_init() registers dev-bound cleanup via drmm ins=
tead of devm
--

commit 57c0533228e6ea2dcc2823e52de07399929877cf
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Introduce xe_wedge

This commit consolidates the device wedging implementation into a dedicated
xe_wedge component and renames the wedge helper functions to match the
component namespace.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 0000000000000..2f35937c5e661
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,262 @@

[ ... ]

> +static void xe_wedge_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_wedge_init() - Initialize wedge
> + * @xe: xe device instance
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_wedge_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedge_work);
> +
> +	xe->wedged.mode =3D wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
> +	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_wedge_fini, xe);
> +}

[Severity: Medium]
Should xe_wedge_init() in drivers/gpu/drm/xe/xe_wedge.c register
xe_wedge_fini() via devm_add_action_or_reset(xe->drm.dev, ...) rather than
drmm_add_action_or_reset(&xe->drm, ...)?

When the device is wedged via xe_wedge_declare() or
prepare_device_for_reset() in drivers/gpu/drm/xe/xe_pci_error.c,
xe->wedged.flag is set to 1, xe_pm_runtime_get_noresume(xe) increments the
runtime pm usage count on the underlying pci device (xe->drm.dev), and
xe_wedge_declare() schedules xe->wedged.work:

drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset() {
	if (!atomic_xchg(&xe->wedged.flag, 1))
		xe_pm_runtime_get_noresume(xe);
}

If any userspace process still holds an open drm file descriptor (or a
dma-buf reference) when the driver is unbound for recovery
(DRM_WEDGE_RECOVERY_REBIND) or when xe_pci_error_slot_reset() runs:

drivers/gpu/drm/xe/xe_pci_error.c:xe_pci_error_slot_reset() {
	...
	xe_device_clear_in_reset(xe);
	pdev->driver->remove(pdev);
	devres_release_group(&pdev->dev, xe->devres_group);

	if (pdev->driver->probe(pdev, ent))
		return PCI_ERS_RESULT_DISCONNECT;
	...
}

the open drm file keeps a reference on xe->drm, so drm_managed_release() and
xe_wedge_fini() do not run during driver teardown.

Can this delay disable_work_sync(&xe->wedged.work) past drm_dev_unplug() and
leak the runtime pm reference on pdev->dev across driver unbind or slot
reset, only decrementing pdev->dev.power.usage_count later when the stale
drm file descriptor is closed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022051303.2828=
05-1-raag.jadav@intel.com?part=3D8
