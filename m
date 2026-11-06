Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA24606EE8B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fjzqiVii
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F4C112EE8;
	Fri,  6 Nov 2026 16:19:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98800112EE2;
 Fri,  6 Nov 2026 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793981955; x=1825517955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ahpIHkaGHap1ktgb37MLw5ENuR+JAgSJAF5Pv55xOIM=;
 b=fjzqiViim+dyRfrEN1H3iBke5WfvK9tp3ErhpDZFnD+9lpbiF77n6J3A
 DSJDoy9GUAnar/dTakNDlgL+SpKrj38oYGzuAdXmTG68NmVjw62MOWJ53
 tTlW3SOnnn6jIEPU+D56355bvyDGwh0SgPbcM/CNP9S8ce7Vn2BEH2q+q
 zO+0ERCBAQK3WmYmkeXfYPdgs9RW9Sasv85QkTUlrKQPcUsWf/9hRwZPt
 pvvyWZcN8/tvMkEj6elJ+1ZNvVuVoY1MzVCHGiEnTH3RXZQcVqdYUHb3P
 b5KYHJmylKCQjEntH+CRcSmqA1LCp8V45jxp0qP5e+2sOToVOO6OHosvd w==;
X-CSE-ConnectionGUID: 5iEBHKQdSFKx9LT7vdKALw==
X-CSE-MsgGUID: 1ZXLpQmbQLOFOEmIaYA96w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2675754"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2675754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:19:14 -0800
X-CSE-ConnectionGUID: XaMot93tRveXiMh3+zBecA==
X-CSE-MsgGUID: PdkvnVoxS9+A0btjZXhp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7366387"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:19:13 -0800
Date: Fri, 6 Nov 2026 18:19:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/9] drm/i915/de: Move unclaimed mmio detection into
 display code
Message-ID: <au39_Rv2aA4oXIUu@intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-8-ville.syrjala@linux.intel.com>
 <sashiko-outbox-198239@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198239@kernel.org>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:36:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] drm/i915/de: NULL deref on displayless devices in unclaimed MMIO checks
> - [Medium] drm/i915/de: intel_de_init() enables FPGA_DBG check on Ivy Bridge
> - [Medium] drm/i915/de: unclaimed MMIO status is not cleared on initialization
> - [Low] drm/i915/display: unused mmio.mmio_debug field in struct intel_display
> --
> 
> commit 74c572411ef669251a5e2e347d14a7771407e433
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/de: Move unclaimed mmio detection into display code
> 
> This commit moves the FPGA_DBG and CLAIM_ER unclaimed MMIO access detection
> from intel_uncore into the display code, protecting the tracking state with
> display->mmio.lock.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> > index 8b7a4e696ff96..0a51105e0fbad 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.c
> > +++ b/drivers/gpu/drm/i915/display/intel_de.c
> 
> [ ... ]
<snip>
> > @@ -304,7 +470,11 @@ void intel_de_init(struct intel_display *display)
> >  	spin_lock_init(&display->mmio.lock);
> >  
> >  	if (driver_is_i915()) {
> > -		if (display->platform.valleyview || display->platform.cherryview)
> > +		if (display->platform.valleyview || display->platform.cherryview)
> > +			display->mmio.funcs = &vlv_mmio_funcs;
> > +		else if (DISPLAY_VER(display) >= 7)
> > +			display->mmio.funcs = &ivb_mmio_funcs;
> > +		else if (DISPLAY_VER(display) >= 6)
> >  			display->mmio.funcs = &snb_mmio_funcs;
> >  		else
> >  			display->mmio.funcs = &i9xx_mmio_funcs;
> 
> [Severity: Medium]
> Does checking DISPLAY_VER(display) >= 7 in intel_de_init() unintentionally
> enable FPGA_DBG unclaimed MMIO checks on Ivy Bridge?

Yes, but only because I misremembered that IVB has the feature already.
IVB does have the FPGA_DBG register already (which is the part I
remembered correctly), but the unclaimed register access bit is not
there until HSW. I guess that makes perfect since since HSW is the
one that also introduced us to power wells. So I'll need to
s/ivb/hsw/ here.

> 
> Previously, intel_uncore_init_mmio() gated FPGA_DBG unclaimed MMIO detection
> on HAS_FPGA_DBG_UNCLAIMED(display). In
> drivers/gpu/drm/i915/display/intel_display_device.c, has_fpga_dbg is set on
> hsw_desc and bdw_desc onwards, whereas ivb_display has ip.ver = 7 and
> has_fpga_dbg = 0. Checking DISPLAY_VER(display) >= 7 assigns ivb_mmio_funcs to
> Ivy Bridge as well, and leaves HAS_FPGA_DBG_UNCLAIMED(display) unused.
> 
> Should this check HAS_FPGA_DBG_UNCLAIMED(display) instead?
> 
> > @@ -314,4 +484,7 @@ void intel_de_init(struct intel_display *display)
> >  		else
> >  			display->mmio.funcs = &i9xx_mmio_funcs;
> >  	}
> > +
> > +	if (display->mmio.funcs->check_for_unclaimed_mmio)
> > +		display->mmio.unclaimed_mmio_check = 1;
> >  }
> 
> [Severity: Medium]
> Previously, intel_uncore_init_mmio() cleared any stale unclaimed MMIO bit left
> set by BIOS or pre-boot firmware during initialization:
> 
> 	/* clear out unclaimed reg detection bit */
> 	if (intel_uncore_unclaimed_mmio(uncore))
> 		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");
> 
> With that removed and not replaced in intel_de_init(), if mmio_debug is

Hmm. I thought I took care of that, but looks like I only adjusted the
resume path, not the init path.

> disabled by default, won't a stale FPGA_DBG_RM_NOCLAIM or CLAIM_ER bit from
> boot firmware remain latched until intel_de_arm_unclaimed_mmio_detection()
> runs at the end of the first modeset or in
> intel_display_driver_mmio_suspend_late(), triggering a false-positive error or
> falsely arming oneshot mmio_debug reporting?
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> > index aded2af8c92a6..cb18ee040b5d6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> > @@ -539,11 +539,18 @@ struct intel_display {
> >  		 * serializes all display register accesses done
> >  		 * using intel_de_{read,write}(), but not those
> >  		 * done using intel_de_{read,write}_fw().
> > +		 *
> > +		 * The lock also protects mmio.mmio_debug and
> > +		 * mmio.unclaimed_mmio_check.
> >  		 */
> >  		spinlock_t lock;
> >  
> >  		struct intel_uncore *uncore;
> >  		const struct intel_mmio_funcs *funcs;
> > +
> > +		/* protected by mmio.lock */
> > +		int mmio_debug;
> > +		int unclaimed_mmio_check;
> >  	} mmio;
> 
> [Severity: Low]
> This isn't a bug, but display->mmio.mmio_debug is never used since
> check_unclaimed_mmio_pre(), check_unclaimed_mmio_post(), and
> intel_de_arm_unclaimed_mmio_detection() all use display->params.mmio_debug.
> Should mmio.mmio_debug be dropped from struct intel_display?

Aye. Looks like some crap I accidentally left in.

-- 
Ville Syrjälä
Intel
