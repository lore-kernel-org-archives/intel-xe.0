Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC41CC88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 13:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26310F618;
	Fri, 11 Sep 2026 13:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTDtg2q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4FC10F617;
 Fri, 11 Sep 2026 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789131655; x=1820667655;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NcbRdnmuxOf6k2EwrfUg0myuTh9oSjIdIyrsOTOSbRA=;
 b=hTDtg2q94TnU/vhM1rwh10ypI3wnPYkHPe/GU03eBVJ1X2lHAZaJq4U/
 bMv8dpDzXT1WjFCY5LfIUAKz0Imvo3kHBALSrBNgLU6+KF9Wqwd7Cab0R
 y3X4VpMdQoCQeZ+0E9ebGCak6T9Y64Wy/XW+yKCQd7Xi+AnD+Unpzel6t
 mb6Or5k9H96btDoj3ivJ/ioixNWEeDJsBLFL6B+bBSPrViMtbXd67/Pjf
 b1dcyiSaHaFPpMeISTEnY6Ezd0CWspYNP8njy5QLtT0RoizwaaavDS8m7
 rB7UjZAxvU6Bmtme+QjLO0viYEexJA7VzxSj7UfFLWy7RHHBqFURAdRhq A==;
X-CSE-ConnectionGUID: 6C6QoRmzQIiZuauwEQS6YA==
X-CSE-MsgGUID: Q6fjiLhXRje4T8SI53UVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89623068"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89623068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 06:00:54 -0700
X-CSE-ConnectionGUID: SZ8RgvrqRBe3Oph+BQ97og==
X-CSE-MsgGUID: lVOLs0KDTNqGRxsdhmOIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275438208"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.127])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 06:00:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: Re: [PATCH v5 06/10] drm/i915/hotplug: add helpers to track HPDs
 can generate PME
In-Reply-To: <20260911080448.778316-7-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-7-vinod.govindapillai@intel.com>
Date: Fri, 11 Sep 2026 16:00:49 +0300
Message-ID: <8005a243080166f9f328f7a58af857858626f027@intel.com>
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

On Fri, 11 Sep 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> As NVL+ devices can generate PME from HPDs, introduce a flag to
> keep track of such a capability and helper functions to access
> this flag. The plan is, this flag will be set to true from pm runtime
> suspend if PME is enabled and this flag will cleared on early runtime
> resume unconditionally. This is a place holder for the flag and later
> on this flag will be used for conditional IRQ resets and to decide
> whether to do HPD polling.

What's the rationale for duplicating the state in a flag? Why can't you
use intel_display_rpm_pme_enabled() and have a single point of truth?
This would dodge the extra error path clearing too.

I don't understand.

BR,
Jani.

>
> Bspec: 52979, 52980, 68857, 68867, 68970
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_core.h |  2 ++
>  drivers/gpu/drm/i915/display/intel_hotplug.c      | 10 ++++++++++
>  drivers/gpu/drm/i915/display/intel_hotplug.h      |  3 +++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index c80b4a2f74f9..b3a396800798 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -220,6 +220,8 @@ struct intel_hotplug {
>  	 * cue to ignore the long HPDs and can be set / unset using debugfs.
>  	 */
>  	bool ignore_long_hpd;
> +
> +	bool can_generate_pme;
>  };
>  
>  struct intel_vbt_data {
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> index 970aa95ee344..b24c9f360e24 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -846,6 +846,16 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
>  	}
>  }
>  
> +void intel_hpd_set_pme_capable(struct intel_display *display, bool can_generate_pme)
> +{
> +	display->hotplug.can_generate_pme = can_generate_pme;
> +}
> +
> +bool intel_hpd_can_generate_pme(struct intel_display *display)
> +{
> +	return display->hotplug.can_generate_pme;
> +}
> +
>  /**
>   * intel_hpd_poll_enable - enable polling for connectors with hpd
>   * @display: display device instance
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.h b/drivers/gpu/drm/i915/display/intel_hotplug.h
> index edc41c9d3d65..c57e30f8366b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.h
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.h
> @@ -35,4 +35,7 @@ void intel_hpd_enable_detection_work(struct intel_display *display);
>  void intel_hpd_disable_detection_work(struct intel_display *display);
>  bool intel_hpd_schedule_detection(struct intel_display *display);
>  
> +void intel_hpd_set_pme_capable(struct intel_display *display, bool can_generate_pme);
> +bool intel_hpd_can_generate_pme(struct intel_display *display);
> +
>  #endif /* __INTEL_HOTPLUG_H__ */

-- 
Jani Nikula, Intel
