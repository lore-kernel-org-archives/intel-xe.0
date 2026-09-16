Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AADC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A3010E8F0;
	Wed, 16 Sep 2026 09:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jrmAEgWz";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005D510EA7A;
 Wed, 16 Sep 2026 09:27:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D53EA4384D;
 Wed, 16 Sep 2026 09:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0D61F000FF;
 Wed, 16 Sep 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789550858;
 bh=FbRH0jF3lL1uNTaNP0l6MIaTeKeckLqJuNDspqZkDnM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jrmAEgWzIprR8GmO0H8HKdy3tMWXvWD528fDx3qQy6YV0ZKu2QbP274P+hK+uwPE6
 Tfrb8nppyILeFUY4Y5D10r0y+6ADDQzqqv6uP3A/tluozHhvtDCxTbEebSRYcJRwjH
 fRQSBe5Iq4eHA76GL2nUEjV5mkvgtgnRKnP/sHB2x+yTPoYn8bzU/4guNkiwF+3Yzf
 UZGXFfdUfvxeXgIq2NMFujDU/eyqGSRhkromrto0bHLtIgLVaKpCXwcUKBLXP/qC2r
 ztLTMm0pIEOuW/QcfF+LbXGOF22y8bhe/JNfZO1yV5JLyRKDd+cv9Hzjq8TDmB+Tyf
 HlixBrMu7fpOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260916090946.677564-9-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
 <20260916090946.677564-9-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:27:37 +0000
Message-Id: <20260916092738.7E0D61F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/dp: state leak of bypass_m_n_ratio_limit disables DRRS
--

commit 0e4fb34450fd70c4ab5e5e995c5d7cab890c8cac
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > =
10

Handle the bypass logic for the M/N ratio limit for DP. Calculate the
M/N ratio, check if it can bypass the limit, and set the appropriate
flags for the workaround to restrict DRRS and seamless M/N fastsets.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 8de51582d18c8..3911942de8e53 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -3405,10 +3409,21 @@ void intel_dp_check_m_n_ratio(struct intel_crtc_s=
tate *crtc_state,
> =20
>  	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> =20
> -	if (m_n_ratio > max_m_n_ratio)
> -		drm_WARN(display->drm, 1,
> -			 "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> -			 m_n_ratio, max_m_n_ratio);
> +	if (m_n_ratio <=3D max_m_n_ratio)
> +		return;

[Severity: Medium]
If a previous iteration or modeset evaluated an M/N ratio > 10 and set the
bypass_m_n_ratio_limit flag to true, does returning early here leave the fl=
ag
incorrectly set?

For example, when this function is called during the MST BPP fallback loop:

drivers/gpu/drm/i915/display/intel_dp_mst.c:intel_dp_mtp_tu_compute_config(=
) {
    ...
		intel_dp_mst_compute_m_n(crtc_state,
					 local_bw_overhead,
					 link_bpp_x16,
					 &crtc_state->dp_m_n);

		intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
    ...
}

The crtc_state->dp_m_n struct is reused across fallback iterations. If a
rejected high-ratio configuration sets bypass_m_n_ratio_limit to true, it
appears a subsequent accepted lower-ratio configuration will return early
without clearing it. This would permanently disable DRRS for the CRTC.
Should we set m_n->bypass_m_n_ratio_limit =3D false before returning?

> +
> +	if (intel_dp_is_uhbr(crtc_state) &&
> +	    intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc->pipe))=
 {
> +		m_n->bypass_m_n_ratio_limit =3D true;
> +		drm_dbg_kms(display->drm,
> +			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
> +			    m_n_ratio);
> +		return;
> +	}
> +
> +	drm_WARN(display->drm, 1,
> +		 "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> +		 m_n_ratio, max_m_n_ratio);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916090946.6775=
64-1-suraj.kandpal@intel.com?part=3D8
