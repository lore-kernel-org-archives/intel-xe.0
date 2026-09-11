Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E8FC79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3593D10EA68;
	Fri, 11 Sep 2026 04:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Keg28zsT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1A010EA68;
 Fri, 11 Sep 2026 04:30:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BA01B40329;
 Fri, 11 Sep 2026 04:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A871F000FF;
 Fri, 11 Sep 2026 04:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789101050;
 bh=dfcBHbuSXwuehQ5PkBF9eL3tBCUCfD+ixqhHWVAe37w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Keg28zsTpRxnkvMJVyzx49BMgw+pRKif4aceRy28ycVBkl+f+mstY52YreP2QH720
 YBYDe9UxMmDZW3dC3J9kb1dmUj8UYyd/gu4iqLCkjChpRxcUaaiKnB04sYspuW3Yv5
 Jr+B8dxQsU0s2qydhhrtKhNt8dLSikTjFVl5oeRkbWT+aVcLdgP/MBSoDSs2iyBGOw
 3SQaSgNSFiqpHd7hhpxYVcTTz7hAvDiYqbo/3AC75qg7dwehGKAd/Mf+bSScROV9Rx
 ALGteSZ+ACP3uKNREo+XZsXin7MXej90VZmpBPljimx2A4lupgFkYboLZpemQRFw6g
 A/U/6l1XUoDDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260911041449.3699400-9-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-9-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 04:30:49 +0000
Message-Id: <20260911043050.65A871F000FF@smtp.kernel.org>
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
- [High] The `bypass_m_n_ratio_limit` flag is not reset to `false` when rec=
omputing M/N parameters, causing it to leak across atomic modesets and perm=
anently disable DRRS and seamless M/N fastsets, while incorrectly programmi=
ng hardware for subsequent modes.
--

commit 1051e6f37ea4e4c3629ed1e93206c237d8286159
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > =
10

This commit implements the bypass logic for the M/N ratio limit for DP on=20
128b/132b links. It calculates the M/N ratio, sets the appropriate flags fo=
r=20
the workaround, and disables DRRS and seamless M/N fastsets when active.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 585762be07bb2..27ffd937c75f2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -3385,10 +3389,21 @@ void intel_dp_check_m_n_ratio(struct intel_crtc_s=
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

[Severity: High]
When returning early here, should we explicitly reset the
bypass_m_n_ratio_limit flag to false?

Because atomic modesets duplicate the CRTC state, if a user previously
applied a high-bandwidth UHBR mode that set bypass_m_n_ratio_limit to true,
changing to a lower-resolution mode would carry this true flag over into the
new state.

Neither intel_link_compute_m_n() nor the early return or fall-through paths
in intel_dp_check_m_n_ratio() seem to clear this flag. Could this state leak
permanently disable DRRS and seamless M/N updates for that connector, and
potentially lead to incorrectly programming the hardware for non-UHBR modes?

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
> =20
>  static void

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911041449.3699=
400-1-suraj.kandpal@intel.com?part=3D8
