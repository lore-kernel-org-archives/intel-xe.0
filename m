Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B0B606A32D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxRGEzcc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1B110E110;
	Tue, 24 Nov 2026 06:02:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9692410E110
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:02:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E27460E76;
 Tue, 24 Nov 2026 06:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2C91F000C6;
 Tue, 24 Nov 2026 06:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795500123;
 bh=bhMUo7dzSU+5tsjOxDPpEdDUJY26FEbC7aDtQCECU7k=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=JxRGEzccElg1fAY6PEtMaBqiXgKvNgBgRfYGHosyayKpu6MVhojmTzeeUqbW+rkio
 tPL6dy2TXErvJzgeqdeHTJ3KGqEUMbQx9Zrbn0WT/wh+8pSdTCzYc2zwAbwPJvyr4z
 d1LGqEdVG9uBA6xtbA/YWaC0Gd/bnes2Eyh8fPc8hoS/pjosm0QPaihF0uJrGWQNu7
 A2karAP+9MovdwtwkbhdOFRBVE+dW7Ji12Cted7JyrpmFOUZwZlVBZ7wYIWtGca9/F
 F4SguhyndwfVd9zTTKwiRBxKAoK/WrTuZoArlt5dCCFDyNyiOSOpBBRiOG9hKG0ves
 9GX3wpUSNcp2w==
Message-ID: <sashiko-outbox-230573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/10] drm/xe/hwmon: Enable fan curve control support
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124054811.798763-7-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:02:02 +0000
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

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [Medium] drm/xe/hwmon: stale staged state on error in
  xe_hwmon_update_user_fan_point()
- [Medium] drm/xe/hwmon: missing is_full_speed check in curve store
  callbacks
- [Medium] drm/xe/hwmon: min_pwm clamping bypassed in
  xe_hwmon_pwm_auto_point_pwm_store()
- [Medium] drm/xe/hwmon: overflow and post-rounding check in
  xe_hwmon_sysfs_to_hw_val()
- [Medium] drm/xe/hwmon: live pcode count vs cache mismatch in curve
  show callbacks
- [Low] drm/xe/hwmon: missing ABI documentation update claimed in commit
  message
- [Low] drm/xe/hwmon: xe_err() and 0-based indices used in curve store
  mode logs
- [Low] drm/xe/hwmon: guard() mixed with goto unlock in curve sysfs
  callbacks
--

commit 148c3dbca37416a6517d9d7801eb5f432ec2b872
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Enable fan curve control support

This commit adds hwmon sysfs attributes pwm[1-3]_auto_point[1-10]_temp and
pwm[1-3]_auto_point[1-10]_pwm to stage and commit custom fan control curves
via pcode.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 59a8521316c2c..77c4d1b0ecaef 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1337,12 +1423,354 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_h=
wmon *hwmon, u8 fan, u8 pwm, boo
[ ... ]
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
[ ... ]
> +	fi =3D &hwmon->fi[fan];
> +	active_table =3D xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	ret =3D xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_t=
able);
> +	if (ret)
> +		goto unlock;
> +
> +	/* Slots beyond the active curve can still be staged for the next curve=
. */
> +	if (point >=3D point_count &&
> +	    (active_table !=3D USER_FAN_TABLE ||
> +	    !(fi->fan_table[USER_FAN_TABLE].temp_staged & BIT(point))))
> +		temp =3D 0;
> +	else if (point >=3D point_count)
> +		temp =3D fi->fan_table[USER_FAN_TABLE].staged_fcp[point].temp;
> +	else
> +		temp =3D fi->fan_table[active_table].fcp[point].temp;
> +	ret =3D sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);

[Severity: Medium]
Should xe_hwmon_pwm_auto_point_temp_show() and
xe_hwmon_pwm_auto_point_pwm_show() use the cached
fi->fan_table[active_table].point_count and check temp_staged / speed_staged
before falling back to active fcp[point]?

Querying point_count live from pcode via xe_hwmon_get_fan_point_count() whi=
le
reading point values from the software cache can desynchronize the bound fr=
om
the cache: if a previous table update or stock table probe failed and reset
cached point_count to 0, pcode can still report a non-zero count and cause
show to read unpopulated or stale fcp[] entries, and if stock point_count
exceeded MAX_FAN_CONTROL_POINTS (which xe_hwmon_read_fan_control_info()
clamps), xe_hwmon_get_fan_point_count() fails with -EINVAL.  Also, checking
temp_staged / speed_staged only when point >=3D point_count means staging a=
 new
value for an existing point (< point_count) still reads back the old active
value until the whole curve is committed.

> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
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
> +		return -EINVAL;
> +	}
> +
> +	ret =3D xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, p=
oint_count);
> +	if (ret)
> +		return ret;

[Severity: Medium]
When curve validation or xe_hwmon_commit_user_fan_table() fails here, does
leaving table->temp_staged and table->speed_staged set wedge subsequent cur=
ve
writes?

Because every bit in the completed prefix remains set in temp_staged and
speed_staged after an error return, the next single-attribute sysfs write
immediately sees a complete prefix and re-runs the commit check with the le=
ft
over staged points instead of waiting for both temp and pwm of the new curve
to be staged.  In addition, if xe_hwmon_commit_user_fan_table() fails in or
after xe_pcode_write_batch(), pcode's user table may already be partially
overwritten while table->point_count is not invalidated to 0 as in
xe_hwmon_set_user_fan_pwm().

[ ... ]
> +static int xe_hwmon_sysfs_to_hw_val(struct xe_hwmon *hwmon, long val, bo=
ol is_temp, u8 *out)
> +{
> +	long max =3D is_temp ? U8_MAX : 100;
> +	long hw_val;
> +
> +	/* Temperature is in degrees Celsius, speed in percent. */
> +	if (is_temp)
> +		hw_val =3D DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	else
> +		hw_val =3D DIV_ROUND_CLOSEST(val * 100, U8_MAX);
> +
> +	if (hw_val < 0 || hw_val > max) {
> +		xe_dbg(hwmon->xe, "%s value %ld out of range\n", is_temp ? "temp" : "p=
wm", val);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Can validating hw_val after DIV_ROUND_CLOSEST() overflow val * 100 and acce=
pt
out-of-range sysfs inputs?

Because val is an arbitrary signed long from kstrtol(), large values overfl=
ow
val * 100 or DIV_ROUND_CLOSEST() before the range check and can wrap into
0..max.  Checking after rounding also accepts out-of-range inputs near the
boundaries, such as negative temperatures in -499..-1 (which round to 0 and
can trigger the (0, 0) end marker) or pwm values of -1 and 256.  Validating
val against 0..U8_MAX * MILLIDEGREE_PER_DEGREE for temperature and 0..U8_MAX
for pwm before converting avoids both issues.

> +
> +	*out =3D hw_val;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
[ ... ]
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +	fi =3D &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode !=3D XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		xe_err(hwmon->xe, "pwm%d_enable not in manual mode; cannot update temp=
 point %d\n",
> +		       fan, point);
> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}

[Severity: Medium]
Does this check allow staging and committing a user fan curve while
pwmN_enable is set to 0 (XE_FAN_PWM_FULL_SPEED)?

When full-speed mode is enabled via xe_hwmon_set_user_fan_pwm(),
fi->pwm_enable_mode is set to XE_FAN_PWM_MANUAL_USER_TABLE with
fi->is_full_speed =3D true.  Because xe_hwmon_pwm_auto_point_temp_store() a=
nd
xe_hwmon_pwm_auto_point_pwm_store() do not check !fi->is_full_speed, curve
writes succeed in full-speed mode and silently clear fi->is_full_speed =3D =
false
on commit, switching pwmN_enable from 0 to 1.

> +
> +	xe_dbg(hwmon->xe, "staging fan %d point %d temp to %u\n", fan, point, t=
emp);
> +	ret =3D xe_hwmon_update_user_fan_point(hwmon, fan, point, true, temp);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
[ ... ]
> +	ret =3D xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi =3D &hwmon->fi[fan];
> +	active_table =3D xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	ret =3D xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_t=
able);
> +	if (ret)
> +		goto unlock;
[ ... ]
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but the four new curve show/store callbacks mix
guard(xe_pm_runtime) with manual mutex_lock(&hwmon->hwmon_lock) and goto
unlock; using guard(mutex)(&hwmon->hwmon_lock) would avoid mixing cleanup
helpers with goto-based unwinding.

> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
[ ... ]
> +	if (fi->pwm_enable_mode !=3D XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		xe_err(hwmon->xe,
> +		       "pwm%d_enable is not in manual user mode, cannot update pwm poi=
nt %d\n",
> +		       fan, point);
> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}

[Severity: Low]
Should this and the matching check in xe_hwmon_pwm_auto_point_temp_store() =
use
xe_dbg() and print fan + 1 and point + 1?

Logging at error level lets unprivileged-style invalid mode writes spam dme=
sg,
and printing the 0-based fan and point indices reports "pwm0_enable" and
"point 0" when writing to pwm1_auto_point1_pwm.

> +
> +	/* Speed and min_pwm are in percent; keep zero for the (0, 0) end marke=
r. */
> +	if (speed)
> +		speed =3D max_t(u32, speed, min_t(u32, fi->min_pwm, 100));

[Severity: Medium]
Can an active curve point bypass fi->min_pwm when userspace writes a pwm va=
lue
of 0 or 1?

Both 0 and 1 convert to speed =3D=3D 0 in xe_hwmon_sysfs_to_hw_val(), so sk=
ipping
the clamp here leaves speed at 0% and xe_hwmon_commit_user_fan_table() writ=
es
0% directly to pcode for active points whose temperature is non-zero.  Also,
if a point has temp =3D=3D 0 and userspace writes pwm =3D=3D 1, rounding sp=
eed to 0
without clamping turns the point into a (0, 0) end-of-curve marker.  Clampi=
ng
active points (0 .. point_count - 1) to fi->min_pwm at commit time after
identifying the (0, 0) terminator would enforce min_pwm on all active point=
s.

[ ... ]
> +static void xe_hwmon_init_curve_attrs(struct xe_hwmon *hwmon)
> +{
> +	int fan, kind, point, i =3D 0;
> +
> +	/* Per fan: all temp points then all pwm points; is_visible relies on t=
his layout. */
> +	for (fan =3D 0; fan < FAN_MAX; fan++) {
> +		for (kind =3D 0; kind < 2; kind++) {
> +			bool is_temp =3D !kind;
> +
> +			for (point =3D 0; point < MAX_FAN_CONTROL_POINTS; point++, i++) {
> +				struct sensor_device_attribute *sda =3D &hwmon->curve_sda[i];
> +
> +				snprintf(hwmon->curve_names[i], XE_CURVE_ATTR_NAME_LEN,
> +					 "pwm%d_auto_point%d_%s", fan + 1, point + 1,
> +					 is_temp ? "temp" : "pwm");

[Severity: Low]
The commit message states that this patch updates the Xe hwmon ABI
documentation for these attributes, but
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon is not modified in th=
is
patch.  Was the documentation hunk dropped by mistake?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124054811.7987=
63-1-karthik.poosa@intel.com?part=3D6
