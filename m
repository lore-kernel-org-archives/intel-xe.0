Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317A4C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8F310E6E0;
	Mon,  7 Sep 2026 08:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JTv8StVQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4FC10E6E0
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:44:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FAAD416A0;
 Mon,  7 Sep 2026 08:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1720E1F00A3A;
 Mon,  7 Sep 2026 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788770658;
 bh=lycYdfOhciGEEobelpmxK3OAotNz7z6cXVpP9+wfa20=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JTv8StVQAL3RAYFFHIh9ueKTe53IkLZj/3ELVp0aLQ7MN32xs9b2csURNn6FSd2Pf
 eIsTJD+TjXlpF2kxHp6aqocFJsq4nHdbcerN60GVw7+RU4deU+CUR0Gch5uDiz8l0j
 pgfRSbRcuCCwBoWJrNtGisFhVsysRPTFUABJvvQn15pvJjbsXxgnV1GL1gyuMCIl2E
 pB+MvBWbxCIi1pNmPRW7Tim8WIWucGobzdutwpX9IBDy6BRlZIprFkjeKnmI6xB2YL
 lxfL+toTVMWLCoJz+dNzTnuhj/bj/LP/1oBneR60ryP1+Jcg0GtrN1MM8DO4diR5NR
 HUKjOm9YQ5gzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/hwmon: Use shared pcode default timeout
 for power limit write
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907083520.192418-3-karthik.poosa@intel.com>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
 <20260907083520.192418-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:44:17 +0000
Message-Id: <20260907084418.1720E1F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [High] Missing early return on PCODE mailbox read failure causes hardware=
 misconfiguration and corruption of pcode registers.
--

commit d67ad2da2fb13ff7d9f642e82666f4e587b00a48
Author: Karthik Poosa <karthik.poosa@intel.com>
drm/xe/hwmon: Use shared pcode default timeout for power limit write

This commit drops the local PL_WRITE_MBX_TIMEOUT_MS macro and uses the comm=
on
PCODE_DEFAULT_TIMEOUT_MS for the power limit write mailbox command.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d8..5edeac961ec33 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -252,7 +247,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struc=
t xe_hwmon *hwmon, u32 attr
>  							     (channel =3D=3D CHANNEL_CARD) ?
>  							     WRITE_PSYSGPU_POWER_LIMIT :
>  							     WRITE_PACKAGE_POWER_LIMIT, 0),

[Severity: High]
This isn't a bug introduced by this patch, but looking at the earlier read
operation in xe_hwmon_pcode_rmw_power_limit() in drivers/gpu/drm/xe/xe_hwmo=
n.c,
is an early return missing upon read failure?

If xe_pcode_read() encounters an error, such as a mailbox timeout, it logs a
debug message but execution falls through without returning. The val0 and v=
al1
variables remain 0, and the read-modify-write operation is applied to them:

        ret =3D xe_pcode_read(..., &val0, &val1);
        if (ret)
                drm_dbg(...);

        if (attr =3D=3D PL1_HWMON_ATTR)
                val0 =3D (val0 & ~clr) | set;
        else if (attr =3D=3D PL2_HWMON_ATTR)
                val1 =3D (val1 & ~clr) | set;

Can this fall-through cause the subsequent write to clear all other fields =
in
the power limit registers, like time windows and enable bits, potentially
leaving the hardware power configuration in a corrupted state?

> -							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
> +							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x,=
 ret %d\n",
>  			channel, val0, val1, ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083520.1924=
18-1-karthik.poosa@intel.com?part=3D2
