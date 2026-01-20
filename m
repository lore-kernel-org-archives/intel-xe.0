Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A41D2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 13:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A9710E0E3;
	Tue, 20 Jan 2026 13:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJdk9txj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085710E0E3;
 Tue, 20 Jan 2026 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768917438; x=1800453438;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dZZXOsQ53im/OalCKixm4HW0NZT+PvYhC+KiGyVhPFo=;
 b=GJdk9txjZ/PgH/BRzsz/9ymlQlWN4Z/56sGuTKU7VGl5cl8GMmIy/2h9
 3joiaXBcAmpX3hLOt9PRhS5ON16bCzxSdewtBllPh/seKslj1E5sf0A7V
 vT1Bgysi1sSe2WPfPkTpnufGKZc1MqBED2/5sh/GIHnZhurNtAzxOWLEM
 6bYpHrD19eBRXB4345VhX2IxTEGPeYcj1CtvhK1AVI3sceW2TQFj0sTx7
 8tJ7do+MlyEFRgLg5KaP19m+AS+aA+XcwylbTtmPQ6rAe4DdX3H1zEkV3
 WzpQjiryOStYmMdH5CSka8FvIPa0YiKbix3aOOmAFLpkAjvNweFoUTU4p Q==;
X-CSE-ConnectionGUID: sEhNKalSScq0sTlODbs9Ng==
X-CSE-MsgGUID: CT+f35f8Qv2lu5DQU7+7jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57682757"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="57682757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:57:17 -0800
X-CSE-ConnectionGUID: Gtq5IAOmTY+uodmNSJT+eA==
X-CSE-MsgGUID: 3NVLpqYtQWGjMueLtsdV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205932941"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:57:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Mika Kahola <mika.kahola@intel.com>, Suraj
 Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 1/3] drm/i915/pps: Enable panel power earlier
In-Reply-To: <20260116085455.571766-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260116085455.571766-1-suraj.kandpal@intel.com>
 <20260116085455.571766-2-suraj.kandpal@intel.com>
Date: Tue, 20 Jan 2026 15:57:11 +0200
Message-ID: <36f6ab153c13cf5bf0e4db6969a95db9c3eb6ddb@intel.com>
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

On Fri, 16 Jan 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> From: Mika Kahola <mika.kahola@intel.com>
>
> Move intel_pps_on() to intel_dpll_mgr PLL enabling
> .enable function hook to enable panel power earlier.
> We need to do this to make sure we are following the
> modeset sequences of Bspec. This had changed when we
> moved the PLL PHY enablement for CX0 from .enable_clock
> to dpll.enable hook

So I really hate this.

Yeah, maybe it follows the spec now, but what connection does the DPLL
manager have with the panel power sequencing?

Absolutely nothing.

The DPLL manager has no business calling PPS functions.

Currently only the g4x and DDI encoder code does PPS power calls, and
they're the only ones who should manage PPS.

>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>
> v2 -> v3: 
> - Rather than splitting the PHY enablement sequence, enable PPS
> earlier (Imre)

Please point me at the review comment. I couldn't find anything that
would suggest moving the PPS calls to the DPLL manager.

Please let's not do this.

BR,
Jani.


>   
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 6 ++++--
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 5 +++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index cb91d07cdaa6..1784fa687c03 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2653,8 +2653,10 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	/* 3. Select Thunderbolt */
>  	mtl_port_buf_ctl_io_selection(encoder);
>  
> -	/* 4. Enable Panel Power if PPS is required */
> -	intel_pps_on(intel_dp);
> +	/*
> +	 * 4. Enable Panel Power if PPS is required
> +	 *    moved to intel_dpll_mgr .enable hook
> +	 */
>  
>  	/* 5. Enable the port PLL */
>  	intel_ddi_enable_clock(encoder, crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 9aa84a430f09..b5655c734c53 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -40,6 +40,7 @@
>  #include "intel_hti.h"
>  #include "intel_mg_phy_regs.h"
>  #include "intel_pch_refclk.h"
> +#include "intel_pps.h"
>  #include "intel_step.h"
>  #include "intel_tc.h"
>  
> @@ -4401,6 +4402,10 @@ static void mtl_pll_enable(struct intel_display *display,
>  	if (drm_WARN_ON(display->drm, !encoder))
>  		return;
>  
> +	/* Enable Panel Power if PPS is required */
> +	if (intel_encoder_is_dp(encoder))
> +		intel_pps_on(enc_to_intel_dp(encoder));
> +
>  	intel_mtl_pll_enable(encoder, pll, dpll_hw_state);
>  }

-- 
Jani Nikula, Intel
