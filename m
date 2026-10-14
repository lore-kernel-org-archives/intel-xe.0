Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394BFCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7A10FD67;
	Wed, 14 Oct 2026 12:11:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406010FD67
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 12:11:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5FB2A600DA;
 Wed, 14 Oct 2026 12:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7CF1F000FF;
 Wed, 14 Oct 2026 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791979885;
 bh=fGFheuKnjYk8Joefyd/+Np/ZgiBTT/VVqEBL75kNjiE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dy568fnQA4ZXSRhQk9Tf1ixzZ7lPXgf9jHNTdyA/pEsl3A0T4mA9Dx9u1znj1yYWc
 zxTBwcjXBbgdd7vwlXbgJFsopPYJYHRxu5tesUT5G2A3jUuxnzJr1UC9zg0hvhdGul
 2t/kq9o24bnqNtT9prY/xikfOypBLwCWaQL1Jtzgu0TIJFU7Z40ZypmksuQ/rOFeyd
 n8PVm81RMY2JPR4uTGcdHbnIqHjhyp0abz5eEPEmJhs3D+PZebhTzpdRS1qCM5gWxD
 Jh2KhZZArfMjITBeBGPrSTpsovadgSL1RohFT4i4b12XNx5+6LfNXc7SXx1RDTrp8g
 KfxDkBO1rd6tA==
Message-ID: <sashiko-outbox-171241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014115806.831459-5-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:11:24 +0000
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
- [Low] drm/xe/hwmon: mbx_temp_valid() fails to reject 0x80 (-0=C2=B0C) as =
invalid
--

commit cc835292455ece8a38adb02fe6e4c345fc3aa89a
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add helpers to validate thermal sensor readings

This commit adds mmio_temp_valid() and mbx_temp_valid() to validate
temperature sensor readings. It uses the has_temp_sentinel flag to gate
these checks and rejects 0xFF for mailbox and 0xFFFFFFFF for MMIO.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1b4efbf4ac999..883a0ae1d90e3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -834,6 +837,30 @@ static int xe_hwmon_pcode_read_thermal_info(struct x=
e_hwmon *hwmon)
>  	return ret;
>  }
[ ... ]
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude=
). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	if (value =3D=3D TEMP_MBX_INVALID)
> +		return false;
> +
> +	return hwmon->xe->info.has_temp_sentinel || value !=3D 0;

[Severity: Low]
Does this raw byte check fail to reject 0x80?

Since 0x80 represents -0 degrees Celsius in the sign-magnitude format (sign
bit 7 is set, magnitude bits 6:0 are zero), it evaluates to true here
because 0x80 is not equal to 0.

> +}
> +
> +/* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius=
. */
> +static int mbx_temp_decode(u8 value)
> +{
> +	int temp =3D value & TEMP_MBX_MAG;
> +
> +	return (value & TEMP_MBX_SIGN) ? -temp : temp;

If 0x80 is passed here, it decodes to 0 degrees Celsius.

This means the fallback safety logic in mbx_temp_valid() intended to reject
uninitialized 0 degrees Celsius readings can be bypassed if the hardware
returns 0x80 instead of 0x00. This could fold invalid readings into the
temperature average.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014115806.8314=
59-1-karthik.poosa@intel.com?part=3D4
