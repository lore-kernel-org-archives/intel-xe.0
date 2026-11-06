Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907EF606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UedS+DiY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560910E9FB;
	Fri,  6 Nov 2026 15:35:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD17112E62;
 Fri,  6 Nov 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793979339; x=1825515339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5c4x8yhZW3Rsh1ulp6U9Qn2Q1JsrthMRbmS+ekqcTIY=;
 b=UedS+DiYBgWGvt0rzdXPzT9DI78uIrEPabu6E/h9xm4oy3sZdszqrf11
 6WLFmAA9Fp3H0Phzgm6s/X7t4kwig2pAiFEXJp/h05UiEKEEshhzCK6m1
 iJa2XTlzvHuhGN5p78c/ZkCySn8iv9aZzA4pw4TuvaODpsbTNH1V/Ab3v
 lPPTcbdGEJIc2aSrfmCacRb4dJ+nGwKWm8koPKtRusCl99mfnlr9Y8Xnf
 Yn5a+be/SdzgTwW3kZKCGIavVA1PNEeRykNFwnl1xSUU0/GqcHU+4l2ow
 +XJ6xc/I7cup0H1oAEvbVN+AC4FLcrzb1EcJ3Fy+X5Z6IaZ/W2Gl7CEAn w==;
X-CSE-ConnectionGUID: S2GnQwE7St+0nhqPbFmu/A==
X-CSE-MsgGUID: awRh56BYRdKK6Dm4KvBx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2835889"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2835889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:35:39 -0800
X-CSE-ConnectionGUID: xzekPQPqTtGUIvE9kC/o7g==
X-CSE-MsgGUID: n8nsw56bRTSk8eOR1U4vRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7355285"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:35:37 -0800
Date: Fri, 6 Nov 2026 17:35:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/i915/de: Convert intel_de_{read,write}() into
 vfuncs
Message-ID: <au3zxf-6iAvo-fZj@intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-3-ville.syrjala@linux.intel.com>
 <f51fb847cb0bbe5d17eaba71d16fb03059444626@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51fb847cb0bbe5d17eaba71d16fb03059444626@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:50:19PM +0200, Jani Nikula wrote:
> On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Different platforms will need to do different things in
> > their mmio accessors. The plan is to trade the overhead
> > of runtime platform checks into no runtime checks and
> > the cost of a vfunc call. This seems to provide slightly
> > better overall performance.
> 
> What's the plan for the 8- and 16-bit counterparts?

Just raw readb/readw.

> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_de.c         | 17 +++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_de.h         |  9 +++++++--
> >  .../gpu/drm/i915/display/intel_display_core.h   |  2 ++
> >  3 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> > index 6b3d06147e58..4f423a684ec2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.c
> > +++ b/drivers/gpu/drm/i915/display/intel_de.c
> > @@ -163,7 +163,24 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
> >  	return intel_uncore_read16(__to_uncore(display), reg);
> >  }
> >  
> > +static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
> > +{
> > +	return intel_uncore_read(__to_uncore(display), reg);
> > +}
> > +
> > +static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
> > +{
> > +	intel_uncore_write(__to_uncore(display), reg, val);
> > +}
> > +
> > +static const struct intel_mmio_funcs i9xx_mmio_funcs = {
> > +	.read = i9xx_mmio_read,
> > +	.write = i9xx_mmio_write,
> > +};
> > +
> >  void intel_de_init(struct intel_display *display)
> >  {
> >  	display->mmio.uncore = to_intel_uncore(display->drm);
> > +
> > +	display->mmio.funcs = &i9xx_mmio_funcs;
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> > index f1135ee5071b..63aef17e6ed3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > @@ -12,6 +12,11 @@
> >  #include "intel_uncore.h"
> >  #include "intel_uncore_trace.h"
> >  
> > +struct intel_mmio_funcs {
> > +	u32 (*read)(struct intel_display *display, intel_reg_t reg);
> > +	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
> > +};
> > +
> 
> Wondering if this should be in intel_display_core.h as all the other
> ones are. But let's see how it pans out.

Only intel_de.{c,h} need the definition so seems like it belongs there.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >  static inline struct intel_uncore *__to_uncore(struct intel_display *display)
> >  {
> >  	return display->mmio.uncore;
> > @@ -30,7 +35,7 @@ intel_de_read(struct intel_display *display, intel_reg_t reg)
> >  
> >  	intel_dmc_wl_get(display, reg);
> >  
> > -	val = intel_uncore_read(__to_uncore(display), reg);
> > +	val = display->mmio.funcs->read(display, reg);
> >  
> >  	intel_dmc_wl_put(display, reg);
> >  
> > @@ -60,7 +65,7 @@ intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
> >  {
> >  	intel_dmc_wl_get(display, reg);
> >  
> > -	intel_uncore_write(__to_uncore(display), reg, val);
> > +	display->mmio.funcs->write(display, reg, val);
> >  
> >  	intel_dmc_wl_put(display, reg);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> > index 35409f9abb2f..3a48119f7890 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> > @@ -49,6 +49,7 @@ struct intel_fbdev;
> >  struct intel_fdi_funcs;
> >  struct intel_hotplug_irq_funcs;
> >  struct intel_initial_plane_config;
> > +struct intel_mmio_funcs;
> >  struct intel_opregion;
> >  struct intel_overlay;
> >  struct intel_uncore;
> > @@ -533,6 +534,7 @@ struct intel_display {
> >  
> >  	struct {
> >  		struct intel_uncore *uncore;
> > +		const struct intel_mmio_funcs *funcs;
> >  	} mmio;
> >  
> >  	struct {
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
