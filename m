Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4560DCD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 11:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E9610E575;
	Wed, 10 Jun 2026 11:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="il0Mo4dT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142DA10E575;
 Wed, 10 Jun 2026 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781091166; x=1812627166;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Te6obf/6wFQWXJ1Z31zqcs+ZGC4n7lCn9rO7pYOkNg0=;
 b=il0Mo4dTmvW5cZt/vEQTqyrUcidYlnBH4oX7Cj9/bLxfdtNxWXZk2xgH
 w/d3kH79Ban8rH+cvlZEtKfHxrwDeWAQ8WqUVXk5WIfLIoRMavX1mVcPv
 5NEe4mrWJKa+g9FBmYGujmglTTKjlQtUs993CYnllrqNA8Uu0PACCqHr1
 HnEKNp2xxBADpoUjg/i7TSPek3/gg6AzsqmW/Y5Ye4pK+1ba7r2vXl8xO
 zPF0k6D/Q/+3HSofeEJlJuhvmoQeYrLGz32M4o29fyaYeyEsg1Ic1sMDa
 JAIHRfHGj3ADdhVLyxVLLJ2ZzUbGOE2uTIbVvq4BPX/GbAPlpS5aGEFys w==;
X-CSE-ConnectionGUID: nRpx8fr2TlOKIZrsSTq+1g==
X-CSE-MsgGUID: HW7zGSaARVOYEy/lZSWVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92988477"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92988477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 04:32:44 -0700
X-CSE-ConnectionGUID: s/X0VWy7R9q0YyvPZROOLA==
X-CSE-MsgGUID: Ze4TE5tBQ9qMJ+7DmbczxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243683373"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 04:32:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v8 08/20] drm/i915/vrr: Pass transcoder to
 intel_vrr_set_fixed_rr_timings()
In-Reply-To: <20260603195416.91639-9-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260603195416.91639-1-animesh.manna@intel.com>
 <20260603195416.91639-9-animesh.manna@intel.com>
Date: Wed, 10 Jun 2026 14:32:38 +0300
Message-ID: <4f1a195b98fb31f4cca7fec1580e053966f3025d@intel.com>
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

On Thu, 04 Jun 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 4f16ca4af91f..2daba0c16162 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +#include "intel_display_limits.h"

Don't include headers from headers if it can be avoided.

> +
>  struct drm_connector_state;
>  struct intel_atomic_state;
>  struct intel_connector;
> @@ -42,7 +44,8 @@ int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_state);
>  bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state);
>  void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state);
>  void intel_vrr_transcoder_disable(const struct intel_crtc_state *crtc_state);
> -void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state);
> +void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
> +				    enum transcoder transcoder);
>  void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
>  			 struct intel_crtc *crtc);
>  bool intel_vrr_always_use_vrr_tg(struct intel_display *display);

-- 
Jani Nikula, Intel
