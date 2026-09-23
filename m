Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E32C9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5A510E13F;
	Wed, 23 Sep 2026 18:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IeG6bBZ0";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849810E13F
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:28:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 12833600AA;
 Wed, 23 Sep 2026 18:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C601F00893;
 Wed, 23 Sep 2026 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790188114;
 bh=6h9LeYmW7iNKoFtdjeR76GEVP1lv/6pEhuVNhm70X+w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IeG6bBZ05BMYptIca41JEB5OOcd8fKncUnXpbvBq4aru08RKCtxuEvtItW/VmLBS1
 jJ/jL6GgPsnNHX9bjIFE588eIrkiyc3WW8whBuV0jhRuD/GeZZqW7BA+Wjgg/amICb
 +fmgDMFrL/OEuNQBOpESWi8ApdlofAh+Bh1XYhryzh+0FZy78zHLC7GwR8VRRrH+LE
 kF/5M8gWqZWZFTRbxp2aC9/8qTQK2vMl+4hR3nDnxLCRVNBkif8hi0NsGRyxk/kylL
 2MJIf/IeWzdyWFmIf9opU/W+7EIpmUx6R32JWhYj2sMoiMquC4QayyDYVol6uDfAbX
 yvWPuFYKcVSgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 16/20] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260923181115.2514193-38-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-38-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:28:34 +0000
Message-Id: <20260923182834.A8C601F00893@smtp.kernel.org>
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
- [Low] goto mixing: goto-based error handling mixed with scoped_guard()
--

commit e14ac202349f1aadb0ba7078894729003942c9fe
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces the necessary callbacks to get the status and control
information for Crescent Island (CRI) PMT usage. It adds xe_pmt_read_reg() =
and
xe_pmt_write_reg() to access the discovery status and control areas, and
registers the CRI PMT functionality.

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a814d7151eeae..0f6e3be520c09 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 o=
ffset)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
> +	int ret =3D 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr +=3D inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		*reg =3D readl(disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}

[Severity: Low]
Does this violate the cleanup API contract by mixing manual goto-based clea=
nup
in xe_pmt_read_reg() with scope-based cleanup via scoped_guard()?

According to the subsystem guidelines in include/linux/cleanup.h, we should
either convert all resources that need a goto cleanup to scope-based cleanu=
p,
or convert none of them. While this specific code path in
drivers/gpu/drm/xe/xe_vsec.c avoids immediate resource leaks because the
scope exits cleanly before the goto labels are reached, this architectural
pattern creates confusing ownership semantics and increases the risk of
double-free or resource leaks during future refactoring.

> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 o=
ffset)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
> +	int ret =3D 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr +=3D inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		writel(reg, disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}

[Severity: Low]
Similarly here in xe_pmt_write_reg(), is it appropriate to mix the goto dev=
_exit
error handling with the scoped_guard() block?

As noted above, mixing these two cleanup styles in the same function is
discouraged to prevent confusing semantics in the execution paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181115.2514=
193-22-michael.j.ruhl@intel.com?part=3D16
