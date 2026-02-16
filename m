Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B1CE7BD89
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 10:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FE910E227;
	Mon, 16 Feb 2026 10:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSUIGzGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD8E10E2FF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771237823; x=1802773823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2KkXDFJBxgcTYj1VGh9BXfn8MPxOpCLuQceqFRNZh4o=;
 b=BSUIGzGFt+tLM2+sUQ92v6gKhduiqj/7dWvn84zgowuV35gmjapQBTkK
 K/drtkdU/F+7m3an2CwKVj2omSmpd3kXvWL3P2wm6jBduau9tGVAOQ0/l
 IKmN+JsaQ18flm60bY48bslZwuo/X5loGkTD0in56UjBV5OHs7eolZns2
 hGtyBDgZnNrjjerbSKWNkN9qwA3M+Yptuvv/pMwhz/SPfPL8CPGsHKieI
 fR7kf9SOpO3YJQ+JkOV4CNTI6snRR/8kjumxfs1YML/q43kNb+0Ud8EQ0
 oKRUe6UpHt7tb7rtkIRJtkRVHacCJgeeTtzEO850IckQpt+Qj91iVS361 w==;
X-CSE-ConnectionGUID: R3EDd/FSTuirCSmOXg7p1g==
X-CSE-MsgGUID: 6+/KDxI/SxSQaZEG4rvEGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83415553"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83415553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:30:23 -0800
X-CSE-ConnectionGUID: zVcAru8jSIS2rzh4K7Oouw==
X-CSE-MsgGUID: UmTxYSVYTW61GCJBs6+p7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="213657334"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:30:21 -0800
Date: Mon, 16 Feb 2026 11:30:17 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aZLxubuW7UrLaP1D@black.igk.intel.com>
References: <20260205111836.1628965-1-raag.jadav@intel.com>
 <aYUfpZOEIHl3i_kf@intel.com> <aYWK6DK4F7qIhsok@black.igk.intel.com>
 <aYzAYqWrDkuS1Ro2@intel.com> <aY1lApm0_ZDMoyK5@black.igk.intel.com>
 <aY3dVn4pSgw-wNZD@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY3dVn4pSgw-wNZD@intel.com>
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

On Thu, Feb 12, 2026 at 09:01:58AM -0500, Rodrigo Vivi wrote:
> On Thu, Feb 12, 2026 at 06:28:34AM +0100, Raag Jadav wrote:
> > On Wed, Feb 11, 2026 at 12:46:10PM -0500, Rodrigo Vivi wrote:
> > > On Fri, Feb 06, 2026 at 07:32:08AM +0100, Raag Jadav wrote:
> > > > On Thu, Feb 05, 2026 at 05:54:29PM -0500, Rodrigo Vivi wrote:
> > > > > On Thu, Feb 05, 2026 at 04:48:35PM +0530, Raag Jadav wrote:
> > > > > > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > > > > so wedge the device without any recovery method (unknown) and have it
> > > > > > available to the user for debugging.
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
> > > > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > > index b1241fa4c3d6..815f0b0c9dfd 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > @@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > > > >  		xe_gt_declare_wedged(gt);
> > > > > >  
> > > > > >  	if (xe_device_wedged(xe)) {
> > > > > > +		/*
> > > > > > +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > > > > +		 * so wedge the device without any recovery method and have it available
> > > > > > +		 * to the user for debugging.
> > > > > 
> > > > > agree....
> > > > > 
> > > > > > +		 */
> > > > > > +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > > > > > +			xe_device_set_wedged_method(xe, 0);
> > > > > 
> > > > > but why not using the already defined:
> > > > > 
> > > > > #define DRM_WEDGE_RECOVERY_NONE    BIT(0)  /* optional telemetry collection */
> > > > 
> > > > We originally added this for AMD usecase, and it doesn't strictly speaking
> > > > means 'wedged'.
> > > > 
> > > > Documentation/gpu/drm-uapi.rst +441
> > > > 
> > > > "The only exception to this is ``WEDGED=none``, which signifies that the device
> > > > was temporarily 'wedged' at some point but was recovered from driver context
> > > > using device specific methods like reset."
> > > 
> > > Well, so, why not to change that to a more generic meaning then?!
> > > 
> > > 'none' should mean, no recovery help is needed. go away user space.
> > > regardless if it is temporary or permanent...
> > 
> > A few things,
> > 
> > 1. I'm doubtful if Christian will allow it since they've built a lot of
> > infrastruction around it.
> 
> there's only way to know that...
> 
> Cc: Christian König <christian.koenig@amd.com>

What do you think Chris? Any objections?

Raag

> > 2. "Debugging" != "go away userspace" IMO since we ultimately do need the
> > recovery, it just won't be automated.
> 
> exactly in my view: 'none' = 'no automation needed'
> 
> much easier and meaningfully aligned than 'unkown'
> 
> > 
> > 3. I had debug cases in mind at the time and have already kept a provision
> > for them.
> > 
> > Documentation/gpu/drm-uapi.rst +533
> > 
> > "Consumers can also choose to have the device available for debugging or
> > telemetry collection and base their recovery decision on the findings.
> > This is useful especially when the driver is unsure about recovery or
> > method is unknown."
> 
> Okay, so perhaps we need to update that. Because in my view, driver knows
> and it is pretty sure that no automated recover should take place in this
> case.
> 
> > > > > >  		/* If no wedge recovery method is set, use default */
> > > > > > -		if (!xe->wedged.method)
> > > > > > +		else if (!xe->wedged.method)
> > > > > >  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > > > > >  						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > > > > >  
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
