Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54846106B528
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D99E10E892;
	Wed, 25 Mar 2026 13:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZjWJA17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95910E88E;
 Wed, 25 Mar 2026 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774443624; x=1805979624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IuVEM4AHi/Q9LIs5AGwvZBQ7/VcF3JuJD7RHrbQeWDA=;
 b=MZjWJA17erWM1mZDqMGRt1orOcmhu/hgohOSoFKozUl4S7xKf+gmplpL
 lv13LPSm9Rw0g3T2uYC/ektQuRv1haL2Yqf3Pw9M01UiUEp7kq20dvhDD
 6Z6mTFoSAdUOatFH+y1TmQzWR5/S+8S6tSldYgL4R8dkjsTkPQquZOMyd
 KJwQ6nf52I49ZSKv3ASqTvtFzCSB4CdYI4fA5lvlJQj7Zrh9RkXg0+fHQ
 rnznZLHJHkhCumBTL2tWsyjN9LLgGMm4fDwffLU4XxmwsFeCTSP3RC+fi
 wRDkEfliq4wh8ukz9cQJz8inFN8IaGWN1Gwr7GujnLBjybRT8AOySjW+H A==;
X-CSE-ConnectionGUID: 2nPTapryQgu5snIIdF/lXA==
X-CSE-MsgGUID: JVUSg7mHTbeSmYh22Xps5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365941"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75365941"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:00:24 -0700
X-CSE-ConnectionGUID: B/8sBhi/RlC+fDc6CbWZmA==
X-CSE-MsgGUID: j/GdxYh4Q5i0tnHSju6fJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229451158"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:00:22 -0700
Date: Wed, 25 Mar 2026 15:00:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH v3 23/26] drm/i915/writeback: Initialize writeback encoder.
Message-ID: <acPcYs-LZiKRPDdd@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
 <20260325110744.1096786-24-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325110744.1096786-24-suraj.kandpal@intel.com>
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

On Wed, Mar 25, 2026 at 04:37:41PM +0530, Suraj Kandpal wrote:
> Call the init function to initialize the writeback encoder
> only for ADLP.

Why only for ADLP?

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4cc3e0779e8a..b4cf7153b7c8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8030,6 +8030,9 @@ void intel_setup_outputs(struct intel_display *display)
>  		intel_dvo_init(display);
>  	}
>  
> +	if (DISPLAY_VER(display) == 13)
> +		intel_writeback_init(display);
> +
>  	for_each_intel_encoder(display->drm, encoder) {
>  		encoder->base.possible_crtcs =
>  			intel_encoder_possible_crtcs(encoder);
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
