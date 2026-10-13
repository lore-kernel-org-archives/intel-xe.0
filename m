Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F30CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9054110E985;
	Tue, 13 Oct 2026 19:01:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B456310E985
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:01:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D9AB1601FF;
 Tue, 13 Oct 2026 19:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658311F000FF;
 Tue, 13 Oct 2026 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791918070;
 bh=eSx4ztfbDHr/cd/IGoW349WKIv+bwIWy7kUgFJL5Br4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=MMdsVytHagssvZmDAkicDpfCg0k3bitYmIxKp95xcdP5YbC/DAo7dMMrW5us+sa7H
 f9OzGrCwQD0Z4dKYOcvYmnX6A1jlqCpClsOuZBjZJVYWUpJrCsE/VMt8HFX9bNJJug
 gFqWK61BBP1SWEfN4ixt7NeiPHEzHSROQt19C6nLs+IN/Ld/PhbG+hST0z1LRhA5Uo
 8m1XOGlowm0mkekIjVSJgzmWBNtd5PkVTuUCbUpA0m2mLIsNAnPPN9BRo1uVG8f1wf
 6Kp9kQFADPPIMur4T2p+xaPK08h+FkLbGITpfqHsDOLJWb84syJZUNYa6E6yenRY7/
 gLTWm6aIGFfAg==
Message-ID: <sashiko-outbox-170367@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013184939.694945-5-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 19:01:09 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: Validation helpers fail to filter U32_MAX/0xFF on pre-CRI=
 platforms
--

commit 3734bfcfc0e55f578f66176481a816cff2820aea
Author: Karthik Poosa <karthik.poosa@intel.com>
drm/xe/hwmon: Add helpers to validate thermal sensor readings

This commit adds mmio_temp_valid() and mbx_temp_valid() helpers to validate
temperature sensor readings. It introduces has_temp_sentinel to use U32_MAX
or 0xFF as invalid indicators on supported platforms, falling back to check=
ing
for 0 on other platforms.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b1d57f4910579..418e1c503eb5a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -825,6 +828,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct x=
e_hwmon *hwmon)
>  	return ret;
>  }
> =20
> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 val=
ue)
> +{
> +	/*
> +	 * On platforms lacking temperature sentinel support, a value of 0 is t=
reated
> +	 * as invalid. While 0=C2=B0C is theoretically possible, it is highly u=
nlikely for
> +	 * a discrete GPU in normal environments, making it a reasonable fallba=
ck
> +	 * indicator for invalid or uninitialized temperature readings.
> +	 */
> +	return hwmon->xe->info.has_temp_sentinel ? value !=3D U32_MAX : value !=
=3D 0;

[Severity: Medium]
Does this allow standard MMIO read failures (U32_MAX) to bypass the filter =
on
platforms lacking has_temp_sentinel?

If a device on a platform before CRI encounters a PCI read failure returning
U32_MAX, the ternary fallback (value !=3D 0) evaluates to true. Any userspa=
ce
read of the hwmon sysfs nodes during such conditions would expose bogus
extreme temperatures instead of properly returning an error.

> +}
> +
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude=
). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	return hwmon->xe->info.has_temp_sentinel ? value !=3D TEMP_MBX_INVALID =
: value !=3D 0;

[Severity: Medium]
Does this allow 0xFF (TEMP_MBX_INVALID) to be treated as a valid reading on
platforms lacking has_temp_sentinel?

If a device reads an unpopulated or unavailable mailbox sensor returning 0x=
FF,
the fallback check (value !=3D 0) evaluates to true. This would bypass the =
filter
and erroneously decode the reading to -127 degrees Celsius.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184939.6949=
45-1-karthik.poosa@intel.com?part=3D4
