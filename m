Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9AC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC89810E18C;
	Mon, 24 Aug 2026 18:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mze5Wrkw";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0974910E18C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:54:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C0A0C6011F;
 Mon, 24 Aug 2026 18:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555D51F000E9;
 Mon, 24 Aug 2026 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597677;
 bh=tAvhajK6biHU2RW1DTLx1zRXGTz1iTc7K53HQs5Tvlg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Mze5WrkwJCa0NDwMj1IOUuRGNDRQ9my6r1Qcwv7xRw7CQ0hL/jQ6R9LFO/2o5ZHkc
 YrpwUqLf5zrKA8vdCPr5iUk3cpbsKpJeoVHhlf8LjMbZ9S+L9pLDPB9gTyk7eLCLlD
 ZuUD8AX/091Vz582Ms+uoHK2+tP5U1dSuigEE6VZo3xfGaDexBP3FBSfqxcmE2RM4E
 0nMyy93Tj5rKJmT2E9eQr5T+t3GaKOey6wN2J2VyQvCcgNFBz3pg43oZSenvMb+BuU
 JSmHIKU2ELHwUj+xkOnFao//x0AbMYV5ZhtBOjV1c/dWCB+mGDnCUpQKvHUM/w3gih
 v4jMAvsC1KV3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory
 controller temperature
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-4-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:54:36 +0000
Message-Id: <20260824185437.555D51F000E9@smtp.kernel.org>
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
- [Medium] Out-of-bounds write of 1 byte into `hwmon->temp.value` when read=
ing thermal data from pcode if the sensor count exceeds 252.
--

--- Patch [3]: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory=
 controller temperature ---
commit d6bd40537c53d76ef6df15e33458ad0d982f56b1
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Correct group selection for memory controller temperature
   =20
This patch corrects the memory controller temperature group selection by
updating get_mc_temp() to read all necessary groups based on the actual
sensor count rather than a hardcoded maximum.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -820,7 +820,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *=
val)
>  	int ret, i, count =3D 0;
>  	s32 average =3D 0;
> =20
> -	for (i =3D 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i =3D 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {

[Severity: Medium]
Could this lead to an out-of-bounds write into hwmon->temp.value if the
hardware returns a sensor count greater than 252?

If hwmon->temp.count is between 253 and 255, the DIV_ROUND_UP calculation
evaluates to 64. The loop will execute 64 times, reading 4 bytes per
iteration, resulting in 256 bytes being written to the dword pointer.

Since dword points to hwmon->temp.value, which is sized at 255 bytes, this
will write past the end of the array by 1 byte.

>  		ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_T=
HERMAL_DATA, i),
>  				    (dword + i), NULL);
>  		if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D3
