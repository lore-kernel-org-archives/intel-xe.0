Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C481C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7A910E822;
	Mon, 28 Sep 2026 08:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVmoHw4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3B10E822;
 Mon, 28 Sep 2026 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790584755; x=1822120755;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=G0ULH/51lZXqIS9ryaYXki+4QzyHB/vQp6N79/5D50E=;
 b=eVmoHw4v0HZE9Ziu8Ryws1uiOgjiVVOImZa8zP/Lpw5P8wmsnQWsQRbh
 YImR9qGi9j/EKC9r0wAQPF+R8f3t0q030FiAqW4J3gJW4X1iFdP0arE+3
 zgujklrJ3w7IqqhC/QECjz+GEn1agbY5Ileu2AtTwRnfz+3e/aMOOwiFr
 EWzSbCPseO0j48EF/8LW/XKaM1WKyZnsI8BzloPMAbeQXH5qec6YlY88V
 QZxwwXUa+5bfpWMl3z/aKwxvL0nGbD4+U4Aq1NGXVaTQpLuhQypZWFO/D
 QSUkN5SnKFj1G/BYXqJV1kGD4RR2iUyRnIjZium1UjgKSHJYFLGQcDPvM Q==;
X-CSE-ConnectionGUID: 1g6UIj1lT/mYMVW9ITeqkg==
X-CSE-MsgGUID: puyrwZ21Ry+lo61zDnLjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90405286"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90405286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:39:15 -0700
X-CSE-ConnectionGUID: qTOkn1kjQ9mioatiFqQnSg==
X-CSE-MsgGUID: guKxGBR2QvKAe7EBKqKP+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274222503"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:39:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.comm, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
In-Reply-To: <20260928061211.2764543-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
Date: Mon, 28 Sep 2026 11:39:10 +0300
Message-ID: <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
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

On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it until
> edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5 ms after
> the last AUX transfer. That is seconds on a typical panel.
> The AUX domains now block DC states on Xe3p_LPD, so that reference keeps
> DC_off up for all of it. DC3co arms with a 1 ms put delay and never gets a
> window, and its residency counter does not increment.
> Nothing in the panel power sequence needs DC states off for as long as the
> override is held. Take AUX IO instead, which powers up the same well
> without blocking DC states, the same split intel_ddi_main_link_aux_domain()
> makes for PSR. AUX transfers still take the DC state blocking domain around
> each transfer.
>
> Bspec: 49277
> Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to DC_off")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index d4c98b150fa2..bdbaa10bce23 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -11,6 +11,7 @@
>  #include "g4x_dp.h"
>  #include "intel_de.h"
>  #include "intel_display_jiffies.h"
> +#include "intel_display_power.h"
>  #include "intel_display_power_well.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp *intel_dp)
>  	return control;
>  }
>  
> +static enum intel_display_power_domain
> +intel_pps_vdd_power_domain(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +
> +	if (DISPLAY_VER(display) >= 35 && !intel_encoder_is_tc(&dig_port->base))
> +		return intel_display_power_aux_io_domain(display, dig_port->aux_ch);

Seems like this is something that the power domain framework should take
care of instead of hacking together locally.

Cc: Imre, which you should pretty much always do when doing anything
related to power domains.


BR,
Jani.

> +
> +	return intel_aux_power_domain(dig_port);
> +}
> +
>  /*
>   * Must be paired with intel_pps_vdd_off_unlocked().
>   * Must hold pps_mutex around the whole on/off sequence.
> @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
>  
>  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
>  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> -							    intel_aux_power_domain(dig_port));
> +							    intel_pps_vdd_power_domain(intel_dp));
>  
>  	pp_stat_reg = _pp_stat_reg(intel_dp);
>  	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
> @@ -862,7 +875,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>  	}
>  
>  	intel_display_power_put(display,
> -				intel_aux_power_domain(dig_port),
> +				intel_pps_vdd_power_domain(intel_dp),
>  				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
>  }
>  
> @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp *intel_dp)
>  
>  	/* We got a reference when we enabled the VDD. */
>  	intel_display_power_put(display,
> -				intel_aux_power_domain(dig_port),
> +				intel_pps_vdd_power_domain(intel_dp),
>  				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
>  }
>  
> @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
>  		    pps_name(intel_dp));
>  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
>  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> -							    intel_aux_power_domain(dig_port));
> +							    intel_pps_vdd_power_domain(intel_dp));
>  }
>  
>  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)

-- 
Jani Nikula, Intel
