Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1D5C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1B310E259;
	Tue,  1 Sep 2026 20:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e9bSVb9+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367410E259
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:21:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CCC741AF2;
 Tue,  1 Sep 2026 20:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5791F000E9;
 Tue,  1 Sep 2026 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788294100;
 bh=8n2yy4O4ieJikhiSBYfcFO8+UNhQAohqbrLRbpKpSZQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=e9bSVb9+ElZcv6IQuivewikauxFpHAm0cW+Ec1JmFUWDexrBWXgCiEBccMngv5Rik
 qVUe+UWUJih25pE6kIGsXcczpVjcYcnupgzB4byKJ2NMH0RgIIeNh5t+zuzQu9B19p
 bipGngwt5de/hiCJvdTe2XyKFytfENMmewNISaRoovlC3hxlNVmq6UhRhv6WIwvOIX
 Tx1nDjgTTGLAjFTujd2y0CiKJtu3vlcps9SMzvNDlpUqSU+VIGKCzmlVSVA7C+BLH1
 AOdkSRCQQ60UubmPqNA23/rw8tGBmMQOLaTZcmAB2up/pgaPPp4x3tZAQDV2dVApQx
 WIEJ+Ul5Lqxbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/18] drm/xe/vsec: Update PMT internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-37-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-37-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:21:39 +0000
Message-Id: <20260901202140.0E5791F000E9@smtp.kernel.org>
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
- [Low] Typo in warning message: 'availalbe' instead of 'available'.
--

commit be57820139ce1361483c472d9f460a1358ea6064
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Update PMT internal access
   =20
Current PMT internal access assumes BMG devices. Use the new PMT GUID API
to read the device specific guid. Minor cleanup for a newly unused paramete=
r.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 844d8c6face67..039c23086990b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO);=
 /* See xe_pci_probe */
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *=
version)
>  {
>  	int ret =3D 0;
> +	u32 guid;
> =20
>  	guard(xe_pm_runtime)(xe);
> =20
> -	ret =3D xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
> +	ret =3D xe_vsec_get_guid(xe, &guid);
> +	if (ret) {
> +		xe_warn(xe, "PMT device is not availalbe: %d\n", ret);

[Severity: Low]
Is there a typo in this warning message in xe_get_pcode_version? It looks
like availalbe should be spelled available.

> +		return ret;
> +	}
> +
> +	ret =3D xe_pmt_telem_read(xe->drm.dev, guid,
>  				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>  	if (ret !=3D sizeof(*version)) {
>  		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(r=
et));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D17
