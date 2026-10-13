Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E58CC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9845B10E8B6;
	Tue, 13 Oct 2026 19:04:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0664D10E8B6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:04:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CAD9642D8F;
 Tue, 13 Oct 2026 19:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A29C1F00893;
 Tue, 13 Oct 2026 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791918264;
 bh=gk3go67qipml+gzCF/HQxuDraeelFjIpBftg3sSS6rY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HgF36xsFVstmNP9tITuEDJisBYDod16leb4Xb9mv5bZWB5H5PJe4jmhoFyVMOL4ME
 dP8qtVjQa95imv1Ri+zsXzVuVG/EvnauJq2+aXPU+muL/Q+DvU2sep/8OjkwvUiRVR
 35QmtNGO63ucOEaHVRRkTTFDpoIxXVePG9VgRbSu82IEr/G899Y9Q0ZFOUuImMR9YX
 aIibfMzSLt7wmORzP8tIH+93KM3L7y5AOfNfXKIMJBuGPRQz6+560muqNfRbYxf9zE
 YpkzY/3pxuXBVvTTQc272KLbDy5uSd86RSbU708/uwMvtiYzZPKQYpH05MjW4+sDpC
 13NmqTb/Qedvw==
Message-ID: <sashiko-outbox-170375@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 07/16] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013184939.694945-8-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 19:04:24 +0000
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
- [Medium] drm/xe/hwmon: dynamic hw queries at probe hide sysfs attributes =
on timeout
--

commit 4140f9b7c587fc4925ef3079bf0c972416615373
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Consolidate temperature sensor availability checks

This patch introduces a generalized is_temp_available() function to validate
PKG, VRAM, MCTRL, and PCIE temperature sensors. It uses this helper within
xe_hwmon_temp_is_visible() to prevent exposing sysfs attributes for sensors
that are not present during hwmon registration.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 4463f32c8d8cb..b2f18a32487cc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1011,19 +1011,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon =
*hwmon, int channel, long *valu
>  	*value =3D DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 250=
0, SF_VOLTAGE);
>  }
> =20
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
If xe_mmio_read32() returns an uninitialized value (like 0) during early bo=
ot,
does returning false here permanently prevent the creation of the sysfs
attribute for this sensor?

In mmio_temp_valid(), 0 is treated as an invalid temperature, which might o=
nly
be a temporary state during device probe before the hardware is fully
initialized. Since this is called from the is_visible callback, returning
false will hide the attribute permanently.

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
Do these dynamic PCODE mailbox reads at probe time risk permanently hiding
the MCTRL and PCIE sysfs attributes if there is a transient error?

If get_mc_temp() or get_pcie_temp() encounter a mailbox timeout or other
transient failure when called from xe_hwmon_temp_is_visible(), it evaluates
to false, preventing the hwmon core from creating the sysfs files.

Prior to this patch, MCTRL and PCIE merely checked hwmon->temp.count
statically without issuing a dynamic read.

> +	default:
> +		return false;
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184939.6949=
45-1-karthik.poosa@intel.com?part=3D7
