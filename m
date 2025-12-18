Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B02D6ACE6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 11:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB9710E3CA;
	Thu, 18 Dec 2025 11:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSVXO0XM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA35510E3CA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766056385; x=1797592385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GK1gxGtst83M+i1kewoKm2Bb032HxM6mDxl+EagmXs4=;
 b=DSVXO0XMTyq3M3rTG6UFfkTZ907ajYmxEA0SKuP3dTp2f+/MPBdY2kAr
 65si0Hdk1d/BSfyX8+KUbIYTOdeYkemDtS/UQ88bWxM48VKX3dSckPUdl
 y1ab8146G31YP4/nC7dO2fUMMK0zgoOO0szkI8cE3vHxfnfgNaYLXJBko
 PJ9gH3PHazWH7Q5sYd6MQx9pOxAqJCFsKrfNDXBVOTjWq+/EYmWHxkken
 2r0uYQjYHhGgd/aDERdz8tVPEP6MbiLthQLqkgy/0mTlNnb+gK7oeBPe8
 5Am0YsfLJTn/kW9eZYqBgn2xEwPcxteRerrSOa+7EiKDL4iLtmvZUTO9f A==;
X-CSE-ConnectionGUID: lx7YgKecSpmtDJ0VyLDRmA==
X-CSE-MsgGUID: M58id+bASlyW4YfZUtQcVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78321748"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78321748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:13:04 -0800
X-CSE-ConnectionGUID: r/nuWJX2RLKkD7+mMcYsTA==
X-CSE-MsgGUID: jqT7sfBZQ8ONjuGE/0VYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197820701"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:13:03 -0800
Date: Thu, 18 Dec 2025 12:12:59 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, dev@lankhorst.se
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
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

On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > We've been historically ignoring GT resume failure. Since the function
> > > can return error, handle it properly.
> > 
> > I probably had a reason for it, but since I didn't document and
> > cannot remember it, let's go forward and make the clean flow.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 4390ba69610d..a8b50091d62e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > >  
> > >  	xe_irq_resume(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_resume(gt);
> > > +		if (err)
> > > +			goto err;
> 
> When we propagate these errors upward, what's the end result / where
> does it eventually get handled?  If the device is still [partially]
> usable after an error, wouldn't it be better to not bail out of the loop
> immediately, but rather at least try to resume the other GTs, the
> display, etc. before returning the error at the end to indicate
> something failed?  Then you might still have a partially functioning
> device and have a better chance of at least having your screen turn back
> on to show the relevant error messages?

I had a similar question when I came across xe_device_probe(), but as
Lucas mentioned[1] that the expectation here is pretty much "all or
nothing". Again, not my call but I think we should be consistent.

[1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/

Raag

> > > +	}
> > >  
> > >  	xe_display_pm_resume(xe);
> > >  
> > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  
> > >  	xe_irq_resume(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > +		if (err)
> > > +			goto out;
> > > +	}
> > >  
> > >  	xe_display_pm_runtime_resume(xe);
> > >  
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
