Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E908F10A88C3
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FBC10E386;
	Thu, 26 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkCejERZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0530410E382;
 Thu, 26 Mar 2026 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774538187; x=1806074187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nmD+vs1dQXoifOb4XQPPe7WqipGjcW2PD7Choh6tIJ0=;
 b=SkCejERZCbvanlGPWX4P98xcPtEizZ+EoMO4PeUKjI/ZhAxKP1xnSeXx
 9hsvg9vHcc0bqZObqDow+BBwajrIu9mfD2un3eLao+yIrjsQ678CsxE6Z
 zM5J5ObcVcUlgLw/IhUeTieJdmFuvBVKRG5ndVWoJlq1aKQz4cTtvoy6y
 LE6jmI9osFbiwxF/kYb7NvxFj1gJJ6O7eVniKCHHw+K7FWPBTBpBvIoLH
 +k0UrSd1tG2G4ls+p8e0HXWnCm1FPcderiOD95bxG6l4g/8eJIvAbPTzw
 D9bKj9h9s/F3ArrbiBWNg4fIkE3eMDJL9FrgAeLV69wXOPQOi3UW8haHD g==;
X-CSE-ConnectionGUID: dHd1ntr+R/6tgNMACVGbQw==
X-CSE-MsgGUID: mp8wySvmTQaxjTHME7tOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86676082"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86676082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:16:26 -0700
X-CSE-ConnectionGUID: vOItwcGhT+iRsLY+41O8fA==
X-CSE-MsgGUID: cOBIXhkqRZeEhxgAxOrYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225289207"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:16:25 -0700
Date: Thu, 26 Mar 2026 17:16:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915/dsi: Make 'clock_stop' boolean
Message-ID: <acVNxsGGgsGo9Zqw@intel.com>
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
 <20260326111814.9800-4-ville.syrjala@linux.intel.com>
 <1558669af43583b072c8c58eff1e01960c2d9f8c@intel.com>
 <acU8ft5x55rIp-jx@intel.com>
 <557b26b17545103834b9051b7165d8010a88f870@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <557b26b17545103834b9051b7165d8010a88f870@intel.com>
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

On Thu, Mar 26, 2026 at 05:01:33PM +0200, Jani Nikula wrote:
> On Thu, 26 Mar 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Mar 26, 2026 at 03:40:56PM +0200, Jani Nikula wrote:
> >> On Thu, 26 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> >
> >> > The DSI 'clock_stop' parameter is a boolean, so use a real
> >> > 'bool' for it. And pimp the debug print while at it.
> >> >
> >> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
> >> >  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++--
> >> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> >> > index 8e39d2b52c54..0023ac341aa0 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> >> > @@ -81,7 +81,7 @@ struct intel_dsi {
> >> >  	int video_mode;
> >> >  
> >> >  	bool eot_pkt;
> >> > -	u8 clock_stop;
> >> > +	bool clock_stop;
> >> >  
> >> >  	u8 escape_clk_div;
> >> >  	u8 dual_link;
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> >> > index 51f6a5b82cb2..23da7f5f9578 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> >> > @@ -719,7 +719,7 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
> >> >  	drm_printf(&p, "Burst mode ratio %d\n", intel_dsi->burst_mode_ratio);
> >> >  	drm_printf(&p, "Reset timer %d\n", intel_dsi->rst_timer_val);
> >> >  	drm_printf(&p, "EoT packet %s\n", str_enabled_disabled(intel_dsi->eot_pkt));
> >> > -	drm_printf(&p, "Clockstop %s\n", str_enabled_disabled(!intel_dsi->clock_stop));
> >> > +	drm_printf(&p, "Clock stop during BLLP %s\n", str_enabled_disabled(intel_dsi->clock_stop));
> >> 
> >> What's with the reversed !intel_dsi->clock_stop in the existing log and
> >> the change here?
> >
> > I've had these sitting around for a while so completely forgot I changed
> > it.
> >
> > Looks that it's been wrong since the initial commit.
> >
> > Apparently v2 of the patch
> > https://lore.kernel.org/intel-gfx/1397454507-10273-5-git-send-email-shobhit.kumar@intel.com/
> > had it the correct way around, but then it got messed in
> > in v3 while the capital letters were being made lowercase.
> >
> > I can split that out into its own patch with that explanation.
> 
> Not sure I care enough, other than please mention it in the commit
> message. Unless you specifically want that fix backported too.

Nah. I guess I'll just amend the commit message a bit.

-- 
Ville Syrjälä
Intel
