Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17606C624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1DF10E126;
	Thu,  3 Sep 2026 20:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nOnKGhGx";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017ED10E126
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:34:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 29C0260219;
 Thu,  3 Sep 2026 20:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B835F1F000E9;
 Thu,  3 Sep 2026 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467639;
 bh=3j+8H9tmVu33Gol0XqdOggJY0wwwvgtbZTa2bNR5fxo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nOnKGhGxNLtNQl+FhOgO+tBNvgGheyt6MkCevDNbjO12ExOsiSNB8wQBN3uceBejU
 E4w2zd6N4ezv05cn2mHImhnDe7qNyoHvlVfsvs5uSb1v9T2pYiSG+QTnRGr90nN/Hi
 BGDFOdmfPkFPCg6JW/0RoIthDO86Sz5wbYXWvvgdramQ0DrY/eSXBXf5OtPW4QXO9U
 uO/ny8x1k8LwQ/0CNqRhgSKjlAVHxW/fc50Sdd+7BPdUFO107f8mk5c6EzHwlWPNaN
 7locjQ92nxFFozchtqanhctA9EsaZzedSzeSjYXVHD2B/PqX0Vo1c9a613FeSpDiqC
 ZXlorSsyGh+Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/18] drm/xe/vsec: Do not register BMG PMT for VF
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-26-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-26-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:33:59 +0000
Message-Id: <20260903203359.B835F1F000E9@smtp.kernel.org>
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
- [Critical] Removing the `!xe->soc_remapper.set_telem_region` check introd=
uces a NULL pointer dereference during PMT telemetry reads when the device =
is in boot survivability mode.
--

commit e9ec971f3f576a6d5f7a1224c18c5b1a5428ab39
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Do not register BMG PMT for VF

This commit disables BMG PMT registration for Virtual Function (VF) nodes by
adding SR-IOV checks. It also removes the soc_remapper pointer check in the
telemetry read path.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572c..71bc359b2ad14 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
> =20
>  	guard(mutex)(&xe->pmt.lock);
> =20
> -	if (!xe->soc_remapper.set_telem_region)
> -		return -ENODEV;
> -

[Severity: Critical]
Does removing this check introduce a NULL pointer dereference during PMT
telemetry reads when the device is in boot survivability mode?

If the device enters boot survivability mode (e.g., due to pcode failure or
configfs), xe_pci_probe() returns early. This skips xe_device_probe() and
xe_soc_remapper_init(), leaving xe->soc_remapper.set_telem_region as NULL.

However, xe_vsec_init() still registers the PMT capabilities during boot
survivability mode, exposing them via sysfs. Because the PCI core leaves
the device's runtime PM state as RPM_ACTIVE, a userspace read of the PMT
sysfs entry will bypass the xe_pm_runtime_get_if_active() check and
unconditionally dereference the NULL set_telem_region pointer later in this
function:

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_telem_read() {
	...
	/* Unconditional dereference of set_telem_region */
	xe->soc_remapper.set_telem_region(xe, mem_region);
	...
}

>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D6
