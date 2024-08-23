Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E4BC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 12:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2110E622;
	Fri, 23 Aug 2024 12:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KW2Xcyo8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878B410E622
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724417483; x=1755953483;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iARHJdc0yAGJiy6GLVPHKUinQavU3piYALAsxjIJP4c=;
 b=KW2Xcyo8hg4gpM8iMr+a5l91dbKsfXivFNx9hULeAQBtWXhu45kamHSI
 RbmOeAVwEtq4N97LVxZaU0jiA5RitOkrULqGBWgNUIG9yHtaANO0rsEHc
 teQyrm07HlUKE+3LhlEOBF05N4mbOOW7mMYGWv8x10hOndqaiGJxVDqsG
 xPG4oY1D+irfUO2hagZqgYFz9Onah2lkP5jzvwB5bR8d+JyQ9nosZNj2R
 PAq40Lndi1k/EXe/mpZHsyObR9mFxMBz4/ADOQLTV53ESw4MAP7iWfckD
 yg+XVHh9h3/mjWjSy1bFEoHwZ2wcfIiaNQFq7pkkC1fj6KfaVVAfggpWd g==;
X-CSE-ConnectionGUID: HYEP95xnQtug/l5E/+s+2A==
X-CSE-MsgGUID: LyC2WP1WQWOvcv8RQaXswA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34261530"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="34261530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 05:51:23 -0700
X-CSE-ConnectionGUID: d0fY9RsaReCGMTnnJYtp+g==
X-CSE-MsgGUID: nQ1/fYsgRamL3jk4HsZKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66711778"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 05:51:22 -0700
Date: Fri, 23 Aug 2024 15:51:38 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Message-ID: <ZsiF2msfc_4Cj1xm@ideak-desk.fi.intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
 <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 23, 2024 at 11:43:47AM +0300, Murthy, Arun R wrote:
> > > > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> > > > b/drivers/gpu/drm/xe/display/xe_display.c
> > > > index ad7fc5137b42..b2a0b4b5c45c 100644
> > > > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > > > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > > > @@ -320,15 +320,13 @@ void xe_display_pm_suspend(struct xe_device
> > > > *xe, bool runtime)
> > > >          * properly.
> > > >          */
> > > >         intel_power_domains_disable(xe);
> > > > +
> > > Un-necessary change.
> > >
> > > >         intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED,
> > > > true);
> > > > -       if (has_display(xe)) {
> > > > +       if (!runtime && has_display(xe)) {
> > > >                 drm_kms_helper_poll_disable(&xe->drm);
> > >
> > > Can we get rid of this API as we don't reply on device polling and
> > > use interrupt based.
> >
> > Not sure if I understand the point! Wonder if it is relevant at this
> > context! But as mentioned in the series patch description, there
> > could be few other steps missing in the xe runtime_suspend handling
> > and a better refactoring/changes are being planned. So I guess you
> > could take this up at that time?
> >
> Nothing missing as such, rather this
> function(drm_kms_helper_poll_enable/ disable) is not required.  I915
> uses interrupt based detection and not polling.

Not sure what you mean by this. i915 (and xe) does use HPD polling to
detect display hotplug events. Interrupts for this work only if the
given output type has a physical HPD interrupt signal for this (so for
DP, HDMI yes, but for TV and some VGA outputs no) and the device is not
runtime suspended. Because of the former reason (outputs w/o an HPD
interrupt signal) the polling functionality provided by DRM core is
enabled while the system is not suspended (and so gets disabled here
during system suspend). Because of the latter reason (interrupts
disabled when the device is runtime suspended) polling for output types
that have an HPD interrupt signal is enabled when runtime suspending and
for these same outputs polling is disabled (switched back to interrupt
based detection) when runtime resuming.

> Even if called when polling is not enabled, will have no impact and
> just return with warning.  If to be taken later can we have a TODO or
> Re-visit so that we don’t miss.
>
> > >
> > > > -               if (!runtime)
> > > > -
> > > > intel_display_driver_disable_user_access(xe);
> > > > -       }
> > > > -
> > > > -       if (!runtime)
> > > > +               intel_display_driver_disable_user_access(xe);
> > > >                 intel_display_driver_suspend(xe);
> > > > +       }
> > > >
> > > >         xe_display_flush_cleanup_work(xe);
> > > >
> > > > @@ -387,15 +385,12 @@ void xe_display_pm_resume(struct xe_device
> > > > *xe, bool runtime)
> > > >
> > > >         /* MST sideband requires HPD interrupts enabled */
> > > >         intel_dp_mst_resume(xe);
> > > > -       if (!runtime)
> > > > +       if (!runtime && has_display(xe)) {
> > > >                 intel_display_driver_resume(xe);
> > > > -
> > > > -       if (has_display(xe)) {
> > > >                 drm_kms_helper_poll_enable(&xe->drm);
> > > > -               if (!runtime)
> > > > -                       intel_display_driver_enable_user_access(xe);
> > > > +               intel_display_driver_enable_user_access(xe);
> > > > +               intel_hpd_poll_disable(xe);
> > > Do we need this disable here as we are enabling this only in
> > > xe_display_pm_runtime_suspend() and hence disable only in
> > > xe_display_pm_runtime_resume()
> >
> > To quote Imre,
> >
> > "intel_hpd_poll_disable() is needed during system resume as well, since it does
> > an explicit connector probing. This probing is needed also when you resume
> > from S3 etc, for monitors that got connected during the system was
> > suspended."
> >
> Thanks for the clarification.
> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
