Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75378CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDB110E5B7;
	Fri,  9 Oct 2026 12:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X3WvXfeS";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC8110E5B7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:14:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E33104184C;
 Fri,  9 Oct 2026 12:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9EF1F000FF;
 Fri,  9 Oct 2026 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791548083;
 bh=QaSw9NDixBy0gEDLnopG1rePdzhoEfw5nsf0Ln71ahU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X3WvXfeSyaUipdTscovKSD3iA3uRCtw94YPFKd+ls625xhDqJF8GOD55EclHOweWg
 bY4SM/Fn6VV0jfpwBWAwvgZ+dINlYS1gontUsGodbUM14OXOvcqBqdu+ip+IgBqqc+
 R6s8BIG3pKcTakNKOktJoDn7N/UbJbK2lNA2IpUwZu6MTJaik+JfGfq9endrdA7Wzm
 M25JutZz4NXpyx9NSc2keyhEEiQ/R3X2N3nHg5+0Zrxyoved8Bbpq7l3dUOKUuPYIJ
 OnRuB6tNhAO0Ow35nFAl40Mnq2i1TQEDwC9ajrPpZHUOUHpVBbBnFrdnbatgNVzpR0
 KWscpQESsgrtg==
Message-ID: <sashiko-outbox-165502@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/14] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009120335.52973-2-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:14:43 +0000
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
- [Medium] drm/xe/hwmon: unchecked return value from xe_hwmon_pcode_rmw_pow=
er_limit()
- [Medium] hwmon: ignored pcode read errors fabricate valid sysfs responses
--

commit 6cc9575a02c32b9a8a28e257650ff7b17698865f
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit

This commit adds a return on read failures inside
xe_hwmon_pcode_rmw_power_limit and updates callers to avoid updating
power limit settings with invalid data.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec33..9884e06f83e59 100644
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

[Severity: Medium]
Since this function now returns early on error, skipping the subsequent PCO=
DE
writes, could this cause regressions in xe_hwmon_get_preregistration_info?

In xe_hwmon_get_preregistration_info, there are four calls to this function
that ignore the return value. If these initialization writes fail, the
function still sets hwmon->boot_power_limit_read =3D true.

Setting this flag alters the subcommand used for later reads, changing it f=
rom
READ_PL_FROM_FW to READ_PL_FROM_PCODE. Could this cause userspace to receive
incorrect power limit values if the initial writes were aborted?

[ ... ]
> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *=
hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret =3D xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_=
EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);

[Severity: Medium]
Is it intentional that the return value of xe_hwmon_pcode_read_power_limit =
is
discarded right after checking the write failure?

If this read fails due to a hardware timeout, it could leave reg_val
uninitialized or zeroed, bypassing the disable verification check that foll=
ows.

Additionally, could the ignored read errors in xe_hwmon_power_max_read
fabricate valid sysfs responses? If xe_hwmon_pcode_read_power_limit fails in
that function, it returns fake 0 readings instead of propagating the hardwa=
re
error, which might mislead userspace tools into believing the power limit is
disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120335.5297=
3-1-karthik.poosa@intel.com?part=3D1
