Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9158CA5FE0
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 09:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7FE10E52B;
	Fri,  2 Oct 2026 09:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NpVKQ3KW";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351A210E52B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 09:13:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AB99560A6F;
 Fri,  2 Oct 2026 09:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430DA1F00893;
 Fri,  2 Oct 2026 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790932418;
 bh=epQ3hPByTHjxldKp/7Uu6/CmI1PsM99pQvqLzVbEcjw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NpVKQ3KWJENndb5e5iQ7wGZVd7vqgdMYWFsvcI6MAnYeqBhNQwMKkAUMkgLWWJHaI
 gFuxstmPKze0iouZLt1KAVgaxYOWYuyxeR1ISTWIoU8H+I5qk93odSgwov678Uoy+n
 9RDrhcwn8EqOgagLXWdtFQu4aedShOKQMiOuKFRCBuiAYYK6nOC+A1XtCPJTOdXIi0
 ZzxZ1n8mFaMPTetq8fsT0QOav2w4JCOXmaEvlz/jrDZiLDNRcScXMktvjYb4EZUCNN
 g7j6NDxmiqBrqCYgemZenVCfw2FUaenhUbw68/MD0ARgRQaDUEVblLxMKFktwShvL5
 TAkxbJ0ZpT6Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/15] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001195033.3466205-2-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
 <20261001195033.3466205-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:37 +0000
Message-Id: <20261002091338.430DA1F00893@smtp.kernel.org>
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
- [Low] drm/xe/hwmon: error code from pcode write is dropped and replaced w=
ith -EIO
--

commit a3216689f81fc9f531bd48c8af3db490de1c046b
Author: Karthik Poosa <karthik.poosa@intel.com>
drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit

This commit adds error checking to pcode read operations in
xe_hwmon_pcode_rmw_power_limit() and propagates the error up to the callers.
Callers are updated to handle the new return values instead of continuing
with invalid data.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec33..92be71f7bc92f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -679,15 +683,18 @@ xe_hwmon_power_max_interval_store(struct device *de=
v, struct device_attribute *a
> =20
>  	mutex_lock(&hwmon->hwmon_lock);
> =20
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIM=
E, rxy);
> -	else
> +	ret =3D count;
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM=
_TIME, rxy))
> +			ret =3D -EIO;

[Severity: Low]
Does this code intentionally discard the specific error code returned by
xe_hwmon_pcode_rmw_power_limit()?

Replacing the actual error (such as -ETIMEDOUT or -ENXIO) with a generic -E=
IO
might obscure the true cause of the hardware failure and affect userspace
retry logic. Can the returned error code be propagated directly instead?

> +	} else {
>  		r =3D xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, =
channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
> =20
>  	mutex_unlock(&hwmon->hwmon_lock);
> =20
> -	return count;
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001195033.3466=
205-1-karthik.poosa@intel.com?part=3D1
