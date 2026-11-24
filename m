Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8133606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2GmkNeD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632C10E110;
	Tue, 24 Nov 2026 05:53:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA8410E110
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:53:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 72307434C1;
 Tue, 24 Nov 2026 05:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62CF1F000C0;
 Tue, 24 Nov 2026 05:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795499604;
 bh=GQBFvU/2xiVIXe9GCpD9JXBizr5mOjV3pqlse7h61DA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=K2GmkNeD2K5P8NnXtOyezEm4LDq0bvaLVZsNCw09Tw8FBxrsKAlhf2YVo9tEvL2SQ
 PMymw7Oxq3eYAD1kdKhd6l9ui5bXbj1pP2FEYPBc5KoKamW7IDMuNHjcBQu/yzjYJZ
 sLfle7BA6Wzp4FFz8rWu++pVDUmU0JnQB9vxzHn9c9Wy7PNKcgBzcXivnGfCK1sbPo
 0ycPwyIpBJo0AOAL7qMG2IRPbjjXYxQGVl2zL76M32R5o+K3ToujWV1EYcu9p0H4PV
 r3GLsKAMICF29omVLOJhh4iOLt9L1Q2484WnN2oyVTK7qZnZamLxAbaME7mEytCecf
 iQVFt7LHsOX+g==
Message-ID: <sashiko-outbox-230564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] drm/xe/hwmon: Add kernel-doc for fan control
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124054811.798763-8-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 05:53:24 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/hwmon: kernel-doc claims pwm writes fail when pwmN_enable
  is 0
--

commit e3f1b146650ba8a68f8904ed7422e9ec4d05d22c
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add kernel-doc for fan control

This commit adds a kernel-doc comment describing Xe hwmon fan control,
its firmware stock and driver user tables, and the exposed sysfs files.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 77c4d1b0ecaef..b9e2e76d73c33 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -139,6 +139,58 @@ struct xe_hwmon_energy_info {
>  	long accum_energy;
>  };
> =20
> +/**
> + * DOC: Xe fan control
[ ... ]
> + * Writes to ``pwmN``, ``pwmN_auto_pointM_temp`` and ``pwmN_auto_pointM_=
pwm``
> + * are accepted only while ``pwmN_enable`` is 1; otherwise they fail with
> + * -EINVAL. Firmware stores duty cycle in percent, so PWM values read ba=
ck
> + * rounded to the nearest percent step. PWM values below the minimum dut=
y cycle
> + * reported by firmware for that fan are raised to it, except a curve po=
int PWM
> + * of 0, which is kept for the end marker.

[Severity: Low]
Does the driver actually reject writes to pwmN, pwmN_auto_pointM_temp
and pwmN_auto_pointM_pwm when pwmN_enable is 0?

Writing 0 (XE_FAN_PWM_FULL_SPEED) to pwmN_enable calls
xe_hwmon_set_user_fan_pwm(..., U8_MAX, true), which sets
fi->is_full_speed =3D true while keeping fi->pwm_enable_mode set to
XE_FAN_PWM_MANUAL_USER_TABLE.  Because the write guards in
xe_hwmon_set_user_fan_pwm(), xe_hwmon_pwm_auto_point_temp_store() and
xe_hwmon_pwm_auto_point_pwm_store() only check fi->pwm_enable_mode !=3D
XE_FAN_PWM_MANUAL_USER_TABLE and do not check fi->is_full_speed, writes
to these attributes succeed when pwmN_enable is 0 instead of failing
with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124054811.7987=
63-1-karthik.poosa@intel.com?part=3D7
