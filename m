Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8178DC9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D5C10E0EC;
	Thu, 24 Sep 2026 11:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mXb/1ooV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B510E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:23:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 35F9340AE0;
 Thu, 24 Sep 2026 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27421F000FF;
 Thu, 24 Sep 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249013;
 bh=ueFKAihuh6dU+YGB+B0hYqGvAmLiBf4EoNjypn9yVmQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mXb/1ooVtqI17HmVDIStkRpjygEjRzL7TZQd+ztiCRxLffivdXhsaKxzmiR1EiKVi
 gxSc3OFUlgwWDqc62NgJAhiNhEY47Mmqx+oyLmIrxYSZVkv9LEJKdzX+TgqkD1d2un
 BTTrSElzWyVVHRRpF0iXFCyCwbxLWhUVTLApf5/36CBGNfeIfdp0/lnw7y5aouYcx0
 9FxJf9nKsbzLAKOx5aPIRtzdx7wEhZQ6Ii6EJ2szkT98z6F6yJlSxIAGVSiiT7NAJD
 oYOFXcD7Zi3FegAPD92Dzejc2ogt2ozvQruc9qnokoPl9ikko0pUWKuGdTxWEwnz+7
 w6umRxAcpUNAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/13] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-2-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:23:32 +0000
Message-Id: <20260924112332.E27421F000FF@smtp.kernel.org>
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
- [Medium] sysfs: returning 0 on error in store callback causes userspace i=
nfinite loop
--

commit fdbe8069cbe324980fc35768d7993da6a046117b
Author: Karthik Poosa <karthik.poosa@intel.com>
drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit

This commit adds error handling for pcode read failures in
xe_hwmon_pcode_rmw_power_limit() and checks the returned error in callers
to prevent updating power limit settings with invalid data.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
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
In xe_hwmon_power_max_interval_store() within drivers/gpu/drm/xe/xe_hwmon.c,
will setting count to 0 here cause userspace tools to enter an infinite loo=
p?

When a sysfs store callback returns 0 instead of a negative error code, it
indicates to the virtual file system that 0 bytes were written and swallows
the error. Standard userspace utilities (like echo or dd) often treat a
0-byte write as a short write and retry infinitely.

If an administrative user or script writes to the sysfs attribute and the
underlying pcode mailbox operation fails, could this cause an infinite loop
that consumes maximum processor time while simultaneously flooding the kern=
el
log with error messages?

Should this return the negative error code from
xe_hwmon_pcode_rmw_power_limit() instead of setting count to 0?

> +	} else {
>  		r =3D xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, =
channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
> =20
>  	mutex_unlock(&hwmon->hwmon_lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D1
