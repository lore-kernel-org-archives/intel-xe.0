Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868F7C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 15:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4798C10E092;
	Thu, 19 Jun 2025 15:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCb51Zbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E232510E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750347153; x=1781883153;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=taViibjm5pggoxJokyWXzO34T5gINKWytUSMXSmfT3g=;
 b=WCb51ZbsEoaiYo8hUcnlJypajGwhTCsbpV5q2UR1qRN9u4iIpv4L1UXv
 wIC0nHw7Vbzk9teJp7jbhLFCncys2cdnZ4haouzKEKElQzqhDweGn57N1
 2L5bSsIdVf43lb6f0ynCtXOlP+qIgnHNSEF1thaqcAsweA1DrDTlcTFRO
 GDyZIvXYsDtiksxRR5dvgUAoAZNbK51wGn/I3A7A71reTyZ7IbLYUuiub
 Ti5kqxuhg2V+OshNTdaYPgFYQBOzTx8eW5N6JJcN4tivxuT5xrSqTxgof
 0gTKmCcb2AglhuP5+L6HQBC/pRqGDC7Zm2QSyCgMEb9Sewxvios4agkDl g==;
X-CSE-ConnectionGUID: p34/VXxyRD+gBgfI9AN2Ow==
X-CSE-MsgGUID: +MOd5tozTP2vLw/lQTtZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40210809"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="40210809"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 08:32:33 -0700
X-CSE-ConnectionGUID: 6xOzRqfJRCOIo+MxL5in/A==
X-CSE-MsgGUID: NwHXLSk2S92+JkaDddY38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="150998467"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.196])
 ([10.245.244.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 08:32:30 -0700
Message-ID: <052cc0ccb3caee768004c07ef890f6fade3fa5c0.camel@linux.intel.com>
Subject: Re: [PATCH v4] drm/xe/hwmon: Fix xe_hwmon_power_max_write
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Date: Thu, 19 Jun 2025 17:32:28 +0200
In-Reply-To: <20250617120030.612819-1-karthik.poosa@intel.com>
References: <20250617120030.612819-1-karthik.poosa@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Karthik

On Tue, 2025-06-17 at 17:30 +0530, Karthik Poosa wrote:
> Prevent other bits of mailbox power limit from being overwritten with
> 0.
> This issue was due to a missing read and modify of current power
> limit,
> before setting a requested mailbox power limit, which is added in
> this
> patch.
>=20
> v2:
> =C2=A0- Improve commit message. (Anshuman)
>=20
> v3:
> =C2=A0- Rebase.
> =C2=A0- Rephrase commit message. (Riana)
> =C2=A0- Add read-modify-write variant of
> xe_hwmon_pcode_write_power_limit()
> =C2=A0=C2=A0 i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
> =C2=A0- Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
> =C2=A0- Remove xe_hwmon_pcode_write_power_limit() as all mailbox power
> limits
> =C2=A0=C2=A0 writes use xe_hwmon_pcode_rmw_power_limit() only.
>=20
> v4:
> =C2=A0- Use PWR_LIM in place of (PWR_LIM_EN | PWR_LIM_VAL) wherever
> =C2=A0=C2=A0 applicable. (Riana)
>=20
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power

This patch has non-trivial conflicts in drm-xe-fixes. Please help
backporting by helping resolving those:

dim update-branches
dim checkout drm-xe-fixes
dim cherry-pick 8aa7306631f0

Manually fix conflicts

git add <fixed files>
git cherry-pick --continue

Then please send me the resulting patch (do not push drm-xe-fixes).

Please let me know if you need assistance.

Thanks,
Thomas


> limits though mailbox")
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_hwmon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++++++++++-----------
> --
> =C2=A02 files changed, 24 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 5394a1373a6b..ef2bf984723f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -40,6 +40,7 @@
> =C2=A0#define
> PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> =C2=A0#define=C2=A0=C2=A0 PWR_LIM_VAL				REG_GENMASK(14, 0)
> =C2=A0#define=C2=A0=C2=A0 PWR_LIM_EN				REG_BIT(15)
> +#define=C2=A0=C2=A0 PWR_LIM				REG_GENMASK(15, 0)
> =C2=A0#define=C2=A0=C2=A0 PWR_LIM_TIME				REG_GENMASK(23, 17)
> =C2=A0#define=C2=A0=C2=A0 PWR_LIM_TIME_X			REG_GENMASK(23, 22)
> =C2=A0#define=C2=A0=C2=A0 PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0d32e977537c..f08fc4377d25 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const
> struct xe_hwmon *hwmon, u32 att
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon
> *hwmon, u32 attr, u8 channel,
> -					=C2=A0=C2=A0=C2=A0 u32 uval)
> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon
> *hwmon, u32 attr, u8 channel,
> +					=C2=A0 u32 clr, u32 set)
> =C2=A0{
> =C2=A0	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon-
> >xe);
> =C2=A0	u32 val0, val1;
> @@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const
> struct xe_hwmon *hwmon, u32 at
> =C2=A0			channel, val0, val1, ret);
> =C2=A0
> =C2=A0	if (attr =3D=3D PL1_HWMON_ATTR)
> -		val0 =3D uval;
> +		val0 =3D (val0 & ~clr) | set;
> =C2=A0	else if (attr =3D=3D PL2_HWMON_ATTR)
> -		val1 =3D uval;
> +		val1 =3D (val1 & ~clr) | set;
> =C2=A0	else
> =C2=A0		return -EIO;
> =C2=A0
> @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, u32 attr, int channe
> =C2=A0		if (hwmon->xe->info.has_mbx_power_limits) {
> =C2=A0			drm_dbg(&hwmon->xe->drm, "disabling %s on
> channel %d\n",
> =C2=A0				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_write_power_limit(hwmon,
> attr, channel, 0);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, attr,
> channel, PWR_LIM_EN, 0);
> =C2=A0			xe_hwmon_pcode_read_power_limit(hwmon, attr,
> channel, &reg_val);
> =C2=A0		} else {
> =C2=A0			reg_val =3D xe_mmio_rmw32(mmio, rapl_limit,
> PWR_LIM_EN, 0);
> @@ -378,10 +378,9 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, u32 attr, int channe
> =C2=A0	reg_val =3D PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
> =C2=A0
> =C2=A0	if (hwmon->xe->info.has_mbx_power_limits)
> -		ret =3D xe_hwmon_pcode_write_power_limit(hwmon, attr,
> channel, reg_val);
> +		ret =3D xe_hwmon_pcode_rmw_power_limit(hwmon, attr,
> channel, PWR_LIM, reg_val);
> =C2=A0	else
> -		reg_val =3D xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN
> | PWR_LIM_VAL,
> -					reg_val);
> +		reg_val =3D xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM,
> reg_val);
> =C2=A0unlock:
> =C2=A0	mutex_unlock(&hwmon->hwmon_lock);
> =C2=A0	return ret;
> @@ -591,14 +590,11 @@ xe_hwmon_power_max_interval_store(struct device
> *dev, struct device_attribute *a
> =C2=A0
> =C2=A0	mutex_lock(&hwmon->hwmon_lock);
> =C2=A0
> -	if (hwmon->xe->info.has_mbx_power_limits) {
> -		ret =3D xe_hwmon_pcode_read_power_limit(hwmon,
> power_attr, channel, (u32 *)&r);
> -		r =3D (r & ~PWR_LIM_TIME) | rxy;
> -		xe_hwmon_pcode_write_power_limit(hwmon, power_attr,
> channel, r);
> -	} else {
> +	if (hwmon->xe->info.has_mbx_power_limits)
> +		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr,
> channel, PWR_LIM_TIME, rxy);
> +	else
> =C2=A0		r =3D xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon,
> REG_PKG_RAPL_LIMIT, channel),
> =C2=A0				=C2=A0 PWR_LIM_TIME, rxy);
> -	}
> =C2=A0
> =C2=A0	mutex_unlock(&hwmon->hwmon_lock);
> =C2=A0
> @@ -1217,25 +1213,25 @@ xe_hwmon_get_preregistration_info(struct
> xe_hwmon *hwmon)
> =C2=A0						=C2=A0=C2=A0=C2=A0 &hwmon-
> >pl1_on_boot[CHANNEL_PKG]) |
> =C2=A0		=C2=A0=C2=A0=C2=A0 xe_hwmon_pcode_read_power_limit(hwmon,
> PL2_HWMON_ATTR, CHANNEL_CARD,
> =C2=A0						=C2=A0=C2=A0=C2=A0 &hwmon-
> >pl2_on_boot[CHANNEL_CARD]) |
> -		=C2=A0=C2=A0=C2=A0 xe_hwmon_pcode_read_power_limit(hwmon,
> PL1_HWMON_ATTR, CHANNEL_PKG,
> +		=C2=A0=C2=A0=C2=A0 xe_hwmon_pcode_read_power_limit(hwmon,
> PL2_HWMON_ATTR, CHANNEL_PKG,
> =C2=A0						=C2=A0=C2=A0=C2=A0 &hwmon-
> >pl2_on_boot[CHANNEL_PKG])) {
> =C2=A0			drm_warn(&hwmon->xe->drm,
> =C2=A0				 "Failed to read power limits, check
> GPU firmware !\n");
> =C2=A0		} else {
> =C2=A0			drm_info(&hwmon->xe->drm, "Using mailbox
> commands for power limits\n");
> =C2=A0			/* Write default limits to read from pcode
> from now on. */
> -			xe_hwmon_pcode_write_power_limit(hwmon,
> PL1_HWMON_ATTR,
> -						=09
> CHANNEL_CARD,
> -							 hwmon-
> >pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon,
> PL1_HWMON_ATTR,
> -						=09
> CHANNEL_PKG,
> -							 hwmon-
> >pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_write_power_limit(hwmon,
> PL2_HWMON_ATTR,
> -						=09
> CHANNEL_CARD,
> -							 hwmon-
> >pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon,
> PL2_HWMON_ATTR,
> -						=09
> CHANNEL_PKG,
> -							 hwmon-
> >pl2_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon,
> PL1_HWMON_ATTR,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHANNEL_CARD,
> PWR_LIM | PWR_LIM_TIME,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon-
> >pl1_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon,
> PL1_HWMON_ATTR,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHANNEL_PKG,
> PWR_LIM | PWR_LIM_TIME,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon-
> >pl1_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon,
> PL2_HWMON_ATTR,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHANNEL_CARD,
> PWR_LIM | PWR_LIM_TIME,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon-
> >pl2_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon,
> PL2_HWMON_ATTR,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHANNEL_PKG,
> PWR_LIM | PWR_LIM_TIME,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon-
> >pl2_on_boot[CHANNEL_PKG]);
> =C2=A0			hwmon->scl_shift_power =3D PWR_UNIT;
> =C2=A0			hwmon->scl_shift_energy =3D ENERGY_UNIT;
> =C2=A0			hwmon->scl_shift_time =3D TIME_UNIT;

