Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D4C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9DF10E158;
	Mon, 24 Aug 2026 16:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="myPIueUe";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4110E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 123CC43D2F;
 Mon, 24 Aug 2026 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03301F00A3A;
 Mon, 24 Aug 2026 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589396;
 bh=U7F718+T7Tu+Y1NLdb9EXa2w5B9d/HjTHa+GjhKGYGs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=myPIueUez1H+VhVu6j6NKFsXYpZE8UnGgzh3Kp+DUDWRtFns4Ag3EDyoEHPzDUXq3
 xSI0AU2Zy7N7GY4kuyU4X5htmNY1hFVdepctbmhUya1j4RblcwswPfuMF8fjAw9oO+
 NBPkVbLbXEjo2w5wf2aq2IbQ8ygM8U1tHV3Ey0wBvH2RJrHUO8QSelXvS8pHTiHTB9
 zhZmQoaOmSBw6OU+MRJ6EJgy0NQzgbJOUPcHPL3wHmBMIDyPPpEEcCgVAYR4vu+PoL
 YukcQ4JzMQLoQgOEg1HWuAWkmWioDBSUpekbVH5v6BuSR4FwGBawpekZRngK5c8971
 m/QTsIaMx5pvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-15-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-15-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:36:35 +0000
Message-Id: <20260824163635.C03301F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Subsystem guidelines violation: The patch uses the absence of `s=
oc_remapper.set_telem_region` as a proxy check to prevent execution on Virt=
ual Functions (VF) instead of an explicit `IS_SRIOV_VF()` guard.

Pre-existing issues:
- [High] The `xe_pmt_cb` struct is missing the `.read_reg` and `.write_reg`=
 callbacks required for safe PMT Crashlog control register access on discre=
te GPUs.
--

--- Patch [3]: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config=
 ---
commit 6d90522f74020b6e17f1f98588ed1740977adfb4
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Protect against missing config

This commit prevents PMT registration and telemetry read access when the
soc-remapper callbacks are not configured, specifically targeting Virtual
Function (VF) init paths.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> +		if (!xe->soc_remapper.set_telem_region)
> +			return;

[Severity: Medium]
The commit message mentions that some init paths (VF) will not provide
soc-remapper callbacks. Is it safe to use this feature presence as a proxy
check to prevent execution on Virtual Functions?

According to the SR-IOV guidelines for the xe driver, VFs must be explicitly
blocked from PF-only resource registration using an IS_SRIOV_VF() guard to
prevent hardware failures and MMIO timeouts.

Should this code explicitly check for the VF context instead of relying on
the absence of the set_telem_region callback?

>  		info->priv_data =3D &xe_pmt_cb;

[Severity: High]
This is a pre-existing issue, but does assigning xe_pmt_cb here expose us to
unprotected MMIO accesses during suspend?

Since BMG exposes VSEC_CAP_CRASHLOG in xe_vsec_info, the crashlog driver
will probe and create sysfs entries. However, the xe_pmt_cb structure lacks
the .read_reg and .write_reg callbacks.

When userspace accesses crashlog sysfs attributes, the driver will fall back
to using direct readl()/writel() on entry->disc_table.

If the GPU is in D3cold, will these direct accesses bypass runtime PM checks
and attempt to read or write powered-off MMIO, potentially triggering MCE or
AER kernel panics?

>  		break;
>  	default:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D3
