Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF03E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 16:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE66410E2FD;
	Mon, 16 Dec 2024 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTLOoCKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDD210E2FD
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734365115; x=1765901115;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=vZKYFN/5tGD72LC5theaKNQZJpQXeOacQHzVv/72Uf0=;
 b=KTLOoCKKv7VL5Dok0xGmDVkbFbu97hIw6ESvZgDOQdYNpsePWXeCWJX4
 5dbbIVf24EB3f+fj8ayyUftD1INR+c4ECmPjBAZZAQbNqTwSFVm8psF/5
 sNGoQIe3SF/2Tnrm0uM5i8b3/fFisD9ZotKHu/Xd4dhzwZBaHfKREAOA+
 kdMPAHiCaImoED8pJbK5IL+0ktVS/V5sC+SMCacVhmnXAagK1hnhXT2hK
 /+V7hg/fMUlPny+W6sVIiew+30j/a2OdafBWaL0LRiBP7bgl1zAQMSFiF
 s21vqfiSZs88JJEvvBv5MfI2gTjtYVB40s8XUrqJBFm8FJy1Z/wns93FR Q==;
X-CSE-ConnectionGUID: VsKt8J9sRZGDz/3XNpGCSg==
X-CSE-MsgGUID: aYeT80NBTqWdUxd0niSsXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45242535"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45242535"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 08:05:14 -0800
X-CSE-ConnectionGUID: sI1O93nHRTiftjkPiYm4OQ==
X-CSE-MsgGUID: JdY1X92bTkajJx1a1cT2DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102231915"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 08:05:13 -0800
Date: Mon, 16 Dec 2024 18:05:55 +0200
From: Imre Deak <imre.deak@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: UHBR rates for Thunderbolt
Message-ID: <Z2BP451PxJngjYbg@ideak-desk.fi.intel.com>
References: <20241216124422.475693-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216124422.475693-1-mika.kahola@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2024 at 02:44:22PM +0200, Mika Kahola wrote:
> tbt-alt mode is missing uhbr rates 10G and 20G. This requires
> requires pll clock rates 312.5 MHz and 625 MHz to be added,
> respectively. The uhbr rates are supported only form PTL+
> platforms.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

I presume all display related changes should be sent to the intel-gfx ML
as well for review, even though the change only affects platforms
supported by xe only.

> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 27 ++++++++++++++++---
>  .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  4 +++
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index cc734079c3b8..e0bd47e684c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -3070,7 +3070,10 @@ int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder)
>  
>  	val = intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port));
>  
> -	clock = REG_FIELD_GET(XELPDP_DDI_CLOCK_SELECT_MASK, val);
> +	if (DISPLAY_VER(display) >= 30)
> +		clock = REG_FIELD_GET(XE3LPDP_DDI_CLOCK_SELECT_MASK, val);
> +	else
> +		clock = REG_FIELD_GET(XELPDP_DDI_CLOCK_SELECT_MASK, val);
>  
>  	drm_WARN_ON(display->drm, !(val & XELPDP_FORWARD_CLOCK_UNGATE));
>  	drm_WARN_ON(display->drm, !(val & XELPDP_TBT_CLOCK_REQUEST));
> @@ -3085,6 +3088,10 @@ int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder)
>  		return 540000;
>  	case XELPDP_DDI_CLOCK_SELECT_TBT_810:
>  		return 810000;
> +	case XELPDP_DDI_CLOCK_SELECT_TBT_312_5:
> +		return 1000000;
> +	case XELPDP_DDI_CLOCK_SELECT_TBT_625:
> +		return 2000000;
>  	default:
>  		MISSING_CASE(clock);
>  		return 162000;
> @@ -3102,6 +3109,10 @@ static int intel_mtl_tbt_clock_select(int clock)
>  		return XELPDP_DDI_CLOCK_SELECT_TBT_540;
>  	case 810000:
>  		return XELPDP_DDI_CLOCK_SELECT_TBT_810;
> +	case 1000000:

On platforms not supporting this rate and the one below, the returned
value should be still valid, so something like if WARN(DISPLAY_VER < 30)
return XELPDP_DDI_CLOCK_SELECT_TBT_162;

> +		return XELPDP_DDI_CLOCK_SELECT_TBT_312_5;
> +	case 2000000:
> +		return XELPDP_DDI_CLOCK_SELECT_TBT_625;
>  	default:
>  		MISSING_CASE(clock);
>  		return XELPDP_DDI_CLOCK_SELECT_TBT_162;
> @@ -3114,15 +3125,25 @@ static void intel_mtl_tbt_pll_enable(struct intel_encoder *encoder,
>  	struct intel_display *display = to_intel_display(encoder);
>  	enum phy phy = intel_encoder_to_phy(encoder);
>  	u32 val = 0;
> +	u32 mask;
>  
>  	/*
>  	 * 1. Program PORT_CLOCK_CTL REGISTER to configure
>  	 * clock muxes, gating and SSC
>  	 */
> -	val |= XELPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
> +
> +	if (DISPLAY_VER(display) >= 30) {
> +		mask = XE3LPDP_DDI_CLOCK_SELECT_MASK;
> +		val |= XE3LPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
> +	} else {
> +		mask = XELPDP_DDI_CLOCK_SELECT_MASK;
> +		val |= XELPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
> +	}
> +

To handle the mask for both fields the same way:
	mask |= XELPDP_FORWARD_CLOCK_UNGATE;

>  	val |= XELPDP_FORWARD_CLOCK_UNGATE;
> +
>  	intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port),
> -		     XELPDP_DDI_CLOCK_SELECT_MASK | XELPDP_FORWARD_CLOCK_UNGATE, val);
> +		     mask | XELPDP_FORWARD_CLOCK_UNGATE, val);

passing just mask here to intel_de_rmw().

>  
>  	/* 2. Read back PORT_CLOCK_CTL REGISTER */
>  	val = intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port));
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> index c685479c9756..9870d61ca493 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> @@ -187,7 +187,9 @@
>  #define   XELPDP_TBT_CLOCK_REQUEST			REG_BIT(19)
>  #define   XELPDP_TBT_CLOCK_ACK				REG_BIT(18)
>  #define   XELPDP_DDI_CLOCK_SELECT_MASK			REG_GENMASK(15, 12)
> +#define   XE3LPDP_DDI_CLOCK_SELECT_MASK			REG_GENMASK(16, 12)

Not sure about the XE3 terms, but the driver atm only uses the XE3LPD
and XE3 prefixes. I see the XE3_D and XE3P_D tags in the spec used for
the above field width. Which platform does X3LPDP correspond to?

>  #define   XELPDP_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XELPDP_DDI_CLOCK_SELECT_MASK, val)
> +#define   XE3LPDP_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XE3LPDP_DDI_CLOCK_SELECT_MASK, val)
>  #define   XELPDP_DDI_CLOCK_SELECT_NONE			0x0
>  #define   XELPDP_DDI_CLOCK_SELECT_MAXPCLK		0x8
>  #define   XELPDP_DDI_CLOCK_SELECT_DIV18CLK		0x9
> @@ -195,6 +197,8 @@
>  #define   XELPDP_DDI_CLOCK_SELECT_TBT_270		0xd
>  #define   XELPDP_DDI_CLOCK_SELECT_TBT_540		0xe
>  #define   XELPDP_DDI_CLOCK_SELECT_TBT_810		0xf
> +#define   XELPDP_DDI_CLOCK_SELECT_TBT_312_5		0x18
> +#define   XELPDP_DDI_CLOCK_SELECT_TBT_625		0x19
>  #define   XELPDP_FORWARD_CLOCK_UNGATE			REG_BIT(10)
>  #define   XELPDP_LANE1_PHY_CLOCK_SELECT			REG_BIT(8)
>  #define   XELPDP_SSC_ENABLE_PLLA			REG_BIT(1)
> -- 
> 2.43.0
> 
