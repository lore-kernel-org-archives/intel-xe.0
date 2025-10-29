Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDD5CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 10:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BAE10E1C9;
	Wed, 29 Oct 2025 10:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRJmwhUJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02D10E1C9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761733064; x=1793269064;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=7GqOYXLIt5H0SH5+TYC5hZe2D7io5jSOzdVSmsikoBs=;
 b=lRJmwhUJrTYzdnRwCPH8kyut1XmbbnmWHXu4PkeU9Sedf7soSqQXYq4s
 ufz2/4Om3qY+VWpe71jBrseXWtHda+7fdkMB/VVPp27zIAPPfU6pMIxrO
 ZCj6T/rW7uc6gAkxCIijQaAcL73FWwKEHwXZFaIuzv0NKfQhgEzAXYxHc
 QYCTbx6lgNUo4bfPp9bVDXl3Pd2Hx2ui5T09dcwEnmPmN9Pz2IgypBM9z
 vxdwmol8VS+12MLkxx1KTjEyDqOfFkR+dO8eo+1posVfO/gHNrspIlCEG
 PH3CEig7HN2tS//j1pQOPuGMQo/1alQ6p4Ft3cTp0u6XPO6eRn95yBJJ/ g==;
X-CSE-ConnectionGUID: o0NQpDLFRrSkxFWlxLK3FQ==
X-CSE-MsgGUID: eI0MmMWTQRqtN/BMWmWLqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67686894"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67686894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:17:43 -0700
X-CSE-ConnectionGUID: tU8OnF1TQLmunUjeWqolSQ==
X-CSE-MsgGUID: M9nbemqWSXS/rcox0g7c2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185962135"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:17:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Subject: Re: [FOR CI 2/5] drm/i915: Use preempt_disable/enable_rt() where
 recommended
In-Reply-To: <20251029095934.16813-3-dev@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251029095934.16813-1-dev@lankhorst.se>
 <20251029095934.16813-3-dev@lankhorst.se>
Date: Wed, 29 Oct 2025 12:17:39 +0200
Message-ID: <ff46f53791991456439a9ccc58db2d011c12cbff@intel.com>
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

On Wed, 29 Oct 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
> From: Mike Galbraith <umgwanakikbuti@gmail.com>
>
> Mario Kleiner suggest in commit
>   ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")
>
> a spots where preemption should be disabled on PREEMPT_RT. The
> difference is that on PREEMPT_RT the intel_uncore::lock disables neither
> preemption nor interrupts and so region remains preemptible.
>
> The area covers only register reads and writes. The part that worries me
> is:
> - __intel_get_crtc_scanline() the worst case is 100us if no match is
>   found.
>
> - intel_crtc_scanlines_since_frame_timestamp() not sure how long this
>   may take in the worst case.
>
> It was in the RT queue for a while and nobody complained.
> Disable preemption on PREEPMPT_RT during timestamping.
>
> [bigeasy: patch description.]
>
> Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
> Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 43 ++++++++++++++++-----
>  1 file changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 44a7242658da4..cd7f2c1ef21af 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -315,6 +315,20 @@ static void intel_vblank_section_exit(struct intel_display *display)
>  	struct drm_i915_private *i915 = to_i915(display->drm);
>  	spin_unlock(&i915->uncore.lock);
>  }
> +
> +static void intel_vblank_section_enter_irqf(struct intel_display *display, unsigned long *flags)
> +	__acquires(i915->uncore.lock)
> +{
> +	struct drm_i915_private *i915 = to_i915(display->drm);
> +	spin_lock_irqsave(&i915->uncore.lock, *flags);
> +}
> +
> +static void intel_vblank_section_exit_irqf(struct intel_display *display, unsigned long flags)
> +	__releases(i915->uncore.lock)
> +{
> +	struct drm_i915_private *i915 = to_i915(display->drm);
> +	spin_unlock_irqrestore(&i915->uncore.lock, flags);
> +}

The whole #ifdef I915 conditional stuff needs to go sooner rather than
later. This needs to become independent of i915 vs xe.

The comment says this is about *platforms* not *drivers*, so the check
should be about platforms, not drivers.

In any case, adding more stuff to the #ifdef I915 branches is
counter-productive.


BR,
Jani.


>  #else
>  static void intel_vblank_section_enter(struct intel_display *display)
>  {
> @@ -323,6 +337,17 @@ static void intel_vblank_section_enter(struct intel_display *display)
>  static void intel_vblank_section_exit(struct intel_display *display)
>  {
>  }
> +
> +static void intel_vblank_section_enter_irqf(struct intel_display *display, unsigned long *flags)
> +{
> +	*flags = 0;
> +}
> +
> +static void intel_vblank_section_exit_irqf(struct intel_display *display, unsigned long flags)
> +{
> +	if (flags)
> +		return;
> +}
>  #endif
>  
>  static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
> @@ -359,10 +384,10 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  	 * timing critical raw register reads, potentially with
>  	 * preemption disabled, so the following code must not block.
>  	 */
> -	local_irq_save(irqflags);
> -	intel_vblank_section_enter(display);
> +	intel_vblank_section_enter_irqf(display, &irqflags);
>  
> -	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +		preempt_disable();
>  
>  	/* Get optional system timestamp before query. */
>  	if (stime)
> @@ -426,10 +451,10 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  	if (etime)
>  		*etime = ktime_get();
>  
> -	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +		preempt_enable();
>  
> -	intel_vblank_section_exit(display);
> -	local_irq_restore(irqflags);
> +	intel_vblank_section_exit_irqf(display, irqflags);
>  
>  	/*
>  	 * While in vblank, position will be negative
> @@ -467,13 +492,11 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
>  	unsigned long irqflags;
>  	int position;
>  
> -	local_irq_save(irqflags);
> -	intel_vblank_section_enter(display);
> +	intel_vblank_section_enter_irqf(display, &irqflags);
>  
>  	position = __intel_get_crtc_scanline(crtc);
>  
> -	intel_vblank_section_exit(display);
> -	local_irq_restore(irqflags);
> +	intel_vblank_section_exit_irqf(display, irqflags);
>  
>  	return position;
>  }

-- 
Jani Nikula, Intel
