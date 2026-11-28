Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3B606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5g2yKM8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B410E04C;
	Sat, 28 Nov 2026 06:27:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E810E04C
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:27:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A54C433F1;
 Sat, 28 Nov 2026 06:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B771F000C1;
 Sat, 28 Nov 2026 06:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795847261;
 bh=aZWu9uunHOXh+VDRcAdtejopHWpGyMHyGhP5pA+SYfc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=g5g2yKM8Al8VmKaa3xxhgoZA7EoU+0hblioM7NkAnMVe0TrVL4Ir0ww/TsGsDI5KM
 ZVFYcdUgJW8v6v4qZPF0DmZlQ1oCL7Ce8aRpWbIYy9CDSIe2fDqBEKf8mYT2TETu1t
 cDKdMMFJ+0xcyajjn1kZywHO2LvMf/FaZtd8V0PqsrHZmI5u4D1OQLcPEt5bLVRLMq
 6hM7KkfD+gFoB6FaiW6kR/eWvUxw00jLVjU9RvsacR2EF/JCSyyAxgdK00topdxYWP
 NmsxHX6HMS7/YNu0PoJasXS2kTQhIc2UJzD7kP4uXqMcPcZzzsYhNh6eTqddkT8Uve
 LRqra6PHPaozA==
Message-ID: <sashiko-outbox-238493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] drm/xe/hwmon: Refresh fan data after late binding
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-9-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-9-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:27:40 +0000
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
- [Medium] drm/xe/hwmon: refresh error in
  xe_hwmon_read_fan_control_info() wipes state
- [Medium] drm/xe/hwmon: circular locking dependency in
  xe_hwmon_unregister()
- [Low] drm/xe/hwmon: inaccurate kernel-doc on
  xe_hwmon_fan_update_post_lb()
--

commit 66dd9f8eb5bcfd27c5213f0a2c07a58daa0c1bb3
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Refresh fan data after late binding

This commit refreshes cached stock fan tables and maximum RPM after
fan-control firmware loads via late binding, and serializes the refresh
with hwmon registration and teardown.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 76c2b519a21f7..be80717054c18 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1806,7 +1816,6 @@ static int xe_hwmon_read_fan_control_info(struct xe=
_hwmon *hwmon)
>  		if (!IS_FAN_ENABLED(hwmon, fan))
>  			continue;
> =20
> -		fi->pwm_enable_mode =3D XE_FAN_PWM_UNINITIALIZED;
>  		fi->fan_table[STOCK_FAN_TABLE].point_count =3D 0;

[Severity: Medium]
When xe_hwmon_fan_update_post_lb() calls xe_hwmon_read_fan_control_info()
after hwmon registration, does a pcode failure wipe the previously cached
fi->fan_table[STOCK_FAN_TABLE].point_count and fi->max_rps?

Clearing point_count and overwriting fi->max_rps in place (which also
passes the old cached fi->max_rps as the PCODE_DATA0 input to
xe_pcode_read()) before verifying that the refresh succeeded leaves
fi->pwm_enable_mode at XE_FAN_PWM_AUTO_STOCK_TABLE and the sysfs
attributes visible, so subsequent reads of fanN_max return 0 and reads
of pwmN fail with -ENODATA.

[ ... ]
> @@ -2979,11 +3002,21 @@ int xe_hwmon_register(struct xe_device *xe)
>   */
>  void xe_hwmon_unregister(struct xe_device *xe)
>  {
> -	if (!xe->hwmon)
> +	struct xe_hwmon *hwmon;
> +
> +	/* Stop updates before unregistering hwmon or unplugging the device. */
> +	xe_late_bind_pm_suspend(&xe->late_bind);
> +
> +	hwmon =3D READ_ONCE(xe->hwmon);
> +	if (!hwmon)
>  		return;
> =20
> -	hwmon_device_unregister(xe->hwmon->hwmon_dev);
> -	xe->hwmon =3D NULL;
> +	mutex_lock(&hwmon->registration_lock);
> +	if (READ_ONCE(xe->hwmon) =3D=3D hwmon) {
> +		hwmon_device_unregister(hwmon->hwmon_dev);
> +		WRITE_ONCE(xe->hwmon, NULL);
> +	}
> +	mutex_unlock(&hwmon->registration_lock);
>  }

[Severity: Medium]
Does holding hwmon->registration_lock across hwmon_device_unregister()
create a circular locking dependency in lockdep?

hwmon_device_unregister() drains active sysfs attributes under
kn->dep_map, while hwmon sysfs callbacks (such as xe_hwmon_read())
acquire xe_pm_runtime_d3cold_map via xe_pm_runtime_get().  On resume,
xe_pm_runtime_resume() holds xe_pm_runtime_d3cold_map while calling
xe_late_bind_pm_resume() -> flush_work(&fan_control_fw->work), and
xe_late_bind_work() now calls xe_hwmon_fan_update_post_lb(), which takes
hwmon->registration_lock:

  hwmon->registration_lock -> kn->dep_map -> xe_pm_runtime_d3cold_map ->
  (&fan_control_fw->work) -> hwmon->registration_lock

[ ... ]
> +/**
> + * xe_hwmon_fan_update_post_lb - Update fan info after late binding
> + * @xe: xe device instance
> + *
> + * This function reads the number of fans and their stock table after la=
te binding.
> + */
> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
> +{
> +	/* Pair with the release store in xe_hwmon_register(). */
> +	struct xe_hwmon *hwmon =3D smp_load_acquire(&xe->hwmon);
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	guard(mutex)(&hwmon->registration_lock);
> +	if (READ_ONCE(xe->hwmon) !=3D hwmon)
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	if (xe_hwmon_read_fan_control_info(hwmon))
> +		xe_warn(hwmon->xe, "failed to read stock fan tables after late binding=
\n");
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}

[Severity: Low]
This isn't a bug, but the kernel-doc above says
xe_hwmon_fan_update_post_lb() reads the number of fans, whereas it only
calls xe_hwmon_read_fan_control_info() and does not call
xe_hwmon_get_fan_enable_mask().  The v2 changelog in the commit message
also mentions returning an error from xe_hwmon_get_fan_enable_mask() and
keeping the old mask on failure, which is not part of this patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D8
