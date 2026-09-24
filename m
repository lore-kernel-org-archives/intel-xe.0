Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0704BC98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0A110E6E1;
	Thu, 24 Sep 2026 11:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hVnOg7LY";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEA810E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:24:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 56706601DE;
 Thu, 24 Sep 2026 11:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E374A1F000FF;
 Thu, 24 Sep 2026 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249075;
 bh=QB89cEY2RmfJtMUEOdnUSbRyaSUvP8VqKTDOjhtHHSs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hVnOg7LYK9hj2rfhW5WrQgwW0PbxaGPIqaJVrL4E0FalZETVeHjOMr4HvhFm/fe6f
 yw6ACD364WCFlXgAUoHDzvWQ5ZWEh4aTH1b+HJHJpZRCpDnpXzmsy7V4yHW+YQAuxc
 Y9wtOMexLXrkOB2OnKxBoVY8G9BcYQRqxvWEVMRPHV0abfz+GJWqbe/RTuyG5cFWAv
 50f5lwqW1zX5BjRx1igRunQIt6PK0vOUdJkRIPiO5JAsBz3cWOj10omj5rSg/OvQ9h
 UqrD9jHrmt1T4wTCqsZuo0Laq8YsDzwi1SCMQ5LPWoF9SRlCchpOWeWZJ+4cq7TzJH
 roqnbiL8MWi4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/13] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-8-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:24:34 +0000
Message-Id: <20260924112434.E374A1F000FF@smtp.kernel.org>
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
- [Medium] hwmon: initialization race causes permanent attribute loss on sl=
ow sensors
--

commit c02db655e6dabb60e61a8acbe0daf64a353e248d
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Consolidate temperature sensor availability checks

This commit replaces is_vram_ch_available() with a generalized=20
is_temp_available() to validate multiple sensor types. It uses this new=20
helper during hwmon registration to prevent exposing sysfs attributes for=20
sensors that are not present.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7bb7a5f402d1e..d62f95a1912f3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int chan=
nel)
> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
> -	int vram_id =3D channel - CHANNEL_VRAM_N;
> -	struct xe_reg vram_reg;
> +	struct xe_reg reg;
> +	u32 reg_val;
> =20
> -	vram_reg =3D xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> -		return false;
> +	switch (channel) {
> +	case CHANNEL_PKG:
> +	case CHANNEL_VRAM:
> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +		reg =3D xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +		if (!xe_reg_is_valid(reg))
> +			return false;
> +
> +		reg_val =3D xe_mmio_read32(mmio, reg);
> +		if (!mmio_temp_valid(hwmon, reg_val)) {
> +			drm_dbg(&hwmon->xe->drm,
> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
> +			return false;
> +		}

[Severity: Medium]
Could this cause functional sensors to be permanently hidden if the firmware
is slow to initialize them?

During hwmon registration, is_temp_available() performs a live MMIO read to
determine attribute visibility. If the firmware hasn't populated a valid
temperature yet at the exact moment of device probe (for instance, returning
0 or U32_MAX), mmio_temp_valid() will return false.

Since this determines sysfs attribute visibility, doesn't this create a
silent failure where perfectly functional PKG sensors disappear intermitten=
tly
depending on boot timing?

> +
> +		if (channel >=3D CHANNEL_VRAM_N)
> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
> =20
> -	/* Create label only for available vram channel */
> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> -	return true;
> +		return true;
> +	case CHANNEL_MCTRL:
> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> +	case CHANNEL_PCIE:
> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);

[Severity: Medium]
Similarly, does this live PCODE mailbox polling risk permanently hiding the
Memory Controller and PCIe temperature sensors?

If PCODE is slow to respond during device probe, get_mc_temp() and
get_pcie_temp() might fail or return invalid data. Because this check
replaces static capability checks (such as hwmon->temp.count) with live
sensor data, it seems to introduce a race condition where a temporary
initialization delay results in permanent attribute loss.

> +	default:
> +		return false;
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D7
