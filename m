Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FBAC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3432210E777;
	Mon, 31 Aug 2026 09:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fR/xrDF2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF7110E777
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:02:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 23A0160120;
 Mon, 31 Aug 2026 09:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1711F000E9;
 Mon, 31 Aug 2026 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788166952;
 bh=Y1Em+1GF4NYMMpUM9B6y4ONgK8NdWm8qcV6IsC+0wyI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fR/xrDF2kK2RGzCk3DqwREoIqP25oeE+S4aBZLl1M+Y6XHJh8m7PlyH5F5/s5gM0W
 5i9+dLE4bsdtYcIC1kBGi9Xxd4vpIbJImohbDHnu3697i8NVEUsj1YWiaDoZfXg4nv
 E8g6Szw4ie2gk+jfBUOiaWiUx1u9oPkm5XbRqtjmbsjHUvr2WoKPCdWLqIAgssDAQW
 wibylTZ/ST/VTMgUCRPaf9iRpeQR9gQ7t9dPHoK2N+uK8rQg9U5uuJgpIPzziw4fon
 S9tBjvtoxz7VR8WaIn9qalKhGHAglhMntwKJIWIRdXes8foxIK1l+jb1xL7Ja60jel
 G2jxQpudnSCzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 11/15] drm/xe/ras: Cache disable_vram_page_offline
 policy at init
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-28-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-28-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:02:32 +0000
Message-Id: <20260831090232.AB1711F000E9@smtp.kernel.org>
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
- [Medium] Inconsistent default value for disable_vram_page_offline when co=
nfigfs is disabled.
--

commit fc4ea47b91e45c757aade7da6b3575d972f0bc5f
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/ras: Cache disable_vram_page_offline policy at init

This commit caches the configfs attribute disable_vram_page_offline in
the xe_drm_ras structure at initialization. This avoids repeated configfs
lookups during page faults.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..f11a743990044 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -804,6 +805,14 @@ void xe_ras_init(struct xe_device *xe)
>  {
>  	int ret;
> =20
> +	/*
> +	 * TODO: Replace platform check with xe->info.has_disable_vram_page_off=
line
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe->ras.disable_vram_page_offline =3D
> +			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));

[Severity: Medium]
Will this silently disable VRAM page offlining when configfs is disabled in
the kernel configuration?

When the kernel is built without configfs,
xe_configfs_get_disable_vram_page_offline() is provided by a stub in
drivers/gpu/drm/xe/xe_configfs.h that returns true.

The intended default behavior when configfs is enabled but the attribute is
not set appears to be false (allowing offlining), as defined by
device_defaults in drivers/gpu/drm/xe/xe_configfs.c. By calling the stub and
caching its return value here, kernels built without configfs will silently
have this hardware reliability feature disabled by default.

Should the stub in drivers/gpu/drm/xe/xe_configfs.h be updated to return
false to match the expected default behavior?

> +
>  	xe_drm_ras_init(xe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D11
