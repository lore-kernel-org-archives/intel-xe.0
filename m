Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF408606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvUuYI6y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FC210E0DE;
	Tue, 24 Nov 2026 06:01:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE15010E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:01:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A887760D9E;
 Tue, 24 Nov 2026 06:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1531F000D1;
 Tue, 24 Nov 2026 06:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795500066;
 bh=tiFgWdpaaB1kjBAoMQTOZmmNbbRRYCvXHMoAWKpmZm8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jvUuYI6yhMxkMb/9gCK1DqgfDF8GeBvxksS1ELpLm49c+3DIXjw4RUQk01rZQPNtp
 tJNVWmyT8DrTSUT5K5zjM6ZiPqq5G3ApsQqkpQU1IbOWBP5Rc3JpQbIiwPAqhRj/FN
 3brkBBYK1D4y+QwPC0As4jbGcAjrCBa+vDaWOTQnRkRV0RuhbZd0T9Ah9IwmGRTLue
 pAmlJktDLz4YNzMwJ4mm6B/zVwjQRCeLQux9D2Slje2XAl8VyNrfCZPYQjpMviaxVU
 ge2j35E4ARSZQ1/d898RvoUD7DPnMHLeL0oQLYYuLHXk7QkJqT1V+GLUtZputhppnU
 jyuH3W6JbFBEg==
Message-ID: <sashiko-outbox-230572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] drm/xe/hwmon: Expose pwm[1-3]_enable
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124054811.798763-6-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:01:06 +0000
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
- [Medium] drm/xe/hwmon: mode 0 sets manual mode in
  xe_hwmon_set_user_fan_pwm()
- [Medium] drm/xe/hwmon: xe_hwmon_set_user_fan_pwm() clobbers user table
  in mode 0
- [Medium] drm/xe/hwmon: uninitialized pwm_enable_mode on stock table
  read failure
--

commit 2c87d5a2e63abba6144fe6efb9070eacc54a6cbc
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Expose pwm[1-3]_enable

This commit exposes the pwm[1-3]_enable sysfs attributes to select between
full-speed mode (0), manual user-table control (1), and firmware stock-table
control (2).

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c053d597f26c5..59a8521316c2c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -1190,10 +1208,80 @@ static int xe_hwmon_get_fan_point_count(struct xe=
_hwmon *hwmon, u8 fan, u32 *poi
>  /* Temperature to set when setting the fan PWM with pwmN. */
>  #define FIXED_PWM_TEMP	1
> =20
> -static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 =
pwm)
> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 =
pwm, bool full_speed)
>  {
>  	struct xe_hwmon_fan_info *fi =3D &hwmon->fi[fan];
>  	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
> @@ -1201,6 +1289,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwm=
on *hwmon, u8 fan, u8 pwm)
>  	u8 speed;
>  	int ret, i;
> =20
> +	if (!full_speed && fi->pwm_enable_mode !=3D XE_FAN_PWM_MANUAL_USER_TABL=
E) {
> +		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n"=
, fan);
> +		return -EINVAL;
> +	}

[ ... ]

> @@ -1245,6 +1338,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmo=
n *hwmon, u8 fan, u8 pwm)
>  	}
>  	fi->fan_table[USER_FAN_TABLE].point_count =3D MIN_FAN_CONTROL_POINTS;
> =20
> +	fi->pwm_enable_mode =3D XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed =3D full_speed;
>  	return 0;
>  }

[Severity: Medium]
When full_speed is true (writing 0 to pwm[1-3]_enable), should
xe_hwmon_set_user_fan_pwm() set fi->pwm_enable_mode to
XE_FAN_PWM_FULL_SPEED instead of XE_FAN_PWM_MANUAL_USER_TABLE?

Because fi->pwm_enable_mode is set to XE_FAN_PWM_MANUAL_USER_TABLE (1),
reading pwm[1-3]_enable in this commit returns 1 right after writing 0
(until later commit "drm/xe/hwmon: Enable fan curve control support" checks
fi->is_full_speed in xe_hwmon_pwm_read()).  In addition, subsequent writes
to pwm[1-3] while in mode 0 pass the fi->pwm_enable_mode !=3D
XE_FAN_PWM_MANUAL_USER_TABLE check above and drop the fan out of full-speed
mode instead of failing with -EINVAL as documented in the ABI.

> @@ -1320,6 +1415,9 @@ static int xe_hwmon_read_fan_control_info(struct xe=
_hwmon *hwmon)
>  		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
>  			continue;
> =20
> +		/* Set PWM enable mode to automatic i.e stock table in use. */
> +		fi->pwm_enable_mode =3D XE_FAN_PWM_AUTO_STOCK_TABLE;
> +

[Severity: Medium]
If reading the stock fan table fails or returns 0 points in
xe_hwmon_read_fan_control_info(), does the early continue leave
fi->pwm_enable_mode zero-initialized to XE_FAN_PWM_FULL_SPEED (0)?

Because xe_hwmon_pwm_is_visible() only checks has_fan_control and
IS_FAN_ENABLED(), pwm[1-3]_enable is still exposed and reports mode 0
(full speed) even though the fan is under default firmware control, while
later commit "drm/xe/hwmon: Update fan info after late binding" only
initializes fi->pwm_enable_mode for newly enabled fan bits.

[ ... ]

> @@ -1984,7 +2090,53 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 att=
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
Does enabling XE_FAN_PWM_FULL_SPEED via xe_hwmon_set_user_fan_pwm() clobber
fi->fan_table[USER_FAN_TABLE] with a 2-point 100% table?

When the user later writes 1 (XE_FAN_PWM_MANUAL_USER_TABLE) to
pwm[1-3]_enable, fi->fan_table[USER_FAN_TABLE].point_count is non-zero
(MIN_FAN_CONTROL_POINTS from mode 0), so xe_hwmon_pwm_write() selects
USER_FAN_TABLE and keeps the 2-point 100% full-speed table active instead
of initializing from STOCK_FAN_TABLE or restoring a prior user table.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124054811.7987=
63-1-karthik.poosa@intel.com?part=3D5
