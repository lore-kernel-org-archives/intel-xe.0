Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A7CF8851
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E532B10E165;
	Thu, 20 Nov 2025 13:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYA767RF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B5010E165
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763643806; x=1795179806;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=tbQ80UHeE6/ynI1sV1Eiu6OvJnjz+HmOtfMpGXMOzfM=;
 b=EYA767RFn8wZkx8BizIAIc0he6zXxjOzSYhSDSZy2/s6QolWdnZ6RIjY
 CogIe0xsJzU5MNJZSVjmevAjxw3BNEIcFZkAouSmrvqWG/kT9noJyf/ow
 6awgTj8VD7cGna4Pjtog1E4ayMiBmcrlC+T/waivd3OeYC/LdRvuCpk4F
 +yZ+GfNpf+6LgRzYITrgASBpgsvBdvNQrL67lDtNFhwf9zc15TnAacd2k
 qaJwl0Lpu1EqEanXV4hod+Cv6W9s9HR7YWDn9UkT9rA+janjj70qvvNks
 9X5XUN0/+FMPO2FEYc/I3NWDbblJyO94Nz/hJTPRJKd8kaNzImiJJ0S4c w==;
X-CSE-ConnectionGUID: 76/5SH/xR+erUIof5SvZWQ==
X-CSE-MsgGUID: X/gcH8LFRGiZ5v7tq5q3IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65411686"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65411686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:03:25 -0800
X-CSE-ConnectionGUID: 8Rf0ADBxQ1m6YKYicW/n/w==
X-CSE-MsgGUID: iSIo9EWCRVeEYZosQPF6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195500118"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:03:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH CI] drm/i915/cx0: Fix port to PLL ID mapping on BMG
In-Reply-To: <20251120073845.1270159-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251120073845.1270159-1-imre.deak@intel.com>
Date: Thu, 20 Nov 2025 15:03:21 +0200
Message-ID: <df4e37461b9e9aaf564e8fecb917849dcb65aaf7@intel.com>
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

On Thu, 20 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:

Commit message?


> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 7 ++++---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 9 +++++----
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 96fcad6dbb2f4..8471bdab5c62f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4294,9 +4294,10 @@ static void mtl_ddi_cx0_get_config(struct intel_encoder *encoder,
>  }
>  
>  /*
> - * Get the configuration for either a port using a C10 PHY PLL, or in the case of
> - * the PTL port B eDP on TypeC PHY case the configuration of a port using a C20
> - * PHY PLL.
> + * Get the configuration for either a port using a C10 PHY PLL, or a port using a
> + * C20 PHY PLL in the cases of:
> + * - BMG port A/B
> + * - PTL port B eDP over TypeC PHY
>   */
>  static void mtl_ddi_non_tc_phy_get_config(struct intel_encoder *encoder,
>  					     struct intel_crtc_state *crtc_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 6d7d5394713d6..8ae8cc7ad79d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -206,7 +206,7 @@ enum intel_dpll_id icl_tc_port_to_pll_id(enum tc_port tc_port)
>  enum intel_dpll_id mtl_port_to_pll_id(struct intel_display *display, enum port port)
>  {
>  	if (port >= PORT_TC1)
> -		return icl_tc_port_to_pll_id(intel_port_to_tc(display, port));
> +		return icl_tc_port_to_pll_id(port - PORT_TC1 + TC_PORT_1);
>  
>  	switch (port) {
>  	case PORT_A:
> @@ -3507,9 +3507,10 @@ static int icl_get_tc_phy_dplls(struct intel_atomic_state *state,
>  }
>  
>  /*
> - * Get the PLL for either a port using a C10 PHY PLL, or in the
> - * PTL port B eDP over TypeC PHY case, the PLL for a port using
> - * a C20 PHY PLL.
> + * Get the PLL for either a port using a C10 PHY PLL, or for a port using a
> + * C20 PHY PLL in the cases of:
> + * - BMG port A/B
> + * - PTL port B eDP over TypeC PHY
>   */
>  static int mtl_get_non_tc_phy_dpll(struct intel_atomic_state *state,
>  				      struct intel_crtc *crtc,

-- 
Jani Nikula, Intel
