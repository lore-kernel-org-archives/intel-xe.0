Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401D4CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 11:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ADA10E784;
	Wed, 15 Oct 2025 11:52:07 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AEC10E784;
 Wed, 15 Oct 2025 11:52:06 +0000 (UTC)
Received: from mobile-access-d98cd5-201.dhcp.inet.fi ([217.140.213.201]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1v9030-00000001ZMJ-28eZ; Wed, 15 Oct 2025 14:52:05 +0300
Message-ID: <397c8f8acedb06b90b9f5c8f210e73ca192c811a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>
Date: Wed, 15 Oct 2025 14:52:00 +0300
In-Reply-To: <20251013095045.3658871-2-mika.kahola@intel.com>
References: <20251013095045.3658871-1-mika.kahola@intel.com>
 <20251013095045.3658871-2-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-4 
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] drm/i915/display: Sanitize
 PHY_C20_VDR_CUSTOM_SERDES_RATE/DP_RATE field macros
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
> Rename the PHY_C20_CUSTOM_SERDES / PHY_C20_CUSTOM_SERDES_MASK register
> field names to PHY_C20_DP_RATE / PHY_C20_DP_RATE_MASK, and move the
> definitions under the actual register containing the fields.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c      | 6 +++---
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index a2d2cecf7121..0d83145eff41 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2700,12 +2700,12 @@ static void intel_c20_pll_program(struct intel_di=
splay *display,
>  	/* 5. For DP or 6. For HDMI */
>  	if (is_dp) {
>  		intel_cx0_rmw(encoder, owned_lane_mask, PHY_C20_VDR_CUSTOM_SERDES_RATE=
,
> -			      BIT(6) | PHY_C20_CUSTOM_SERDES_MASK,
> -			      BIT(6) | PHY_C20_CUSTOM_SERDES(intel_c20_get_dp_rate(port_clock=
)),
> +			      BIT(6) | PHY_C20_DP_RATE_MASK,
> +			      BIT(6) | PHY_C20_DP_RATE(intel_c20_get_dp_rate(port_clock)),
>  			      MB_WRITE_COMMITTED);
>  	} else {
>  		intel_cx0_rmw(encoder, owned_lane_mask, PHY_C20_VDR_CUSTOM_SERDES_RATE=
,
> -			      BIT(7) | PHY_C20_CUSTOM_SERDES_MASK,
> +			      BIT(7) | PHY_C20_DP_RATE_MASK,
>  			      is_hdmi_frl(port_clock) ? BIT(7) : 0,
>  			      MB_WRITE_COMMITTED);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/=
gpu/drm/i915/display/intel_cx0_phy_regs.h
> index 77eae1d845f7..25ab8808e548 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> @@ -298,10 +298,10 @@
>  #define PHY_C20_RD_DATA_L		0xC08
>  #define PHY_C20_RD_DATA_H		0xC09
>  #define PHY_C20_VDR_CUSTOM_SERDES_RATE	0xD00
> +#define   PHY_C20_DP_RATE_MASK		REG_GENMASK8(4, 1)
> +#define   PHY_C20_DP_RATE(val)		REG_FIELD_PREP8(PHY_C20_DP_RATE_MASK, va=
l)
>  #define PHY_C20_VDR_HDMI_RATE		0xD01
>  #define   PHY_C20_CONTEXT_TOGGLE	REG_BIT8(0)
> -#define   PHY_C20_CUSTOM_SERDES_MASK	REG_GENMASK8(4, 1)
> -#define   PHY_C20_CUSTOM_SERDES(val)	REG_FIELD_PREP8(PHY_C20_CUSTOM_SERD=
ES_MASK, val)
>  #define PHY_C20_VDR_CUSTOM_WIDTH	0xD02
>  #define   PHY_C20_CUSTOM_WIDTH_MASK	REG_GENMASK(1, 0)
>  #define   PHY_C20_CUSTOM_WIDTH(val)	REG_FIELD_PREP8(PHY_C20_CUSTOM_WIDTH=
_MASK, val)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
