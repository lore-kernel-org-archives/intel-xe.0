Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41988CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 08:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC251112730;
	Thu,  4 Jun 2026 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9h19f8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F56D112730
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780562401; x=1812098401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oNfdM9iEBWTO5Dl0sxV4mwaA15Leak67axJyBveSCA0=;
 b=J9h19f8Kep5/pJRVE6P6WwR8+QznEQZ/BkjWGZVW6VKGo7GVJE/Zxpgt
 gcwxxyTa0gYnBVZJobhcw+65V+GYQ06dSozICJgf886d6elS29RsA30vx
 eMfwPkUSSBkPIz2mK1auzh7obkzyGWsYoijjevgEiUDhcoJ0x+9YulOWw
 lHB/cW1OopuSrlhygy1xG3vEUB7lJ++gsV+jT9WPE06by4DzCAT13n5gz
 3l5fJT2Na/OvwkWM99S0TnQpk/dmE7OeL5fZwXcQL+bdOgkE0qVJfVq8W
 NcsBCjF5Z3nl+VpWH/OSun+oxE7Ihgs5380RIdg96flCei2yOfGGvYXhb g==;
X-CSE-ConnectionGUID: gmfSY78oT/6nCWNwgQr3Zw==
X-CSE-MsgGUID: 1xwko1arTjOVXQ2DMz7nOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81446731"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="81446731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:40:01 -0700
X-CSE-ConnectionGUID: YxJZqykJQDaIk6jyC7PWbw==
X-CSE-MsgGUID: eHoU6zp1QL60Fnx9gmvzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249579240"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:39:57 -0700
Date: Thu, 4 Jun 2026 10:39:54 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com, lukasz.laguna@intel.com,
 zhanjun.dong@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v8 08/10] drm/xe: Improve wedged state management
Message-ID: <aiE52oh3F-5OOqLh@black.igk.intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-9-raag.jadav@intel.com>
 <aiAIcAihJhDwOj5e@intel.com>
 <9da04b52-c43e-4afd-9d1b-8248034f58ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da04b52-c43e-4afd-9d1b-8248034f58ab@intel.com>
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

On Thu, Jun 04, 2026 at 12:22:35PM +0530, Tauro, Riana wrote:
> On 6/3/2026 4:26 PM, Rodrigo Vivi wrote:
> > On Wed, Jun 03, 2026 at 03:47:08PM +0530, Raag Jadav wrote:
> > > Currently, wedged state is serving a single usecase where the device is
> > > declared wedged, but this doesn't allow any wedged state management for
> > > runtime usecases. In preparation of usecases which requires to facilitate
> > > temporary device wedging, convert wedged.flag to wedged.ref which serves
> > > as a driver internal refcount and blocks critical path execution during
> > > device lifetime and while at it, introduce wedged.fini and use it as a
> > > cleanup indicator during driver unwind which operates independent of the
> > > refcount.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c       |  5 +++--
> > >   drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
> > >   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
> > >   3 files changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 9e0cbad8adb0..d77f8f054a1a 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > >   {
> > >   	struct xe_device *xe = arg;
> > > -	if (atomic_read(&xe->wedged.flag))
> > > +	if (atomic_read(&xe->wedged.fini))
> > >   		xe_pm_runtime_put(xe);
> > >   }
> > > @@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >   		return;
> > >   	}
> > > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > +	if (!atomic_xchg(&xe->wedged.fini, 1)) {
> 
> Just curious. Why do we need runtime pm reference held throughout till the
> end of driver unload?
> Even if this is needed why not associate releasing runtime pm wakeref with
> the flr_on_fini flag.

I guess flr_on_fini has multiple setters and it's not always clear how many.

> I was facing a similar issue for uncorrectable series and i was thinking of
> releasing runtime
> pm wakeref based on flr_fini.

Sure but I'm not touching any existing behaviour in this series. Probably
worth exploring as a follow up.

Raag

> > > +		xe_device_wedged_get(xe);
> > >   		xe->needs_flr_on_fini = true;
> > >   		xe_pm_runtime_get_noresume(xe);
> > >   		drm_err(&xe->drm,
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index d61fdb362f91..14677729aa24 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> > >   void xe_device_td_flush(struct xe_device *xe);
> > >   void xe_device_l2_flush(struct xe_device *xe);
> > > +static inline void xe_device_wedged_get(struct xe_device *xe)
> > > +{
> > > +	atomic_inc(&xe->wedged.ref);
> > > +}
> > > +
> > > +static inline void xe_device_wedged_put(struct xe_device *xe)
> > > +{
> > > +	atomic_dec(&xe->wedged.ref);
> > > +}
> > > +
> > >   static inline bool xe_device_wedged(struct xe_device *xe)
> > >   {
> > > -	return atomic_read(&xe->wedged.flag);
> > > +	return atomic_read(&xe->wedged.ref);
> > >   }
> > >   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 32dd2ffbc796..66e673e4e3e7 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -485,8 +485,10 @@ struct xe_device {
> > >   	/** @wedged: Struct to control Wedged States and mode */
> > >   	struct {
> > > -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> > > -		atomic_t flag;
> > > +		/** @wedged.fini: Needs cleanup on fini */
> > > +		atomic_t fini;
> > to me it is easier to see this as a 'permanent' flag than
> > a flag to 'clean' on 'fini'.
> > 
> > but up to you...
> > 
> > either way:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> > > +		atomic_t ref;
> > >   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> > >   		enum xe_wedged_mode mode;
> > >   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> > > -- 
> > > 2.43.0
> > > 
