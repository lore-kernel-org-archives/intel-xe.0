Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA988CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E510112439;
	Fri, 29 May 2026 19:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nc9OC6gG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C7B112439;
 Fri, 29 May 2026 19:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780081973; x=1811617973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zye2KKmvqOCFsejoVUU+IOAeqcfxX/D7CViJEFJQGKQ=;
 b=nc9OC6gGjQpRGUXrHiNFckhH/+hDd4v5DhRFkzj2xINiPwpGuT7lL7Pb
 hjfIdCCCBFL5OnCETI3i8yXg32hyvrkO66TGE8kw/CwHhAzmLlyTLKj4S
 UqMfKHxXangVQIJ4xYiMsM8iupAM3VmdulHYTXToFCzB8uYlKRRlsUdeb
 oKj7hu45FDSXik7fIYsHI1C1UeXFmbHvKn5D88897+ROxrcWMCLSsw/Ro
 n+UH7AVKEDkOGz41/1DnXsUyR+2ErB4QdwGZTXWVP1dxuWBJWpuyJO//j
 sd/cgQ8yzJuBCI8XL40qnDP8zmcBM1eXptXJ1EoI2WvnHur7vTXz105bv g==;
X-CSE-ConnectionGUID: FhY/8DOhSziNuRZodJnKLg==
X-CSE-MsgGUID: CVJuCXF2SjurxaOMlnAjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91624265"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91624265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:12:53 -0700
X-CSE-ConnectionGUID: rObi9cMoSU+X/NAMTPv3Nw==
X-CSE-MsgGUID: iKI/r4ecS/u8yR6Y14C0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="243072743"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:12:51 -0700
Date: Fri, 29 May 2026 22:12:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Subject: Re: [PATCH 24/24] drm/xe/display: unify runtime suspend/resume with
 i915 for non-d3cold
Message-ID: <ahnlL1v-W68om8cc@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
 <2b7015d5f0c2c6d7b91fd020cba25deda91c0baa.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b7015d5f0c2c6d7b91fd020cba25deda91c0baa.1780051905.git.jani.nikula@intel.com>
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

On Fri, May 29, 2026 at 02:04:08PM +0300, Jani Nikula wrote:
> With the special d3cold handling in xe runtime suspend/resume separated,
> unify the non-d3cold paths with i915. There are multiple changes here at
> once that probably wouldn't make much sense to split out further.
> 
> Add the call to intel_display_driver_pm_runtime_suspend(), which in turn
> starts calling intel_display_power_runtime_suspend(). Deep down, this
> should take care of intel_dmc_wl_flush_release_work(), allowing us to
> drop the extra call in xe_display_pm_runtime_suspend_late().
> 
> Add the call to intel_display_driver_pm_runtime_suspend_late(), which
> starts calling intel_opregion_notify_adapter(). The
> intel_hpd_poll_enable() call is also done here, postponed from the
> previous location in xe_display_pm_runtime_suspend().
> 
> Add the call to intel_display_driver_pm_runtime_resume_early(), which
> contains the intel_display_power_runtime_resume() and
> intel_opregion_notify_adapter() counterparts found in
> intel_display_power_runtime_suspend() and
> intel_display_power_runtime_suspend_late(). (They are not symmetric.)
> 
> Finally, intel_display_driver_pm_runtime_resume() replaces the direct
> calls to intel_hpd_init(), intel_hpd_poll_disable(), and
> skl_watermark_ipc_update().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0fadc62e1cdd..cd7264d7dfe2 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -363,7 +363,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
>  		return;
>  	}
>  
> -	intel_hpd_poll_enable(display);
> +	intel_display_driver_pm_runtime_suspend(display);
>  }
>  
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
> @@ -379,12 +379,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
>  		return;
>  	}
>  
> -	/*
> -	 * If xe_display_pm_suspend_late() is not called, it is likely
> -	 * that we will be on dynamic DC states with DMC wakelock enabled. We
> -	 * need to flush the release work in that case.
> -	 */

The entire comment seems wonky. I don't think we have any platforms
with wakelock+!DC9. Ah, it was added exactly because the D3cold path
is broken and doesn't go into DC9. Would have been better to fix the
actual problem instead. I guess you should move the comment to the
D3cold path in the previous patch to keep it where it actually makes
some sense.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> -	intel_dmc_wl_flush_release_work(display);
> +	intel_display_driver_pm_runtime_suspend_late(display);
>  }
>  
>  void xe_display_pm_runtime_resume(struct xe_device *xe)
> @@ -399,9 +394,8 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
>  		return;
>  	}
>  
> -	intel_hpd_init(display);
> -	intel_hpd_poll_disable(display);
> -	skl_watermark_ipc_update(display);
> +	intel_display_driver_pm_runtime_resume_early(display);
> +	intel_display_driver_pm_runtime_resume(display);
>  }
>  
>  
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
