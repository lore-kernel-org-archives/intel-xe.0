Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D7CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CFA10E5B7;
	Fri,  9 Oct 2026 12:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkkuBGMG";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7203C10E5B7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:15:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B610760534;
 Fri,  9 Oct 2026 12:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9481F000FF;
 Fri,  9 Oct 2026 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791548134;
 bh=o4I2aTsQ6UuYlAksFAZQH2c7119pU3AtL+YLLPNzZC0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lkkuBGMGGALGNwWnafLU+O8Q4AmY4doZ3Ox1RQjAl6yFkpmVl9cWihEIJDI11+HmE
 2ORcZFvLNPifUpdi3qlbxinm5sj3fZP9fQR4Z/71542yD5zEyXrTczPQXBoWN9W5Uf
 b5MgmfaZKvOJhnW8D7No5DoHFJKTWI5wgDKXJsiyUxKywF5Y9IH34+8F66VE6X/jSB
 HYdA6y9H0jes7UocJH8kRorH4v+R0hOOvrCg82nHPjXDgNpbXm7m1J7qk9wQtGX6SL
 7GBac0zL1tYd2vQT3f2fDT2eaoaQD/OMwPNkqTACawwNg7BPOo/d/5WqtVdp6wfh0f
 yswIYaKMIhB6w==
Message-ID: <sashiko-outbox-165506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/14] drm/xe/hwmon: Fix memory controller thermal
 data handling
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009120335.52973-4-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:15:33 +0000
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
- [Low] xe: endianness bug when unpacking thermal sensor values via union o=
verlay
--

commit 99c258fb8e157f67678f926764db2d41f2794285
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Fix memory controller thermal data handling

This commit updates get_mc_temp() to read all required thermal groups and u=
ses
an aligned u32 buffer for PCODE accesses to avoid unaligned memory accesses
and ensure correct MC temperature reporting.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c63aa708ab6fc..33d0ca7d86e44 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -143,8 +143,12 @@ struct xe_hwmon_thermal_info {
>  	};
>  	/** @count: no of temperature sensors available for the platform */
>  	u8 count;
> -	/** @value: per-sensor raw mailbox temperature; bit7=3Dsign, bits6:0=3D=
magnitude */
> -	u8 value[U8_MAX];
> +	union {
> +		/** @value: per-sensor raw mailbox temperature; bit7=3Dsign, bits6:0=
=3Dmagnitude */
> +		u8 value[U8_MAX + 1];
> +		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
> +		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> +	};
>  	/** @vram_label: vram label names */
>  	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>  };

[Severity: Low]
Does this struct layout rely on a little-endian memory layout?

Overlaying a byte array over a dword array via a union structurally embeds =
an
endianness assumption. On big-endian architectures, the bytes of the 32-bit
hardware registers unpacked into the dword array would be reversed when
accessed through the value array.

[ ... ]
> @@ -831,16 +835,16 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> -	u32 *dword =3D (u32 *)hwmon->temp.value;
>  	s32 average =3D 0;
>  	int ret, i;
> =20
> -	for (i =3D 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i =3D 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>  		ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_T=
HERMAL_DATA, i),
> -				    (dword + i), NULL);
> +				    &hwmon->temp.dword[i], NULL);
>  		if (ret)
>  			return ret;
> -		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dw=
ord[i]);
> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i,
> +			hwmon->temp.dword[i]);
>  	}
> =20
>  	for (i =3D TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>  		average +=3D mbx_temp_decode(hwmon->temp.value[i]);

[Severity: Low]
Does this regression decode the wrong byte from the 32-bit hardware register
on big-endian systems?

Since the value array aliases the dword array in xe_hwmon_thermal_info, this
loop will extract incorrect bytes on big-endian architectures and report the
wrong temperatures.

While Intel GPUs are rarely deployed on big-endian hosts, the xe driver's
Kconfig does not restrict compilation to little-endian or x86 architectures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120335.5297=
3-1-karthik.poosa@intel.com?part=3D3
