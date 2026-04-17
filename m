Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A38F8DFDF
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6B710E9A0;
	Fri, 17 Apr 2026 08:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eablg+Uh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2C210E99C;
 Fri, 17 Apr 2026 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414442; x=1807950442;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wXmPWZ5PZc9vldD23K6g3/1eYbNT73RvmHFtWmcTfsQ=;
 b=eablg+Uh9wKUr7y75tz4AXYBHOb74fOwtWeuZwNc3fXSNlg8fQF+UU2R
 dhIkNEQz2C6TF1esGo8dSgzAWDC8pNQhvdjUiGgOhgSvXxhM3QJHq/cV9
 zk5vq2jqRfYdyBRFFtHhowJ7WduOdihm+lQvGqJBOrRgVxZxK3e7j7bj/
 ayUBextzQX4OXIyZjA3K+3vUjWTHpCVn0hz7O4b1VKcn/Bm0Dzk7WTG0i
 IN2XavK0FTSlbAFKCsW916FDE0PJ8eJV43gTXYzEzwR5q5PmmNxniaqe6
 GqvDfMMJq5oAeQ0iTnANfzE0ht3hp9pVFITG8WmajQc2Ds+i9cicCsbsA Q==;
X-CSE-ConnectionGUID: DrxsYpDVRaWL7wLXy3Ph+A==
X-CSE-MsgGUID: w4ev0/thRZK3yHBH0srqIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81024601"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81024601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:27:22 -0700
X-CSE-ConnectionGUID: NWv8zDpGQrytb+W7ZUC0LQ==
X-CSE-MsgGUID: JFGPjrmhTJqeQ2uwfwzyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="254198093"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:27:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, swati2.sharma@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Ignore HPD when in DPLL enable/disable cycle
In-Reply-To: <20260417080118.2352283-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417080118.2352283-1-suraj.kandpal@intel.com>
Date: Fri, 17 Apr 2026 11:27:17 +0300
Message-ID: <a99f71916d52b29e300ecac2207e0fb501d6a4a5@intel.com>
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

On Fri, 17 Apr 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> When we are enable/disable DPLL cycle there are chances the connected
> monitors is still sending us HPD signals. This causes us to handle them
> which require DPCD read. These sometimes race with the DPLL getting
> disabled in between causing AUX failures via Timeout.
> Introduce atomic variable link_teardown which is used to track if
> we are in DPLL enable/disable cycle. We ignore HPDs during this time.
> Re-enable after DPLL is up so that we can avoid populating logs
> with expected logs AUX timeout failures.

How is this not racy?

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

-- 
Jani Nikula, Intel
