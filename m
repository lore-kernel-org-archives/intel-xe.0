Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F5CCD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 13:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9EC10E71D;
	Mon, 11 May 2026 13:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgoROtAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4C10E549;
 Mon, 11 May 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778505847; x=1810041847;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=GK/B3DlXW3lRPywOOkaR03IAPrX9KenXMdrIUbgApdg=;
 b=UgoROtAZ9F4ntC4n9CDcLaoU/NPc2yDBUSdhbCW99ocs2FnOk1KeUNTE
 0JBfWo8k5h5CGfakdd14fp/rdvr6R7tJmUOsS7D6lCcGjWnHW/aXDhkzs
 4rBy6vPxM2W9weoN3/IkRIiMEDkcoXZQvMs4L6JKgES+Q8BVOJ4Uh+BSt
 gvSlk8RG9i+IVuHyl7DWRBuSxm8VxV/pcDPcrbg8lKPPA+9aTggr0a+Ra
 HYNhK6AYCV30Lz7XBBxROOO9jvs+BucLOgYRfYAdAxl4tR5Z29ia45Zwx
 229a7llxofai1m9pebvj20Z7rw+NHSS7x1rnKMc084OB3YC+A2UQSsnQh w==;
X-CSE-ConnectionGUID: 6Q9azZvfSfu2mjzrtIYW0w==
X-CSE-MsgGUID: iKfZSimuTz6m/hbPAgWP3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79112646"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79112646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:24:07 -0700
X-CSE-ConnectionGUID: fHyHMPuwScOUOAAZClGkjA==
X-CSE-MsgGUID: 6oWP56s+RgSOGJrfyA3tWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241807027"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:24:05 -0700
Date: Mon, 11 May 2026 15:24:03 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-15?Q?Jouni_H=F6gander?= <jouni.hogander@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/i915/psr: Block DC states on vblank enable when
 Panel Replay supported
In-Reply-To: <20260511121551.2373824-1-jouni.hogander@intel.com>
Message-ID: <6e9aff22-6ca1-92cb-c8c0-3fcd2fcfaef3@intel.com>
References: <20260511121551.2373824-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-248716376-1778505529=:541093"
Content-ID: <1cd4dfa7-81d2-5fb9-3f91-fb45c814f245@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-248716376-1778505529=:541093
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <03fd19ef-4622-1089-a705-3c1166dc9982@intel.com>

On Mon, 11 May 2026, Jouni Högander wrote:
> Currently we are blocking DC states only when Panel Replay is enabled on
> vblank enable. It may happen that Panel Replay is getting enabled when
> vblank is already enabled. Fix this by blocking DC states always if Panel
> Replay is supported.
>
> While at it take care of possible dual eDP case by looping all encoders
> supporting PSR.
>
> Fixes: 0c427ac78a1d ("drm/i915/psr: Add interface to notify PSR of vblank enable/disable")
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_psr.c | 19 ++++++++++---------
> 1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 9958230a3dd9..657b1614cd65 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -4141,32 +4141,33 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
> 					    bool enable)
> {
> 	struct intel_encoder *encoder;
> +	bool block_dc_states = false;
>
> 	for_each_intel_encoder_with_psr(display->drm, encoder) {
> 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>
> 		mutex_lock(&intel_dp->psr.lock);
> -		if (intel_dp->psr.panel_replay_enabled) {
> -			mutex_unlock(&intel_dp->psr.lock);
> -			break;
> -		}
> +		if (CAN_PANEL_REPLAY(intel_dp))
> +			block_dc_states = true;
>
> -		if (intel_dp->psr.enabled && intel_dp->psr.pkg_c_latency_used)
> +		if (intel_dp->psr.enabled && !intel_dp->psr.panel_replay_enabled &&
> +		    intel_dp->psr.pkg_c_latency_used)
> 			intel_psr_apply_underrun_on_idle_wa_locked(intel_dp);
>
> 		mutex_unlock(&intel_dp->psr.lock);
> -		return;
> 	}
>
> 	/*
> 	 * NOTE: intel_display_power_set_target_dc_state is used
> -	 * only by PSR * code for DC3CO handling. DC3CO target
> +	 * only by PSR code for DC3CO handling. DC3CO target
> 	 * state is currently disabled in * PSR code. If DC3CO

Here '*' could be dropped as well. Anyways it doesn't make much
difference since next patch will remove the whole block.

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.co>

BR,
Micha³

> 	 * is taken into use we need take that into account here
> 	 * as well.
> 	 */
> -	intel_display_power_set_target_dc_state(display, enable ? DC_STATE_DISABLE :
> -						DC_STATE_EN_UPTO_DC6);
> +	if (block_dc_states)
> +		intel_display_power_set_target_dc_state(display, enable ?
> +							DC_STATE_DISABLE :
> +							DC_STATE_EN_UPTO_DC6);
> }
>
> static void
> -- 
> 2.43.0
>
>
--8323329-248716376-1778505529=:541093--
