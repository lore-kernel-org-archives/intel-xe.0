Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B7CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 14:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3388A10FFC5;
	Fri, 29 May 2026 14:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3FIIxm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50CA10FFCB;
 Fri, 29 May 2026 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780064209; x=1811600209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ygB4oZfJ0oQbz5H1L7yu3B7EVgA1Rbh4Brxw3YfcyVc=;
 b=Z3FIIxm0dxOR7FgKWfv+miu1mwbZQx5AIr7YOvH9XlTpeQBO1BnZg5Ro
 OCYVjeKWFjZTpNI13H0uB+TRI3Ob1Ypy+gKN+llhje40GPskvzPFOQ2zt
 KfeNdPAaLkb7l2GT1TWu4UNyoL8yzTWwVDYTBQYgn/LoH61fB9lXcD8yo
 tEueZJEa6UrSyyRwIYllYDafmKDjqjUHUakFMBF0fuY/qJNbNW4uvFreV
 3EuMHNwv0l4cvZuoZXM8rweANhKk4NuUoVVqvBN9BDPwrwWbSVnkVD4xU
 wwgC33Du/m7tJvUM3O2eYJtDnfwRpAUJBodW8FiekAplQdU1XLVIah4fT Q==;
X-CSE-ConnectionGUID: B1bF0gbiQ3Sv/Gepbi4/aA==
X-CSE-MsgGUID: sH4BD31EQzK0iXNwIA7ZNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80910939"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80910939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 07:16:48 -0700
X-CSE-ConnectionGUID: WhAFl9ohTgGny4tf/w106A==
X-CSE-MsgGUID: iwMKi8tUT1mnG68P2kB0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247804507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 07:16:47 -0700
Date: Fri, 29 May 2026 17:16:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Subject: Re: [PATCH 19/24] drm/{i915,xe}: make intel_dmc_suspend() part of
 display suspend/shutdown calls
Message-ID: <ahmfy87QdRbD4Pi-@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
 <96b661da7cec4ef7f9c0e5e140f59990659281cf.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96b661da7cec4ef7f9c0e5e140f59990659281cf.1780051905.git.jani.nikula@intel.com>
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

On Fri, May 29, 2026 at 02:04:03PM +0300, Jani Nikula wrote:
> Move the intel_dmc_suspend() calls from i915 and xe suspend and shutdown
> hooks all the way down to a shared location in
> __intel_display_driver_pm_suspend().
> 
> This is a change in the suspend/shutdown sequences, but hopefully one
> without problems.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>  drivers/gpu/drm/xe/display/xe_display.c             | 4 ----
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index bc632ac8c9b4..6cac36157bea 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -755,6 +755,8 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
>  
>  	intel_encoder_suspend_all(display);
>  
> +	intel_dmc_suspend(display);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 209ac512455d..40fc15017486 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1045,8 +1045,6 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>  
>  	intel_irq_suspend(i915);
>  
> -	intel_dmc_suspend(display);
> -

I wonder what we're even trying to achieve here. Just to make sure
the DMC firmware has been loaded before we system suspend? That might
be reasonable, but we now wait for the firmware load somewhere during
driver init due to flip queue needing it. So this all seems rather
redundant now.

>  	i915_gem_suspend(i915);
>  
>  	/*
> @@ -1117,8 +1115,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  
>  	dev_priv->suspend_count++;
>  
> -	intel_dmc_suspend(display);
> -
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	i915_gem_drain_freed_objects(dev_priv);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 561ec1ed6845..9416405667d8 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -198,8 +198,6 @@ void xe_display_shutdown(struct xe_device *xe)
>  	intel_display_driver_shutdown(display);
>  
>  	intel_opregion_suspend(display, PCI_D3cold);
> -
> -	intel_dmc_suspend(display);
>  }
>  
>  void xe_display_shutdown_late(struct xe_device *xe)
> @@ -276,8 +274,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	intel_display_driver_pm_suspend(display);
>  
>  	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> -
> -	intel_dmc_suspend(display);
>  }
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
