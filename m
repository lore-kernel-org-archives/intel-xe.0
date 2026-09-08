Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F772C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B7310ECD1;
	Tue,  8 Sep 2026 15:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M77Hd/MI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E438E10EC9A;
 Tue,  8 Sep 2026 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788881714; x=1820417714;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u+fwEMQ3rZavDcsCI75TLVv+//iAGPJVv/NoxhmOD54=;
 b=M77Hd/MI17qGCjFF/eHe2He9rAc2G5cHGUk5I7dNTXIRG2gWdp7ki0yC
 k9U0Hz+Bf8GbtxJdkrzoQKdZubiYIL5/K08hjL7RlJtqfXD5XkvlFrSgl
 OzODtkuvOFKVqoRVYLyLDr/mU/rKLbRThav94Iui145tq4QDBtUT4n/cI
 Ff2dV7RwoRv+ggFFMhFkE3E5dUrT3OnMKpfdQiYVvIPNtt4Jk6RgJA9Vc
 74CtYQ9R2XlkBNHW1xc70fEj9+tl2ANp26tt1Imb+sNrFh0vrWZKqPQeC
 CsAMaTLxuoejNVGDnit60S1SOH5VlvgY5vlICld7uzLgySvQuoujQixt/ A==;
X-CSE-ConnectionGUID: d0t+ioYOR2qDQ8DvhTGBfw==
X-CSE-MsgGUID: +eld6BTZSbqSv84EAeBM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114826677"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="114826677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:35:13 -0700
X-CSE-ConnectionGUID: 0+lt2V4nSyGjn/GqPuADLQ==
X-CSE-MsgGUID: FGr7JByRSxa3COmoz8Q0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267368801"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:35:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
In-Reply-To: <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
Date: Tue, 08 Sep 2026 18:35:09 +0300
Message-ID: <c90084aa168dbcbaab68732b26b42c29ebcf2df5@intel.com>
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

On Thu, 11 Jun 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> The Adaptive Sync SDP is currently the only packet with a programmable
> transmission line.
>
> Make a structure struct intel_dip for Data Island Packets. Add a member to
> track Adaptive-Sync SDP transmission line. Include the new member in the
> pipe configuration comparison.
>
> This will pave the way for supporting more packets' programmable
> transmission lines, including the common base SDP transmission line
> introduced with Xe3p_lpd.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dip.h           | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display.c       | 2 ++
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 +++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
> index 25bae4a04d6b..37507ac3e645 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -35,4 +35,12 @@ struct intel_crtc_state;
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
>  void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
>  
> +struct intel_dip {
> +	/*
> +	 * DIP Transmission line, relative to the Vtotal.
> +	 * The programmed transmit line is (Vtotal - value)
> +	 */
> +	u16 emp_as_sdp_tl;
> +};
> +
>  #endif /* __INTEL_DIP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index bdf02b67c1d8..c84ee0e865ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5507,6 +5507,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>  
>  	PIPE_CONF_CHECK_I(set_context_latency);
>  
> +	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
> +
>  #undef PIPE_CONF_CHECK_X
>  #undef PIPE_CONF_CHECK_I
>  #undef PIPE_CONF_CHECK_LLI
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index aa4772a1c208..6cc3a4c2f17c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -46,6 +46,7 @@
>  
>  #include "i915_gtt_view_types.h"
>  #include "intel_bios.h"
> +#include "intel_dip.h"

I understand the motivation, but I'd rather keep the struct here in
intel_display_types.h than blow up the includes. There are already too
many includes *and* this file is included just about everywhere.

The point is, if you change anything unrelated to struct intel_dip in
intel_dip.h, you'll end up rebuilding pretty much all the display code,
and it'll slow everyone down.

C really sucks at this. And embedding a lot of structs makes it worse.


BR,
Jani.



>  #include "intel_display.h"
>  #include "intel_display_conversion.h"
>  #include "intel_display_limits.h"
> @@ -1301,6 +1302,8 @@ struct intel_crtc_state {
>  		struct drm_dp_as_sdp as_sdp;
>  	} infoframes;
>  
> +	struct intel_dip dip;
> +
>  	u8 eld[MAX_ELD_BYTES];
>  
>  	/* HDMI scrambling status */

-- 
Jani Nikula, Intel
