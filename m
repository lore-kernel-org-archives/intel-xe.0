Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8419DD711CA
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 05:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CECB10E216;
	Fri, 19 Dec 2025 05:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlmTbvhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B44210E216
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 05:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766120688; x=1797656688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oEpGA6W87xQ60LKzjTEXtudZ1CPZ9E66rlDGQ5nGjR8=;
 b=GlmTbvhM7tMgvNDyIGW9uq4JrP7dUhsDznfIaWPurR8AaDIkjlxcns1v
 Y7VkpcNyc8sc9vKSzj7akXxLjweAUFkupgofcqRc51l3E8Mt7SZ2chP6J
 Q6HtasAYu3ao7iBiXDgICRgajaqe038w+TLsFzaUGTxiWvdkZfD2oUMhD
 E0sQtYGduZPjlBM5CSWOqqppMnRhewy/v42E/NjhZZ+SD2xFROeYtXPV8
 sktpX9txeORYL0fNNOydfPu0OQKYfbqkPfBXf0V2QCGAptAY7vnU47V66
 PgzG2cRPLpRtTQ5eMCmhtiNcThdz5aQU7LCetbpLSKWJsdFoGSxF7ugSo g==;
X-CSE-ConnectionGUID: sDJRww+lSKK3Ji2ku9hd/A==
X-CSE-MsgGUID: HKD3NscHQdqVbm5L8321Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68016691"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68016691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 21:04:48 -0800
X-CSE-ConnectionGUID: 0zNMqngETO2mW0hR45IUOA==
X-CSE-MsgGUID: haeduPfiRn6waOZEHI0O7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199037021"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 21:04:45 -0800
Date: Fri, 19 Dec 2025 06:04:42 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, dev@lankhorst.se
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aUTc6kypmsbHNWC1@black.igk.intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
 <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
 <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Dec 18, 2025 at 10:46:10AM -0800, Matt Roper wrote:
> On Thu, Dec 18, 2025 at 12:12:59PM +0100, Raag Jadav wrote:
> > On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> > > On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > > > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > > > We've been historically ignoring GT resume failure. Since the function
> > > > > can return error, handle it properly.
> > > > 
> > > > I probably had a reason for it, but since I didn't document and
> > > > cannot remember it, let's go forward and make the clean flow.
> > > > 
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > index 4390ba69610d..a8b50091d62e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > > > >  
> > > > >  	xe_irq_resume(xe);
> > > > >  
> > > > > -	for_each_gt(gt, xe, id)
> > > > > -		xe_gt_resume(gt);
> > > > > +	for_each_gt(gt, xe, id) {
> > > > > +		err = xe_gt_resume(gt);
> > > > > +		if (err)
> > > > > +			goto err;
> > > 
> > > When we propagate these errors upward, what's the end result / where
> > > does it eventually get handled?  If the device is still [partially]
> > > usable after an error, wouldn't it be better to not bail out of the loop
> > > immediately, but rather at least try to resume the other GTs, the
> > > display, etc. before returning the error at the end to indicate
> > > something failed?  Then you might still have a partially functioning
> > > device and have a better chance of at least having your screen turn back
> > > on to show the relevant error messages?
> > 
> > I had a similar question when I came across xe_device_probe(), but as
> > Lucas mentioned[1] that the expectation here is pretty much "all or
> > nothing". Again, not my call but I think we should be consistent.
> 
> I think device probe is a bit different --- if you can't bring up the
> hardware successfully at the very beginning then something is pretty
> wrong and it's best to just not enable and start using the device at
> all.  But the resume paths are different --- the device is already bound
> and in use, and was working properly previously.  If we intentionally
> don't even try to power up other parts of the device that might still
> work (display, other GTs, etc.), then we're making the situation worse
> and that could be the difference between the user having a functional UI
> that gives them a chance to save their work and shutdown/recover
> gracefully vs having to just power off the machine because their monitor
> is black and they don't have any idea what's going on.  Powering up
> other units like display also makes it more likely that we can get
> useful debugging information out of the machine to figure out what
> actually went wrong.

Fair, but this also means the existing error handing in resume path is
redundant and should be removed.

Raag

> > [1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/
> > 
> > > > > +	}
> > > > >  
> > > > >  	xe_display_pm_resume(xe);
> > > > >  
> > > > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > >  
> > > > >  	xe_irq_resume(xe);
> > > > >  
> > > > > -	for_each_gt(gt, xe, id)
> > > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > +	for_each_gt(gt, xe, id) {
> > > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > +		if (err)
> > > > > +			goto out;
> > > > > +	}
> > > > >  
> > > > >  	xe_display_pm_runtime_resume(xe);
> > > > >  
> > > > > -- 
> > > > > 2.43.0
> > > > > 
