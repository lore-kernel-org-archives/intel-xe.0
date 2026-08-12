Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF073C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4910F142;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YVTuGYBX";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532E110E452
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:49:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AE4B40DAD;
 Wed, 12 Aug 2026 19:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75AB1F000E9;
 Wed, 12 Aug 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564162;
 bh=hxrS0cV9QHuxH+UUnCpDmXlwO2HTsUsFsBvO1Ureps8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YVTuGYBX08UTOeGx7EbbHkkGZSfepSN5f/1q18TDSxI1tajntN8HRz4vd7hxHflC2
 o3w/UwfkNdqgQdWixNI0EKv41av9LlsVRp+tT1aFqQnq5h5LlKiEJ/nwsyAbUGjQjQ
 Lp/Q0Op/VLL80y14qaIYZ2zdn6w/6AxPZSbd6egAIMxcorrt5P+zlegJenJNKL0sC1
 VdtjNbSFcI0ne15Q6UefNPaI8jCX2tKqmr9X7VDRWK3qdTNp6yIaYhPFWVQGT7MVXi
 P5OnEX9akmtviQq5DEMXWZ37+Qr6lNJJz/OypojYCtveGqMpWZZOIdd5YgWHrMq07n
 YvE5gzd2gFT0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] drm/xe/vsec: Support Crescent Island PMT
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-18-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-18-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:49:21 +0000
Message-Id: <20260812194921.E75AB1F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [Medium] The Crescent Island (CRI) PMT feature is completely non-function=
al and unreachable due to multiple missing integration steps across the VSE=
C initialization and decoding paths.
--

--- Patch [6]: [PATCH v2 06/10] drm/xe/vsec: Support Crescent Island PMT ---
commit 0135683ab7b7649c2500e35c35f765f517103d98
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

    drm/xe/vsec: Support Crescent Island PMT
   =20
    Crescent Island (CRI) supports PMT telemetry and crashlog.
   =20
    Add Crescent Island (CRI) discovery structure (DVSEC)
    information to allow for Xe registration.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8abe11e6312f0..6345b0b4b26b8 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -21,8 +21,19 @@
> =20
>  #include "regs/xe_pmt.h"
> =20
> -/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
> +/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
> +#define CRI_DEVICE_ID 0xE2FA

[Severity: Medium]
Does CRI_DEVICE_ID need to be added to xe_guid_decode()?

Currently xe_guid_decode() unconditionally checks for BMG_DEVICE_ID:

drivers/gpu/drm/xe/xe_vsec.c:xe_guid_decode() {
	...
	if (device_id !=3D BMG_DEVICE_ID)
		return -ENODEV;
	...
}

Will this reject CRI devices when they try to decode their GUID?

[ ... ]

>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN =3D 0,
>  	XE_VSEC_BMG,
> +	XE_VSEC_CRI,
>  };
> =20
>  static struct intel_vsec_platform_info xe_vsec_info[] =3D {
> @@ -60,6 +98,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] =
=3D {
>  		.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>  		.headers =3D bmg_capabilities,
>  	},
> +	[XE_VSEC_CRI] =3D {
> +		.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
> +		.headers =3D cri_capabilities,
> +	},
>  	{ }
>  };

[Severity: Medium]
Are there missing updates to get_platform_info() and vsec_platforms[] to
actually return XE_VSEC_CRI?

Currently get_platform_info() returns XE_VSEC_UNKNOWN for any platform
greater than XE_BATTLEMAGE:

drivers/gpu/drm/xe/xe_vsec.c:get_platform_info() {
	if (xe->info.platform > XE_BATTLEMAGE)
		return XE_VSEC_UNKNOWN;

	return vsec_platforms[xe->info.platform];
}

Additionally, does xe_vsec_init() need a case for XE_VSEC_CRI to set up
the PMT callbacks?

drivers/gpu/drm/xe/xe_vsec.c:xe_vsec_init() {
	...
	switch (platform) {
	case XE_VSEC_BMG:
		if (!xe->soc_remapper.set_telem_region)
			return;
		info->priv_data =3D &xe_pmt_cb;
		break;
	default:
		break;
	}
	...
}

Without these additions, it appears the CRI platform will not be fully
detected and the PMT feature will remain unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D6
