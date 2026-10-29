Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF5606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA7y5V67
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AB1112247;
	Thu, 29 Oct 2026 11:38:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E7D112247;
 Thu, 29 Oct 2026 11:38:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ED858600D1;
 Thu, 29 Oct 2026 11:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723251F01825;
 Thu, 29 Oct 2026 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793273897;
 bh=D3PO0pWvumJwB9qBUZF1Ylxy3QH43UziZMXtXf2d89A=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NA7y5V67h8TV0URcu3nDV0QAsXKqqKTQNbkstpYxTCyg5X26/8aSA94OBJ4xCZFPD
 +y/9Emjr+rBM261eWHg30nP18g+nB5LG1KddayHut5PYIAw9axQzbvUeJXySwOWTc3
 Wg8r+Iv1qvY/q6Sl0ndd6CMTICKea0yqaSDDkLsoeelNQ5iPrheO5nIu7v8vaVQKz2
 FDcAG9Thg40rMeoPKfqnGliNgQSeV7KhmT1sK03r011YLC+MxuFOsuTMYvKFQq3yk4
 HaorJ41rhW+0175mKsA2snzycr8WgKyByshmlCQfqP81mcgKGqZAyqmXKp7FRWa4oA
 ImtVsYwEsNfFQ==
Message-ID: <sashiko-outbox-189201@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] drm/i915/mtl+: Use PHY type to identify TypeC ports
 in PLL ID lookup
To: "Imre Deak" <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261029113017.618286-6-imre.deak@intel.com>
References: <20261029113017.618286-1-imre.deak@intel.com>
 <20261029113017.618286-6-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 11:38:16 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/dpll: broken PLL ID lookup for PORT_TC1..4 on BMG in mtl_=
port_to_pll_id()
--

commit cf78fabe6f011d3447934883b6ff2b74f3d46e5f
Author: Imre Deak <imre.deak@intel.com>

drm/i915/mtl+: Use PHY type to identify TypeC ports in PLL ID lookup

This commit replaces the port >=3D PORT_TC1 check in mtl_port_to_pll_id() w=
ith
an intel_phy_is_tc() check so that port B can take the TypeC path when its
PHY type is set to TypeC on PTL+ platforms.

> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/=
drm/i915/display/intel_dpll_mgr.c
> index bfd6f0a197253..563db12cf2ef3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -207,7 +207,7 @@ enum intel_dpll_id icl_tc_port_to_pll_id(enum tc_port=
 tc_port)
> =20
>  enum intel_dpll_id mtl_port_to_pll_id(struct intel_display *display, enu=
m port port)
>  {
> -	if (port >=3D PORT_TC1)
> +	if (intel_phy_is_tc(display, intel_port_to_phy(display, port)))
>  		return icl_tc_port_to_pll_id(intel_port_to_tc(display, port));

[Severity: High]
Does this break PLL ID lookup for PORT_TC1..PORT_TC4 on Battlemage?

On Battlemage (bmg_desc with PLATFORM_GROUP(dgfx) and xe2_hpd_display),
display->platform.dgfx is true and port_mask includes PORT_A and
PORT_TC1..PORT_TC4, while DISPLAY_VER(display) >=3D 14 selects mtl_pll_mgr =
in
intel_dpll_init().

Because BMG's PORT_TC1..PORT_TC4 DDI ports are not connected to a TypeC PHY
(as noted in the comment above intel_port_to_tc()), intel_phy_is_tc()
unconditionally returns false on dgfx:

drivers/gpu/drm/i915/display/intel_display.c:intel_phy_is_tc() {
	if (display->platform.dgfx)
		return false;
    ...
}

With port >=3D PORT_TC1 replaced by intel_phy_is_tc(), calling
mtl_port_to_pll_id() for PORT_TC1..PORT_TC4 on BMG falls through into the
switch statement:

drivers/gpu/drm/i915/display/intel_dpll_mgr.c:mtl_port_to_pll_id() {
	if (intel_phy_is_tc(display, intel_port_to_phy(display, port)))
		return icl_tc_port_to_pll_id(intel_port_to_tc(display, port));

	switch (port) {
	case PORT_A:
		return DPLL_ID_ICL_DPLL0;
	case PORT_B:
		return DPLL_ID_ICL_DPLL1;
	default:
		MISSING_CASE(port);
		return DPLL_ID_ICL_DPLL0;
	}
}

Wouldn't this trigger MISSING_CASE(port) and return DPLL_ID_ICL_DPLL0 inste=
ad
of DPLL_ID_ICL_MGPLL1..DPLL_ID_ICL_MGPLL4 during hardware state readout
(mtl_pll_get_hw_state(), mtl_ddi_non_tc_phy_get_config()) and modesets
(mtl_get_dplls() -> mtl_get_non_tc_phy_dpll(), get_intel_encoder() in
mtl_pll_enable(), mtl_pll_disable(), and mtl_pll_get_freq())?

Should the condition check both intel_phy_is_tc() and port >=3D PORT_TC1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029113017.6182=
86-1-imre.deak@intel.com?part=3D5
