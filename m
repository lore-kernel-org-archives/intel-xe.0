Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF48C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF86D10E126;
	Mon, 24 Aug 2026 18:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A4jolGRP";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7110E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:57:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 861676011F;
 Mon, 24 Aug 2026 18:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B68F1F000E9;
 Mon, 24 Aug 2026 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597875;
 bh=T/AY/vuEyJ/ULJ0KEfbxC8rgxnp67xEfVossJvNE9Y8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A4jolGRPtV1MKqApb9h3LYGIQ/pvCNHQroNuNDePQE1uSVEAAyiSkGW89cfb7KDiR
 Ib0LgiincTHLoCN3rPEryuCgPcYBDik3nDXqPmbevtOtwat7crRT5N2aw9/wYH+F2z
 b3uLkKjEyld1Tc58HQept04Evnmoy6FYxdZ0LtDiNxh8FrPkaLovlNtD35+OEuGMSu
 SZ8dzxHUgyGMq8j8T633JXw+8/4DsYQMWiOalJS8YchtGZj1C1jC8PyYfiwbI+lpu2
 gmA6a72ke3BscHBaDLHn8pvkqcsP2U95AXWPjRCP3W7eNBGo5cb+QfqGJ8nLJXIiLH
 hVKI2ASsrAQtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-3-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:57:54 +0000
Message-Id: <20260824185755.1B68F1F000E9@smtp.kernel.org>
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
- [High] VRAM temperature sensors are silently lost on platforms where the =
thermal mailbox read fails or is unsupported.
- [High] The dynamic VRAM temperature sensor count feature for CRI is compl=
etely non-functional due to missing static attribute definitions and regist=
er mappings.

Pre-existing issues:
- [Medium] The hardware monitoring device is registered directly from the D=
RM subsystem rather than using an auxiliary device driver.
--

--- Patch [2]: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count =
from thermal config on CRI ---
commit ef0f46c26d79ec5ef4b877579a9d69bdbc93ae6c
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Use VRAM temperature sensor count from thermal confi=
g on CRI

This patch reads the number of VRAM temperature sensor channels from the
second byte of READ_THERMAL_CONFIG on CRI platforms. It uses this reported
count to cap the exposed hwmon attributes for VRAM temperature sensors,
while retaining the maximum supported channel count for non-CRI platforms.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c15312b0858ca..8c8a519711230 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -786,6 +790,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct x=
e_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count =3D REG_FIELD_GET(TEMP_MASK, config);
> =20
> +	if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
> +		hwmon->temp.vram_count =3D REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_cou=
nt) {
> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clam=
ping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count =3D MAX_VRAM_CHANNELS;
> +		}

[Severity: High]
Can the extra sensors on CRI platforms actually be exposed to sysfs?

The HWMON_CHANNEL_INFO(temp, ...) static attribute array doesn't appear
to be expanded in this patch. Since the static array caps the maximum
channels visible to sysfs, won't the hwmon core stop querying early
regardless of the dynamic vram_count value?

Also, looking at xe_hwmon_get_reg(), there doesn't seem to be a branch=20
for XE_CRESCENTISLAND under the REG_TEMP case. Will is_vram_ch_available()
receive an invalid register and fail for all VRAM sensors on CRI?

> +	} else {
> +		hwmon->temp.vram_count =3D 16; /* For older platforms, max is 16 VRAM =
channels */
> +	}
> +
>  	return ret;
>  }

[Severity: High]
If xe_pcode_read() fails earlier in xe_hwmon_pcode_read_thermal_info(), the
function returns early. Does this leave hwmon->temp.vram_count uninitialize=
d=20
at 0 instead of setting the fallback value of 16?

> @@ -964,6 +979,9 @@ static inline bool is_vram_ch_available(struct xe_hwm=
on *hwmon, int channel)
>  	u32 reg_val;
>  	u8 temp;
> =20
> +	if (vram_id >=3D hwmon->temp.vram_count)
> +		return false;
> +

[Severity: High]
If vram_count was left at 0 due to an early return during the pcode read,
this bounds check will unconditionally return false.=20

Does this mean a transient pcode error permanently disables all VRAM
temperature monitoring on older platforms, whereas previously the channels
were still exposed?

[ ... ]

> @@ -1621,6 +1639,13 @@ int xe_hwmon_register(struct xe_device *xe)
> =20
>  	xe_hwmon_get_preregistration_info(hwmon);
> =20
> +	hwmon->temp.vram_label =3D devm_kcalloc(dev, hwmon->temp.vram_count,
> +					      MAX_LABEL_SIZE, GFP_KERNEL);
> +	if (!hwmon->temp.vram_label) {
> +		xe->hwmon =3D NULL;
> +		return -ENOMEM;
> +	}
> +
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> =20
>  	/*  hwmon_dev points to device hwmon<i> */

[Severity: Medium]
This is a pre-existing issue, but should this hardware monitoring device be
registered using an auxiliary device driver?

The hwmon subsystem documentation dictates that if the main functionality of
a chip is not hardware monitoring (such as a DRM controller), its hardware
monitoring functionality should be implemented as an auxiliary device driver
in drivers/hwmon/, rather than being registered directly from the DRM
subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D2
