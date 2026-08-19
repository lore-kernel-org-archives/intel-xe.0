Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0792AC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFF810E198;
	Wed, 19 Aug 2026 19:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F8XooNVI";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20B10E198
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:23:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 97D4341FCE;
 Wed, 19 Aug 2026 19:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D05B1F000E9;
 Wed, 19 Aug 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167400;
 bh=4pp8qWvGiqjIcSMJRIUYfEqfWDczFHfRHtqXb+BACrk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=F8XooNVIImE6bxDH3RXWA/V6TR3kxWwbJ0k27Vr8vC7djj4zAxPqTnqpAuEGikCsW
 qQ0moaYJg90UbaVIa5WiTgFk6V/iQKJHuVk4/klQSj4G0jjwP3ZfCs+tHB/UHKa9kq
 bYXn5aaUknglvhng6rJinE2Vy1fiV4ieb44xdQwmi/rmLyL9yaf2r6UP/iAu9p9mXZ
 fzp32S+ByMYwdTa87ao9AaDB9IFNPC7Fnb4cn8SguZGMjIciG9rNl425mgPiyFf23m
 ykkIdCdS9qwM60K4PJvN/eh67RXV8cilr/vUS3c7Cwcn/A4de9inH3r5F1SZDQNyPl
 4cUtUumpjjuHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/12] drm/xe/hwmon: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:23:20 +0000
Message-Id: <20260819192320.5D05B1F000E9@smtp.kernel.org>
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
- [Medium] The `xe_log_err()` API is invoked with a hardcoded `-EIO` error =
value instead of the actual error code, corrupting structured telemetry.
- [Low] Missing newline character in the format string for `xe_log_err()` w=
ill cause malformed dmesg output.
--

--- Patch [3]: [PATCH 03/12] drm/xe/hwmon: Report errors using structured x=
e_log API ---
commit d3f9f82c222b6fd15cd76563436ef83288bc6453
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/hwmon: Report errors using structured xe_log API
   =20
Replace drm_err() calls with xe_log_err() using the HWMON component
tag to enable structured error reporting with SIGID for hardware
monitor failures:

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d8..9ff351e87e5a2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -563,9 +564,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, =
struct device_attribute *at
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		ret =3D xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &r=
eg_val);
>  		if (ret) {
> -			drm_err(&hwmon->xe->drm,
> -				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> -				channel, power_attr, reg_val, ret);
> +			xe_log_err(hwmon->xe, HWMON, -EIO,
> +				   "power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> +				   channel, power_attr, reg_val, ret);

[Severity: Medium]
In xe_hwmon_power_max_interval_show(), should we be passing the actual ret
error code instead of hardcoding -EIO here? By passing -EIO, the structured
error payload will log an incorrect telemetry value instead of the actual
failure code from xe_hwmon_pcode_read_power_limit() when it fails.

>  			reg_val =3D 0;
>  		}
>  	} else {
[ ... ]
> @@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
>  								&hwmon_chip_info,
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_=
dev);
> +		xe_log_err(xe, HWMON, -EIO,
> +			   "Failed to register xe hwmon (%pe)", hwmon->hwmon_dev);

[Severity: Medium]
In xe_hwmon_register(), should this use PTR_ERR(hwmon->hwmon_dev) instead
of hardcoded -EIO to ensure the correct error is captured in telemetry when
devm_hwmon_device_register_with_info() fails?

[Severity: Low]
It looks like the \n terminator was accidentally dropped from the format
string during the conversion in xe_hwmon_register(). Since xe_log_err()
maps to dev_printk(), will this missing newline cause subsequent kernel
messages to be appended to the same line when hwmon registration fails?

>  		xe->hwmon =3D NULL;
>  		return PTR_ERR(hwmon->hwmon_dev);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D3
