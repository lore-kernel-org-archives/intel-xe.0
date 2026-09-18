Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16763C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7F10F2E4;
	Fri, 18 Sep 2026 10:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vjl0vNmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE37110F2C1;
 Fri, 18 Sep 2026 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789726116; x=1821262116;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4caR/YRJfQ9hZuxvoEXZ0uKGtIOxawTP6tzRZ2JNq14=;
 b=Vjl0vNmR12fZWGNDShLxmUK+m62UKZdROJ+XoH9GVZdLOZUydpAUaUc+
 awiC2hnO/w7E96enuZKjsLMF7vUUvevGYInxE7x8jW4FVdCD9+9CCZVWq
 3L3LVc7NKGbBJJEdLCx1F3rRvo0LhRcSylapj8b8dP3FuwYIFSJnavekg
 xCsoogC0Scucv63bCxnheoxLCK/RxedbMUcvjxs0+wdZ53IH7MroazaWW
 ZQojnUpAA05BinMhZQHuRnpONBiGQkLo1hVf0uMjbGR9q8cEyTdtv+keL
 ifLSXEYpJ4xmuigzevAQW0JzjVz6cToVG7qAyaARQb3ELsjalPbr5eSyu A==;
X-CSE-ConnectionGUID: Qsh5u0EzTgm4ogBxffHIBg==
X-CSE-MsgGUID: FryG/0FAQ+ysjUQLHoT9Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90353245"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90353245"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:08:35 -0700
X-CSE-ConnectionGUID: U3LuIJBnQV6kEcNXcoi/1g==
X-CSE-MsgGUID: mdSFEWjaRWqoJsS6sDG3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2745244"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:08:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, swati2.sharma@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>, Ramanaidu Naladala
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
In-Reply-To: <20260918063829.1321703-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
Date: Fri, 18 Sep 2026 13:08:30 +0300
Message-ID: <990495a5048d910d16fbd0452db5fbc21cd65701@intel.com>
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

On Fri, 18 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
> for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
> which powers down the PHY. Which means we need to make sure
> "Disable DC5/6" of AUX Programming sequence is honored.
> Disable Dc5/6 when programming AUX.
>
> Bspec: 68851, 68967
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>

Per submitting-patches.rst, "Since Co-developed-by: denotes authorship,
every Co-developed-by: must be immediately followed by a Signed-off-by:
of the associated co-author."

> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
> v1 -> v2:
> -Fix commit message (Arun)
> -Fix the if typo (Arun, Sashiko)
>
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 3cb07b0a901c..879b203f9258 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	u32 aux_clock_divider;
>  	enum intel_display_power_domain aux_domain;
>  	struct ref_tracker *aux_wakeref;
> +	struct ref_tracker *dc_off_wakeref = NULL;
>  	struct ref_tracker *pps_wakeref = NULL;
>  	int i, ret, recv_bytes;
>  	int try, clock = 0;
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  
>  	aux_wakeref = intel_display_power_get(display, aux_domain);
>  
> +	if (HAS_LT_PHY(display))
> +		dc_off_wakeref = intel_display_power_get(display, POWER_DOMAIN_DC_OFF);
> +
>  	/*
>  	 * The PPS state needs to be locked for:
>  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (pps_wakeref)
>  		intel_pps_unlock(intel_dp, pps_wakeref);
>  
> +	if (dc_off_wakeref)
> +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF, dc_off_wakeref);
> +
>  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
>  out_unlock:
>  	intel_digital_port_unlock(encoder);

-- 
Jani Nikula, Intel
