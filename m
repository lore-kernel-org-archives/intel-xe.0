Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D831C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 10:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8B10E723;
	Mon, 17 Aug 2026 10:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHYq2TqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D55F10E3E8;
 Mon, 17 Aug 2026 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786961713; x=1818497713;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0OMIofAuNsvMJS9RfW4fD/q4L5JyaBHovAEqzCrJ0QM=;
 b=IHYq2TqVnGLkSBxp/uIzDIwNuMxGuSgE7GkQABM9rtsfJ323rMH4pQAo
 g40KA2AXITJFGgUyh4YIkIXFzzGEupaj2uUMPhPCpskvHoa4LaW6Pb8nU
 c/vAd5IJIRD/zly/vczK+rpjHQbzWbmPQcSmsM9QzpGh3FyZruGI7Q6Lo
 6BoZ2gPUzbZM4vAyqeyqrrWaVRyUticAwlK3UmmGxaeN+ndKf1e7vUyzW
 GNi1tGvOKn19bgXI3fukk9asArgLSX5MuyTPXpItpPPLAU9J6hxQxwaGp
 we68U6YcrryKCIaLAclc+rV0M8pL0TFHzRmT03UoboUkK5eizElNK8tLP w==;
X-CSE-ConnectionGUID: 8FT5SxItTqufzTR4/8nr+Q==
X-CSE-MsgGUID: fG2fA4YrRkuNTtAcoGo6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91305863"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91305863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:15:13 -0700
X-CSE-ConnectionGUID: 8uqtr4s1Ss6GcQappU4XKg==
X-CSE-MsgGUID: MSbm+RqcSqqMLigpSlhs4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="260655935"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:15:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com
Subject: Re: [RFC PATCH 5/5] drm/i915/display: skip HPD polling if PME is
 supported
In-Reply-To: <20260816224005.886035-6-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-6-vinod.govindapillai@intel.com>
Date: Mon, 17 Aug 2026 13:15:08 +0300
Message-ID: <3927e15f2e02fd03c8101cf626866a56e13c8d01@intel.com>
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

On Mon, 17 Aug 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> A display hotplug can generate a PM_PME which in turn will
> trigger pm_runtime_resume call on a device. So we don't need
> to resort to HPD polling on pm_runtime_suspend calls. But on
> pm_runtime_resume call we would need to still resort to the
> intel_hpd_poll_disable() as the i915_hpd_poll_detect_connectors()
> catches the hotplugs that occurred during suspend.
>
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  .../drm/i915/display/intel_display_driver.c   | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 70d112fd4287..b7e25b7ea32e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -34,6 +34,7 @@
>  #include "intel_display_driver.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_power.h"
> +#include "intel_display_rpm.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
>  #include "intel_display_wa.h"
> @@ -931,6 +932,10 @@ void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
>  		intel_opregion_notify_adapter(display, PCI_D1);
>  	}
>  
> +	/* No need of HPD polling if the device is PME capable */
> +	if (intel_display_rpm_pme_capable(display))
> +		return;
> +

It's really messy to just return here. We may add more stuff into this
function, and it will be a PITA.

>  	if (!display->platform.valleyview && !display->platform.cherryview)
>  		intel_hpd_poll_enable(display);
>  }
> @@ -951,10 +956,20 @@ void intel_display_driver_pm_runtime_resume(struct intel_display *display)
>  	 * power well, so hpd is reinitialized from there. For
>  	 * everyone else do it here.
>  	 */
> -	if (!display->platform.valleyview && !display->platform.cherryview) {
> +	if (display->platform.valleyview || display->platform.cherryview)
> +		goto out;

Ditto. The function is about runtime resume. Don't make it about dodging
hpd poll.

> +
> +	/* For PME capable devices we would not have resorted into HPD polling */

These comments are a nuisance. This makes you stop for more questions
than what it answers.

> +	if (intel_hpd_polling_enabled(display))
>  		intel_hpd_init(display);

Why is this not called unconditionally?

> -		intel_hpd_poll_disable(display);
> -	}

Maybe PME is an hpd implementation detail that should be hidden inside
intel_hpd_poll_enable/disable? Maybe it should not be poll
enable/disable at all, but hpd runtime suspend/resume, and that can do
whatever needs doing internally?

>  
> +	/*
> +	 * Regardless of PME capable path, call the HPD polling disable, the
> +	 * poll_init_work, i915_hpd_poll_detect_connectors reprobe catches the
> +	 * hotplug that occurred while suspended

Ditto about the comment. It's nonsensical.

> +	 */
> +	intel_hpd_poll_disable(display);
> +
> +out:
>  	skl_watermark_ipc_update(display);
>  }

-- 
Jani Nikula, Intel
