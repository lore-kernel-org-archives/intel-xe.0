Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFC606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5t04k0e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B550A10E21F;
	Tue, 24 Nov 2026 06:07:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3310E337
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:07:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 52D5D60F04;
 Tue, 24 Nov 2026 06:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F1A1F000C0;
 Tue, 24 Nov 2026 06:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795500434;
 bh=ooPAFqgMCQsUSFeLwJvkpUhnpfolsyLJCTQodWwRwZI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=d5t04k0ePy/fmfe9J0yjxKM+Ja05JlzDqg4iKLpgXUH4wWCN/PJMirFARPOsL/iQF
 dX9Kj8UucRQvjzGw/wW23Lyh5956YZEirOhJQjo543OEVNf00YrTGZBP+salnn9Qtn
 JArjlPg7TvTmPtGquhdleI5XBb8C5xtj+QJ9OLM69GJP361JlxGz6+JDtJoB94/0Y3
 V3VHLpGfSNqRfSnDnSmyqIg8vU0qA7/t0vNfSzxtTBPKHF2gZ5hc4f7nv2QblXh1CM
 gaU9rZAEnqeV7PyN1MZV+dLt0qcZBlbRQQ31ecqx2ml/Y/j7uKCwZvHG3ypLRGQ4RB
 uTS6gSLCCpqUw==
Message-ID: <sashiko-outbox-230575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] drm/xe/hwmon: Preserve fan user table across
 suspend resume
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124054811.798763-9-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-9-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:07:14 +0000
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
- [Medium] drm/xe/hwmon: xe_hwmon_resume() clears staged fan curve
  points
- [Medium] drm/xe/hwmon: fan mode desync on PCODE error in
  suspend/resume
- [Medium] drm/xe/hwmon: xe_hwmon_suspend() treats unprobed fan mode as
  user table
- [Medium] drm/xe/hwmon: uninitialized point_count in
  xe_hwmon_get_fan_point_count()
--

commit 5afbb369b25a32407c56f7ca0be622b0b78f35d5
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Preserve fan user table across suspend resume

This commit adds xe_hwmon_suspend() and xe_hwmon_resume() hooks to save
active fan user tables before suspend or FLR and restore them on resume.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b9e2e76d73c33..8efb5d2ce9ac2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -2898,4 +2900,137 @@ void xe_hwmon_unregister(struct xe_device *xe)
>  	hwmon_device_unregister(xe->hwmon->hwmon_dev);
>  	xe->hwmon =3D NULL;
>  }
> +
> +/**
> + * xe_hwmon_suspend - Save hwmon state before suspend
> + * @xe: xe device instance
> + * @runtime: true for runtime suspend, false for system suspend or FLR p=
repare
> + *
> + * Save any hwmon runtime state that must survive PM suspend transitions.
> + */
> +void xe_hwmon_suspend(struct xe_device *xe, bool runtime)
> +{
> +	struct xe_hwmon *hwmon =3D xe->hwmon;
> +	struct xe_tile *root_tile;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	/* Runtime suspend keeps the fan tables unless the device enters d3cold=
. */
> +	if (runtime && !xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
> +		return;
> +	}
> +
> +	root_tile =3D xe_device_get_root_tile(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan =3D 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi =3D &hwmon->fi[fan];
> +		struct fan_control_point points[MAX_FAN_CONTROL_POINTS];
> +		u32 point_count =3D 0;
> +		u32 point;
> +		int ret;
> +
> +		if (!IS_FAN_ENABLED(hwmon, fan))
> +			continue;
> +
> +		fi->restore_user_table =3D false;
> +		if (fi->pwm_enable_mode =3D=3D XE_FAN_PWM_AUTO_STOCK_TABLE)
> +			continue;

[Severity: Medium]
Can this treat an uninitialized fi->pwm_enable_mode as an active user fan
table?

Because struct xe_hwmon is zero-allocated, fi->pwm_enable_mode starts at 0
(XE_FAN_PWM_FULL_SPEED) and is only set to XE_FAN_PWM_AUTO_STOCK_TABLE in
xe_hwmon_read_fan_control_info() after reading the stock fan table from
PCODE succeeds.  On platforms like DG2 (which sets fan_enable_mask =3D
GENMASK(1, 0) for tachometer reads without PCODE fan tables) or when stock
table initialization fails at probe, fi->pwm_enable_mode stays 0 while
IS_FAN_ENABLED(hwmon, fan) is true.  Since every path that activates a user
table sets fi->pwm_enable_mode to XE_FAN_PWM_MANUAL_USER_TABLE, checking
only for equality with XE_FAN_PWM_AUTO_STOCK_TABLE causes
xe_hwmon_suspend() to issue failing PCODE reads and log warnings on every
suspend.

Checking fi->pwm_enable_mode !=3D XE_FAN_PWM_MANUAL_USER_TABLE would skip
fans that have no active user table.

> +
> +		ret =3D xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FA=
N_TABLE);
> +		if (ret || point_count < MIN_FAN_CONTROL_POINTS) {
> +			xe_warn(hwmon->xe,
> +				"fan %d user table point count before suspend invalid, ret=3D%d, cou=
nt=3D%u\n",
> +				fan, ret, point_count);
> +			continue;
> +		}
> +
> +		for (point =3D 0; point < point_count; point++) {
> +			u32 fcp =3D FCP_INDEX(USER_FAN_TABLE, point);
> +
> +			ret =3D xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +								  FSC_READ_FAN_TABLE, fan),
> +					    &fcp, NULL);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"failed to read fan %d user table point %u before suspend, ret=3D%d=
\n",
> +					fan, point, ret);
> +				break;
> +			}
> +
> +			points[point].temp =3D
> +				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			points[point].speed =3D
> +				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +		}
> +		if (ret)
> +			continue;
> +
> +		memcpy(fi->fan_table[USER_FAN_TABLE].fcp, points,
> +		       point_count * sizeof(points[0]));
> +		fi->fan_table[USER_FAN_TABLE].point_count =3D point_count;
> +		fi->restore_user_table =3D true;

[Severity: Medium]
Does xe_hwmon_suspend() need to re-read the user table from PCODE when
fi->fan_table[USER_FAN_TABLE] is already cached by every path that commits
or activates a user table?

xe_device_suspend() also runs during PCIe FLR prepare via
xe_pci_reset_prepare(), when hardware state may be corrupted and PCODE
mailbox reads can fail.  Because fi->restore_user_table is cleared to false
before the PCODE reads, a mailbox error during suspend or FLR prepare skips
restoring the already-cached user table on resume.  When either this
pre-suspend read or xe_hwmon_activate_user_fan_table() in xe_hwmon_resume()
fails, hardware falls back to the stock fan table after reset while
fi->pwm_enable_mode remains XE_FAN_PWM_MANUAL_USER_TABLE and
fi->is_full_speed remains set, leaving sysfs out of sync with the hardware.

[ ... ]
> +void xe_hwmon_resume(struct xe_device *xe, bool runtime)
> +{
> +	struct xe_hwmon *hwmon =3D xe->hwmon;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	if (runtime && !xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
> +		return;
> +	}
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan =3D 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi =3D &hwmon->fi[fan];
> +		int ret;
> +
> +		if (!IS_FAN_ENABLED(hwmon, fan))
> +			continue;
> +
> +		if (!fi->restore_user_table) {
> +			xe_dbg(xe, "fan %d user table restore not required\n", fan);
> +			continue;
> +		}
> +
> +		/* Re-program cached user-table settings for fans active before suspen=
d. */
> +		ret =3D xe_hwmon_activate_user_fan_table(hwmon, fan,
> +						       fi->is_full_speed,
> +						       USER_FAN_TABLE);

[Severity: Medium]
Does calling xe_hwmon_activate_user_fan_table() on resume discard fan curve
points that userspace is in the middle of staging?

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_activate_user_fan_table() {
    ...
	fi->fan_table[USER_FAN_TABLE].point_count =3D point_count;
	fi->fan_table[USER_FAN_TABLE].temp_staged =3D 0;
	fi->fan_table[USER_FAN_TABLE].speed_staged =3D 0;
    ...
}

Each sysfs write in xe_hwmon_pwm_auto_point_temp_store() and
xe_hwmon_pwm_auto_point_pwm_store() only holds a runtime PM reference for
that single attribute write while staging a multi-point curve in
Manual/User mode.  If the device enters D3cold runtime suspend or system
suspend between point writes, xe_hwmon_resume() zeroes temp_staged and
speed_staged, so subsequent writes to finish the curve see missing prefix
bits in xe_hwmon_update_user_fan_point() and return 0 without committing
the curve.

> +		if (ret) {
> +			xe_warn(xe, "failed to restore fan %d user table after resume, ret=3D=
%d\n",
> +				fan, ret);
> +			continue;
> +		}

[Severity: Medium]
Does xe_hwmon_get_fan_point_count() pass uninitialized or non-zero values
in *point_count into PCODE_DATA0?

__pcode_mailbox_rw() writes *data0 to PCODE_DATA0 before issuing the
mailbox read command, but xe_hwmon_get_fan_point_count() passes point_count
straight to xe_hwmon_pcode_read_fan_control() without initializing
*point_count =3D 0.  In xe_hwmon_activate_user_fan_table() (called here on
resume), point_count holds source_table->point_count rather than 0, and in
xe_hwmon_pwm_auto_point_temp_show() and xe_hwmon_pwm_auto_point_pwm_show(),
point_count is an uninitialized stack variable whose contents are written to
PCODE_DATA0.

Initializing *point_count =3D 0 at the start of
xe_hwmon_get_fan_point_count() would avoid passing stale or uninitialized
data to PCODE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124054811.7987=
63-1-karthik.poosa@intel.com?part=3D8
