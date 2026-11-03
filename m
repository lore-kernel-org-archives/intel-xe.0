Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B02606A329
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgLTi0IX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5127510F3A6;
	Tue,  3 Nov 2026 06:23:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783710F39A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:23:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7135C41282;
 Tue,  3 Nov 2026 06:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEF61F000C1;
 Tue,  3 Nov 2026 06:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793687011;
 bh=olMRCMkJyI9JYLh630Ygd3N7VEycXqTmipHH16gWl1g=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KgLTi0IXMOUid5a5jza1Ymi6KviWDi3eBoBPDfWli88eJsMuPaWkc523M1sf+ELvh
 UVVdA7fAR1g44Vt1XyeW+C72UxzlwZ9FKGi7mG3QPwnnglnRG1jbpi9XqU54R1EuV3
 djKZ2Zb6837S21yk2K10cqn50iY/pqnkPhP6b7iccjHP1alMo2Ge+ZMrKdfPc9Dj6x
 sD6jvqxr/PB8W4ZUNgKZk1yfKOj5UTv78/nuSiYR6YqdnyVnPogdVYu+3FXZU9QOM8
 7YJXH4dCd2QWp+9YRYr/YaLZzwUsQ7cEwpYDHa3pwihgdvFES3Yc1q3v4Rw+eCM4bv
 FvFVuymMbhp7g==
Message-ID: <sashiko-outbox-194620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060929.1586783-11-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-11-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:23:30 +0000
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
- [High] drm/xe/hw_error: missing xe_hw_error_work_disable() on probe error=
 unwind
--

commit 07d05aa9e22e61afa48de05e4142a663fa2508dd
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/hw_error: Initialize hw_error_work per tile

This commit initializes tile->hw_error_work across all tiles in
xe_hw_error_init() and adds xe_hw_error_work_disable() in
xe_device_remove() to stop the hardware error work items on device
removal.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 07a7ab6ac0832..8f498e3e3e586 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  void xe_device_remove(struct xe_device *xe)
>  {
> +	xe_hw_error_work_disable(xe);
> +
>  	xe_display_unregister(xe);
> =20
>  	drm_dev_unplug(&xe->drm);

[Severity: High]
As reported by Sashiko on v2 [1], what happens if xe_device_probe() fails
after xe_hw_error_init() has already run?

During probe, xe_device_probe() calls xe_irq_install(), which invokes
xe_hw_error_init(xe) before allocating or requesting IRQs:

drivers/gpu/drm/xe/xe_irq.c:xe_irq_install() {
	xe_hw_error_init(xe);

	xe_irq_reset(xe);
	...
	err =3D pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
	if (err < 0) {
		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
		return err;
	}
}

Inside xe_hw_error_init(), process_hw_errors() -> xe_hw_error_irq_handler()
can immediately schedule tile->hw_error_work, and once xe_irq_install()
enables interrupts, dg1_irq_handler() can also schedule tile->hw_error_work
while the rest of xe_device_probe() is executing.

However, in __xe_pci_probe(), xe_pci_remove() -> xe_device_remove() is
only called if xe_pm_init() fails after xe_device_probe() has already
succeeded:

drivers/gpu/drm/xe/xe_pci.c:__xe_pci_probe() {
	err =3D xe_device_probe(xe);
	if (err)
		return err;

	err =3D xe_pm_init(xe);
	if (err)
		goto err_driver_cleanup;

	return 0;

err_driver_cleanup:
	xe_pci_remove(pdev);
	return err;
}

If xe_irq_install() fails after xe_hw_error_init(), or if any subsequent
step in xe_device_probe() fails (such as xe_gt_init(), xe_vram_memtest(),
or xe_heci_gsc_init()), xe_device_remove() is never called. Can
tile->hw_error_work remain pending or running while devres_release_all()
unmaps MMIO and frees struct xe_device, causing a use-after-free on probe
error unwind?

[1] https://lore.kernel.org/r/20261026060459.771448-13-riana.tauro@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060929.1586=
783-9-riana.tauro@intel.com?part=3D2
