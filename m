Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23701CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 11:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D5210E790;
	Wed, 15 Oct 2025 11:57:40 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8ED10E78A;
 Wed, 15 Oct 2025 11:57:39 +0000 (UTC)
Received: from mobile-access-d98cd5-201.dhcp.inet.fi ([217.140.213.201]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1v908O-00000001ZNW-2kgW; Wed, 15 Oct 2025 14:57:37 +0300
Message-ID: <5b61408318fdc5849bbddbcfe190dcd596210a1a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Wed, 15 Oct 2025 14:57:35 +0300
In-Reply-To: <20251013095045.3658871-4-mika.kahola@intel.com>
References: <20251013095045.3658871-1-mika.kahola@intel.com>
 <20251013095045.3658871-4-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-4 
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] drm/i915/display: Sanitize
 PHY_C20_VDR_CUSTOM_SERDES_RATE/CONTEXT_TOGGLE flag macro
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
> Move the PHY_C20_CONTEXT_TOGGLE flag's definition under the register cont=
aining
> the flag and refer to the flag always by its name instead of a plain bit =
number.
>=20
> v2: Amend commit log to match what the patch does. (Jani)
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c      | 6 ++++--
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index 9492661f1645..a7aee098e7b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2628,7 +2628,8 @@ static void intel_c20_pll_program(struct intel_disp=
lay *display,
>  	int i;
> =20
>  	/* 1. Read current context selection */
> -	cntx =3D intel_cx0_read(encoder, INTEL_CX0_LANE0, PHY_C20_VDR_CUSTOM_SE=
RDES_RATE) & BIT(0);
> +	cntx =3D intel_cx0_read(encoder, INTEL_CX0_LANE0, PHY_C20_VDR_CUSTOM_SE=
RDES_RATE) &
> +		PHY_C20_CONTEXT_TOGGLE;
> =20
>  	/*
>  	 * 2. If there is a protocol switch from HDMI to DP or vice versa, clea=
r
> @@ -2719,7 +2720,8 @@ static void intel_c20_pll_program(struct intel_disp=
lay *display,
>  	 * the updated programming toggle context bit
>  	 */
>  	intel_cx0_rmw(encoder, owned_lane_mask, PHY_C20_VDR_CUSTOM_SERDES_RATE,
> -		      BIT(0), cntx ? 0 : 1, MB_WRITE_COMMITTED);
> +		      PHY_C20_CONTEXT_TOGGLE, cntx ? 0 : PHY_C20_CONTEXT_TOGGLE,
> +		      MB_WRITE_COMMITTED);
>  }
> =20
>  static int intel_c10pll_calc_port_clock(struct intel_encoder *encoder,
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/=
gpu/drm/i915/display/intel_cx0_phy_regs.h
> index ad2f7fb3beae..5bd1e02b5313 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> @@ -301,8 +301,8 @@
>  #define   PHY_C20_IS_DP			REG_BIT8(6)
>  #define   PHY_C20_DP_RATE_MASK		REG_GENMASK8(4, 1)
>  #define   PHY_C20_DP_RATE(val)		REG_FIELD_PREP8(PHY_C20_DP_RATE_MASK, va=
l)
> -#define PHY_C20_VDR_HDMI_RATE		0xD01
>  #define   PHY_C20_CONTEXT_TOGGLE	REG_BIT8(0)
> +#define PHY_C20_VDR_HDMI_RATE		0xD01
>  #define PHY_C20_VDR_CUSTOM_WIDTH	0xD02
>  #define   PHY_C20_CUSTOM_WIDTH_MASK	REG_GENMASK(1, 0)
>  #define   PHY_C20_CUSTOM_WIDTH(val)	REG_FIELD_PREP8(PHY_C20_CUSTOM_WIDTH=
_MASK, val)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
