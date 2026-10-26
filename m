Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E6606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vc0GfvCG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7B10E076;
	Mon, 26 Oct 2026 09:37:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35A10E076
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 09:37:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7EE7B43400;
 Mon, 26 Oct 2026 09:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475B11F01825;
 Mon, 26 Oct 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793007431;
 bh=lSt+OIPBlRB5MiHzKiq4BAqS6CygC02T68fYglHnAhw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Vc0GfvCGZYiR78HtUR1KYIVSctGDat4g8zaTpI296KOOZoQuJFSjxtuert9p2MNC2
 6X5cboIAPVuL/GvQtPEPxr914fZVxQf/v86XlB6Sp6LURBizb1eADunqY+oKwWI0ES
 dmV1quzbPuWxJfJaU0oFlpo8FvwhuTb69M8g5sFiSYWETPT7uWGpQ6McTxlVBKQCm2
 WTvA+fpqfNMsASFWmFw3XlpduN7cZ2nHhEDBraJTbhw/Q2RcjXehXh+4HNsqmLJVJT
 LunwLutZXJWXDCOvHwAJX9FcBFYq3G0b6MFrcJcwUnwICQNN2+agi6DLKB0bfy1eUq
 SJ5RnF9sfOx+A==
Message-ID: <sashiko-outbox-184810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261026060459.771448-13-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-13-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:37:10 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe/hw_error: devres teardown race in xe_hw_error_work_disable()
- [Medium] drm/xe/hw_error: unchecked devm_add_action_or_reset() in xe_hw_e=
rror_init()
- [Medium] drm/xe/hw_error: uninitialized delayed_work in xe_hw_error_work_=
disable()
--

commit eb5d3c525869285977a7b6ae0cced93702f4f61e
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/hw_error: Initialize hw_error_work per tile

This commit initializes tile->hw_error_work across all tiles in
xe_hw_error_init() rather than only on the root tile, and registers a
xe_hw_error_work_disable() callback with devm_add_action_or_reset() to
disable the delayed work on teardown.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index 41ddd997478b8..f7799c3c08aac 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,23 @@ static void process_hw_errors(struct xe_device *xe)
>  	}
>  }
> =20
> +/**
> + * xe_hw_error_work_disable - Disable hw error work
> + * @arg: xe device instance
> + *
> + * This function disables the delayed work for hardware error handling
> + * for all tiles.
> + */
> +void xe_hw_error_work_disable(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_delayed_work_sync(&tile->hw_error_work);
> +}

[Severity: Medium]
Should xe_hw_error_work_disable() also check !IS_DGFX(xe) || IS_SRIOV_VF(xe)
before calling disable_delayed_work_sync()?

In xe_hw_error_init(), tile->hw_error_work is only initialized via
INIT_DELAYED_WORK() when IS_DGFX(xe) && !IS_SRIOV_VF(xe):

drivers/gpu/drm/xe/xe_hw_error.c:xe_hw_error_init()
	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
		return;

	for_each_tile(tile, xe, id)
		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);

However, xe_hw_error_work_disable() is exported in drivers/gpu/drm/xe/xe_hw=
_error.h
without that guard. In the commit "drm/xe/xe_ras: Disable hw error worker w=
hen
AER handling is in progress", xe_pci_error_detected() in
drivers/gpu/drm/xe/xe_pci_error.c calls xe_hw_error_work_disable(xe) whenev=
er
XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev) is true.

Because Crescent Island (cri_desc) sets .has_sriov =3D true and enables
workaround 14028434957 at the platform level in xe_device_probe_early() bef=
ore
xe_sriov_probe_early(), an SR-IOV VF on Crescent Island has
XE_DEVICE_WA(xe, 14028434957) set while tile->hw_error_work remains
uninitialized.

If pcie_do_recovery() invokes xe_pci_error_detected() on the VF, won't
xe_hw_error_work_disable() pass an uninitialized tile->hw_error_work (with
work->func =3D=3D NULL) to disable_delayed_work_sync() -> __cancel_work_syn=
c() ->
__flush_work(), triggering WARN_ON(!work->func) in kernel/workqueue.c?

> +
>  /**
>   * xe_hw_error_init - Initialize hw errors
>   * @xe: xe device instance
> @@ -546,12 +563,15 @@ static void process_hw_errors(struct xe_device *xe)
>   */
>  void xe_hw_error_init(struct xe_device *xe)
>  {
> -	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
> =20
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
> =20
> -	INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
> =20
>  	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>  }

[Severity: High]
Can registering xe_hw_error_work_disable() via devm_add_action_or_reset() r=
ace
with an in-flight hw_error_work() callback during devres teardown and leave
behind dangling devres nodes and sysfs attributes after struct xe_device is
freed?

When devres teardown runs during probe failure unwind, driver unbind
(__device_release_driver() -> xe_pci_remove() -> device_unbind_cleanup() ->
devres_release_all()), or PCI slot reset (xe_pci_error_slot_reset() ->
devres_release_group()), drivers/base/devres.c moves all queued nodes from
dev->devres_head onto a local todo list before running any release callback=
s:

drivers/base/devres.c:devres_release_all()
	spin_lock_irqsave(&dev->devres_lock, flags);
	cnt =3D remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
	spin_unlock_irqrestore(&dev->devres_lock, flags);

	release_nodes(dev, &todo);

If tile->hw_error_work was scheduled by process_hw_errors() or an interrupt=
 and
begins executing before release_nodes() invokes xe_hw_error_work_disable()
(including while xe_hw_error_work_disable() is waiting inside
disable_delayed_work_sync(&tile->hw_error_work) for the running worker to
finish), the worker executes:

drivers/gpu/drm/xe/xe_hw_error.c:hw_error_work()
  -> xe_survivability_mode_runtime_enable(xe)
    -> create_survivability_sysfs(pdev)

Inside drivers/gpu/drm/xe/xe_survivability_mode.c:create_survivability_sysf=
s(),
the worker creates sysfs files and registers new devres actions on
xe->drm.dev:

	ret =3D device_create_file(dev, &dev_attr_survivability_mode);
	if (ret)
		goto failed;

	ret =3D devm_add_action_or_reset(xe->drm.dev,
				       xe_survivability_mode_fini, xe);
	if (ret)
		goto failed;

	if (needs_info) {
		ret =3D devm_device_add_group(dev, &survivability_info_group);
		if (ret)
			goto failed;
	}

Because remove_nodes() already drained dev->devres_head into todo before
release_nodes() started, those newly registered devres actions are appended=
 to
dev->devres_head and are not run by the active release_nodes(dev, &todo) pa=
ss,
while devm_drm_dev_init_release on todo frees struct xe_device *xe.

Wouldn't this leave the survivability_mode and survivability_info sysfs fil=
es
exposed on pdev->dev after xe is freed and drvdata is cleared (leading to a
NULL pointer dereference or use-after-free in survivability_mode_show() and
survivability_info_show()), leave xe_survivability_mode_fini(xe) queued on
dev->devres_head with a dangling xe pointer, and cause subsequent driver
re-probing in really_probe() to fail with -EBUSY because dev->devres_head is
non-empty?

Additionally, what happens in xe_hw_error_init() if devm_add_action_or_rese=
t()
fails with -ENOMEM?

include/linux/device/devres.h:__devm_add_action_or_reset()
	ret =3D __devm_add_action(dev, action, data, name);
	if (ret)
		action(data);

	return ret;

On allocation failure, __devm_add_action_or_reset() immediately runs
xe_hw_error_work_disable(xe), which cancels any delayed work just scheduled=
 by
process_hw_errors(xe) (after the hardware error registers and GFX_MSTR_IRQ
have already been cleared) and permanently disables tile->hw_error_work acr=
oss
all tiles via WORK_CANCEL_DISABLE. Because xe_hw_error_init() returns void =
and
ignores the return value, xe_irq_install() and xe_device_probe() continue p=
robing
with tile->hw_error_work permanently disabled for the lifetime of the devic=
e.
Should xe_hw_error_init() propagate the error to xe_irq_install()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026060459.7714=
48-11-riana.tauro@intel.com?part=3D2
