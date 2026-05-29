Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91227CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 13:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDA010FF34;
	Fri, 29 May 2026 13:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8nG1qpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B7910FF34;
 Fri, 29 May 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780061446; x=1811597446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ac46X7vOZGMsSEOapU7r5ztZNj1zzkLGdSfYFOihuSY=;
 b=c8nG1qpJ2IaTEyA4prEdFbleFr7zMukvEu+fpdvxah5WmoLyCjs/b8MC
 h730x0ETDGFubUUzUBKxPPsGaOvQWbzB/5+3e+7xfoUiquOizvE5tuIA0
 wM+qww08mK170JhtCjAVTObQVzSspQZ43Z6Kfvli513wSKJv9TA7aV3Cs
 LP1L6W/UANcB7hNuR/3a7W98YtQjb6VxwK4MaBXPGG2/NYPh7v12qf0SL
 YzFSejRbAZRXFOJld1h177NnBsdpuI5txTfl/cetvLL0TMsGcFi0R67WX
 gKeZ4gz6L2x9KS/ZyG2e0ZDkVuQNGu7sdNWGn5dJ/DyCa0iWIqMFre9RX w==;
X-CSE-ConnectionGUID: dQc9zMLqRLKkDRLDr51b6Q==
X-CSE-MsgGUID: tSKWu0SJQEKTA+0GEABACw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84771990"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="84771990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:30:45 -0700
X-CSE-ConnectionGUID: HbTbq9gHRI+ER6pz2jyUcA==
X-CSE-MsgGUID: AhPvBD6STg6rBSf5EvA9cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="244677443"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:30:44 -0700
Date: Fri, 29 May 2026 16:30:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Subject: Re: [PATCH 07/24] drm/xe/display: rename xe_display_pm_shutdown*()
 to xe_display_shutdown*()
Message-ID: <ahmVAa79qKoeTEDF@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
 <ed6969b44d160d13d4f19d8fcd7c758f6157c27c.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed6969b44d160d13d4f19d8fcd7c758f6157c27c.1780051905.git.jani.nikula@intel.com>
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

On Fri, May 29, 2026 at 02:03:51PM +0300, Jani Nikula wrote:
> The shutdown functions get called from the struct pci_driver .shutdown
> hook, not through the struct dev_pm_ops hooks. Name accordingly,
> dropping the "pm" from the name, even if shutdown has a lot of
> similarities with suspend.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c |  4 ++--
>  drivers/gpu/drm/xe/display/xe_display.h | 10 ++++++----
>  drivers/gpu/drm/xe/xe_device.c          |  4 ++--
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index d1c450a18713..3567b3018083 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -326,7 +326,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	intel_dmc_suspend(display);
>  }
>  
> -void xe_display_pm_shutdown(struct xe_device *xe)
> +void xe_display_shutdown(struct xe_device *xe)
>  {
>  	struct intel_display *display = xe->display;
>  
> @@ -400,7 +400,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
>  	intel_dmc_wl_flush_release_work(display);
>  }
>  
> -void xe_display_pm_shutdown_late(struct xe_device *xe)
> +void xe_display_shutdown_late(struct xe_device *xe)
>  {
>  	struct intel_display *display = xe->display;
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 60291cb154df..e5f9aed93206 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -29,15 +29,16 @@ int xe_display_init(struct xe_device *xe);
>  void xe_display_register(struct xe_device *xe);
>  void xe_display_unregister(struct xe_device *xe);
>  
> +void xe_display_shutdown(struct xe_device *xe);
> +void xe_display_shutdown_late(struct xe_device *xe);
> +
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
>  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
>  void xe_display_irq_reset(struct xe_device *xe);
>  void xe_display_irq_postinstall(struct xe_device *xe);
>  
>  void xe_display_pm_suspend(struct xe_device *xe);
> -void xe_display_pm_shutdown(struct xe_device *xe);
>  void xe_display_pm_suspend_late(struct xe_device *xe);
> -void xe_display_pm_shutdown_late(struct xe_device *xe);
>  void xe_display_pm_resume_early(struct xe_device *xe);
>  void xe_display_pm_resume(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
> @@ -65,15 +66,16 @@ static inline int xe_display_init(struct xe_device *xe) { return 0; }
>  static inline void xe_display_register(struct xe_device *xe) {}
>  static inline void xe_display_unregister(struct xe_device *xe) {}
>  
> +static inline void xe_display_shutdown(struct xe_device *xe) {}
> +static inline void xe_display_shutdown_late(struct xe_device *xe) {}
> +
>  static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
>  static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
>  static inline void xe_display_irq_reset(struct xe_device *xe) {}
>  static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
>  
>  static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> -static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
>  static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
> -static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
>  static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
>  static inline void xe_display_pm_resume(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d224861b6f6f..ec065b168bb9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1128,14 +1128,14 @@ void xe_device_shutdown(struct xe_device *xe)
>  
>  	drm_dbg(&xe->drm, "Shutting down device\n");
>  
> -	xe_display_pm_shutdown(xe);
> +	xe_display_shutdown(xe);
>  
>  	xe_irq_suspend(xe);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_shutdown(gt);
>  
> -	xe_display_pm_shutdown_late(xe);
> +	xe_display_shutdown_late(xe);
>  
>  	if (!xe_driver_flr_disabled(xe)) {
>  		/* BOOM! */
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
