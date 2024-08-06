Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E554CC49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 13:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF46E10E159;
	Tue,  6 Aug 2024 13:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKRpq3xE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FDF10E159
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722950207; x=1754486207;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=f6xC1ocOOEskjkHfxNEszuDwbOublrlxzLowjkNSXqk=;
 b=eKRpq3xEwn6AYw11w99aePQ8cgLv1vYMioqDNWBdnehenQvWNLFRjbQl
 Xcm1KiaO+Z5ayNoqz7zE2L+jEH4m86WIk7wGkJ4IQOGgc4Ya9K/NQ7Hfr
 oC2jXRSqbewa7v/ApLhJk95zgfjW3OKfviC3zp6TaWBVFQX8eLQhXYVkd
 tvarhxv0xuQBHEIiAz0Tyi9B38kS/S7YRhNbpkYjZubb8nEPn4GWJe0s3
 LyDFe+Bj7GV25qjbR92Um24QdBJeLw0MhlBhmvmODs+nFPEaCYbUIRiPh
 On+7bXkFc7v9ru96jbjm8RUID8+GmzDs3Bb3iAsRPhZOAS3AkhnjKdVQ4 A==;
X-CSE-ConnectionGUID: ZMepArXvRBiuRvOYqAeycw==
X-CSE-MsgGUID: /paW47tUR0iw+wH70udnRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20842509"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20842509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 06:16:46 -0700
X-CSE-ConnectionGUID: nXE6eFkiTNipGFblirFEZw==
X-CSE-MsgGUID: u6uhmxwgS7C/ZFLvMz8itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56476323"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 06:16:45 -0700
Date: Tue, 6 Aug 2024 16:17:02 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Message-ID: <ZrIiTvjkrL3XpEfr@ideak-desk.fi.intel.com>
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
 <20240805151309.461021-2-maarten.lankhorst@linux.intel.com>
 <ZrEdT1mxvBpeeRFe@ideak-desk.fi.intel.com>
 <87mslq5c42.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mslq5c42.fsf@intel.com>
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

On Tue, Aug 06, 2024 at 10:44:45AM +0300, Jani Nikula wrote:
> On Mon, 05 Aug 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Mon, Aug 05, 2024 at 05:13:08PM +0200, Maarten Lankhorst wrote:
> >> Suspend fbdev sooner, and disable user access before suspending to
> >> prevent some races. I've noticed this when comparing xe suspend to
> >> i915's.
> >
> > This is only part of
> >
> > 24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")
> > f4ed123ae295 ("drm/i915: Suspend the framebuffer console during driver shutdown")
> > 1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")
> > bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")
> >
> > done for i915, imo all the above changes should be applied to xe.
> 
> Really, all of should happen inside drivers/gpu/drm/i915/display/, not
> duplicated in i915 and xe drivers.

I agree and I was planning to do that, but AFAIR sharing the code
(moving the display suspend/resume steps to intel_display_driver.c) also
involves changing the order of some of the steps at least in the xe
driver. So imo adding now these separately to xe and then making i915
and xe share the s/r handlers in a separate change would be better.

> BR,
> Jani.
> 
> 
> >
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> >> index ca4468c820788..44405f17c1d28 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> @@ -294,8 +294,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> >>  	 * properly.
> >>  	 */
> >>  	intel_power_domains_disable(xe);
> >> -	if (has_display(xe))
> >> +	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> >> +
> >> +	if (has_display(xe)) {
> >>  		drm_kms_helper_poll_disable(&xe->drm);
> >> +		intel_display_driver_disable_user_access(xe);
> >> +	}
> >>  
> >>  	if (!runtime)
> >>  		intel_display_driver_suspend(xe);
> >> @@ -308,8 +312,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> >>  
> >>  	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
> >>  
> >> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> >> -
> >>  	intel_dmc_suspend(xe);
> >>  }
> >>  
> >> @@ -353,8 +355,10 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
> >>  		intel_display_driver_resume(xe);
> >>  
> >>  	intel_hpd_poll_disable(xe);
> >> -	if (has_display(xe))
> >> +	if (has_display(xe)) {
> >>  		drm_kms_helper_poll_enable(&xe->drm);
> >> +		intel_display_driver_enable_user_access(xe);
> >> +	}
> >>  
> >>  	intel_opregion_resume(xe);
> >>  
> >> -- 
> >> 2.45.2
> >> 
> 
> -- 
> Jani Nikula, Intel
