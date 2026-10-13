Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16472CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD77F10E8B6;
	Tue, 13 Oct 2026 19:03:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7D10E927
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:03:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 68FB840543;
 Tue, 13 Oct 2026 19:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4981F000FF;
 Tue, 13 Oct 2026 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791918192;
 bh=+Z91hj4i4SUZngxZ5ds9PYtSLWwQSDTYm3YBbd/Sm/I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=MlUTryPgBDSs3T+B3BfpaOCPO6aD/G1HVicmeTrRGbU5eJRXKfNAx+vAEhrYhBF9a
 uHha0HXzbmWBb0MFxGbBaU9Zfuxvwacw+oHU0zVhVESMDxiB0sU3Kc2YqJaeg3Zth0
 LWKzWicDW9NL6UKli4jgV1EqDPW0vHZJcOBCYdu7c09UKD5on+UZ5lGDl1rEh3YFKB
 hsviidslim4k2HBtJlQNHW3aCGPhgmqZujXI8FmJWpOKuzeRbv33WrgzmLbwZAL2jk
 IJp6yhKs8fPaC5+nKibq2G30FL1BmtLk4FW/dzcBC/p6ex6ERvFtJjEIx+qBqqmvIJ
 M1co/qVCoxLmA==
Message-ID: <sashiko-outbox-170371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013184939.694945-2-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 19:03:11 +0000
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
- [High] drm/xe/hwmon: PCODE active configuration corruption due to power l=
imit init short-circuit
--

commit 96c45d5f8e540d8e962d44f94ea42a65f2c0cb61
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit

This commit adds error handling for pcode read failures in
xe_hwmon_pcode_rmw_power_limit(). It propagates the error codes back to
callers, including an updated initialization sequence in
xe_hwmon_get_preregistration_info().

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec33..0b46572bb3c88 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const stru=
ct xe_hwmon *hwmon, u32 attr
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
>  						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, =
ret %d\n",
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, =
ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
> =20
>  	if (attr =3D=3D PL1_HWMON_ATTR)
>  		val0 =3D (val0 & ~clr) | set;
[ ... ]
> @@ -1510,23 +1518,29 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon=
 *hwmon)
>  				 "Failed to read power limits, check GPU firmware !\n");
>  		} else {
>  			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n"=
);
> -			/* Write default limits to read from pcode from now on. */
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_PKG]);
> +
>  			hwmon->scl_shift_power =3D PWR_UNIT;
>  			hwmon->scl_shift_energy =3D ENERGY_UNIT;
>  			hwmon->scl_shift_time =3D TIME_UNIT;
> -			hwmon->boot_power_limit_read =3D true;
> +
> +			/* Write default limits to read from pcode from now on. */
> +			if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl1_on_boot[CHANNEL_CARD]) ||
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl1_on_boot[CHANNEL_PKG]) ||
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl2_on_boot[CHANNEL_CARD]) ||
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl2_on_boot[CHANNEL_PKG])) {
> +				drm_warn(&hwmon->xe->drm,
> +					 "Failed to set default power limits !\n");
> +			} else {
> +				hwmon->boot_power_limit_read =3D true;
> +			}

[Severity: High]
Does this code inadvertently leave power limit sysfs files exposed with
boot_power_limit_read set to false when an error occurs?

If any of the initializations fail, the logical OR short-circuits. This ski=
ps
the remaining initialization calls and leaves boot_power_limit_read as fals=
e,
but the driver continues loading.

When userspace later writes to a power limit via xe_hwmon_power_max_write()=
, it
calls xe_hwmon_pcode_rmw_power_limit(). Because boot_power_limit_read is fa=
lse,
the read phase fetches firmware defaults (READ_PL_FROM_FW) instead of active
PCODE limits.

However, the write phase targets the active PCODE registers
(WRITE_PACKAGE_POWER_LIMIT). This asymmetrical read-modify-write silently
overwrites the active PCODE register (including sibling power limit enables=
 and
time windows) with the firmware defaults, corrupting the active hardware
configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184939.6949=
45-1-karthik.poosa@intel.com?part=3D1
