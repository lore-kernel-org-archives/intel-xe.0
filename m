Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB30C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 15:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11F10EBDD;
	Tue, 18 Aug 2026 15:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BPSnPkB8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789E010EBDD
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 15:54:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BDEDB60A58;
 Tue, 18 Aug 2026 15:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557591F000E9;
 Tue, 18 Aug 2026 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787068473;
 bh=+jXJGIi+eFs7XDlMZeqET7Nd0jvp/OHhOnv/x+8+0uQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BPSnPkB8K9CBp1eg8x/4VjbrRalQ4DPviOXMXxhlGGI/2sEhW35yWVfs9vG4Xqtbz
 Q0B+uyanbyMK1rP5o3w3aw74iUlIkoxpTAfjOK7uKwtCgT/vOAJhUiW8QX3eUavSY4
 eH3lJP4LYNp1R4VzeP/HOuxlYN7n/YgxXodxFDxPQBU38u8UGe0ZuIE+c+MuNKwuIQ
 xz+Y8QmkzTrPXm63IESGxGkKps08CVTz8wObnBEZ+foAWDwqnA4G5UGYAL2egpmFwJ
 MAJ5+4CoiCDV+0vpCm0n3az9P1CS+K1HFJMsiE97LWU/2V9yrBtM1f8s/qIv6iWzDd
 FmwO3Bg7la2Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add force_p2p module/configfs parameter
To: "Nathan Ciobanu" <nathan.d.ciobanu@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
References: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 15:54:33 +0000
Message-Id: <20260818155433.557591F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Global force_p2p parameter incorrectly overrides P2P safety checks=
 for all non-Xe PCI devices.
- [Low] The `force_p2p` attribute is missing from `dump_custom_dev_config()=
`, resulting in incomplete debug logs.
--

--- Patch [1]: [PATCH] drm/xe: Add force_p2p module/configfs parameter ---
commit 7f80ed3c08c50eca10a0100021e6454c59749548
Author: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>

drm/xe: Add force_p2p module/configfs parameter

Add force_p2p module and configfs parameter to give users an option to
allow P2P DMA between GPU cards that are connected off of the root bus
with no switch/bridge in between, as seen in some virtual machine
topologies.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 052cce9621611..187352a8b4199 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -856,6 +923,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, force_p2p);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> =20
> @@ -865,6 +933,7 @@ static struct configfs_attribute *xe_config_device_at=
trs[] =3D {
>  	&attr_enable_multi_queue,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> +	&attr_force_p2p,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
>  	NULL,

[Severity: Low]
Should the new force_p2p attribute also be added to dump_custom_dev_config(=
)?

When a user modifies the force_p2p attribute via configfs and subsequently
binds the device, the driver successfully detects that custom settings were
applied but fails to log the force_p2p modification. This leads to confusing
debug logs where the driver announces custom settings but prints an
incomplete list.

[ ... ]
> @@ -1269,6 +1338,25 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *=
pdev)
>  	return ret;
>  }
> =20
> +/** xe_configfs_get_force_p2p - get configfs force_p2p setting
> + * @pdev: pci device
> + *
> + * Return: force_p2p setting in configfs
> + */
> +bool xe_configfs_get_force_p2p(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	bool ret;
> +
> +	if (!dev)
> +		return xe_modparam.force_p2p;

[Severity: High]
Does returning xe_modparam.force_p2p for non-Xe devices bypass PCIe topology
safety checks for unrelated hardware?

Since find_xe_config_group_device() will return NULL for non-Xe PCI devices,
this fallback unconditionally causes any other PCI device (like NVMe drives
or network cards) to inherit the global xe.force_p2p setting.

> +
> +	ret =3D dev->config.force_p2p;
> +
> +	config_group_put(&dev->group);
> +	return ret;
> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_=
buf.c
> index bf0728838ead5..bd8f8ad70bcd3 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
[ ... ]
> @@ -26,9 +27,14 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
>  			     struct dma_buf_attachment *attach)
>  {
>  	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> +	struct pci_dev *a_pdev =3D to_pci_dev(obj->dev->dev);
> +	struct pci_dev *b_pdev =3D dev_is_pci(attach->dev) ?
> +				 to_pci_dev(attach->dev) : NULL;
> =20
>  	if (attach->peer2peer &&
> -	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) =
< 0)
> +	    !(b_pdev && xe_configfs_get_force_p2p(a_pdev) &&
> +	      xe_configfs_get_force_p2p(b_pdev)) &&
> +	    pci_p2pdma_distance(a_pdev, attach->dev, false) < 0)

[Severity: High]
Because xe_configfs_get_force_p2p(b_pdev) falls back to the global module
parameter when find_xe_config_group_device() fails, doesn't this condition
evaluate to true even when b_pdev is a completely unrelated device?

This effectively skips the pci_p2pdma_distance() safety checks for any devi=
ce
attempting P2P with the Xe GPU when xe.force_p2p=3D1 is enabled, which risks
data corruption if the bridge drops or corrupts transactions.

>  		attach->peer2peer =3D false;
> =20
>  	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_T=
T))
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 627a741293d59..3cd53bb166afd 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -892,6 +893,10 @@ static bool xe_has_interconnect(struct drm_pagemap_p=
eer *peer1,
>  	if (dev1 =3D=3D dev2)
>  		return true;
> =20
> +	if (xe_configfs_get_force_p2p(to_pci_dev(dev1)) &&
> +	    xe_configfs_get_force_p2p(to_pci_dev(dev2)))
> +		return true;
> +

[Severity: High]
Similar to the xe_dma_buf_attach() logic above, does this improperly bypass
the interconnect peer distance checks for non-Xe devices when the global
module parameter is set?

>  	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >=3D 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818154042.3016=
38-1-nathan.d.ciobanu@linux.intel.com?part=3D1
