Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8BDCF07C3
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 08:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711610E2B3;
	Thu, 10 Oct 2024 08:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMLkKN27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE94A10E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728548991; x=1760084991;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4F/YSIFvKYCGydjALU9IDXpgTn9375mpU0oWxMW4yZ8=;
 b=cMLkKN27SSr3Tql9f1d3nXrGakubcjbgkKrXiMLRg+nPZbj+AYQkFXYW
 HnVZu9ApXXAKe4AtYxZu6JQXWm0bJeZaeIeLfOXvcsyNCN9YcS8kQsAuS
 kUzSjrRVgqdqM0+/8LrRBSOnG4yS+lQVGMaWtpFiOXhBU0cYFNH+t/aqu
 /4jZ8DIzaND+fuokhWb8mZm2yRDl8vlgiQAxuvhvM8VKLPa0GCBe3lMUv
 rgnUcd9b6Po5Frx5W1I0+IN3xj/Yn3Vj17b2On1fuPHu8w0f2MRhHKlpN
 e5g/2F1kjUdCcZ9qoGbTM3npL3Sbwt4y5xXSRs52mcvySS7EXWnSCOKoY Q==;
X-CSE-ConnectionGUID: H0iJvG+WRHC8Z2W+CzlazA==
X-CSE-MsgGUID: LEEO89HxR+qTaSSENOXgvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31787591"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31787591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:29:50 -0700
X-CSE-ConnectionGUID: KMTDTm0BQV2FaqyfA6NBgQ==
X-CSE-MsgGUID: /jLVtl7gRoG8zSF73i0VJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="107253068"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:29:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, jouni.hogander@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/psr: Implement WA to help reach PC10
In-Reply-To: <20241006164934.1689930-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003145337.1673715-2-suraj.kandpal@intel.com>
 <20241006164934.1689930-2-suraj.kandpal@intel.com>
Date: Thu, 10 Oct 2024 11:29:45 +0300
Message-ID: <87y12w743q.fsf@intel.com>
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

On Sun, 06 Oct 2024, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> +static bool
> +intel_psr_is_dc5_entry_possible(struct intel_display *display,
> +				struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *intel_crtc;

Always struct intel_crtc *crtc;

> +
> +	if ((display->power.domains.target_dc_state &
> +	     DC_STATE_EN_UPTO_DC5_DC6_MASK) == 0)
> +		return false;
> +
> +	if (!crtc_state->has_psr && !crtc_state->has_sel_update &&
> +	    !crtc_state->has_panel_replay)
> +		return false;
> +
> +	for_each_intel_crtc(display->drm, intel_crtc) {
> +		struct drm_crtc *crtc = &intel_crtc->base;

Just don't add struct drm_crtc local variables, so you don't get the
name conflict.

> +		struct drm_vblank_crtc *vblank;
> +		struct intel_encoder *encoder;
> +
> +		if (!intel_crtc->active)
> +			continue;
> +
> +		vblank = drm_crtc_vblank_crtc(crtc);
> +
> +		if (vblank->enabled)
> +			return false;
> +
> +		for_each_encoder_on_crtc(display->drm, crtc, encoder)
> +			if (encoder->type != INTEL_OUTPUT_EDP ||
> +			    !CAN_PSR(enc_to_intel_dp(encoder)))
> +				return false;
> +	}
> +
> +	return true;
> +}
> +

[snip]

> +void intel_psr_compute_config_late(struct intel_encoder *intel_encoder,

Always struct intel_encoder *encoder;

> +				   struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_encoder);
> +	struct intel_dp *dp = enc_to_intel_dp(intel_encoder);

Always struct intel_dp *intel_dp;

> +
> +	if (DISPLAY_VER(display) == 20) {
> +		mutex_lock(&dp->psr.lock);
> +		dp->psr.is_dpkgc_configured =
> +			intel_psr_is_dpkgc_configured(display, crtc_state);
> +		dp->psr.is_dc5_entry_possible =
> +			intel_psr_is_dc5_entry_possible(display, crtc_state);
> +		dp->psr.is_wa_delayed_vblank_limit =
> +			intel_psr_check_wa_delayed_vblank(&crtc_state->hw.adjusted_mode);
> +		mutex_unlock(&dp->psr.lock);
> +	}
> +}
> +

-- 
Jani Nikula, Intel
