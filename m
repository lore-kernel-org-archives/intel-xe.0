Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF0C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B50910E189;
	Thu, 24 Sep 2026 11:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NkdNel3N";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562610E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:21:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F42843AFC;
 Thu, 24 Sep 2026 11:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A4E1F00898;
 Thu, 24 Sep 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790248901;
 bh=6rzqG/wzF/jKJmyGxIXsAetSVbuu8R+fsue+l6JsXFM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NkdNel3NS2CUcxkOYcNiiQEHknalfc04o7Ue1ahaVk60cm61UrWDTlRTI/oAQWOpV
 OanO2s8yXd07NWAgHjFIhS1P37CVW+SL0/+zB/V0GSLiNuM3c//is3eGX6ucFAED0y
 5cTC3tj8BkregvYv/npIwBDA4APcq1X8haGTnpm4jlklASVsyKyORYIdCOCboR/063
 rPvffIM/vjxWn5fi/CFpmfTYBrbCk5lnradE0TEM56RS0M0pDna3oxKPSQmLJhQK8s
 CGXGQWuFkmUVMEPVRzrsTQ2jIBbmhF7WMEaJDCG10CmzNHEqDH6aJs5OJi7WlHmJ3M
 yG1Ij8r8mKBdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH i-g-t v4 09/13] drm/xe/hwmon: Add platform-aware VRAM
 thermal channel support
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924105000.2627929-10-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
 <20260924105000.2627929-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:21:39 +0000
Message-Id: <20260924112141.41A4E1F00898@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: sparse msu_mask causes valid VRAM temperature channels to=
 be dropped
- [Medium] hwmon: VRAM temperature register array mapping overlaps with oth=
er CRI registers
--

commit 281083adfcbfcf290d339e8d6d0578c01c2d9ec1
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add platform-aware VRAM thermal channel support

This commit introduces dynamic VRAM temperature channel support for CRI
platforms by reading the MSU enablement mask from hardware. It also
increases the maximum VRAM channel count to 80.

> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe=
/regs/xe_pcode_regs.h
> index c63b409d7a821..11916b4f7cfc0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -29,5 +29,6 @@
> =20
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>  #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +#define CRI_MSU_VRAM_ENABLE             XE_REG(0x138340)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index cf5d51c685360..1b587bd9487e1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -281,7 +298,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon=
 *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel =3D=3D CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);

[Severity: Medium]
Will this return unrelated hardware registers when the channel index reache=
s 56
and higher?

The patch increases MAX_VRAM_CHANNELS to 80. BMG_VRAM_TEMPERATURE_N(n)
calculates the register address as 0x138260 + (n * 4). If n =3D 56, this
evaluates to 0x138340, which overlaps with the newly added
CRI_MSU_VRAM_ENABLE register. If n =3D 57, it evaluates to 0x138344, mapping
to CRI_PACKAGE_TEMPERATURE.

Should the mapping for high index channels be updated to avoid overlapping
with these registers?

[Severity: Medium]
Does this code silently drop valid channels if the mask is sparse?

In xe_hwmon_pcode_read_thermal_info(), vram_count is calculated using
hweight32(msu_mask) * 4, yielding the population count of active channels
rather than the highest valid channel index.

If msu_mask =3D 0xA (bits 1 and 3 enabled), vram_count is 8. The in_range()
check enforces a strict upper bound of 8 (channel - CHANNEL_VRAM_N < 8).
As a result, the enabled channels for bit 3 (indices 12-15) fail the
in_range() check and are dropped.=20

Can this bounds check be revised to use the highest active bit index?

[ ... ]

> @@ -805,15 +887,38 @@ static int xe_hwmon_pcode_read_thermal_info(struct =
xe_hwmon *hwmon)
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
>  	u32 config =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
> +	 * set the count up front so those sensors stay visible even if the the=
rmal
> +	 * mailbox reads below fail.
> +	 */
> +	if (hwmon->xe->info.has_fixed_vram_channels)
> +		hwmon->temp.vram_count =3D FIXED_VRAM_CHANNELS;
> +
> +	if (hwmon->xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +		hwmon->temp.msu_mask =3D xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
> +		/* Each enabled MSU bit maps to VRAM_CHANNELS_PER_MSU channels. */
> +		hwmon->temp.vram_count =3D hweight32(hwmon->temp.msu_mask) * VRAM_CHAN=
NELS_PER_MSU;

[Severity: Medium]
Does this correctly determine the required channel count bound for sparse
masks?

This calculates the upper boundary using a population count (hweight32)
instead of the highest active bit index. As described above, this truncates
the index space and causes valid higher-indexed channels to be ignored when
lower MSUs are disabled.

> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel coun=
t %d\n",
> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924105000.2627=
929-1-karthik.poosa@intel.com?part=3D9
