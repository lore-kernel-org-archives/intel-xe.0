Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A17C606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSqIPLpP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D93010E26F;
	Sat, 28 Nov 2026 06:10:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C051E10E26F
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:10:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8EBC760E25;
 Sat, 28 Nov 2026 06:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323B71F000C1;
 Sat, 28 Nov 2026 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795846225;
 bh=+lDIeOwR2QBgnLH/BeaV4T4G2hFGf4WPjarK8src5UE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=fSqIPLpPaUNSaxsKw0grUVrXNmiaYWHSYh4SI/hJh3Hkk97MRyEh/tS3DUpIM+3A/
 qzHxIw3LHTbOZk/vdC+jmCquBTAcwqXDIfmofzyPTntTm/R3mlUo7A/4yo8ksHoRn5
 Rm7Ze6VwkenNVBdgCOjr2uuni6mKv8c7WuZ68yK4gghgmcNqcZz4QAzQYm3RfMdXxz
 Oonmaz9Ze/E2Lh1F0phLEKo2d7eFfwfQ3PvRIIMaW9Ut+qhJdi0BwpnyfrdvmG0bZn
 DP3hruLujsgtAvNwgt0C3jgs5WH+Bp1yUloRzZ4p63TyJKj9Wet18arxBU/2gwiUj9
 AwAKuRC86iaOw==
Message-ID: <sashiko-outbox-238486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/10] drm/xe/hwmon: Enable fan curve control support
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-7-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:10:24 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] drm/xe/hwmon: missing stock table check in
  xe_hwmon_curve_attributes_visible()
- [Medium] drm/xe/hwmon: xe_hwmon_pwm_read() returns fcp[0].speed on
  user fan curves
- [Low] drm/xe/hwmon: missing ABI documentation update claimed in commit
  message
- [Low] drm/xe/hwmon: unhandled XE_FAN_PWM_UNINITIALIZED in curve show
  callbacks
--

commit 51f62604f9e213b63207cde46fb9f696d1728daf
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Enable fan curve control support

This commit exposes fan curve temperature and PWM control points in hwmon
sysfs via pwm[1-3]_auto_point[1-10]_temp and pwm[1-3]_auto_point[1-10]_pwm,
allowing userspace to stage and commit custom fan curves to PCODE.

> Update Xe hwmon ABI documentation for pwm auto point temperature
> attributes.
>
> v2:
>  - Use xe helpers for dmesg logs.
>  - Update kernel version in Xe hwmon documentation.

[Severity: Low]
Was the Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon update
dropped from this patch?  The commit message says the ABI documentation is
updated, but this commit only touches drivers/gpu/drm/xe/xe_hwmon.c and
leaves pwm[1-3]_auto_point[1-10]_temp and pwm[1-3]_auto_point[1-10]_pwm
undocumented.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b6214ef933165..4d6eb6f6fbc2f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -1389,6 +1482,312 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hw=
mon *hwmon, u8 fan, u8 pwm, boo
>  	return 0;
>  }
> =20
> +#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
> +#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
> +#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
> +
> +static int
> +xe_hwmon_decode_curve_index(struct xe_hwmon *hwmon, u32 index, u8 *fan, =
u8 *point)
> +{
> +	u8 local_fan =3D XE_CURVE_FAN(index);
> +	u8 local_point =3D XE_CURVE_POINT(index);
> +
> +	if (local_fan >=3D FAN_MAX || local_point >=3D MAX_FAN_CONTROL_POINTS) {
> +		xe_dbg(hwmon->xe, "invalid fan curve index 0x%x: fan %u point %u\n",
> +		       index, local_fan, local_point);
> +		return -EINVAL;
> +	}
> +
> +	*fan =3D local_fan;
> +	*point =3D local_point;
> +
> +	return 0;
> +}
> +
> +static enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon=
 *hwmon, u8 fan)
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode =3D=3D XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sattr =3D to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	enum fan_table_type active_table;
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	u8 point;
> +	u8 temp;
> +	int ret;
> +	u8 fan;
> +
> +	ret =3D xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&hwmon->hwmon_lock);
> +
> +	fi =3D &hwmon->fi[fan];
> +	active_table =3D xe_hwmon_get_active_fan_table(hwmon, fan);

[Severity: Low]
Should xe_hwmon_pwm_auto_point_temp_show() and
xe_hwmon_pwm_auto_point_pwm_show() return -ENODATA when
fi->pwm_enable_mode is XE_FAN_PWM_UNINITIALIZED, the same way
xe_hwmon_pwm_read() does for hwmon_pwm_enable?  Right now
xe_hwmon_get_active_fan_table() maps XE_FAN_PWM_UNINITIALIZED to
USER_FAN_TABLE, so after a failed xe_hwmon_fan_set_auto() call the show
callbacks report stale user-table points or 0 instead of an error.

> +
> +	point_count =3D fi->fan_table[active_table].point_count;
> +
> +	if (point >=3D point_count)
> +		temp =3D 0;
> +	else
> +		temp =3D fi->fan_table[active_table].fcp[point].temp;
> +	return sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> +}
> +
> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan=
, u32 point,
> +					  bool is_temp, u8 value)
> +{
> +	struct xe_hwmon_fan_info *fi =3D &hwmon->fi[fan];
> +	struct fan_table *table;
> +	u32 point_count;
> +	int ret;
> +
> +	table =3D &fi->fan_table[USER_FAN_TABLE];
> +
> +	if (is_temp) {
> +		table->staged_fcp[point].temp =3D value;
> +		table->temp_staged |=3D BIT(point);
> +	} else {
> +		table->staged_fcp[point].speed =3D value;
> +		table->speed_staged |=3D BIT(point);
> +	}
> +
> +	/* Wait for a complete prefix; (0, 0) ends the curve without becoming a=
 point. */
> +	for (point_count =3D 0; point_count < MAX_FAN_CONTROL_POINTS; point_cou=
nt++) {
> +		if (!(table->temp_staged & BIT(point_count)) ||
> +		    !(table->speed_staged & BIT(point_count)))
> +			return 0;
> +		if (!table->staged_fcp[point_count].temp &&
> +		    !table->staged_fcp[point_count].speed)
> +			break;
> +	}
> +
> +	if (point_count < MIN_FAN_CONTROL_POINTS) {
> +		xe_dbg(hwmon->xe, "fan %d curve needs at least %d points, got %u\n",
> +		       fan, MIN_FAN_CONTROL_POINTS, point_count);
> +		ret =3D -EINVAL;
> +		goto clear_staged;
> +	}
> +
> +	ret =3D xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, p=
oint_count);
> +	if (ret)
> +		goto clear_staged;
> +
> +	/* Publish the new curve only after firmware accepts its point count. */
> +	memcpy(table->fcp, table->staged_fcp, point_count * sizeof(table->fcp[0=
]));
> +	table->point_count =3D point_count;
> +	fi->pwm_enable_mode =3D XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed =3D false;

[Severity: Medium]
When a multi-point user fan curve is committed here, does reading pwmN in
xe_hwmon_pwm_read() return the wrong PWM value?

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_pwm_read() {
    ...
		if (xe_hwmon_get_active_fan_table(hwmon, channel) =3D=3D STOCK_FAN_TABLE)=
 {
			...
		} else {
			/*
			 * pwmN writes set every user-table point to the same speed,
			 * so the first point gives the cached manual PWM percentage.
			 */
			xe_dbg(hwmon->xe, "getting active pwm for fan %d from user table cache\n=
",
			       channel);
			pwm =3D fi->fan_table[USER_FAN_TABLE].fcp[0].speed;
		}
    ...
}

For a custom curve with different speeds across temperature points,
fcp[0].speed is only the speed at the lowest temperature point rather than
the active PWM from PMT telemetry (on Battlemage) or interpolation across
USER_FAN_TABLE.  Also, if xe_hwmon_commit_user_fan_table() and its
xe_hwmon_fan_set_auto() fallback both fail, point_count is reset to 0 and
pwm_enable_mode is set to XE_FAN_PWM_UNINITIALIZED, yet xe_hwmon_pwm_read()
still takes this USER_FAN_TABLE branch and returns stale fcp[0].speed.

[ ... ]

> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
> +						 struct attribute *attr, int index)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	u32 fan =3D index / XE_CURVE_ATTRS_PER_FAN;
> +
> +	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(hwmon, fan))
> +		return 0;
> +
> +	/* All slots must exist at registration, before the user curve has been=
 staged. */
> +	return attr->mode;
> +}

[Severity: Medium]
Should xe_hwmon_curve_attributes_visible() also check
!hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].point_count like
xe_hwmon_pwm_is_visible() does?

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_pwm_is_visible() {
	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(hwmon, channel) ||
	    !hwmon->fi[channel].fan_table[STOCK_FAN_TABLE].point_count)
		return 0;
    ...
}

When a fan channel is enabled in fan_enable_mask (such as on DG2, or when
reading the stock table in xe_hwmon_read_fan_control_info() fails or
returns 0 points), pwmN and pwmN_enable are hidden and fi->pwm_enable_mode
stays XE_FAN_PWM_UNINITIALIZED, but all 20 pwmN_auto_point* attributes are
still exposed even though every write to them will fail with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D6
