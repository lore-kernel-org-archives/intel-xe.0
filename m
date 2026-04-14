Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E6F9D0CD
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 13:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F010E5FC;
	Tue, 14 Apr 2026 13:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btaCxH8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0E810E5FC;
 Tue, 14 Apr 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776173488; x=1807709488;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RAGj0BRheN//JbqmKXZg0RPj/DrBZcNxLGNN0k0Sgag=;
 b=btaCxH8tkPQCnASOOIyFykwUwqOwwAtgBCUf3pHdDCOzffBMTnDW/ddq
 5yFSGcympEc3SJhs5vk75BqKAjiNzWtFer+WFoqDNwy6bvwJsL2qbGXUE
 1lVOap8CXuRjEme4eAGbvYg2jQEpkj6C4QKS4uLoldW2JCuya2UsdTS1g
 xQ5UfomrL619+m9f4khXgT4diXSNcQrDVmxmz3DZc8iVeJvI2SkLn9vHL
 IGaKyR/1BuHCnDLvKNcfzHd+7b2N6DUwBbrlBVohkty0aRoIKttpLNnDU
 5ytrmzCM4J77YZaZm4Kkvxs2rUHai5WguZsrkgN3EEj5xD339y/VroLU0 Q==;
X-CSE-ConnectionGUID: ZSzH5oSuRDeYvj0K8lb/DA==
X-CSE-MsgGUID: TKd96YzERdy8KkbFgtj7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102587539"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102587539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:31:28 -0700
X-CSE-ConnectionGUID: YAfTFO8iQC24JH4tiYWksQ==
X-CSE-MsgGUID: /dmoFTEqTIu7Ky/IFfXu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229221824"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:31:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com, Animesh
 Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v4 01/13] drm/i915/cmtg: Add intel_cmtg_is_allowed() for
 CMTG
In-Reply-To: <20260412103712.4021213-2-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260412103712.4021213-1-animesh.manna@intel.com>
 <20260412103712.4021213-2-animesh.manna@intel.com>
Date: Tue, 14 Apr 2026 16:31:21 +0300
Message-ID: <26027f9989a2f963236ac3a41d69ca910d4e7069@intel.com>
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

On Sun, 12 Apr 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> CMTG will be enabled only with DC3co, so add a separate function
> intel_cmtg_is_allowed() to check the prerequisites for enabling CMTG.
> DC3co will be enabled in a separate patch.
>
> v2:
> - Remove separate flag for DC3co from crtc_state. [Uma, Dibin]
>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cmtg.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/display/intel_cmtg.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
> index e1fdc6fe9762..1debed43cf2c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cmtg.c
> +++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
> @@ -16,6 +16,7 @@
>  #include "intel_display_device.h"
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
> +#include "intel_display_types.h"
>  
>  /**
>   * DOC: Common Primary Timing Generator (CMTG)
> @@ -185,3 +186,17 @@ void intel_cmtg_sanitize(struct intel_display *display)
>  
>  	intel_cmtg_disable(display, &cmtg_config);
>  }
> +
> +bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	struct i915_power_domains *power_domains = &display->power.domains;
> +
> +	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
> +	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
> +	    power_domains->target_dc_state == DC_STATE_EN_DC3CO)

intel_cmtg.c has no business accessing struct i915_power_domains members
directly. It belongs to intel_display_power.c.

BR,
Jani.

> +		return true;
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
> index ba62199adaa2..7692cc98cf87 100644
> --- a/drivers/gpu/drm/i915/display/intel_cmtg.h
> +++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
> @@ -7,7 +7,9 @@
>  #define __INTEL_CMTG_H__
>  
>  struct intel_display;
> +struct intel_crtc_state;
>  
>  void intel_cmtg_sanitize(struct intel_display *display);
> +bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
>  
>  #endif /* __INTEL_CMTG_H__ */

-- 
Jani Nikula, Intel
