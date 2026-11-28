Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB0606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf6UwcXk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509D410E273;
	Sat, 28 Nov 2026 06:14:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEFB10E4D8
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:13:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4DA7341B31;
 Sat, 28 Nov 2026 06:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7021F000C1;
 Sat, 28 Nov 2026 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795846436;
 bh=hr4rI18jplCzr2LyzhjuH9QUFFm4/8xX7ZwFHtKDaNM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=lf6UwcXkpUiOqXbU14t4XpmzEGL8TwtDKdiLAEUASnmbqi+tb815FNKJKS+srkrNj
 tswqSLwqbMW7rXR2HJ1NXDTN4nf4ScYTnbVGvPrp6atLM48NUXrCX5v7K/z/NNXiFD
 6F+h0jJRmSqJQo50HcT+zz0D3Z9C2qxvhvapIsiwsm0QQbF7cnhRg1yzB9q7r6/XnS
 Lbr4q/IwTzZCyoUm40ZOS70YlOuo7HL1dB0NVOvfVjrjZnyWQ2JoYe/RIW4uwe+Lwl
 fShI70F0XQyJBrGS0xxVk2QSB15UqXYsBMJKY2Bu23WY8JPLb/GOG5ZshLJ0ysyMPf
 5a869dpw3gKyg==
Message-ID: <sashiko-outbox-238488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/10] drm/xe/hwmon: Expose pwm[1-3]_enable
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-6-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:13:55 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/hwmon: wrong pwm readback in xe_hwmon_pwm_read() for
  non-stock modes
- [Medium] drm/xe/hwmon: xe_hwmon_set_user_fan_pwm() clobbers user table
  in mode 0
- [Low] drm/xe/hwmon: missing point count check in
  xe_hwmon_fan_set_auto()
--

commit 562936f0b505f7da573995f262799f779e7aab25
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Expose pwm[1-3]_enable

This commit exposes the pwm[1-3]_enable hwmon sysfs attributes to select
between full-speed, manual user-table, and automatic firmware fan control
modes, and documents them in the Xe hwmon ABI.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 78ef926feffcb..b6214ef933165 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -1209,9 +1230,88 @@ static int xe_hwmon_fan_set_auto(struct xe_hwmon *=
hwmon, u8 fan)
>  			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, =
fan),
>  			     0);
>  	if (ret)
> -		return ret;
> +		goto fail;
> =20
>  	fi->fan_table[USER_FAN_TABLE].point_count =3D 0;
> +	fi->pwm_enable_mode =3D XE_FAN_PWM_AUTO_STOCK_TABLE;
> +	fi->is_full_speed =3D false;
> +	return 0;

[Severity: Low]
Should xe_hwmon_fan_set_auto() call xe_hwmon_get_fan_point_count() to verify
that firmware cleared the user point count to 0 before marking
XE_FAN_PWM_AUTO_STOCK_TABLE active?  The v5 changelog notes that user point
counts are verified after auto-mode writes as well as table activation, and
both xe_hwmon_activate_user_fan_table() and xe_hwmon_set_user_fan_pwm() do
this check.

[ ... ]

> @@ -2054,12 +2168,20 @@ static int xe_hwmon_get_pwm_from_pmt(struct xe_hw=
mon *hwmon, int channel, long *
>  		return -EOPNOTSUPP;
>  	}
> =20
> -	xe_dbg(hwmon->xe, "fan %d PMT active PWM value: %u\n", channel, pwm);
> +	xe_dbg(hwmon->xe, "fan %d: active pwm from PMT: %u\n", channel, pwm);
> =20
>  	*val =3D pwm;
>  	return 0;
>  }
> =20
> +static enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon=
 *hwmon, u8 fan)
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode =3D=3D XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
>  static int
>  xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *v=
al)
>  {
> @@ -2074,8 +2196,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr,=
 int channel, long *val)
>  	switch (attr) {
>  	case hwmon_pwm_input:
>  		/* If the user fan table is not populated, get active stock pwm */
> -		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
> -			xe_dbg(hwmon->xe, "user fan table not active for fan %d\n", channel);
> +		if (xe_hwmon_get_active_fan_table(hwmon, channel) =3D=3D STOCK_FAN_TAB=
LE) {
> +			xe_dbg(hwmon->xe, "getting active pwm for fan %d from stock table\n",
> +			       channel);
>  			switch (hwmon->xe->info.platform) {
>  			case XE_BATTLEMAGE:
>  				ret =3D xe_hwmon_get_pwm_from_pmt(hwmon, channel, &pwm);
> @@ -2084,13 +2207,18 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 att=
r, int channel, long *val)
>  				ret =3D xe_hwmon_get_stock_table_pwm(hwmon, channel, &pwm);
>  				break;
>  			}
> -			if (ret)
> +			if (ret) {
> +				xe_err(hwmon->xe, "failed to get active pwm for fan %d, ret=3D%d\n",
> +				       channel, ret);
>  				goto unlock;
> +			}
>  		} else {
>  			/*
>  			 * pwmN writes set every user-table point to the same speed,
>  			 * so the first point gives the cached manual PWM percentage.
>  			 */
> +			xe_dbg(hwmon->xe, "getting active pwm for fan %d from user table cach=
e\n",
> +			       channel);
>  			pwm =3D fi->fan_table[USER_FAN_TABLE].fcp[0].speed;
>  		}

[Severity: Medium]
Can reading hwmon_pwm_input return the wrong PWM duty value when
pwm_enable_mode is not XE_FAN_PWM_AUTO_STOCK_TABLE?

When pwm[1-3]_enable is switched from 2 to 1 before any flat write to
pwm[1-3], xe_hwmon_activate_user_fan_table() populates USER_FAN_TABLE from
STOCK_FAN_TABLE with a multi-point temperature curve.  In that state the
points in USER_FAN_TABLE do not share a single speed, so reading
fi->fan_table[USER_FAN_TABLE].fcp[0].speed always reports the lowest
temperature breakpoint speed instead of reading PMT on Battlemage or
interpolating the active table against package temperature.

In addition, xe_hwmon_get_active_fan_table() returns USER_FAN_TABLE when
fi->pwm_enable_mode is XE_FAN_PWM_UNINITIALIZED.  If a mode transition and
its xe_hwmon_fan_set_auto() fallback fail after clearing
fi->fan_table[USER_FAN_TABLE].point_count to 0, reading pwm[1-3] returns
stale or zero fcp[0].speed instead of -ENODATA.

[ ... ]

> @@ -2125,7 +2263,48 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 att=
r, int channel, long val)
>  			ret =3D -EINVAL;
>  			break;
>  		}
> -		ret =3D xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
> +		ret =3D xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val, false);
> +		break;
> +	case hwmon_pwm_enable:
> +		if (val =3D=3D XE_FAN_PWM_FULL_SPEED) {
> +			ret =3D xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, true);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"full speed enable for fan %d failed, ret=3D%d\n",
> +					channel, ret);
> +				break;
> +			}
> +		} else if (val =3D=3D XE_FAN_PWM_MANUAL_USER_TABLE) {
> +			enum fan_table_type source =3D fi->fan_table[USER_FAN_TABLE].point_co=
unt ?
> +				USER_FAN_TABLE : STOCK_FAN_TABLE;
> +
> +			/*
> +			 * Manual fan speed control using user fan table.
> +			 * If user fan table is not programmed, it would be initialized with
> +			 * clamped stock points which allows manual control with some
> +			 * default points.
> +			 */
> +			ret =3D xe_hwmon_activate_user_fan_table(hwmon, channel, false, sourc=
e);

[Severity: Medium]
Does setting pwm[1-3]_enable to 0 (XE_FAN_PWM_FULL_SPEED) overwrite
fi->fan_table[USER_FAN_TABLE] and leave the fan pinned at 100% when
subsequently switching to mode 1 (XE_FAN_PWM_MANUAL_USER_TABLE)?

Calling xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, true) replaces
fi->fan_table[USER_FAN_TABLE].fcp[0..1] with 100% speed points and sets
fi->fan_table[USER_FAN_TABLE].point_count to MIN_FAN_CONTROL_POINTS.  When
userspace later writes 1 to pwm[1-3]_enable, point_count is non-zero, so
source becomes USER_FAN_TABLE instead of STOCK_FAN_TABLE (or any previously
configured user table) and xe_hwmon_activate_user_fan_table() re-applies the
100% full-speed table.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D5
