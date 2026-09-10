Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E02C79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E6A10E2C8;
	Thu, 10 Sep 2026 18:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZiExzDxp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464BF10E2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:47:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C5FE60200;
 Thu, 10 Sep 2026 18:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201EB1F000FF;
 Thu, 10 Sep 2026 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789066075;
 bh=Wd9t+Gafx0CVZSrSCCLaRkt464ldIr7/afbtcOksR3M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZiExzDxpyoLIoyxA1+4YuqQdGjonW90vFmB2GlpUgSSR01gLeazq+5dsgb+hvpjgr
 MbnNj0EkOMgs6kzpN3D5M7EjUL8ib/M+PggSGyyOtoJdalHk7a6nv9OwhTkLi3eP8K
 mmxfWM2zTl91M0uA3KYtZe+hEUjloCtLA9x5SzAWfc2J/AtXhViTfAzfmRGaoVW3ow
 PXLdfUWgqQ4TblAUCivFY5nMZ1djKtjsG06jhnu7RuMxF/bU6TvGP4h2Bl6ih35nVJ
 jKbmv2RxU7GoA0PodoJLgU2j53SJHKQXxaZqafw+Qet6qK30vqOdHFTYD9sNrh3bZL
 RzZIUiiXDvO8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910182756.638830-3-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:47:54 +0000
Message-Id: <20260910184755.201EB1F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Kernel-doc syntax violation for struct member documentation.

Pre-existing issues:
- [High] xe_hwmon_pcode_rmw_power_limit ignores xe_pcode_read failures, lea=
ding to hardware state corruption.
- [High] Incorrect bounds check for CRI platforms causes silent field overf=
low when encoding power limits.
--

commit b3104079752794b6ca510cf54096b19d2c7bfc90
Author: Karthik Poosa <karthik.poosa@intel.com>

    drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on =
CRI
   =20
    Read the number of VRAM temperature sensor channels from the second byte
    of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
    exposing hwmon attributes for unavailable VRAM temperature sensors, whi=
le
    retaining the maximum supported channel count on non-CRI platforms.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index f88bacf63c83c..74037a9c32f7e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -178,6 +178,10 @@ struct xe_device {
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
>  		u8 has_fan_control:1;
> +		/*
> +		 * @info.has_fixed_vram_channels: Device has fixed VRAM temperature ch=
annel count.
> +		 */
> +		u8 has_fixed_vram_channels:1;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Is this block comment meant to be a kernel-doc comment?

Using a standard C block comment (/*) instead of a kernel-doc comment (/**)
for the newly added has_fixed_vram_channels member will cause kernel-doc
tooling to emit a "not described" warning when generating documentation.

[ ... ]

[Severity: High]
This is a pre-existing issue, but does xe_hwmon_pcode_rmw_power_limit()
safely handle PCODE read failures?

If xe_pcode_read() fails, it logs the error but proceeds to perform a
read-modify-write on val0 and val1, which remain initialized to 0:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_pcode_rmw_power_limit() {
	...
	ret =3D xe_pcode_read(root_tile, PCODE_MBOX(...), &val0, &val1);
	if (ret)
		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret=
 %d\n",
			channel, val0, val1, ret);

	if (attr =3D=3D PL1_HWMON_ATTR)
		val0 =3D (val0 & ~clr) | set;
	else if (attr =3D=3D PL2_HWMON_ATTR)
		val1 =3D (val1 & ~clr) | set;
	...
	ret =3D xe_pcode_write64_timeout(root_tile, PCODE_MBOX(...), val0, val1, P=
L_WRITE_MBX_TIMEOUT_MS);
	...
}

Writing these 0 values back via xe_pcode_write64_timeout() inadvertently ze=
roes
out the non-targeted power limit and its time windows. Can this disable cri=
tical
sustained power limits and cause severe performance throttling?


[Severity: High]
This is a pre-existing issue, but does xe_hwmon_power_max_interval_store()
properly validate the time window for CRI platforms?

The sysfs store function bounds-checks the input time window against max_win
(calculated using legacy encoding up to ~256 seconds) and then shifts the
value before placing it into the 7-bit PWR_LIM_TIME field:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_power_max_interval_store() {
	...
	if (val > max_win)
		return -EINVAL;

	if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
		/* ... */
		rxy =3D REG_FIELD_PREP(PWR_LIM_TIME, (val << 2));
	}
	...
}

Inputs larger than ~31 ms will silently overflow the 7-bit PWR_LIM_TIME fie=
ld.
Will this write a truncated, drastically reduced time window to the hardwar=
e,
restricting the GPU's ability to absorb bursty workloads and causing immedi=
ate
throttling?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910182756.6388=
30-1-karthik.poosa@intel.com?part=3D2
