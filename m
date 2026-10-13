Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF77DCC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5910E985;
	Tue, 13 Oct 2026 18:59:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC43110E985
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:59:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C0E442A27;
 Tue, 13 Oct 2026 18:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29DA1F000FF;
 Tue, 13 Oct 2026 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791917969;
 bh=HPEr/TnSJOErqaM5g56Pq+uhgdMsv1eTVuSS7uS8i7w=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XphkJSQshax6ZYDZR8z2vjhMCKeNe5kGLyJYMUj2rgAEFiC3aJprisa+40GZpZk9p
 T+jD+NdDcEPqzxtojfZlfgxwBg52JHa3WjgCanw3IpZskcSUtXN5cM9KzU8kNUuFIX
 EGRx2gbi8g2taEtXlijKSWP0lhoeOE/C6NhH6+wAIDy6srwhTM1p0BmpjQ5lGfxlCL
 Oeq2czql0RxQLrhCS6S1X7MMgENJI4tHn1exP08E+BDtWdZECHYJQWLCb6PQvgwANS
 Txv+zG5/Ju2LfCkgWr3kIlv+BARj8y/veHssqkNkGIcjXC9EFOzG7b+rDhV8DAd/pW
 ot8Lh9ePCfnzA==
Message-ID: <sashiko-outbox-170362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 13/16] drm/xe/hwmon: add PCIe temperature support
 for CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013184939.694945-14-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-14-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:59:28 +0000
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
- [Medium] hwmon: pcie_temp_index() uses strict equality for CRI unlike get=
_mc_temp()
--

commit 4122768dbcd48bfed72f1531064229c2807857fd
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: add PCIe temperature support for CRI

This commit adds the PCIe temperature sensor offset in READ_THERMAL_DATA for
the Crescent Island (CRI) platform. It refactors PCIe temperature handling =
to
use platform-specific sensor indices rather than special-case decoding logi=
c.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index bccae2ea91fdb..3c1f6b70c82dc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1016,21 +1019,30 @@ static int get_mc_temp(struct xe_hwmon *hwmon, lo=
ng *val)
>  	return 0;
>  }
> =20
> -static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> +static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
> +{
> +	if (hwmon->xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		return CRI_TEMP_INDEX_PCIE;

[Severity: Medium]
Will this strict equality check cause incorrect PCIe temperature readings on
future platforms that inherit this mailbox layout?=20

In get_mc_temp(), the driver uses a greater-than-or-equal comparison for the
same platform:

	if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
		start =3D CRI_TEMP_INDEX_MCTRL;

Does xe_hwmon_pcie_temp_index() need to use >=3D XE_CRESCENTISLAND to match
the behavior of get_mc_temp() and correctly support future platforms?

> +
> +	if (hwmon->xe->info.subplatform =3D=3D XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		return BMG_G21_TEMP_INDEX_PCIE;
> +
> +	return TEMP_INDEX_PCIE;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184939.6949=
45-1-karthik.poosa@intel.com?part=3D13
