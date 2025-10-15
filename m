Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177FCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 11:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0310E795;
	Wed, 15 Oct 2025 11:52:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E23B10E789;
 Wed, 15 Oct 2025 11:52:55 +0000 (UTC)
Received: from mobile-access-d98cd5-201.dhcp.inet.fi ([217.140.213.201]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1v903p-00000001ZMn-1lH7; Wed, 15 Oct 2025 14:52:54 +0300
Message-ID: <2d32c9add8a31b3a302169b685f795b443558e64.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>
Date: Wed, 15 Oct 2025 14:52:52 +0300
In-Reply-To: <20251013095045.3658871-3-mika.kahola@intel.com>
References: <20251013095045.3658871-1-mika.kahola@intel.com>
 <20251013095045.3658871-3-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-4 
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] drm/i915/display: Sanitize
 PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_DP flag macro
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 2025-10-13 at 12:50 +0300, Mika Kahola wrote:
> From: Imre Deak <imre.deak@intel.com>
>=20
> Define PHY_C20_IS_DP, so it can be used instead of the plain bit number.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c      | 4 ++--
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index 0d83145eff41..9492661f1645 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2700,8 +2700,8 @@ static void intel_c20_pll_program(struct intel_disp=
lay *display,
>  	/* 5. For DP or 6. For HDMI */
>  	if (is_dp) {
>  		intel_cx0_rmw(encoder, owned_lane_mask, PHY_C20_VDR_CUSTOM_SERDES_RATE=
,
> -			      BIT(6) | PHY_C20_DP_RATE_MASK,
> -			      BIT(6) | PHY_C20_DP_RATE(intel_c20_get_dp_rate(port_clock)),
> +			      PHY_C20_IS_DP | PHY_C20_DP_RATE_MASK,
> +			      PHY_C20_IS_DP | PHY_C20_DP_RATE(intel_c20_get_dp_rate(port_cloc=
k)),
>  			      MB_WRITE_COMMITTED);
>  	} else {
>  		intel_cx0_rmw(encoder, owned_lane_mask, PHY_C20_VDR_CUSTOM_SERDES_RATE=
,
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/=
gpu/drm/i915/display/intel_cx0_phy_regs.h
> index 25ab8808e548..ad2f7fb3beae 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> @@ -298,6 +298,7 @@
>  #define PHY_C20_RD_DATA_L		0xC08
>  #define PHY_C20_RD_DATA_H		0xC09
>  #define PHY_C20_VDR_CUSTOM_SERDES_RATE	0xD00
> +#define   PHY_C20_IS_DP			REG_BIT8(6)
>  #define   PHY_C20_DP_RATE_MASK		REG_GENMASK8(4, 1)
>  #define   PHY_C20_DP_RATE(val)		REG_FIELD_PREP8(PHY_C20_DP_RATE_MASK, va=
l)
>  #define PHY_C20_VDR_HDMI_RATE		0xD01

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
