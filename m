Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF084C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9817910E202;
	Fri,  4 Sep 2026 18:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eddxphbg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290110E202
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:50:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D21D600C8;
 Fri,  4 Sep 2026 18:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339DC1F00A3D;
 Fri,  4 Sep 2026 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788547806;
 bh=s3fodXQ4NYRhwkrX5rUIrSIfo9THGLjNbBGXEua1WPU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EddxphbgqjOc7I1k1Tp4Opo21hUr13PRnieqfld/8pW+LHlCV+Z4hHJIiwudHLiFv
 IkgXHBAeLeDy2kquwnZr5u2gcz9Z2P8a8MqHiqxJdPt1ZBY0Dl4GD3MHfKzSIqL1Xe
 lRcjvhsGCHDwBHGo6FTMX0EKm5SvekkZ/PPxIhZeEUPXRKhsFzRKbYFEpTB6e3vpoW
 PHYOH3xq6QSszIJYQjbtFmD24o9lXbwDixNOHQAWAJzUShGEM33SO6a9s1OrOLb7t5
 9oYqiHhVMWJh+ha7PbkDlBxlJHusUpc1VQrnmLddACAS4KyDpA0DeKJh0kJ/ndYANF
 2JSzqzYTFTKlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/18] drm/xe/vsec: Crescent Island PMT decode
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-33-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-33-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:50:05 +0000
Message-Id: <20260904185006.339DC1F00A3D@smtp.kernel.org>
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
- [Low] Unused segment mask macros.
--

commit 33d506c12896273e5662ff3cb4664742e398c70e
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT decode

This commit updates the PMT decode path and data read callback to support
the Crescent Island (CRI) device, which uses different index and offset
values for accessing the PMT data area.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 031c1c0ae5706..22c4efb021328 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -120,19 +120,25 @@ static struct intel_vsec_platform_info xe_vsec_info=
[] =3D {
[ ... ]
>  #define GUID_TELEM_ITERATION	GENMASK(3, 0)
> -#define GUID_SEGMENT		GENMASK(7, 4)
>  #define GUID_SOC_SKU		GENMASK(11, 8)
>  #define GUID_DEVICE_ID		GENMASK(27, 12)
>  #define GUID_CAP_TYPE		GENMASK(29, 28)
>  #define GUID_RECORD_ID		GENMASK(31, 30)
> =20
> +#define BMG_GUID_SEGMENT	GENMASK(7, 4)
> +
> +#define CRI_GUID_SEGMENT	GENMASK(5, 4)

[Severity: Low]
Are BMG_GUID_SEGMENT and CRI_GUID_SEGMENT intended to be used? They are
defined here but do not appear to be utilized anywhere in the file or the
rest of the codebase.

> +#define CRI_GUID_INSTANCE	GENMASK(7, 6)
> +
>  #define BMG_IDX_TELEM_PUNIT		0x00

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D13
