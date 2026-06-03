Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A79CD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 08:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA3410FA27;
	Wed,  3 Jun 2026 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGC7Jz5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5734A10FA27;
 Wed,  3 Jun 2026 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780475409; x=1812011409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BGzhO6xhpYi1RfX30f+nmmMi2esYcN9zAcYjXg2YztU=;
 b=GGC7Jz5PIt4AAGeKs+hB4od2opf+QxF+A+5Q6bwscBGoZlosU3T/KNwR
 5vJPXaE3l7UUocuTuwGPsACeHd2YVaXDSj5ErhagMOee99Q0e9oCl935h
 2g8kjlzFpvnt23qLj05/jqWYO61L11HJg2d+/v5fJ/PbTphWT4zBCcwyq
 2aahkqSl/XJ55rGr/6TyMMOfO23xUJI4cBHr/Rvi54Nm25o1gqER5F5t7
 Y0LsFzCDzzjKSrMGk2ZFG1BVECiB8hwnByc2RMvCuxY/FByVA5S4Rtx42
 RtWMBEm5qRN+atZAaVTng5At5ghYd96/1VVQsJyRiG5aqcbigWThpzsbt A==;
X-CSE-ConnectionGUID: cG0eorKnQqWGqAaQ4Zm8KA==
X-CSE-MsgGUID: J8R/eCP8SUmMQ/XkHsAGhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81334755"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81334755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:30:09 -0700
X-CSE-ConnectionGUID: axZZlUSkRwmH9yZuxYGcnw==
X-CSE-MsgGUID: ujQevUgWSjW1VvrgWm8Zaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="237801520"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:30:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v3] drm/i915/display: Mask RO bits in gen9_write_dc_state()
In-Reply-To: <20260602113134.2477070-1-dibin.moolakadan.subrahmanian@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260601090131.1840805-1-dibin.moolakadan.subrahmanian@intel.com>
 <20260602113134.2477070-1-dibin.moolakadan.subrahmanian@intel.com>
Date: Wed, 03 Jun 2026 11:30:04 +0300
Message-ID: <9de0611a934b0a1fcfbcb5b78822611ee45cb2b9@intel.com>
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

On Tue, 02 Jun 2026, Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com> wrote:
> The DC_STATE_EN register has read-only status bits that are set by
> hardware on some platforms. These bits may cause the read-back
> verification loop in gen9_write_dc_state() to spuriously retry.
>
> Mask the RO bits from the read-back comparison to prevent
> unnecessary retries.
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
> Changes in v3:
> - Limit ro mask to read-back comparison.
>
> BSpec: 49437,69115
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  .../i915/display/intel_display_power_well.c   | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index 04bd0dde5bed..ab0200701a73 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -726,12 +726,28 @@ static void assert_can_disable_dc9(struct intel_display *display)
>  	  */
>  }
>  
> +static u32 dc_state_ro_mask(struct intel_display *display)
> +{
> +	if (DISPLAY_VER(display) >= 20)
> +		return BIT(10) | BIT(11);
> +	else if (DISPLAY_VER(display) >= 13 && !display->platform.dg2)
> +		return BIT(10);

Register contents need to be defined next to the register definition.

But even so, the caller already has the mask we want to change, I
already suggested passing that in. What's wrong with that?

BR,
Jani.


> +
> +	return 0;
> +}
> +
>  static void gen9_write_dc_state(struct intel_display *display,
>  				u32 state)
>  {
>  	int rewrites = 0;
>  	int rereads = 0;
>  	u32 v;
> +	/*
> +	 * Mask out RO status bits from read-back comparison.
> +	 * HW may set these bits independently, so exclude them
> +	 * to prevent the verify loop from retrying due to RO bits mismatch.
> +	 */
> +	u32 ro_mask = dc_state_ro_mask(display);
>  
>  	intel_de_write(display, DC_STATE_EN, state);
>  
> @@ -743,7 +759,7 @@ static void gen9_write_dc_state(struct intel_display *display,
>  	do  {
>  		v = intel_de_read(display, DC_STATE_EN);
>  
> -		if (v != state) {
> +		if ((v & ~ro_mask) != (state & ~ro_mask)) {
>  			intel_de_write(display, DC_STATE_EN, state);
>  			rewrites++;
>  			rereads = 0;
> @@ -753,10 +769,10 @@ static void gen9_write_dc_state(struct intel_display *display,
>  
>  	} while (rewrites < 100);
>  
> -	if (v != state)
> +	if ((v & ~ro_mask) != (state & ~ro_mask))
>  		drm_err(display->drm,
> -			"Writing dc state to 0x%x failed, now 0x%x\n",
> -			state, v);
> +			"Writing dc state to 0x%x failed, now 0x%x (ro_mask=0x%x)\n",
> +			state, v, ro_mask);
>  
>  	/* Most of the times we need one retry, avoid spam */
>  	if (rewrites > 1)

-- 
Jani Nikula, Intel
