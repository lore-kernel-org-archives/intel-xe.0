Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61723C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1806310E1B3;
	Wed,  2 Sep 2026 18:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k4CyDAVn";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07C10E1B3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:18:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 558FB43B36;
 Wed,  2 Sep 2026 18:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169391F00A3E;
 Wed,  2 Sep 2026 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788373080;
 bh=dOwBE0IAvLjfrdpeCiHbdVhz3k/R7HblIjhmsMUap0g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k4CyDAVnjFpQ77PddKcpv+/vtDZHHjoUYlQqzlAxYC/EPG/rMEuScNsQef3n3mDTT
 7a2q1kmxbZhadqf3SnEeG9Nl3u4xZJmawx7XCZOwJ0igXuji8i9d0O4bxaCfTEADH5
 O0HHHBU0mBf+aibGPYzjSDXgLarq9EhAzjlZP3aFvjLnzK/fnrCe6wnO4rwy6R6m78
 5AIk3jovIIldFz/Cz8hzzFyLOT8Kb907jg5qlPsY/btRhUMPuDO3EhvBUWyD6pPDMN
 EVCL1X9OEfwzSXewhdKxfOgQ+ynp8xSH5utJLV9QUG/7x3c968gSGi/lcRjyPR/wcs
 YnXu4YdBFOGDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] drm/xe/hwmon: Correct group selection for memory
 controller temperature
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902175507.3910573-4-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:17:59 +0000
Message-Id: <20260902181800.169391F00A3E@smtp.kernel.org>
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
- [High] Unaligned memory access due to misaligned pointer cast.
--

commit bce6aebc01fe7736c7ce377f855345b461ab89e3
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Correct group selection for memory controller temperature
   =20
Read all the necessary groups when reading memory controller
temperature in get_mc_temp().

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 51a6664eec485..3a675d7b6758b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -883,7 +883,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *=
val)
>  	int ret, i, count =3D 0;
>  	s32 average =3D 0;
> =20
> -	for (i =3D 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i =3D 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>  		ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_T=
HERMAL_DATA, i),
>  				    (dword + i), NULL);

[Severity: High]
This is a pre-existing issue, but does this code create an unaligned memory
access?

In get_mc_temp(), the variable dword is initialized as:

    u32 *dword =3D (u32 *)hwmon->temp.value;

Since the value array is located at offset 10 in struct
xe_hwmon_thermal_info, this cast creates a misaligned 32-bit pointer.

When (dword + i) is passed to xe_pcode_read(), an unaligned 32-bit store
occurs. On strict-alignment architectures, this could cause an alignment
fault and kernel panic.

Because the temp1_input sysfs attribute is world-readable, could this allow
an unprivileged local user to trigger a denial of service?

>  		if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902175507.3910=
573-1-karthik.poosa@intel.com?part=3D3
