Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E95CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 09:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1A91130A7;
	Mon,  1 Jun 2026 09:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld+e7cvl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493FF1130A6;
 Mon,  1 Jun 2026 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780306716; x=1811842716;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BpLlWE2ToXNXFgandlJiK9pco886DxVDNo1cIHZWFw0=;
 b=ld+e7cvl+dIzrsGg7atRd7TWkgWlRDkJ0J3d6THrUAQpx289sVLktv56
 c1ckt6tZAs3iynYX4/ctydxY1em7d+hvinp+pQ73z2bcMsbqdEj7FeUrc
 y/x6KQ0bkh40T/vOT1lNBo9hLud+V9zEjQutHBK+K/tYNVTKSL/DTzjsW
 m6FxzzdlLKZszRkgD9bw1Vhz8WNWMapdNy1CBznBMs6aKJJld9bm/NYf1
 wCO0/f52APFlNA+D7jkCtrHzV+8qc15zao1mhvK4l4tJk50tcRfFJnUlI
 rcmgykzFv7zNioWdSNfQhUzlRAhblVFttzJgAQ8Zv3J+esBmwPKAI1BAv w==;
X-CSE-ConnectionGUID: Mnb23s3KSKyd1Ugtxm18Rw==
X-CSE-MsgGUID: RqEMeSZFSFGmsk4UhoVEaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80093982"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80093982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 02:38:36 -0700
X-CSE-ConnectionGUID: kb/eS8WcTIOzbKNCHDNj0w==
X-CSE-MsgGUID: 6gYFqr55TK+tWDIYT1LPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="243641152"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:38:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v2] drm/i915/display: Mask RO bits in gen9_write_dc_state()
In-Reply-To: <20260601090131.1840805-1-dibin.moolakadan.subrahmanian@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260506130321.487414-1-dibin.moolakadan.subrahmanian@intel.com>
 <20260601090131.1840805-1-dibin.moolakadan.subrahmanian@intel.com>
Date: Mon, 01 Jun 2026 12:38:31 +0300
Message-ID: <4e28616f97067f232226a0fab8c2039cb124b2b8@intel.com>
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

On Mon, 01 Jun 2026, Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com> wrote:
> The DC_STATE_EN register has read-only status bits that are set by
> hardware on some platforms. These bits may cause the read-back
> verification loop in gen9_write_dc_state() to spuriously retry.
>
> Mask the RO bits from both the write value and the read-back comparison
> to prevent unnecessary retries.
>
> Changes in v2:
> - Rename patch from
>   "drm/i915/display: Use rmw in gen9_write_dc_state() to preserve non-DC
> bits"
>   to
>   "drm/i915/display: Mask RO bits in gen9_write_dc_state()"
> - Mask only RO bits rather than masking all non DC state bits
>   in DC_STATE_EN.  As the register has also some clear-on-write flags,
>   like 'Display DC*CO State Status DSI'(Imre Deak)
>
> BSpec: 49437,69115
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  .../i915/display/intel_display_power_well.c   | 29 +++++++++++++++----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index 04bd0dde5bed..4bc9e3ef738e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -726,14 +726,33 @@ static void assert_can_disable_dc9(struct intel_display *display)
>  	  */
>  }
>  
> +static u32 dc_state_ro_mask(struct intel_display *display)
> +{
> +	if (DISPLAY_VER(display) >= 20)
> +		return BIT(10) | BIT(11);
> +	else if (DISPLAY_VER(display) >= 13 && !display->platform.dg2)
> +		return BIT(10);
> +
> +	return 0;
> +}
> +
>  static void gen9_write_dc_state(struct intel_display *display,
>  				u32 state)

The caller already has the platform specific mask, please just pass that
in and use it.

BR,
Jani.

>  {
>  	int rewrites = 0;
>  	int rereads = 0;
>  	u32 v;
> +	u32 ro_mask = dc_state_ro_mask(display);
> +	u32 val = state;
> +
> +	/*
> +	 * Mask out RO status bits from both the write value and the read-back
> +	 * comparison. HW may set these bits independently, so exclude them
> +	 * to prevent the verify loop from retrying due to RO bits mismatch.
> +	 */
> +	val &= ~ro_mask;
>  
> -	intel_de_write(display, DC_STATE_EN, state);
> +	intel_de_write(display, DC_STATE_EN, val);
>  
>  	/* It has been observed that disabling the dc6 state sometimes
>  	 * doesn't stick and dmc keeps returning old value. Make sure
> @@ -741,10 +760,10 @@ static void gen9_write_dc_state(struct intel_display *display,
>  	 * we are confident that state is exactly what we want.
>  	 */
>  	do  {
> -		v = intel_de_read(display, DC_STATE_EN);
> +		v = intel_de_read(display, DC_STATE_EN) & ~ro_mask;
>  
> -		if (v != state) {
> -			intel_de_write(display, DC_STATE_EN, state);
> +		if (v != val) {
> +			intel_de_write(display, DC_STATE_EN, val);
>  			rewrites++;
>  			rereads = 0;
>  		} else if (rereads++ > 5) {
> @@ -753,7 +772,7 @@ static void gen9_write_dc_state(struct intel_display *display,
>  
>  	} while (rewrites < 100);
>  
> -	if (v != state)
> +	if (v != val)
>  		drm_err(display->drm,
>  			"Writing dc state to 0x%x failed, now 0x%x\n",
>  			state, v);

-- 
Jani Nikula, Intel
