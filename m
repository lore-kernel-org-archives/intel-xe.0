Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1153DCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052810E2DF;
	Fri, 16 Oct 2026 03:05:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F1410E2CB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792119950; x=1823655950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jTCh2bS40kQa/l8YU99NS13CWfF4zltr6FA2poT8OEA=;
 b=dute6ja46wDkLiPvNiEjcYN8dLOBzyMU/5o8zwbxIvgA9hepC/Jvrpr3
 fEktI5jv3HnGwtDGq7rvW1y9yMGoOtmNrHsC17rkwTrkJCpvbpHFabUmg
 XYVhWTq3+DCOBsCkAotCCH3QWWLXFiGTU3VjVPQIFbH+vSUsQ+knAO+GF
 THO4e81Cgl5Hure6h/vryylYz8KrowChVMXAKUJAy3+9m+lhy8+hJCoSD
 Yq5yE6T0+/Z/yoO06xMZ9cYMWcwhoNkLlqAcNjTee+6kVmd8GdnF2ocO6
 /5IkeLavd1BYy7n7yBkXSPT67G8AZepZp6F9UImrQSOtA46XcT3+VjbMy A==;
X-CSE-ConnectionGUID: gz6/ZK8BR8K3YhA2jmIjZw==
X-CSE-MsgGUID: ILrgxNQqSVWtPZdDbZAjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="897888"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="897888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:05:49 -0700
X-CSE-ConnectionGUID: XdXuiK/lT4S/lSscaRtsHQ==
X-CSE-MsgGUID: rtgox6tJQ4uHUxdNgSiZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2200180"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:05:46 -0700
Date: Fri, 16 Oct 2026 05:05:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 12/12] drm/xe/xe_ras: Report correctable errors using
 SIGID
Message-ID: <atGUh1N45hl6wzoU@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-26-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009104602.1075405-26-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:15PM +0530, Badal Nilawar wrote:
> Use xe_log_* helper to report correctable errors.
> 
> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
> v4:
>  - Pass structured log component to xe_log_from() (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index af2970941b59..9df2e8942bda 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <linux/bitfield.h>
> +
>  #include "xe_configfs.h"
>  #include "xe_cper.h"
>  #include "xe_debugfs.h"
> @@ -216,6 +218,12 @@ static u8 ras_sev_to_cper_sev(u8 ras_sev)
>  	}
>  }
>  
> +static u16 ras_comp_to_log_comp(u8 component)
> +{
> +	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
> +	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
> +}
> +
>  static inline const char *sev_to_str(u8 severity)
>  {
>  	if (severity >= XE_RAS_SEV_MAX)
> @@ -459,8 +467,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  		if (!ras_counter_is_valid(xe, &errors[id]))
>  			continue;
>  
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),
> +			    ras_comp_to_log_comp(component),
> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");

Please add a reference log in commit message, so we don't leave people
guessing (in all patches).

Raag

>  		/* Send event once per component */
>  		if (sent & BIT(component))
> -- 
> 2.54.0
> 
