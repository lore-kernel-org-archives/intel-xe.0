Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61864C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1169710F47B;
	Thu,  3 Sep 2026 08:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPBmkVaR";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED110F476;
 Thu,  3 Sep 2026 08:15:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B21D600D1;
 Thu,  3 Sep 2026 08:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C801F000E9;
 Thu,  3 Sep 2026 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788423319;
 bh=CpV+GH04b9H/ZL1WSV9oY6AhVSB0SDwS4qfIpZt78Vo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TPBmkVaR+64pSW/1WaF+sORGviAKbVdgWaAC5yE4FvKa/KH1FzTjipbzMPcT1Um7j
 YEHl+egvGL/WS/X4BQS4lvdj1pgl1RXYbaFLsqxuYSVZ7Qe297GZcPyUISiN2o3EgF
 zxqUppA+VZGJ9BGj6CTYK2OAhCr7UPQDbEFgAC6vGiE5c8QsRpb7YIFpi6ANk7kolw
 Mx7tzY6Arng1N3pBAWy3dzR4bs7q35HIOs6Bg3Pd2aUgvSSOTXUIORVMEkMbouZti+
 3BVHc9UAsjLp9i4gmwbKud450V0pLxnPTwyyrvTzC3y4r2cHHOlw8BEHownCdaxtit
 NpclzS9HciliQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] drm/xe/pm: initialize the device's system wakeup
 capabilities
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260903080410.489411-2-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:15:19 +0000
Message-Id: <20260903081519.B9C801F000E9@smtp.kernel.org>
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
- [High] Device wakeup capability is enabled unconditionally for all platfo=
rms and VFs, falsely advertising PME capability and breaking HPD polling on=
 unsupported platforms.
--

commit 3d9bcb78036d2ff7f08956912516e90ce3bea87a
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: initialize the device's system wakeup capabilities

This commit enables the device as a wakeup device to allow display hotplugs
to generate PME events for NVL+ hardware.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611f..009271ce532c6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1216,6 +1216,10 @@ static int __xe_pci_probe(struct pci_dev *pdev, co=
nst struct xe_device_desc *des
> =20
>  	pci_set_master(pdev);
> =20
> +	err =3D devm_device_init_wakeup(&pdev->dev);
> +	if (err)
> +		return err;
> +

[Severity: High]
Does enabling wakeup unconditionally here falsely advertise PME capabilities
for unsupported platforms (e.g., DG2, MTL, LNL) and SR-IOV VFs?

By calling devm_device_init_wakeup() in __xe_pci_probe(), the driver sets
dev->power.can_wakeup =3D true for every xe device. Later, during
xe_pci_runtime_suspend(), the code checks:

    pme_capable =3D pci_enable_wake(pdev, state, true) =3D=3D 0;

Because wakeup is enabled by default, pci_enable_wake() will incorrectly
return 0 (success) on older PCIe platforms that report standard PCI PM
capabilities.

This erroneously sets pme_capable =3D true, which is passed to
xe_display_set_pme_capable(). Since intel_hpd_poll_enable() skips polling
if the device is marked PME capable, could this cause hotplug events to be
completely missed during suspend on pre-NVL platforms that cannot actually
generate PMEs from HPDs?

>  	err =3D xe_probe_info_early(xe, desc, &probed_info);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903080410.4894=
11-1-vinod.govindapillai@intel.com?part=3D1
