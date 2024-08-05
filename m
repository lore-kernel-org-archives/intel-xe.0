Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D3C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 18:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDF410E28A;
	Mon,  5 Aug 2024 18:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW+2lc2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956D710E29B
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722883392; x=1754419392;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kpmSu7O81XrO8F1yI8QNz/BFQoiygx3KuXunYGH3tsA=;
 b=iW+2lc2lHChtaOX1rV7h5irUQU2nx4czk2CICKcxWGd1pVxr4YlKmDxH
 GJU2Pt+yFsw2bRhVsizVpTsCYzvdn8c1DKdR8AjILH9we0Tm9L1nrqZs5
 0kYe8bu3lG21SOQSHyZwxyyfEmDVDHD7mwFbV1CHlFrGppn/tctO7og//
 xbozsEQU484C6pTwSFM/V9VR4Q7r+CFdJNgSmXhYQR7enAgDQYfym+ZHU
 A0KmOUbP/7qyUaq2IyzzQ824GXIo6puQb70KkbQU+KvTWJcNiozRPxI1T
 cooo7GRQI7/9xxd967mzAU6AKF2Y1bambdI0PTav95L+FxiJEBHXWIjFK Q==;
X-CSE-ConnectionGUID: H1nLAt2GQsCnFiJFR+A1eQ==
X-CSE-MsgGUID: gC2uRdp6QhqGc4Y6S/HEOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20990344"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="20990344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:43:11 -0700
X-CSE-ConnectionGUID: vtjKxvYzSIGUKeTlS9n1WQ==
X-CSE-MsgGUID: 6GXEpGK1S7KwvfshjVL8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="87181887"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:43:10 -0700
Date: Mon, 5 Aug 2024 21:43:27 +0300
From: Imre Deak <imre.deak@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Message-ID: <ZrEdT1mxvBpeeRFe@ideak-desk.fi.intel.com>
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
 <20240805151309.461021-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805151309.461021-2-maarten.lankhorst@linux.intel.com>
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

On Mon, Aug 05, 2024 at 05:13:08PM +0200, Maarten Lankhorst wrote:
> Suspend fbdev sooner, and disable user access before suspending to
> prevent some races. I've noticed this when comparing xe suspend to
> i915's.

This is only part of

24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")
f4ed123ae295 ("drm/i915: Suspend the framebuffer console during driver shutdown")
1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")
bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")

done for i915, imo all the above changes should be applied to xe.

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index ca4468c820788..44405f17c1d28 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -294,8 +294,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	if (has_display(xe))
> +	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +
> +	if (has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> +		intel_display_driver_disable_user_access(xe);
> +	}
>  
>  	if (!runtime)
>  		intel_display_driver_suspend(xe);
> @@ -308,8 +312,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
>  
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> -
>  	intel_dmc_suspend(xe);
>  }
>  
> @@ -353,8 +355,10 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  		intel_display_driver_resume(xe);
>  
>  	intel_hpd_poll_disable(xe);
> -	if (has_display(xe))
> +	if (has_display(xe)) {
>  		drm_kms_helper_poll_enable(&xe->drm);
> +		intel_display_driver_enable_user_access(xe);
> +	}
>  
>  	intel_opregion_resume(xe);
>  
> -- 
> 2.45.2
> 
