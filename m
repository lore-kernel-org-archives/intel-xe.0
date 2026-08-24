Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB60C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54810E0F5;
	Mon, 24 Aug 2026 18:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="APWDKS0r";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3501910E126
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:57:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 05358417D9;
 Mon, 24 Aug 2026 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8A11F000E9;
 Mon, 24 Aug 2026 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597875;
 bh=lUsiOvTWSvwn9U9iqb4zp/gQtWTNHPiYLF2dfpqOjls=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=APWDKS0rr48N45PGlf+2/nsWICvjw+Z+a4/gbfDRhShF95du09vZRmuVfQjDwnYlK
 ksHVviBdXfTD3bLDZDp+YMvSolLGtu4L5M4n/seAQA6Ir/WPl1AVS5sEx8q5WYsjhN
 l83JaQwAKeBC3OrT3QUSPkcYgGMetaB/CZEtgQrVudlmKfLeDwJgBzzgZ+XMKiF5N8
 Fok7Bh2BPqVU5FrAg0pSjY0IFRcrnD+XhVeYB0TFNdirUHvOEK4aqX1g6RgU91P0r+
 gcnMPS6oRF3MlSI3uVYwkdiQ7F0XmiVIZpU3GO/irn8o8efTlYHpurBwZ0yYlVw8/C
 l+A5Dg0xGG/DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory
 controller temperature
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-8-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:57:55 +0000
Message-Id: <20260824185755.BB8A11F000E9@smtp.kernel.org>
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
- [High] Buffer overflow in memory controller temperature read loop due to =
unsafe loop upper bound.
--

--- Patch [3]: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory=
 controller temperature ---
commit 06143d547f9d92b56105a4e1bd787aaee0504176
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Correct group selection for memory controller temperature

This commit updates get_mc_temp() to read all necessary groups based on
hwmon->temp.count instead of the TEMP_LIMIT_MAX macro.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -820,7 +820,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *=
val)
>  	int ret, i, count =3D 0;
>  	s32 average =3D 0;
> =20
> -	for (i =3D 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i =3D 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>  		ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_T=
HERMAL_DATA, i),
>  				    (dword + i), NULL);

[Severity: High]
If hwmon->temp.count is populated directly from a hardware register field
without validation, could it take values up to 255?

If hwmon->temp.count is between 253 and 255, DIV_ROUND_UP will evaluate to =
64.
The loop would execute 64 times, reading 4 bytes per iteration and writing a
total of 256 bytes into the dword array, which aliases hwmon->temp.value.

Since hwmon->temp.value is defined as s8 value[U8_MAX] (exactly 255 bytes),
does this cause a 1-byte out-of-bounds write past the end of the array?

While this overflow might currently land in struct padding due to alignment
requirements of subsequent fields, could it corrupt adjacent data if the
struct layout changes in the future?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D3
