Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1290FC624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9F710E202;
	Fri,  4 Sep 2026 18:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XM8uryA0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D2E10E202
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:51:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B57E406FC;
 Fri,  4 Sep 2026 18:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61301F00A3D;
 Fri,  4 Sep 2026 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788547887;
 bh=dSVqjP5XXd3maIroh0rJQ4uiYgzalGfZDUKUMCPDj9U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XM8uryA0Mj+YQ9aB8mibRem4ef1ssf4YUgts/Pz5Liil3/ecaloPYasHDhSt4cwbj
 iTBI3XRB/Hz2CnnGv7lMr0wJfiFy+47JnwvT6vIG5HKSPot8zQ3RsdNZiqFTx3j12W
 qNYRhSoG441YdJzPsNh83z8vtW8NqAqNs9MbD858wDQfx6IlzTsyjCB2zkkvEjsRMB
 oSSKpSCaYzYQx5MINDMXjXqqUI//8JtPYl78SArWH5yuDFIeIIeDI2sEjauUx7/tsf
 Wi52k9hESmbgxt3paaTUX+V0KLTrZAD7yt86uJNPwbllEukB6rhhVxhDsTVrwVSWSV
 9Q3eP9S2yVCKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/18] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-34-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-34-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:51:26 +0000
Message-Id: <20260904185126.E61301F00A3D@smtp.kernel.org>
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
- [High] Concurrent telemetry reads during PMT crashlog probe corrupt disco=
very header decoding, leading to out-of-bounds physical memory mapping.
--

commit 824cfdedc1e2d27191c139b8a85c1c3075a9999e
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces callback functions (read_reg, write_reg) and initial=
ization
logic to support Crescent Island (CRI) PMT features, specifically for crash=
log
discovery and telemetry via an MMIO region.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 22c4efb021328..7c3f9938701e3 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -396,8 +489,17 @@ void xe_vsec_init(struct xe_device *xe)
>  		if (IS_SRIOV_VF(xe))
>  			return;
>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
> -		info->priv_data =3D &xe_pmt_cb;
> +		info->priv_data =3D &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		if (IS_SRIOV_VF(xe))
> +			return;
> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +		info->priv_data =3D &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);

[Severity: High]
Does this sequence allow concurrent telemetry reads to corrupt the PMT
crashlog probe discovery header?

The remapper index is set once during init here, which seems to assume it w=
ill
remain unchanged during the sequential PMT core probes. However, if userspa=
ce
concurrently reads the telemetry sysfs file, it calls xe_pmt_telem_read()
which modifies the index:

	mutex_lock(&xe->pmt.lock);

	/* set SoC re-mapper index register based on GUID memory region */
	xe->soc_remapper.set_telem_region(xe, mem_region);

	memcpy_fromio(data, telem_addr, count);

	mutex_unlock(&xe->pmt.lock);

Because xe_pmt_telem_read() modifies the shared SoC remapper index but fails
to restore it to CRI_IDX_TELEM_DISCOVERY before unlocking, subsequent
discovery table reads can get permanently corrupted.

If the PMT class driver uses a corrupted discovery header's base_offset
and size to call devm_ioremap_resource(), could this map an uncontrolled
physical address and expose arbitrary physical memory contents to userspace?

> +		break;
> +
>  	default:
>  		break;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D14
