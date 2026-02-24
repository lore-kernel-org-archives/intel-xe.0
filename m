Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F2FEFB7F9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 08:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197C910E4D8;
	Tue, 24 Feb 2026 08:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uhz9AuJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4E10E4DB;
 Tue, 24 Feb 2026 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771920795; x=1803456795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8LNxIxfiCC285Pv3YrINYJoJK4jLXts2bnzxZ4SIzbA=;
 b=Uhz9AuJwgyYn96pc+eSohkB4nEnlUD+CJKRN73LBsRDJG2JYnwSGPX1Z
 oVszhdG7caU5Q8pImDkKOjmlhqhkMm8turGtCLMIocVFSmS6aWlIWNLuM
 7juUY6s35B/xTWqpL62a8MkogOjhdMNyS1PhQcXmcECUj2ZQV2GsQQD9p
 RHb0QcEwGlDfcPXi0ykOzMja7st/VfyrOsbBorDa3EMTvJ7K/i3+zH+r3
 /MoLg3+vHFxoBC/VdAnqavC6pARMJDSWgYLalNJeRmidljqvSFcTRncZW
 5KqM4yuCFRxL3ChSRmXxTxU1XGerJ3TViG/qIm9GB5YfH0a5NM3QOqAvO w==;
X-CSE-ConnectionGUID: ZuuzoxQiRfO2MldWBge3fA==
X-CSE-MsgGUID: iACCg81RQS2085h7M9nXog==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95544520"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="95544520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:13:14 -0800
X-CSE-ConnectionGUID: QX8dZIupTYmH5hexSn9Vlw==
X-CSE-MsgGUID: 2itRm7YzTR+r6f0WN6Ureg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215068147"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:13:12 -0800
Date: Tue, 24 Feb 2026 10:13:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH] drm/i915/display: Enable AS SDP Skip Frames
Message-ID: <aZ1dlZbH0h21YoQs@intel.com>
References: <20260223210707.1039982-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223210707.1039982-1-uma.shankar@intel.com>
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

On Tue, Feb 24, 2026 at 02:37:07AM +0530, Uma Shankar wrote:
> Hardware provides mechanism to skip AS SDP for programmed
> number of frames. Enable the same to drive to 1Hz if hardware
> supports it.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 3 +++
>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index b3334bc4d0f9..76a8919cdba2 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -395,6 +395,9 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  			if (crtc_state->disable_as_sdp_when_pr_active)
>  				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>  
> +			if (DISPLAY_VER(display) >= 35)
> +				pr_alpm_ctl |= PR_ALPM_CTL_ASSDP_SKIP_FRAMES(32);

Where did that magic 32 frames come from?

This whole thing seems to involve a lot of details (Bspec:75539)
that someone needs to think through.

There are also some things in the DP 2.1a spec (eg. 2.18.8.1.1
Enabling Autonomous Sink Device Refresh Rate Timing) that seem
relevant for this stuff. Sadly the bspec page makes no mention
of any of this :/

> +
>  			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
>  				       pr_alpm_ctl);
>  		}
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 8afbf5a38335..8c35df795955 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -268,6 +268,8 @@
>  
>  #define _PR_ALPM_CTL_A	0x60948
>  #define PR_ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _PR_ALPM_CTL_A)
> +#define  PR_ALPM_CTL_ASSDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
> +#define  PR_ALPM_CTL_ASSDP_SKIP_FRAMES(val)			REG_FIELD_PREP(PR_ALPM_CTL_ASSDP_SKIP_FRAMES_MASK, val)
>  #define  PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU	BIT(6)
>  #define  PR_ALPM_CTL_RFB_UPDATE_CONTROL				BIT(5)
>  #define  PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE	BIT(4)
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
