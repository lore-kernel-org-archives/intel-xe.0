Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77040CD4F57
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 11:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E9610E5E6;
	Tue, 19 May 2026 11:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUu6H7oo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E2610E5E6;
 Tue, 19 May 2026 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779191422; x=1810727422;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bQ4DH/nbn8zRDgQscMKFnw+OhUSe6BBsqoGmaaq4xWk=;
 b=PUu6H7oowvl/8BC0ksqMpq/cwDJ6RVentjKJ9zYi97qeSFhdt+YC5pUa
 VSW90Kolpjq7Dxh68zcQFG+Phan3HCBnUB8OQ9r1101263V3mxNG1xgsW
 ALAZmtCeQcXAd8byL5dbqgnegjBuBKuRrGt0J1Y07hJ/Dk+I4ELS9CjJt
 CjsmjHm7FiGpQysoCpGkEihE6ujG2bXJY7O/V23ZN12eyjAWb5BnqlX2U
 PLWkug3l6bZn2lkxoBxmjQS3QwggpycSrPEzvJyX/lbS8OcE82VNVmLsn
 Y2lRjlG35M/MTKu8ZGOVQgKl90uBPABlkzMOb/VrbtUn72JObF1QW/GCx Q==;
X-CSE-ConnectionGUID: Ugudp/QlSLegMJ5k4UIWCw==
X-CSE-MsgGUID: tTY0GUVlQnacIe4Aefz4/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80096899"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80096899"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:50:21 -0700
X-CSE-ConnectionGUID: XW0TP70ARf6Ij8KKFzKxFA==
X-CSE-MsgGUID: WaAq91OeTHub8/s9NShWMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="241586183"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:50:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/i915/display: harden shifts in
 ICL_DPCLKA_CFGCR0_DDI_CLK_SEL macros
In-Reply-To: <20260519112243.1454375-3-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
 <20260519112243.1454375-3-luciano.coelho@intel.com>
Date: Tue, 19 May 2026 14:50:17 +0300
Message-ID: <ddb9dc51c32a0f681825a42e84f7a671715825d6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 19 May 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
> PHY_A..PHY_D only.  Any other phy value (PHY_NONE, Type-C/SNPS PHYs)
> is not valid here.
>
> This is not a problem with the current implementation, because phy is
> always valid when these macros are called, but it's more robust to
> cast to unsigned so the shift is always well-defined.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 4321f8b529da..bc90a21e8b46 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -2869,9 +2869,16 @@ enum skl_power_gate {
>  #define  ICL_DPCLKA_CFGCR0_TC_CLK_OFF(tc_port)	(1 << ((tc_port) < TC_PORT_4 ? \
>  						       (tc_port) + 12 : \
>  						       (tc_port) - TC_PORT_4 + 21))
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	((phy) * 2)
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +/*
> + * ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
> + * PHY_A..PHY_D only.  Any other phy value (PHY_NONE, TypeC/SNPS PHYs)
> + * is not valid here.  Cast to unsigned so the shift is always
> + * well-defined.
> + */
> +#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	((unsigned int)(phy) * 2)
> +#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	((u32)3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((u32)(pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +

Here too, please avoid direct casts; we have the REG_* helpers exactly
for this purpose.

BR,
Jani.

>  #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy, 0, 2, 4, 27)
>  #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
>  	(3 << RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-- 
Jani Nikula, Intel
