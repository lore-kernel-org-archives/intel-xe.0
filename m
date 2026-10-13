Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1C9CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736C510E6F3;
	Tue, 13 Oct 2026 02:24:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D2D10E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:24:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C9BF143BF8;
 Tue, 13 Oct 2026 02:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8323E1F000FF;
 Tue, 13 Oct 2026 02:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791858270;
 bh=gQJC/5/L2yfIRIzJjiSRLWp2q1+BJVpftGBsnxuywyo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=cFGKYzCW23XoFFqkulPO3i/nr+kfz5He2lDg4tvs9nZk1BWF59twi6NLmkX51VFKb
 t3ksr/xzvbmh634Mc0VcPUeK6jmjhlMvJnWIt1F07oKdsqMMXguTDmYtgwZQe7fAeB
 cxv6nm/K0QrP0ZRUvptrAjG6E/E3YGeTz9Ze5r1pqWTI1oJKG/odUDuyOpiwaQJHVV
 cJCrVal2cNUNpz38nyl7T3xOpR579dtyB+KnWXHE2aVtxL/sQbvj0lHNwebdpMUavM
 RZr1/yMQAJxCTTdns6OkgSqO12Wg3KjoZVkOp1nqHo1g8BLrzmlXm6xLNNP8Nmnqiw
 1slw4YcobO+bg==
Message-ID: <sashiko-outbox-168870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013020636.447620-5-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:24:30 +0000
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
- [Medium] hwmon: MMIO read errors (U32_MAX) are treated as valid temperatu=
res on legacy platforms
--

commit 30c789d23390d6abf7d18b4ec4f037b60404f1b9
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add helpers to validate thermal sensor readings

This commit introduces mmio_temp_valid() and mbx_temp_valid() to check
whether a temperature sensor reading is valid. It gates these checks behind
the has_temp_sentinel flag.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2d1fa9159c58b..712a21a996362 100644
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
Does this inadvertently treat PCIe MMIO read errors as valid temperatures on
legacy platforms?

When a PCIe target abort or link failure occurs, xe_mmio_read32() returns
U32_MAX (0xFFFFFFFF). If the platform lacks has_temp_sentinel support, the
condition evaluates value !=3D 0. Because 0xFFFFFFFF is not 0, this returns
true.

Later, in xe_hwmon_temp_read(), this U32_MAX value will be blindly decoded:

*val =3D (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
        (REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
        MILLIDEGREE_PER_DEGREE;

This could result in absurd temperature readings like -8,388,607 or 255
instead of correctly propagating an error code when the hardware fails.

Should U32_MAX be universally treated as invalid, regardless of the
has_temp_sentinel flag?

> +}
> +
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude=
). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013020636.4476=
20-1-karthik.poosa@intel.com?part=3D4
