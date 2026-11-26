Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F5606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrgNA8h9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845E310EA6D;
	Thu, 26 Nov 2026 19:42:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F410EA63;
 Thu, 26 Nov 2026 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795722115; x=1827258115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hK70FI4nF2jVTE9WWOwT95ZiuUunk2CGAALLdr/7oFg=;
 b=MrgNA8h9K7pFZmE6kH6m7dEPhLnhF/LIdNEfxWSvjDU0p8lgKHLWcCe5
 GJLW624M+z01JNhtwS6MyIFskZhRfkKYP8F/cGHnC1u8rX3p1UpTLGpwb
 uV8n9AncEAOEZyL9qpZc86/SIGjc6XgM0d/kjrugNAGdLXLMSM8L3JoVL
 IeOnIaKz2yPGNHmH6WLvgVcPNlLS78gIpiYLjOd8wMEz1c+JTiYVv1N/B
 29oFEwCnfssZMDo6s1wwV0KtS+eVnruf7orkyXGRdXFUSXdwrRww4H80q
 hEXLF+UP4IfA96Wbx6ifYNq3+BiotFniJSB3DsHNIjrvmThS/ABfweFIO g==;
X-CSE-ConnectionGUID: 1iX1eH2BQY2I7e5IAAJX5g==
X-CSE-MsgGUID: VnDpGAxLTB2MtLTONIb3/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4726583"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4726583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 11:41:54 -0800
X-CSE-ConnectionGUID: 3T+0UbTHSw6uUeTgZxja/A==
X-CSE-MsgGUID: hCNDnGzJRAiLQxQcz/wiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12270149"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 11:41:53 -0800
Date: Thu, 26 Nov 2026 21:41:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: Re: [PATCH] drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK
Message-ID: <awiLffAoM4GsVxUw@intel.com>
References: <20261126191032.1961148-1-uma.shankar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126191032.1961148-1-uma.shankar@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 12:40:32AM +0530, Uma Shankar wrote:
> The horizontal scaler filter works at 2 PPC, but still needs a full
> clock for a fractional shift of just one pixel. It doesn't shift by
> two pixels and re-align the taps, so the extra clock doesn't average
> out.
> 
> Bspec now documents the downscale amount used for the min CDCLK
> calculation as:
> 
>   hscale_ppc = int(hscale) + min(1, ppc * frac(hscale))
>   downscale  = max(hscale_ppc, hscale * vscale)
> 
> Compared to the empirical formula we have now, the fractional penalty
> is capped at one extra clock, and since the scaler filters vertically
> first the penalty does not multiply with the vertical downscale factor.
> Update the code to match.
> 
> Platforms without 2 PPC (ppc == 1) are unaffected as the formula then
> reduces to hscale * vscale.
> 
> Bspec: 68858
> Fixes: f69946f6d891 ("drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating min CDCLK")
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Looks good.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_plane.c | 42 ++++++++++++++--------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index d23de0f34e4b..4a430d6a0ba9 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -266,25 +266,28 @@ unsigned int intel_adjusted_rate(const struct drm_rect *src,
>  }
>  
>  static unsigned int hscale_cdclk(const struct drm_rect *src,
> -				 const struct drm_rect *dst,
> -				 unsigned int ppc)
> +				 const struct drm_rect *dst)
>  {
>  	unsigned int hscale;
>  
>  	hscale = drm_rect_calc_hscale(src, dst, 0, INT_MAX);
>  	hscale = max(hscale, 0x10000);
>  
> -	/*
> -	 * Double the fractional part due to some 2 PPC granularity issue
> -	 *
> -	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
> -	 * and rounding it down to a unit fraction. In practice that is
> -	 * not sufficient, and we need a more aggressive CDCLK bump in
> -	 * many cases. The updated formula was derived empirically.
> -	 * This may need to be updated once we have better undestading
> -	 * of what's happening in the hardware...
> -	 */
> -	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
> +	return hscale;
> +}
> +
> +/*
> + * Bspec: 68858
> + *
> + * The horizontal filter works at 2 PPC but still needs a full clock
> + * for a fractional shift of just 1 pixel, so the fractional part of
> + * the horizontal downscale factor costs PPC times more, but at most
> + * one full extra clock.
> + */
> +static unsigned int hscale_ppc_cdclk(unsigned int hscale,
> +				     unsigned int ppc)
> +{
> +	return (hscale & ~0xffff) + min(ppc * (hscale & 0xffff), 0x10000);
>  }
>  
>  static unsigned int vscale_cdclk(const struct drm_rect *src,
> @@ -303,10 +306,19 @@ unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
>  				       unsigned int rate,
>  				       unsigned int ppc)
>  {
> -	unsigned int hscale = hscale_cdclk(src, dst, ppc);
> +	unsigned int hscale = hscale_cdclk(src, dst);
>  	unsigned int vscale = vscale_cdclk(src, dst);
> +	u64 scale;
> +
> +	/*
> +	 * The scaler filters vertically first, so the horizontal
> +	 * PPC inefficiency doesn't multiply with the vertical
> +	 * downscale factor. .32 fixed point.
> +	 */
> +	scale = max((u64)hscale_ppc_cdclk(hscale, ppc) << 16,
> +		    mul_u32_u32(hscale, vscale));
>  
> -	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
> +	return DIV64_U64_ROUND_UP(rate * scale, 1ull << 32);
>  }
>  
>  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
