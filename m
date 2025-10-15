Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C5CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 12:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B910E7A3;
	Wed, 15 Oct 2025 12:20:39 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8310E7A0;
 Wed, 15 Oct 2025 12:20:38 +0000 (UTC)
Received: from mobile-access-d98cd5-201.dhcp.inet.fi ([217.140.213.201]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1v90Ue-00000001ZQM-07ID; Wed, 15 Oct 2025 15:20:36 +0300
Message-ID: <a5dec0fb27c6e69104b0ae1014ae21ae54b34c6c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>
Date: Wed, 15 Oct 2025 15:20:35 +0300
In-Reply-To: <20251013095045.3658871-7-mika.kahola@intel.com>
References: <20251013095045.3658871-1-mika.kahola@intel.com>
 <20251013095045.3658871-7-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-4 
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] drm/i915/display: Fix PHY_C20_VDR_HDMI_RATE
 programming
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
> The PHY_C20_VDR_HDMI_RATE registers 7:2 bits are reserved and they are
> not specified as a must-be-zero field. Accordingly this reserved field
> shouldn't be zeroed; to ensure that use an RMW to update the
> PHY_C20_HDMI_RATE field (which is bits 1:0 of the register).
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c      | 7 ++++---
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 2 ++
>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index 6e49659d2f17..f8c1338f9053 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2714,9 +2714,10 @@ static void intel_c20_pll_program(struct intel_dis=
play *display,
>  		      MB_WRITE_COMMITTED);
> =20
>  	if (!is_dp)
> -		intel_cx0_write(encoder, INTEL_CX0_BOTH_LANES, PHY_C20_VDR_HDMI_RATE,
> -				intel_c20_get_hdmi_rate(port_clock),
> -				MB_WRITE_COMMITTED);
> +		intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C20_VDR_HDMI_RATE,
> +			      PHY_C20_HDMI_RATE_MASK,
> +			      intel_c20_get_hdmi_rate(port_clock),
> +			      MB_WRITE_COMMITTED);
> =20
>  	/*
>  	 * 7. Write Vendor specific registers to toggle context setting to load
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/=
gpu/drm/i915/display/intel_cx0_phy_regs.h
> index 0743a3e2d15f..86e2e1c7babf 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> @@ -304,6 +304,8 @@
>  #define   PHY_C20_DP_RATE(val)		REG_FIELD_PREP8(PHY_C20_DP_RATE_MASK, va=
l)
>  #define   PHY_C20_CONTEXT_TOGGLE	REG_BIT8(0)
>  #define PHY_C20_VDR_HDMI_RATE		0xD01
> +#define   PHY_C20_HDMI_RATE_MASK	REG_GENMASK8(1, 0)
> +#define   PHY_C20_HDMI_RATE(val)	REG_FIELD_PREP8(PHY_C20_HDMI_RATE_MASK,=
 val)
>  #define PHY_C20_VDR_CUSTOM_WIDTH	0xD02
>  #define   PHY_C20_CUSTOM_WIDTH_MASK	REG_GENMASK(1, 0)
>  #define   PHY_C20_CUSTOM_WIDTH(val)	REG_FIELD_PREP8(PHY_C20_CUSTOM_WIDTH=
_MASK, val)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
