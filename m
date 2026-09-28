Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF2CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1533A10E8F7;
	Mon, 28 Sep 2026 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="co6wuq2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13D910E8F1;
 Mon, 28 Sep 2026 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585376; x=1822121376;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZKK7tq8pINb5P6LsGpwXhvKgByJmAk88ZV88PGo38Vk=;
 b=co6wuq2+mtnARuyc4NacYl9m41N7EyxWX0lzyRLYtR7UFoauv9KTrL2j
 8a5YFxTryCdl/Kk1BQ3FX64m3UoV8hkvsdGe9XYKkt2vOtRGwbqLSvGqf
 2tzcg87ZX4IYC7+wEAVxAMX+pPlJRvGEAJpmJ0T7/Zk4U8mr0b6T6tuHy
 4YWnQQGAzFHvFz/quZnV2fYsX5TJGy6QQtSC2DeG9BtRTOa99vclq3MGG
 2rBdP+0/+22MqZVxy50BgM4BuWsB1gu76YiD6xOKwgNgIjpBZZBJVKBFV
 Dy8hlO0l05NvkMhP7E0JntZ6eTWdmd55tdqGIRor4z+va5Eofy9NU5tVT g==;
X-CSE-ConnectionGUID: cusaecKdQbynq+NP33OvCg==
X-CSE-MsgGUID: 72SWFxdxQn2hUVykgWjxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90182384"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90182384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:49:36 -0700
X-CSE-ConnectionGUID: gar7lmF3REyG2euA7115Lg==
X-CSE-MsgGUID: kX55yMhuR/OVLmJyu796dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304476693"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:49:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "arun.r.murthy@intel.comm" <arun.r.murthy@intel.comm>
Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
In-Reply-To: <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Mon, 28 Sep 2026 11:49:31 +0300
Message-ID: <d2d37b6abd46bab14cf6716ff1f8c06c8d06f174@intel.com>
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

On Mon, 28 Sep 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
>> Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
>> override is held
>> 
>> On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it
>> > until
>> > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5 ms
>> > after the last AUX transfer. That is seconds on a typical panel.
>> > The AUX domains now block DC states on Xe3p_LPD, so that reference
>> > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay and
>> > never gets a window, and its residency counter does not increment.
>> > Nothing in the panel power sequence needs DC states off for as long as
>> > the override is held. Take AUX IO instead, which powers up the same
>> > well without blocking DC states, the same split
>> > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers still
>> > take the DC state blocking domain around each transfer.
>> >
>> > Bspec: 49277
>> > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
>> > DC_off")
>> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++----
>> >  1 file changed, 17 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
>> > b/drivers/gpu/drm/i915/display/intel_pps.c
>> > index d4c98b150fa2..bdbaa10bce23 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_pps.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
>> > @@ -11,6 +11,7 @@
>> >  #include "g4x_dp.h"
>> >  #include "intel_de.h"
>> >  #include "intel_display_jiffies.h"
>> > +#include "intel_display_power.h"
>> >  #include "intel_display_power_well.h"
>> >  #include "intel_display_regs.h"
>> >  #include "intel_display_types.h"
>> > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp
>> *intel_dp)
>> >  	return control;
>> >  }
>> >
>> > +static enum intel_display_power_domain
>> > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
>> > +	struct intel_display *display = to_intel_display(intel_dp);
>> > +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
>> > +
>> > +	if (DISPLAY_VER(display) >= 35 && !intel_encoder_is_tc(&dig_port-
>> >base))
>> > +		return intel_display_power_aux_io_domain(display,
>> > +dig_port->aux_ch);
>> 
>> Seems like this is something that the power domain framework should take
>> care of instead of hacking together locally.
>
> Actually it does not at least not for Xe3p which now has DC_OFF when taking AUX domain,
> Because of that when PPS take AUX power domain it also takes DC_OFF(exiting DC states) which is not required
> And since it keeps the reference for longer than what a normal aux transaction would DC3CO does not increment its
> Counter.

I mean the power domain should be modified to take care of this, not
that it should already take care of this.

BR,
Jani.


>
>> 
>> Cc: Imre, which you should pretty much always do when doing anything
>> related to power domains.
>> 
>
> Sure will keep in mind going forward.
>
> Regards,
> Suraj Kandpal
>
>> 
>> BR,
>> Jani.
>> 
>> > +
>> > +	return intel_aux_power_domain(dig_port); }
>> > +
>> >  /*
>> >   * Must be paired with intel_pps_vdd_off_unlocked().
>> >   * Must hold pps_mutex around the whole on/off sequence.
>> > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
>> > *intel_dp)
>> >
>> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
>> >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
>> > -
>> intel_aux_power_domain(dig_port));
>> > +
>> intel_pps_vdd_power_domain(intel_dp));
>> >
>> >  	pp_stat_reg = _pp_stat_reg(intel_dp);
>> >  	pp_ctrl_reg = _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ static
>> > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>> >  	}
>> >
>> >  	intel_display_power_put(display,
>> > -				intel_aux_power_domain(dig_port),
>> > +				intel_pps_vdd_power_domain(intel_dp),
>> >  				fetch_and_zero(&intel_dp-
>> >pps.vdd_wakeref));
>> >  }
>> >
>> > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
>> > *intel_dp)
>> >
>> >  	/* We got a reference when we enabled the VDD. */
>> >  	intel_display_power_put(display,
>> > -				intel_aux_power_domain(dig_port),
>> > +				intel_pps_vdd_power_domain(intel_dp),
>> >  				fetch_and_zero(&intel_dp-
>> >pps.vdd_wakeref));
>> >  }
>> >
>> > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
>> *intel_dp)
>> >  		    pps_name(intel_dp));
>> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
>> >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
>> > -
>> intel_aux_power_domain(dig_port));
>> > +
>> intel_pps_vdd_power_domain(intel_dp));
>> >  }
>> >
>> >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
