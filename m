Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07833CA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E7910E6F3;
	Tue, 13 Oct 2026 02:23:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081A910E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:23:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BABC8419E9;
 Tue, 13 Oct 2026 02:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED6D1F000FF;
 Tue, 13 Oct 2026 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791858209;
 bh=JuuYo7oHxfUb3yo8sHUJuBmfTWcJFAKb0ZwSC0ZwbJ0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Jf6EUD7wORnkMeF2pbl4QwJRpO0KAbizyPdDHjG8axEW2gHZ1Al1BY5Q0vrokgMXI
 OVHy9++nUojZGIgZjZZTI/xoY1ELyVVWU4STSR+Woj6EeTrJM04dJNiL6Bi9QRlKW6
 06WuTYxePZuB6RArfcwXn+rXnU9mQycNx2w3zQPyJptPLsG4WvSmsXCI3kQTRJXzTP
 5aB9MKb/kBh4kguZHvVkRtgyXPchDJgJpTy4Aiod8cBh4dbc0Y5OrTj1JOiw/X7291
 NAmXVKyRerjZaDY5IvnXzlqUS+5RUw62gvI/IXOB3WCIPRemqEiMOhA0zb1isy30rr
 Rk7Tx1jaASyfA==
Message-ID: <sashiko-outbox-168868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013020636.447620-2-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:23:28 +0000
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
- [Medium] drm/xe/hwmon: missing error checks for pcode writes during prere=
gistration
--

commit 79685dc42e50f60af65d94b261b8f9a9cccf79d0
Author: Karthik Poosa <karthik.poosa@intel.com>

    drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_li=
mit
   =20
    Return early when the pcode read operation fails in
    xe_hwmon_pcode_rmw_power_limit() and check the returned error in
    callers to avoid updating power limit settings with invalid data.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec33..9884e06f83e59 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *=
hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret =3D xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_=
EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>  		} else {

[Severity: Medium]
This problem wasn't introduced by this patch, but since the commit message=
=20
mentions checking the returned error in callers of=20
xe_hwmon_pcode_rmw_power_limit() to avoid invalid data, does this patch mis=
s=20
the callers in xe_hwmon_get_preregistration_info()?

If any of these writes fail (e.g. due to a pcode timeout), the driver still
sets hwmon->boot_power_limit_read =3D true. This forces all subsequent powe=
r=20
limit queries to use READ_PL_FROM_PCODE or READ_PL_ACCEPTED parameters inst=
ead=20
of READ_PL_FROM_FW:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_get_preregistration_info() {
    ...
		} else {
			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
			/* Write default limits to read from pcode from now on. */
			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
						       hwmon->pl1_on_boot[CHANNEL_CARD]);
			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
						       hwmon->pl1_on_boot[CHANNEL_PKG]);
			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
						       hwmon->pl2_on_boot[CHANNEL_CARD]);
			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
						       hwmon->pl2_on_boot[CHANNEL_PKG]);
			hwmon->scl_shift_power =3D PWR_UNIT;
			hwmon->scl_shift_energy =3D ENERGY_UNIT;
			hwmon->scl_shift_time =3D TIME_UNIT;
			hwmon->boot_power_limit_read =3D true;
    ...
}

Because the defaults were never successfully committed to the pcode mailbox=
,=20
can these queries return stale, uninitialized, or invalid limit values,=20
causing userspace to see incorrect hardware monitoring data or misconfigure=
=20
power limits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013020636.4476=
20-1-karthik.poosa@intel.com?part=3D1
