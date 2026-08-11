Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C4C5B572
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 17:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637910E352;
	Tue, 11 Aug 2026 17:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzNZdK8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225710ECF8;
 Tue, 11 Aug 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786468040; x=1818004040;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MNPBqq8TR5qXntDbMQQmo2Qa3aoRFsNPEV1Xpl8FTws=;
 b=QzNZdK8qZad8vOMPU6LjHsRVNpm66qaWL17XIzWa1aBXKx/YDEiRHfdO
 ySL/KKPbAEHzpo8MOD6vf3eFJQ/HHDePNn1dN9dyuAwq2/gllcYRdnvAC
 JTSwVXXlslUwCRAQRLbRXy8cUtv/Oj/qgVGVhGNkPyviPeNxurM8yUjb7
 Pi5a0LwLrL9hOVH4IVoJsHvVPztunXjLEF0YJM4hI579q/NDcZGeJKwF9
 BnlYgCKbICZffSzwICkMUsdDGnQcCjorsqPcl20nIxNPis6WOrQXLZDSq
 Sg3ZIFxOLiGm9GzlrwxDOGt3nQMzJx8YNBz/IjASuMgZAaLYob14byz/7 Q==;
X-CSE-ConnectionGUID: wnPCjOGGRsGqkbfQYteCDw==
X-CSE-MsgGUID: nlBiSoUwQ9WibqQ9qDURlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109799858"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="109799858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:07:19 -0700
X-CSE-ConnectionGUID: mqreKRaWQXiGvx0gdJ+0rA==
X-CSE-MsgGUID: Cu7pIthQT2ePzx1uuXKwwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="262891365"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:07:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/ddi: add helper to compute DDI clock
 frequency
In-Reply-To: <20260811025658.2376173-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260811025658.2376173-1-suraj.kandpal@intel.com>
 <20260811025658.2376173-2-suraj.kandpal@intel.com>
Date: Tue, 11 Aug 2026 20:07:14 +0300
Message-ID: <d76160985b70527e3ba2f2fb7cb772b83c5d26e3@intel.com>
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

On Tue, 11 Aug 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Add intel_ddi_link_symbol_clock() to return the DDI clock frequency for
> a given port clock:
>   DP 8b/10b : rate / 10

rate

>   DP 128b/132b (UHBR) : rate / 32

(10/32) * rate

>   HDMI FRL  : rate / 18

(10/18) * rate

>   HDMI TMDS : rate

>
> The DP case reuses intel_dp_link_symbol_clock().
> This will help in upcoming commits to decide value to be written
> in DDI_CLK_VALFREQ.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi.h |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bf5788c5bbd3..dd9064592ec9 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -1529,6 +1529,17 @@ int intel_ddi_level(struct intel_encoder *encoder,
>  	return level;
>  }
>  
> +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock)
> +{
> +	if (intel_encoder_is_dp(encoder))
> +		return intel_dp_link_symbol_clock(clock);
> +
> +	if (intel_hdmi_is_frl(clock))
> +		return DIV_ROUND_CLOSEST(clock * 10, 18);
> +
> +	return clock;
> +}
> +
>  static void
>  hsw_set_signal_levels(struct intel_encoder *encoder,
>  		      const struct intel_crtc_state *crtc_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.h b/drivers/gpu/drm/i915/display/intel_ddi.h
> index 580ecb09b8b6..239d5a403f91 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.h
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.h
> @@ -81,6 +81,7 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder);
>  int intel_ddi_level(struct intel_encoder *encoder,
>  		    const struct intel_crtc_state *crtc_state,
>  		    int lane);
> +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock);
>  void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
>  				  struct intel_encoder *encoder,
>  				  struct intel_crtc *crtc);

-- 
Jani Nikula, Intel
