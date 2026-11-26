Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E53606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbaiJ48N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946E1123D1;
	Thu, 26 Nov 2026 13:22:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C901123D1;
 Thu, 26 Nov 2026 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699347; x=1827235347;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=OJfmdRC95BQBZaSTM2su16qKNe1+psl7IMPffIGhllY=;
 b=dbaiJ48N1oe5z4T6R2JRPHq9fH0a0TCSaKJznTLPMu5SDAVvAHA0d7DG
 bnB5bqi31H5yfchn+VvChFduTHDSwWEI6n1fN1wtjfM92mJoR7rPij/XO
 HFzz8MohdoMsl3u6JpJDwBXJfxlYuSCAq3TCKdQe/f0G4eiYEA6zOC0WO
 BvlTMRg3XJ0SIgGGryDln6wXNb9lqRkxSzlNTLivzxkvXTx/jhx0bVX5u
 DzFXSbx347dv1uU9d4+MxDTFDeeXdF7YO3dZMgqCkoEgEXsVMgSs5diy3
 bbgyPnt/61cNNkR3hVPSgJ74wGjSM1f+3Xr4CVi6/U277QUCHzQkSYkfF Q==;
X-CSE-ConnectionGUID: T9assz+kSb+uv6f/aZo0vw==
X-CSE-MsgGUID: XJIsgNnjSneYX96IQH0BUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4601097"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4601097"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:22:26 -0800
X-CSE-ConnectionGUID: dYSx0AxqS7mNZvc5BYKy7w==
X-CSE-MsgGUID: hPYuyE3oTBG6ZVcy9eMNxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14210044"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:22:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/13] drm/xe/display: Distinguish failed system suspend
 recovery
In-Reply-To: <20261126100755.1252635-5-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-5-imre.deak@intel.com>
Date: Thu, 26 Nov 2026 15:22:21 +0200
Message-ID: <6c6693b410e6ea3ff65cc30fb4f373c9301bcc1e@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Imre Deak <imre.deak@intel.com> wrote:
> A suspend failure before xe_irq_suspend() resumes display while its HPD
> interrupts are still enabled. Pass that condition to the display resume
> path so a later DDI-pool change can preserve its cached assignments and
> HPD source tables on recovery.
>
> Normal system resume continues after interrupt reset/postinstall, with HPD
> masked until display initialization completes. Document replacing this
> distinction with display-only interrupt shutdown/reinitialization once
> those hooks are available.

This needs to be the same for i915 and xe. No xe specific stuff, please.

BR,
Jani.

>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 7 ++++++-
>  drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
>  drivers/gpu/drm/xe/xe_device.c          | 4 ++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0236f69a0f883..f757cfad4bd6e 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -286,7 +286,12 @@ void xe_display_pm_resume_early(struct xe_device *xe)
>  	intel_display_driver_pm_resume_early(display);
>  }
>  
> -void xe_display_pm_resume(struct xe_device *xe)
> +/*
> + * FIXME: Disable display-only interrupts at the end of xe_display_pm_suspend()
> + * and reinitialize them here, including failed-suspend recovery. That would
> + * remove the need to distinguish recovery without an interrupt reset.
> + */
> +void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed)
>  {
>  	struct intel_display *display = xe->display;
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 6c580d9593b03..79f94be0cfb65 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -41,7 +41,7 @@ void xe_display_irq_postinstall(struct xe_device *xe);
>  void xe_display_pm_suspend(struct xe_device *xe);
>  void xe_display_pm_suspend_late(struct xe_device *xe);
>  void xe_display_pm_resume_early(struct xe_device *xe);
> -void xe_display_pm_resume(struct xe_device *xe);
> +void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
>  void xe_display_pm_runtime_resume_early(struct xe_device *xe);
> @@ -80,7 +80,7 @@ static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
>  static inline void xe_display_pm_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
>  static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
> -static inline void xe_display_pm_resume(struct xe_device *xe) {}
> +static inline void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed) {}
>  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_resume_early(struct xe_device *xe) {}
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 36693df655941..884a2be28c17b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1464,7 +1464,7 @@ int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
>  	return 0;
>  
>  err_display:
> -	xe_display_pm_resume(xe);
> +	xe_display_pm_resume(xe, true);
>  	xe_pxp_pm_resume(xe->pxp);
>  	return err;
>  }
> @@ -1543,7 +1543,7 @@ int xe_device_resume(struct xe_device *xe, bool flr)
>  		 * Try to bring up display before bailing from GT resume failure,
>  		 * so we don't leave the user clueless with a blank screen.
>  		 */
> -		xe_display_pm_resume(xe);
> +		xe_display_pm_resume(xe, false);
>  		if (err)
>  			return err;

-- 
Jani Nikula, Intel
