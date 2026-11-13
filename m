Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6219606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A3JqoxZ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D50410EC04;
	Fri, 13 Nov 2026 14:31:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C0110EC04;
 Fri, 13 Nov 2026 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794580305; x=1826116305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nfwhi8aFB0DyY1GzjuYFfFqrVUFGR3Zcbza+EE1ck+o=;
 b=A3JqoxZ83bVoNwLpe3/34q4EgHMrbjFPGOvDMTFO0eJJ2j2ag/Qd9CX9
 Hauu0p8pIL7CqZb3neyTKFUydSHCneKSX/3p8as/nXtfWdWx3FdvbWRPT
 1JWTS1zxDBOgpQIolV8sYBIiFFxry07JKn1pJjWdhJC8C8DoDecn0e/+L
 kfan9hxDJ4kvdnrPVWidZneCJ6Hz3eKqXbM8BI1Leg9W4n55eWR4TGnJ0
 dwzUoiPIn/rDodYlVOKeW9NiO87DOtcPVy4HMPHj2mTCVAkwrGOJP+tba
 1jnDKhsMhHnbfIO1ZeF2wvknSIpgyuhyIOQVkycCyp51oRlFFZVzCB/sc Q==;
X-CSE-ConnectionGUID: 1wvW023ySwm1J8XzO0636w==
X-CSE-MsgGUID: HvHSE5HnSsSykVue5nDqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3277430"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3277430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:31:45 -0800
X-CSE-ConnectionGUID: Yeb3lTBOSX6wkOeinXqiWA==
X-CSE-MsgGUID: H5WdEdvyQIWMP07K2FbFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9097717"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:31:42 -0800
Date: Fri, 13 Nov 2026 16:31:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/i915/de: Pimp the intel_de_{read, write}_fw() docs
Message-ID: <avcfS-j_eUkkswiM@intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-3-ville.syrjala@linux.intel.com>
 <f472ab77b47162fac4185465c3e19956d4e7d43e@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f472ab77b47162fac4185465c3e19956d4e7d43e@intel.com>
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 04:12:51PM +0200, Jani Nikula wrote:
> On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Include a bit more guidance on when to use or not use
> > intel_de_{read,write}_fw(), and what the extra caveats
> > are.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_de.h | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> > index a6dcb91b36f2..2c469a2d6a20 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > @@ -87,12 +87,19 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
> >  			       u32 mask, unsigned int timeout_ms);
> >  
> >  /*
> > - * Unlocked mmio-accessors, think carefully before using these.
> > + * Unlocked mmio-accessors, think carefully before using these. Generally only
> > + * highly performance sensitive code should use these (eg. vblank evade critical
> > + * section, or interrupt handlers).
> >   *
> >   * Certain architectures will die if the same cacheline is concurrently accessed
> > - * by different clients (e.g. on Ivybridge). Access to registers should
> > - * therefore generally be serialised, by either the dev_priv->uncore.lock or
> > + * by different clients (e.g. on Ivybridge/Haswell). Access to registers should
> > + * therefore generally be serialised, by either the display->mmio.lock or
> >   * a more localised lock guarding all access to that bank of registers.
> > + *
> > + * DMC wakelock will not be taken by these. It must be done manually,
> > + * if needed.
> 
> Is there anything we could mention here about what "if needed" really
> means?

"See intel_dmc_wl.c which registers need the wakelock."
?

> 
> Regardless,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > + *
> > + * These will also skip the mmio_debug unclaimed register detection.
> >   */
> >  u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
> >  void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
