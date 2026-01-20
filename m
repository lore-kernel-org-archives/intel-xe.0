Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145D2CA5FA2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 16:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9CD10E62B;
	Tue, 20 Jan 2026 16:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dmq1Evga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2810E629;
 Tue, 20 Jan 2026 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768925610; x=1800461610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=498oxGrniusgwl02USGMvrqJUqhP94piwMBn+uueNZg=;
 b=Dmq1EvgaMRU0oO2fYpbC9A/4L2wjPh/h+Z2NLLDtlzjjytgYLmTauf20
 nwW9NrDwpqiMpunRBVYpSG06uvGV1jE0LNQ3f+A7B5sMlR/JEUcnM6zLb
 iTgMpL9hFA94jBLipXMSTvVv/kbJJwU0IPceqkezhi20BmsPSJZL5zJ1q
 e8Cw6isMevjjKzVozYXeVCFYgpOkUOquhO1aofRdlg7AzI0YQvu7RCl88
 0qCduZ9ITkFeMScyXF+K9LzRwgtLc7qGzU4zsGFfsRv6NqWhkBXiNwWng
 Jh/trivkWHYCfAZ0sdahxiUtelathe/V5F4gLJV2/QTYkdOV72cykFTcW Q==;
X-CSE-ConnectionGUID: i1QSpgmsS52dL4Tb1hKZ9w==
X-CSE-MsgGUID: Sn05ouwDTBix02/1K8ixbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70043146"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70043146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:13:29 -0800
X-CSE-ConnectionGUID: h1NsZGHDSiyWrJQNkQI+bg==
X-CSE-MsgGUID: ssdgYu1pQh6jUL0If3dBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206199643"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:13:27 -0800
Date: Tue, 20 Jan 2026 18:13:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm/i915/display: Disable DMG Clock Gating
Message-ID: <aW-po67khakWTsNR@intel.com>
References: <20260120050033.635681-1-suraj.kandpal@intel.com>
 <IA1PR11MB646765DC8252C407F4218656E389A@IA1PR11MB6467.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA1PR11MB646765DC8252C407F4218656E389A@IA1PR11MB6467.namprd11.prod.outlook.com>
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

On Tue, Jan 20, 2026 at 08:23:17AM +0000, Garg, Nemesa wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Suraj
> > Kandpal
> > Sent: Tuesday, January 20, 2026 10:31 AM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH] drm/i915/display: Disable DMG Clock Gating
> > 
> > Disable DMG Clock gating during display initialization.
> > 
> > WA: 22021451799
> > Bspec: 69095
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_modeset_setup.c | 7 +++++++
> >  drivers/gpu/drm/i915/i915_reg.h                    | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> > b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> > index d10cbf69a5f8..2d46f00bd0d8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> > +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> > @@ -910,6 +910,13 @@ get_encoder_power_domains(struct intel_display
> > *display)
> > 
> >  static void intel_early_display_was(struct intel_display *display)  {
> > +	/*
> > +	 * Wa_22021451799
> > +	 * Disable DMG Clock gating
> > +	 */
> > +	if (DISPLAY_VER(display) == 35)
> > +		intel_de_rmw(display, GEN9_CLKGATE_DIS_0, 0,
> > DMG_GATING_DIS);
> > +
> >  	/*
> I guess we can remove the comment, only wa no. itself is sufficient.

At least the commit message (if not the comment) should describe what
this does. I do not want to have to trawl bspec to figure that out.

> 
> With this fix LGTM,
> Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> 
> >  	 * Display WA #1185 WaDisableDARBFClkGating:glk,icl,ehl,tgl
> >  	 * Also known as Wa_14010480278.
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h index 5bf3b4ab2baa..f928db78a3fa
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -763,6 +763,7 @@
> >   */
> >  #define GEN9_CLKGATE_DIS_0		_MMIO(0x46530)
> >  #define   DARBF_GATING_DIS		REG_BIT(27)
> > +#define   DMG_GATING_DIS		REG_BIT(21)
> >  #define   MTL_PIPEDMC_GATING_DIS(pipe)	REG_BIT(15 - (pipe))
> >  #define   PWM2_GATING_DIS		REG_BIT(14)
> >  #define   PWM1_GATING_DIS		REG_BIT(13)
> > --
> > 2.34.1

-- 
Ville Syrjälä
Intel
