Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA4EF436B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 15:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE95810EA50;
	Fri, 17 Apr 2026 15:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpg3WgcB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA7F10EA4A;
 Fri, 17 Apr 2026 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776440146; x=1807976146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VSaXQoiojY12yb90IHyvfyEN0giZHo5eSA2uaSQO/pM=;
 b=hpg3WgcBHVzBvPLhQ+lG1ECZeIKvMuK1Z2KyYkhWeUL6MLdCDoMLPS5d
 sSAupbzTF2fTB9tkneGd0owf8porZuhrbO3jR5XEVPrKbLCqWks0jtSI/
 lpW8cS0QNUY/96VELnLasZyYhPiyiiKVCNrztgqCKe2Ex45wEvTzEgFAk
 PbgdSgbuQH6lzA4VDU86RM6mfp9154XnGkRy28xEpq5mJLzfF2ca7Z7VO
 cz8Rw16tzqU6kyrr4ba3IEf6Zndg4gI4ye7yQPagjPQCbtAYYjzMcsHw9
 8NnUzvf7Y/XzJsKhst6ygi8tQxaXuapN/gWarlLLi3HgHHKR88r9cDGUu g==;
X-CSE-ConnectionGUID: KSb1Asu1SAu7SaBXk1493g==
X-CSE-MsgGUID: HFc/F/ZcSd2c+nuNAVQlHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76620152"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="76620152"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 08:35:46 -0700
X-CSE-ConnectionGUID: J2HZmsfnTOu1ZAsTWhcBUg==
X-CSE-MsgGUID: 5rn+4ZJcSryE0w/MWI7xhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="231337475"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.176])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 08:35:43 -0700
Date: Fri, 17 Apr 2026 18:35:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH] drm/i915/dp: Ignore HPD when in DPLL enable/disable cycle
Message-ID: <aeJTTI6kkfMaTk9w@intel.com>
References: <20260417080118.2352283-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417080118.2352283-1-suraj.kandpal@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 17, 2026 at 01:31:18PM +0530, Suraj Kandpal wrote:
> When we are enable/disable DPLL cycle there are chances the connected
> monitors is still sending us HPD signals. This causes us to handle them
> which require DPCD read. These sometimes race with the DPLL getting
> disabled in between causing AUX failures via Timeout.

What does the DPLL have to do with AUX?

> Introduce atomic variable link_teardown which is used to track if
> we are in DPLL enable/disable cycle. We ignore HPDs during this time.
> Re-enable after DPLL is up so that we can avoid populating logs
> with expected logs AUX timeout failures.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c           | 5 +++++
>  drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
>  drivers/gpu/drm/i915/display/intel_dp.c            | 5 +++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 178074316a2c..4a523eb56bc4 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2086,8 +2086,12 @@ static struct intel_dpll *hsw_ddi_get_pll(struct intel_encoder *encoder)
>  void intel_ddi_enable_clock(struct intel_encoder *encoder,
>  			    const struct intel_crtc_state *crtc_state)
>  {
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +
>  	if (encoder->enable_clock)
>  		encoder->enable_clock(encoder, crtc_state);
> +
> +	atomic_set(&dig_port->link_teardown, 0);
>  }
>  
>  void intel_ddi_disable_clock(struct intel_encoder *encoder)
> @@ -3181,6 +3185,7 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
>  					dig_port->ddi_io_power_domain,
>  					wakeref);
>  
> +	atomic_set(&dig_port->link_teardown, 1);
>  	intel_ddi_disable_clock(encoder);
>  
>  	/* De-select Thunderbolt */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c81916761850..f59bbb2fb260 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1985,6 +1985,7 @@ struct intel_digital_port {
>  	enum intel_display_power_domain ddi_io_power_domain;
>  	struct ref_tracker *ddi_io_wakeref;
>  	struct ref_tracker *aux_wakeref;
> +	atomic_t link_teardown;
>  
>  	struct intel_tc_port *tc;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 35b8fb5740aa..9177fe9b3e84 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6889,6 +6889,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
>  	struct intel_dp *intel_dp = &dig_port->dp;
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>  
> +	if (atomic_read(&dig_port->link_teardown)) {
> +		drm_dbg_kms("Ignoring HPD since DPLL is getting disabled\n");
> +		return IRQ_NONE;
> +	}
> +
>  	if (dig_port->base.type == INTEL_OUTPUT_EDP &&
>  	    (long_hpd ||
>  	     intel_display_rpm_suspended(display) ||
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
