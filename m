Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BD0CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86E10E7EE;
	Thu,  8 Oct 2026 12:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAvZY2Mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CEE10E7F3;
 Thu,  8 Oct 2026 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791461575; x=1822997575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BuYPbVcx428BOePAmpCEr+lY39VHfLI8kPd0n73xMg8=;
 b=SAvZY2MwGW71eGcGHVoKtF5f/kmateA9Uk2NR07Rh7/B5N4X0S0ParUz
 GPUL2AIDrXCBCLQR5Op4+2siSaP4kZ0/Or+GugjMxHXYQCjkY150JneU+
 Up6SmFxUEhLcF82Hhb+qqAWYgtIoh7eFJTAFFSK6Boi9Yiz/OT/RLSSPX
 6fnraKEj6bC2Ov9+gIciW25ztZFDKYB0WOjknsePv8Ny3U1j/JXfW9D+A
 sirCpStB0wMM27oYMUuL9lFhNu955b8rcdFnukGU8FQVbxn4W+qN7JreX
 JGcRIBUjKLuOifz/0QbYWVmktl4TAkkyBxSGn/662DSzpD4GSqNnGY3H0 g==;
X-CSE-ConnectionGUID: dsl1BYmtTRuPDtK+Mf/QUw==
X-CSE-MsgGUID: o7gjqP1nQsadKlPb9lJt4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="354255"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="354255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:12:54 -0700
X-CSE-ConnectionGUID: m0lASYQ6R+O57PVcF3VUhQ==
X-CSE-MsgGUID: bbQcI3mSRHKUlVC+qM8vVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="48446"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:12:52 -0700
Date: Thu, 8 Oct 2026 15:12:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [CI] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
Message-ID: <aseIwWEv58T-wioc@intel.com>
References: <20261008114735.2662427-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008114735.2662427-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Oct 08, 2026 at 02:47:35PM +0300, Jani Nikula wrote:
> Try to unify the suspend paths and behaviour by moving the
> intel_opregion_suspend() calls to
> intel_display_driver_pm_suspend_late().
> 
> This is a change in the suspend sequences. The idea behind adding this
> to intel_display_driver_pm_suspend_late() is primarily based on not
> having to pass the s2idle parameter to more functions than that.
> 
> This also changes behaviour for i915 hibernation, going for PCI_D3cold
> instead of PCI_D1 on hibernate.

Pretty sure I pointed out before that this isn't true. PCI_D3cold is
what the current code also does.

I suppose it *might* be the case if one does something like 
'echo reboot > /sys/power/disk', but I've not actually checked
what that sort of thing does to acpi_target_system_state()...

> It's probably the correct thing to do
> anyway, I don't think it should matter all that much, but fingers
> crossed.
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>  drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
>  3 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 77009dca7d0d..abab457bce3a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
>  	if (!HAS_DISPLAY(display))
>  		return;
>  
> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> +
>  	intel_display_power_suspend_late(display, s2idle);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 9e047c27a153..293099fe6639 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct intel_display *display = dev_priv->display;
> -	pci_power_t opregion_target_state;
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> @@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  
>  	i9xx_display_sr_save(display);
>  
> -	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
> -	intel_opregion_suspend(display, opregion_target_state);
> -
>  	dev_priv->suspend_count++;
>  
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index aab416485e3e..7d19f3c42e0e 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -238,14 +238,11 @@ static bool suspend_to_idle(void)
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
>  	struct intel_display *display = xe->display;
> -	bool s2idle = suspend_to_idle();
>  
>  	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_pm_suspend(display);
> -
> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>  }
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
