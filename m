Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F64C98324
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 10:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE5910F9F8;
	Fri, 25 Sep 2026 10:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBNA84yK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CB210F9FB;
 Fri, 25 Sep 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333584; x=1821869584;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ffg2GJFaozH6mYk88vL/xdEylFY8GxiTy7F5525SRTQ=;
 b=HBNA84yKQ9FufqKNYSijfJyQWxLyZT3LicJY6pYP136bRWTGh9ONkpFn
 VcgEXEIpMOICLNtk2RTXGgqgWme1UIRWPDbCljw95ljOBfZ1vw8XmbIn7
 AehktCiQzAFhfcYkw09Z94Y0gsScmzuVO3VQ1BhQBeydZQOPdkljIMYNc
 TCViwp4/IjtnCsXS1qtBKPG1bsCyCLVIskvMTwEUkk+3mai8C4ECcfnWN
 S/Dgnyye/cjsArgaNRytvvjAuN66O0qzy7vCcvz4sa2MgFclLkriN6fkg
 7LE3JbZvTlUr6d67hXH529PSnu4yAcdHD+i6hFXrZSTqVhgT378hJtc5D A==;
X-CSE-ConnectionGUID: v8MatA4GS3KwNXBrkOlQdw==
X-CSE-MsgGUID: OipCZE7fSxeUJFyvq8XD7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101644671"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="101644671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:53:03 -0700
X-CSE-ConnectionGUID: S2Mf055STTiq9U4ubpfzHg==
X-CSE-MsgGUID: tLof0aHwQFqeLfGrKAbJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="270782505"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:53:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 animesh.manna@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/cmtg: Select the right CMTG vblank for DC3co
In-Reply-To: <20260924055734.2138787-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
 <20260924055734.2138787-2-suraj.kandpal@intel.com>
Date: Fri, 25 Sep 2026 13:52:58 +0300
Message-ID: <0c4a6a137ef79510277e715bb55570310181d28b@intel.com>
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

On Thu, 24 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> The DC3co enable state change is double buffered on a CMTG delayed
> vblank, and CHICKEN_DCPR_1 bit 5 picks which CMTG that is. We never
> programmed it, so CMTG B setups ended up using CMTG A's vblank and only
> worked by virtue of the reset value.
>
> Bspec: 75253
> Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cmtg.c         | 2 ++
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
> index 3c0f5b2fb2e7..7db642b2c3f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cmtg.c
> +++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
> @@ -368,6 +368,8 @@ static void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
>  	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>  	u32 interrupt_mask = 0;
>  
> +	intel_de_rmw(display, GEN8_CHICKEN_DCPR_1, DC3CO_CMTG_VBLANK_SELECT,
> +		     cpu_transcoder == TRANSCODER_B ? DC3CO_CMTG_VBLANK_SELECT : 0);
>  	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
>  	intel_de_rmw(display, CMTG_SCANLINE_GB1(cpu_transcoder), 0, CMTG_HW_GB_ENABLE);
>  	crtc->cmtg.enabled = true;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 8251ec15190b..6ac615087e0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -413,6 +413,7 @@
>  #define   _LATENCY_REPORTING_REMOVED_PIPE_C	REG_BIT(25)
>  #define   _LATENCY_REPORTING_REMOVED_PIPE_B	REG_BIT(24)
>  #define   _LATENCY_REPORTING_REMOVED_PIPE_A	REG_BIT(23)
> +#define   DC3CO_CMTG_VBLANK_SELECT		REG_BIT(5)

That's between macros that belong together.

>  #define   LATENCY_REPORTING_REMOVED(pipe)	_PICK((pipe), \
>  						      _LATENCY_REPORTING_REMOVED_PIPE_A, \
>  						      _LATENCY_REPORTING_REMOVED_PIPE_B, \

-- 
Jani Nikula, Intel
