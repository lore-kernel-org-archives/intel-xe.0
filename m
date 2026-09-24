Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B65C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9B10E6CD;
	Thu, 24 Sep 2026 11:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CduDFYBQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AA310E6CD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:03:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F531410C8;
 Thu, 24 Sep 2026 11:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A371F000FF;
 Thu, 24 Sep 2026 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790247820;
 bh=BKuxcr5FbJ/1c6VoOSgp4XqNtStJs4WbLNA2F5pzsB0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CduDFYBQ1gOk4ftVEofTOSdcwcnoBYBDbQUtFNs3IyB6GdBgHsKxetTQBtm+tyZVW
 EUouDikmyLYFaiimGXkqrgzEZWjR1XdYZV1DiQ0NxX5bcNIk2JBIihuymtX3RzxWsS
 rfbNAM+bGaELky+06CbG26WqEh7H/OzQcf4ZjVK6Xk0yqWAZFu67rJ46hZffSkCqlc
 ZXT2LZ3xfE64qN3g+SXPs8wbeQd4K/LXVYnJIe1GhvAM5Pz5JLEcofsbVMgRpKGptw
 LE+s3v2ndFlGQybDDAPIw3o38H0GSAv3nlPf+sa24VFFWGSjBhwA3A0SbTZOOthFcq
 9nmVKbFAenGkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH i-g-t v4 01/13] drm/xe/hwmon: Handle pcode read failures
 of xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924105000.2627929-2-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
 <20260924105000.2627929-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:03:39 +0000
Message-Id: <20260924110340.47A371F000FF@smtp.kernel.org>
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
- [Medium] sysfs: returning 0 on error in xe_hwmon_power_max_interval_store=
() causes infinite userspace loops
--

commit 719c9331149239878e8f9d385268d89b8d17624f
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit

This patch handles pcode read failures in xe_hwmon_pcode_rmw_power_limit() =
by returning early and checking the error in callers. This prevents power l=
imit settings from being updated with invalid data when the hardware read f=
ails.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec33..514573f172ebb 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -679,11 +683,13 @@ xe_hwmon_power_max_interval_store(struct device *de=
v, struct device_attribute *a
> =20
>  	mutex_lock(&hwmon->hwmon_lock);
> =20
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIM=
E, rxy);
> -	else
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM=
_TIME, rxy))
> +			count =3D 0;

[Severity: Medium]
Could setting count to 0 here instead of returning a negative error code=20
cause an infinite loop in userspace tools?

Returning 0 from a sysfs store callback like=20
xe_hwmon_power_max_interval_store() tells the VFS that 0 bytes were written=
.=20
Many userspace writers, including bash loops and standard library buffered=
=20
writers, will interpret a 0-byte write as a signal to retry the write=20
indefinitely.=20

If the underlying pcode mailbox hardware operation fails, would it be bette=
r=20
to propagate the negative error code (such as the return value of=20
xe_hwmon_pcode_rmw_power_limit()) so the userspace write operation properly=
=20
fails?

> +	} else {
>  		r =3D xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, =
channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
> =20
>  	mutex_unlock(&hwmon->hwmon_lock);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924105000.2627=
929-1-karthik.poosa@intel.com?part=3D1
