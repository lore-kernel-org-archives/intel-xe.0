Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F91606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXLI0waB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D306110E337;
	Tue, 24 Nov 2026 06:11:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDD310E337
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:11:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 349BE40837;
 Tue, 24 Nov 2026 06:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045F31F000CA;
 Tue, 24 Nov 2026 06:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795500683;
 bh=wpeUR9xoWoWtO/8eo4Lzc0L+m0Pku7TvWwoGYeMT/RQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FXLI0waBkpS/HUrfHtf9I3BRjGNJfWVAzW3DLj3Jc/iDKSLyb4uQ7RTsBy6+IxGCP
 ozQj86eD2esz46lPD8uUdEji+oC4gFi0D+VKt1prHDcI8o/Rrc2KADY2jCLnnu7SUc
 tddGOyUoUrkVnIuW3/EzRe+SHbJOdYK/57IuSStx3HMUFvnW2cUEz/f9zjDXc4h1Ru
 /mnP5YvRurwNaq/t5r3RU3T2UuaXe7Shg054VjLZh0QYkGb7VpkMKRpcEpFGG6BuyH
 5rgdSMaAATY5fFnMFmrh8dlWNMZbbv0MVXjvyR+FEE8mzqbxfjZy3K1uIZiu/KP8WS
 a6x2U2O7dTNZA==
Message-ID: <sashiko-outbox-230578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] drm/xe/hwmon: Update fan info after late binding
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124054811.798763-10-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:11:22 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] drm/xe/hwmon: known fans stay in full-speed mode after late
  binding
- [Medium] drm/xe/hwmon: post-late-bind fan updates miss sysfs and tach
  init
- [Medium] drm/xe/hwmon: use-after-free race in
  xe_hwmon_fan_update_post_lb()
- [Medium] drm/xe/hwmon: probe race between xe_hwmon_register() and late
  bind
- [Low] drm/xe/hwmon: unlocked max_rps read in xe_hwmon_fan_read()
--

commit 2b5439814ad9ed08f4a6cb30739b8d99fd5d96cb
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Update fan info after late binding

This commit adds xe_hwmon_fan_update_post_lb() to re-read the fan enable
mask and stock fan tables once the fan-control late-binding firmware is
loaded, initializing newly enabled fans in automatic mode.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8efb5d2ce9ac2..c34f13b6e3ce8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -1825,7 +1827,7 @@ static void xe_hwmon_init_curve_attrs(struct xe_hwm=
on *hwmon)
>  	hwmon->curve_group.is_visible =3D xe_hwmon_curve_attributes_visible;
>  }
> =20
> -static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, u32 ne=
w_fan_mask)
>  {
>  	int point;
>  	int fan;
> @@ -1897,8 +1899,9 @@ static int xe_hwmon_read_fan_control_info(struct xe=
_hwmon *hwmon)
>  		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
>  			continue;
> =20
> -		/* Set PWM enable mode to automatic i.e stock table in use. */
> -		fi->pwm_enable_mode =3D XE_FAN_PWM_AUTO_STOCK_TABLE;
> +		/* Start new fans in automatic mode; keep the user's mode for known fa=
ns. */
> +		if (new_fan_mask & BIT(fan))
> +			fi->pwm_enable_mode =3D XE_FAN_PWM_AUTO_STOCK_TABLE;
> =20
>  		/* Read minimum fan PWM */
>  		ret =3D xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, f=
an,

[Severity: Medium]
Does gating fi->pwm_enable_mode initialization on new_fan_mask leave known
fans stuck at 0 (XE_FAN_PWM_FULL_SPEED) after late binding?

Before late binding completes, a fan can already be set in
hwmon->fan_enable_mask (which __xe_late_bind_fw_init() requires before even
loading XE_LB_FW_FAN_CONTROL) while its stock fan table is not yet
available in pcode.  During xe_hwmon_get_preregistration_info(),
xe_hwmon_read_fan_control_info() hits the early continue when
FSC_READ_STOCK_FAN_CONTROL_POINTS fails or returns 0, leaving the
zero-allocated fi->pwm_enable_mode at XE_FAN_PWM_FULL_SPEED.

When xe_hwmon_fan_update_post_lb() later runs, BIT(fan) is already in
old_mask, so hwmon->fan_enable_mask & ~old_mask clears BIT(fan) and
fi->pwm_enable_mode is never set to XE_FAN_PWM_AUTO_STOCK_TABLE.  As a
result, pwmN_enable reports 0, reading the fan curve selects USER_FAN_TABLE
instead of STOCK_FAN_TABLE, and xe_hwmon_suspend() treats the fan as using
a manual user table.

> @@ -2824,7 +2827,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *=
hwmon)
>  				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> =20
>  		/* Fan control tables initialization */
> -		if (xe_hwmon_read_fan_control_info(hwmon))
> +		if (xe_hwmon_read_fan_control_info(hwmon, hwmon->fan_enable_mask))
>  			xe_warn(hwmon->xe, "Fan control tables are not available\n");
>  	}
>  	return xe_hwmon_init_temp_info(hwmon);

[Severity: Medium]
Can xe_hwmon_get_preregistration_info() and hwmon_device_register_with_info=
()
race with xe_hwmon_fan_update_post_lb() during device probe?

In xe_device_probe(), xe_late_bind_init() queues xe_late_bind_work() before
xe_hwmon_register() runs, and xe_hwmon_register() assigns xe->hwmon =3D hwm=
on
before calling xe_hwmon_get_preregistration_info() and
hwmon_device_register_with_info() without holding hwmon->hwmon_lock:

CPU0                                  CPU1 (late_bind->wq)
xe_hwmon_register()
  xe->hwmon =3D hwmon
  xe_hwmon_get_preregistration_info()
                                      xe_late_bind_work()
                                        xe_hwmon_fan_update_post_lb()
                                          mutex_lock(&hwmon->hwmon_lock)
                                          xe_hwmon_get_fan_enable_mask()
                                          xe_hwmon_read_fan_control_info()
                                          mutex_unlock(&hwmon->hwmon_lock)
    xe_hwmon_get_fan_enable_mask()
    xe_hwmon_read_fan_control_info()  <-- unlocked data race / overwrite

Concurrent execution can overwrite the post-late-binding fan state or
transiently zero hwmon->fan_enable_mask while
hwmon_device_register_with_info() is evaluating sysfs attribute visibility.

> @@ -3033,4 +3036,34 @@ void xe_hwmon_resume(struct xe_device *xe, bool ru=
ntime)
>  	mutex_unlock(&hwmon->hwmon_lock);
>  }
> =20
> +/**
> + * xe_hwmon_fan_update_post_lb - Update fan info after late binding
> + * @xe: xe device instance
> + *
> + * This function reads the number of fans and their stock table after la=
te binding.
> + */
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon =3D xe->hwmon;
> +	u32 old_mask;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);

[Severity: Medium]
Can xe_hwmon_fan_update_post_lb() race with device removal or probe unwind
and cause a use-after-free on struct xe_hwmon?

In xe_device_probe(), xe_late_bind_init() registers its devm cleanup action
(xe_late_bind_remove(), which flushes late_bind->wq) before
xe_hwmon_register() allocates struct xe_hwmon and initializes
hwmon->hwmon_lock via devm.  On teardown, xe_hwmon_unregister() clears
xe->hwmon =3D NULL without waiting for late_bind->wq, and devres releases
resources in reverse order, freeing struct xe_hwmon before
xe_late_bind_remove() runs:

CPU0                                  CPU1 (late_bind->wq)
                                      xe_late_bind_work()
                                        xe_hwmon_fan_update_post_lb()
                                          hwmon =3D xe->hwmon
xe_device_remove()
  xe_hwmon_unregister()
    xe->hwmon =3D NULL
devres_release_all()
  /* frees hwmon & hwmon_lock */
                                          mutex_lock(&hwmon->hwmon_lock)
                                            <-- use-after-free
  xe_late_bind_remove()
    wait_for_worker_completion()

> +
> +	old_mask =3D hwmon->fan_enable_mask;
> +	if (xe_hwmon_get_fan_enable_mask(hwmon)) {
> +		xe_warn(hwmon->xe, "keeping fan enable mask %#x after late binding\n",=
 old_mask);
> +		hwmon->fan_enable_mask =3D old_mask;
> +		goto unlock;
> +	}
> +
> +	if (xe_hwmon_read_fan_control_info(hwmon, hwmon->fan_enable_mask & ~old=
_mask))
> +		xe_warn(hwmon->xe, "failed to read stock fan tables after late binding=
\n");
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}

[Severity: Medium]
When xe_hwmon_fan_update_post_lb() runs after
hwmon_device_register_with_info() has already completed, how do newly
discovered fans or newly populated fi->max_rps values become visible in
sysfs and have their tachometer state initialized?

hwmon_device_register_with_info() evaluates xe_hwmon_is_visible() (which
gates fan and pwm attributes on IS_FAN_ENABLED() and fanN_max on
hwmon->fi[channel].max_rps) and xe_hwmon_curve_attributes_visible() only
once during registration.  Any fan added to hwmon->fan_enable_mask or any
fi->max_rps populated after late binding will not have its sysfs attributes
created, and newly enabled fans also miss the initial
xe_hwmon_fan_input_read() call that xe_hwmon_get_preregistration_info()
uses to seed fi->reg_val_prev and fi->time_prev.

[Severity: Low]
Does updating fi->max_rps in xe_hwmon_read_fan_control_info() after hwmon
registration race with unlocked reads of hwmon->fi[channel].max_rps in
xe_hwmon_fan_read()?

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_fan_read() {
    ...
	case hwmon_fan_max:
		*val =3D mul_u32_u32(hwmon->fi[channel].max_rps, 60);
		return 0;
    ...
}

Because __pcode_mailbox_rw() writes the raw PCODE_DATA0 register into
&fi->max_rps before checking pcode_mailbox_status() and
xe_hwmon_read_fan_control_info() only zeroes fi->max_rps after
xe_hwmon_pcode_read_fan_control() returns an error, a concurrent reader in
xe_hwmon_fan_read() without hwmon->hwmon_lock can observe an unvalidated
register value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124054811.7987=
63-1-karthik.poosa@intel.com?part=3D9
