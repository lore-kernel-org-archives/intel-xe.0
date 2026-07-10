Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E75C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 05:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF3E10E649;
	Fri, 10 Jul 2026 05:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtVuI2Nw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89810E649
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783659711; x=1815195711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hj1C9KOTmuexMTk6QbU7uN6E/x6JW0QVgQ/Isg7dqwA=;
 b=CtVuI2NwEqfZv6oaogUc7IIgWiHW90UPN9mskyrldUdAt8Rc+UAKTD38
 nw8hyKEK8NjHZ2+F1fMP8lYlxsHBfMFZSdssgZCugHNHYKG7ro1cXuoWb
 TM+cL6O/jDkMty5cPVbhQWYIYXb3PpGVYBMrL6NWl0Oj6VkBM8aee9iK5
 QjIOUcVMHNqYWsqVcQb6sh2Rq5vgt/hCMX0BKBO2NsnBSj3KnjtJihCKX
 2g+ZohebrFkaE+fLDYJx21jmzf2adUzpUxHoQsWM/l6aWDpWQjKy3Jmr3
 300BXWPiENcIW7iCUqDl+I4EIZQ81A+2/JWl9UN62HYl2LqdsegY+z0fF Q==;
X-CSE-ConnectionGUID: v9eWoxpJRheW8d7joesfaQ==
X-CSE-MsgGUID: tHQB6AWQRwWP3J1oq4AOsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86900570"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="86900570"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:01:51 -0700
X-CSE-ConnectionGUID: C7SWPcdRRw2zxWPz0pudkw==
X-CSE-MsgGUID: qeFfqzzOQIKNvMaVWNJuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253048139"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:01:48 -0700
Date: Fri, 10 Jul 2026 07:01:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com, lukasz.laguna@intel.com,
 zhanjun.dong@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v9 08/10] drm/xe: Improve wedged state management
Message-ID: <alB8ubrXvqWSTOQL@black.igk.intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-9-raag.jadav@intel.com>
 <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
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

On Thu, Jul 09, 2026 at 02:27:40PM -0700, Matthew Brost wrote:
> On Wed, Jul 01, 2026 at 01:59:32PM +0530, Raag Jadav wrote:
> > Currently, wedged state is serving a single usecase where the device is
> > permanently declared wedged, but this doesn't allow any wedged state
> > management for runtime usecases. In preparation of usecases which require
> > to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> > which serves as a driver internal refcount for wedged state and blocks
> > critical path execution during device lifetime. While at it, introduce
> > wedged.perm which signifies permanent device wedging and operates
> > independent of the refcount allowing relevant cleanup action on unwind
> > path.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v9: Redesign to prevent races
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       | 102 ++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_device.h       |   8 +--
> >  drivers/gpu/drm/xe/xe_device_types.h |   8 ++-
> >  3 files changed, 84 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index c5e3e2d1f7c3..e8b6afb29ab6 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -598,6 +598,10 @@ int xe_device_init_early(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > +	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
> > +	if (err)
> > +		return err;
> > +
> >  	err = xe_pm_init_early(xe);
> >  	if (err)
> >  		return err;
> > @@ -920,8 +924,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> >  
> > -	if (atomic_read(&xe->wedged.flag))
> > -		xe_pm_runtime_put(xe);
> > +	if (xe->wedged.perm)
> > +		xe_device_wedged_put(xe);
> > +
> > +	xe_assert(xe, !xe_device_wedged(xe));
> >  }
> >  
> >  int xe_device_probe(struct xe_device *xe)
> > @@ -1387,6 +1393,44 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >   *   firmware and restore device to normal operation.
> >   */
> >  
> > +/**
> > + * xe_device_wedged_get() - Acquire wedged reference
> > + * @xe: xe device instance
> > + *
> > + * Get runtime PM reference and block critical path execution.
> > + */
> > +void xe_device_wedged_get(struct xe_device *xe)
> > +{
> > +	int ref;
> > +
> > +	/* We should not be runtime suspending as long as critical paths are blocked */
> > +	xe_pm_runtime_get_noresume(xe);
> > +
> > +	ref = atomic_inc_return(&xe->wedged.ref);
> > +	xe_assert(xe, ref > 0);
> > +}
> > +
> > +/**
> > + * xe_device_wedged_put() - Relinquish wedged reference
> > + * @xe: xe device instance
> > + *
> > + * Restore critical path execution and put runtime PM reference.
> > + */
> > +void xe_device_wedged_put(struct xe_device *xe)
> > +{
> > +	int ref;
> > +
> > +	ref = atomic_dec_return(&xe->wedged.ref);
> > +	xe_assert(xe, ref >= 0);
> > +
> > +	xe_pm_runtime_put(xe);
> > +}
> > +
> > +bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged.ref);
> > +}
> > +
> >  /**
> >   * xe_device_set_wedged_method - Set wedged recovery method
> >   * @xe: xe device instance
> > @@ -1427,36 +1471,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
> >  		return;
> >  	}
> >  
> > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > -		xe->needs_flr_on_fini = true;
> > -		xe_pm_runtime_get_noresume(xe);
> > -		drm_err(&xe->drm,
> > -			"CRITICAL: Xe has declared device %s as wedged.\n"
> > -			"IOCTLs and executions are blocked.\n"
> > -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> > -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > -			dev_name(xe->drm.dev));
> > -	}
> > +	mutex_lock(&xe->wedged.lock);
> 
> Sashiko pointed out what is likely a pre existing issue:
> 
> 
> Can this mutex_lock() trigger a scheduling while atomic panic?
> Looking at the call chain, xe_device_declare_wedged() can be invoked from
> a hardirq context when a hardware error occurs:
> xe_irq_handler()
>   xe_mert_irq_handler()
>     mert_handle_cat_error()
>       xe_device_declare_wedged()
> Since the interrupt handler runs in atomic context, acquiring a sleeping
> lock here causes a crash.
> Could this synchronization be handled without introducing a mutex in the
> interrupt path?

Yes, the event call performs memory allocation for environment buffer
so mert was broken to begin with. But I'm not sure if that in scope of
series? Perhaps fix it separately? Michal?

> This is an issue and currently unsafe too as we take mutexes deeper in
> xe_device_declare_wedged call stack too. Maybe declare wedged in an
> async work item? We have other issues in xe_device_declare_wedged too
> which stop / start scheduling which also isn't safe unless this is on
> the GT ordered work queue too.

Yes, I have planned this as part of my wedging improvement series once we
land this. It'll be reusing some parts of patch 3 where we use GT ordered
wq for it.

Raag

> > +
> > +	if (xe->wedged.perm)
> > +		goto out;
> > +
> > +	xe_device_wedged_get(xe);
> > +	xe->wedged.perm = true;
> > +	xe->needs_flr_on_fini = true;
> > +	drm_err(&xe->drm,
> > +		"CRITICAL: Xe has declared device %s as wedged.\n"
> > +		"IOCTLs and executions are blocked.\n"
> > +		"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> > +		"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +		dev_name(xe->drm.dev));
> >  
> >  	for_each_gt(gt, xe, id)
> >  		xe_gt_declare_wedged(gt);
> >  
> > -	if (xe_device_wedged(xe)) {
> > -		/*
> > -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > -		 * hangs, so wedge the device with 'none' recovery method and have
> > -		 * it available to the user for debugging.
> > -		 */
> > -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > -		/* If no wedge recovery method is set, use default */
> > -		else if (!xe->wedged.method)
> > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > +	/*
> > +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > +	 * hangs, so wedge the device with 'none' recovery method and have
> > +	 * it available to the user for debugging.
> > +	 */
> > +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > +	/* If no wedge recovery method is set, use default */
> > +	else if (!xe->wedged.method)
> > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> >  
> > -		/* Notify userspace of wedged device */
> > -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > -	}
> > +	/* Notify userspace of wedged device */
> > +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > +out:
> > +	mutex_unlock(&xe->wedged.lock);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 11b67820eb67..89bf909c96e0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -194,11 +194,9 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> >  void xe_device_td_flush(struct xe_device *xe);
> >  void xe_device_l2_flush(struct xe_device *xe);
> >  
> > -static inline bool xe_device_wedged(struct xe_device *xe)
> > -{
> > -	return atomic_read(&xe->wedged.flag);
> > -}
> > -
> > +void xe_device_wedged_get(struct xe_device *xe);
> > +void xe_device_wedged_put(struct xe_device *xe);
> > +bool xe_device_wedged(struct xe_device *xe);
> >  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> >  void xe_device_declare_wedged(struct xe_device *xe);
> >  int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 46a9e9fad7a9..80fa60821a47 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -485,14 +485,18 @@ struct xe_device {
> >  
> >  	/** @wedged: Struct to control Wedged States and mode */
> >  	struct {
> > -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> > -		atomic_t flag;
> > +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> > +		atomic_t ref;
> >  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> >  		enum xe_wedged_mode mode;
> >  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> >  		unsigned long method;
> >  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> >  		bool inconsistent_reset;
> > +		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
> > +		bool perm;
> > +		/** @wedged.lock: Lock protecting wedged state */
> > +		struct mutex lock;
> >  	} wedged;
> >  
> >  	/** @bo_device: Struct to control async free of BOs */
> > -- 
> > 2.43.0
> > 
