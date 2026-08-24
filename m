Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE446C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDE10E158;
	Mon, 24 Aug 2026 16:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ai7f1oNB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC6A10E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:37:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A61646011F;
 Mon, 24 Aug 2026 16:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DD31F000E9;
 Mon, 24 Aug 2026 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589437;
 bh=/iQrjVhqXv7XB/iAXnWtSNCw9dqSMn0CXITKfdPa/Zg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ai7f1oNBQnmQawkTY3kuDz/XmCbIUAqTG9w3l8xW0f1RG/3EKtvBidhci9fsmjlxR
 x/lo635WV9UvJHPfWJ4HE8VDjxdM4vGc+HBOjxx7JpZOdivDiPoaKtCYSXk1IKhVgq
 08GztyHaet+EKGjP23va1sHn+pDGI/oPeHUK1GgtHFx8Txaia5XT4/wR0SpJwGrit1
 Zce39SRyzVNDzIGCX+te9GUjvMNjiYeGV5SI/LZKKJeJiw190eY05+NkUy4MDxbM9L
 KeyBX+qAl35AnvvyMb1UcLWgi1hdKhO7l94dLNcZXvR3Ce551fdmcA1LA6fRGQxpkI
 SVht/0NXC9+UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-20-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-20-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:37:16 +0000
Message-Id: <20260824163717.32DD31F000E9@smtp.kernel.org>
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
- [High] The CRI PMT functionality and VSEC registration lack an explicit I=
S_SRIOV_VF() guard, allowing Virtual Functions to access PF-only SOC_BASE M=
MIO registers.
--

--- Patch [8]: [PATCH v3 08/10] drm/xe/vsec: Crescent Island PMT callbacks =
---
commit 20efb72ccb405a03098f93ae5977f349cb941f0a
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces necessary callbacks to read and write status and
control information for Crescent Island (CRI) PMT usage. It also adds the
logic to register the CRI PMT functionality.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 o=
ffset)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs;

[ ... ]

> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	xe_pm_runtime_get(xe);

[Severity: High]
Can a Virtual Function (VF) trigger this access?

It looks like disc_addr calculates a SOC_BASE MMIO region offset using
CRI_DISCOVERY_OFFSET, which is typically restricted to Physical Functions
(PFs).=20

Accessing PF-only hardware resources from a VF context can cause MMIO
timeouts and hardware failures.=20

[ ... ]

> @@ -375,8 +478,17 @@ void xe_vsec_init(struct xe_device *xe)
>  		if (!xe->soc_remapper.set_telem_region)
>  			return;
>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
> -		info->priv_data =3D &xe_pmt_cb;
> +		info->priv_data =3D &xe_bmg_pmt_cb;
> +		break;
> +
> +	case XE_VSEC_CRI:
> +		if (!xe->soc_remapper.set_telem_region)
> +			return;
> +		xe->pmt.base_offset =3D CRI_TELEMETRY_OFFSET;
> +		info->priv_data =3D &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;

[Severity: High]
Should this platform registration block be guarded by IS_SRIOV_VF()?

Since the newly added callbacks interact directly with SOC_BASE MMIO region=
s,
checking for IS_SRIOV_VF(xe) and returning early could prevent VFs from
registering the PMT functionality and attempting to access restricted hardw=
are.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D8
