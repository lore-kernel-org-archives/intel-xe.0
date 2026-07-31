Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEFCC54F54
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 12:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472C110E1F9;
	Fri, 31 Jul 2026 12:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4ppFHRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDC410E1F9
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 12:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785501376; x=1817037376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9zg9gtVnrfVOfCpuJ7MbfZsDEH/CHOTXllvyzYGChoE=;
 b=n4ppFHRptUarUVi8yk9jC1SyqYL5o2cnX0blKCRnXvzZ0dlpLgxRwrFf
 tl/WF0uB9ku94AxUbasfMziBnrN+dmBzjSBHBtZbw+c672MF2ptOvJ+xq
 k1BPEo7YjJY19XOOdv/0HARxi+wPaom1v0r+FMkpsg94rLT5jbYieBBTy
 cO7r67sSjaMYsA43iVQsHK7Ul0VsIrPREEOml7ko3dKAaGyCV1tZyAwBG
 2+ViyQqfqb2C97szoNd52xljf3JaLUodDGbNjaIxPVOhqQWNOIlNksVcU
 3ZIW1TBhfeRdblaaIHlhuPLfwz/UL4jm5F0ZDRAVrDhx/Hoi084UXUrAk Q==;
X-CSE-ConnectionGUID: u6NQdqWJQaq8xkeM6h9IOw==
X-CSE-MsgGUID: g30JsY98SGm6Av0CeGCpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97283542"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="97283542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:36:15 -0700
X-CSE-ConnectionGUID: uZ4VaIl5RbiOofzcwn17dg==
X-CSE-MsgGUID: qMb7/qXBTWi1fjXz0hq6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="264838529"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:36:13 -0700
Date: Fri, 31 Jul 2026 14:36:10 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/ras: Fix boot-time ras error processing
Message-ID: <amyWumq3vnOYJLTf@black.igk.intel.com>
References: <20260730110635.925537-1-raag.jadav@intel.com>
 <251045b9-5dfc-4450-9a90-b763388d7f0e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <251045b9-5dfc-4450-9a90-b763388d7f0e@intel.com>
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

On Thu, Jul 30, 2026 at 06:56:41PM +0530, Mallesh, Koujalagi wrote:
> On 30-07-2026 04:36 pm, Raag Jadav wrote:
> > Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot
> Please add we "call" xe_ras_process_errors().

It's used as a verb ;)

> > time errors. But this can potentially result in declaring the device as
> > wedged quite early in the driver load sequence, which is problematic due to
> > the lack of registered drm device or required wedged cleanup hooks at this
> > point.
> > 
> > Call xe_ras_process_errors() only after the prerequisites are available.
> > 
> > Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")
> > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c | 6 ++++++
> >   drivers/gpu/drm/xe/xe_ras.c    | 6 ------
> >   2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 03e6177a1d4c..47e1638d2ab3 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
> >   	if (err)
> >   		goto err_unregister_display;
> > +	/*
> > +	 * Process and log any errors detected by hardware. Possible results can
> > +	 * include declaring the device as wedged, which must be done only after
> > +	 * xe_device_wedged_fini() is registered.
> > +	 */
> > +	xe_ras_process_errors(xe);
> 
> What happens when xe_device_declared_wedged()-->xe_pm_runtime_get_noresume
> called before xe_pm_init()? Is it good to call xe_ras_process_errors
> 
> function after xe_pm_init()? any thoughts.

The usage count will increment regardless, which I guess is what we care
about?

Raag

> >   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> >   err_unregister_display:
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 28123f08e513..db8bd19ad28b 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
> >   	if (IS_ENABLED(CONFIG_PCIEAER))
> >   		ras_usp_aer_init(xe);
> > -	/*
> > -	 * During probe, process and log any errors detected by firmware while the driver was not
> > -	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
> > -	 * causing the driver to enter survivability mode.
> > -	 */
> > -	xe_ras_process_errors(xe);
> >   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> >   	if (ret)
> >   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
