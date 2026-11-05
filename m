Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335BA606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TvAofHOz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F211910E334;
	Thu,  5 Nov 2026 18:31:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143E710E334;
 Thu,  5 Nov 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793903483; x=1825439483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j2mvJ5a8fsbbPNHvdOtBbrbBDAd2SqqYDHITBf9HNKs=;
 b=TvAofHOzZbtU3yfa8z0G6BUEC0uMQ2Po68Vrxh6juZhcujYlU+v5wFVz
 J/6lY3pWPN2tLI6nFAeCyl1MVniW7r80XU3SwizfiVW1Y6MKBSUs/cfni
 CsDRXWk2KQZzuKk4BJip6eW4iEl7/zDsvaawWJY2/pQE7wxKkR3lbS/aT
 6LcbT45qJOmXuTZCMc3Ze8kLCNg5JFdffIrmHBVzPUi+ENxi9yJpDOuFj
 /8qQ/5eNPplnSQCacozWm7jMN6A4jofr16pUSr2Ww3qTJDMT5s95uq8BC
 sl1Z0uRvJgl5HiASnKyqMX5qDOlq+clytinSCUZtDEZu9868yMq9fpjOu g==;
X-CSE-ConnectionGUID: v/A7tHr3RDKOKlV6OYaM5w==
X-CSE-MsgGUID: gLdQ/oZETIGbuY7o5vNcyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2697727"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2697727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:31:02 -0800
X-CSE-ConnectionGUID: ASmBuyjaQRWTE2vht7cW5A==
X-CSE-MsgGUID: PUpXyBVYQYeBraWHrXpUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7497834"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:31:00 -0800
Date: Thu, 5 Nov 2026 20:30:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/cdclk: Ignore SWF18 in SKL CDCLK sanitization
Message-ID: <auzLYHTMuLVVktJv@intel.com>
References: <20261105124737.24456-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105124737.24456-1-ville.syrjala@linux.intel.com>
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

On Thu, Nov 05, 2026 at 02:47:37PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently on SKL/derivatives we are checking whether
> the VBIOS/GOP programmed the SWF18 scratch register
> appropriately. Based on the original commit, and the
> set of bits checked, the code actually wanted to check
> SWF06 instead. Looks like it's just completely confused
> whether the register offset should be 0x6*4 vs. 0x18 vs.
> 0x18*4. SWF06 is where the VBIOS/GOP should stuff some
> information about what outputs it enabled. SWF18 is
> where the VBIOS/GOP is supposed to stuff the maximum
> CDCLK frequency.

Actually it's me who is confused. SWF06 is the CDCLK thing
and SWF18 is the pipe/output thing. So I guess it was checking
the right register after all. Oh well, that doesn't change the
fact that it doesn't work on chromebooks.

> 
> I suppose either of these scratch registers are part
> of the expected protocol between the VBIOS/GOP and
> driver, but it looks like at least some coreboot
> based systems don't set them up.
> 
> SWF18 not being populated leads us to reprogram the
> CDCLK PLL during driver initialization, while the
> display pipes are still potentially active. We also
> set CDCLK to its minimum frequency, under the
> assumption that nothing actually needs a higher
> CDCLK frequency when it hasn't even been correctly
> initialized.
> 
> Due to some other changes in the code we may no longer
> force a full CDCLK recalculation and reprogramming upon
> the first atomic commit, so CDCLK can remain at a
> potentially too low a frequency indefinitely.
> 
> To fix this let's just stop looking at SWF18 completely.
> The code is anyway confused about which register
> it's actually looking at, and we don't look at that
> register on any other platform either. We also do an
> actual readout of the CDCLK state from the hardware
> so we should be able to spot if anything is wrong
> enough to need reprogramming.
> 
> Cc: stable@vger.kernel.org
> Fixes: ba91b9eecb47 ("drm/i915/cdclk: Decouple cdclk from state->modeset")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17423
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 92e6fca861f6..0f2f693c78d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1269,18 +1269,7 @@ static void skl_set_cdclk(struct intel_display *display,
>  
>  static void skl_sanitize_cdclk(struct intel_display *display)
>  {
> -	u32 cdctl, expected, swf18;
> -
> -	/*
> -	 * check if the pre-os initialized the display
> -	 * There is SWF18 scratchpad register defined which is set by the
> -	 * pre-os which can be used by the OS drivers to check the status
> -	 */
> -	swf18 = intel_de_read(display, SWF_ILK(0x18));
> -	if ((swf18 & 0x00FFFFFF) == 0) {
> -		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to SWF18 0x%x\n", swf18);
> -		goto sanitize;
> -	}
> +	u32 cdctl, expected;
>  
>  	intel_update_cdclk(display);
>  	intel_cdclk_dump_config(display, &display->cdclk.hw, "Current CDCLK");
> -- 
> 2.56.0

-- 
Ville Syrjälä
Intel
