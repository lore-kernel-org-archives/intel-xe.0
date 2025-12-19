Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82629D78770
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 18:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83810F05E;
	Fri, 19 Dec 2025 18:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFvM+pq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205D10F05E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766167207; x=1797703207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vo3tl1PBxiC+tcvCDGoqV1brddfo7Ccj+LiabnkIS54=;
 b=RFvM+pq1tC03OPuJhCGNkTAez7+IvOiVJFF9Ezp9kg+gR98j8ihy9Bso
 OJk0VCV890gfofoUK2P1zSdM1qrEnhzxqVlFFuxO8CtHZtuKYiZ+wWQu/
 4qXRWV1ZyYmlmu8ZuEeLRU1qEN8ct/HbLh3p4VlR5Xoop1CnfGPriXlir
 xfsY1hnUdIZKGYoXdSNVbxdhqf0Vu6tAQ0+s78B1fXgU5JXgWVPEyehGl
 3VI0kVUGIs+I4BbPNg47BO82g1Ge7E8v0MejQxSoI0ittS9rTxOiM7hz+
 stuMQQapN8DBNmA1OtGm4zJPMc+oj/PnDHB6m2MUtO14B4yCRVihp1G9s g==;
X-CSE-ConnectionGUID: vb/26nVaQFKeljiXohqE9Q==
X-CSE-MsgGUID: cBoOpoxcSFWjHUdwu60ChQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67325750"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67325750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:00:07 -0800
X-CSE-ConnectionGUID: Tjqsra1sS/uWE8198J/qhA==
X-CSE-MsgGUID: PjYMLb8oS4eLVPMMFm3uXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203443737"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:00:05 -0800
Date: Fri, 19 Dec 2025 19:00:02 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, dev@lankhorst.se
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aUWSovxtNUyZ0Yys@black.igk.intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
 <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
 <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
 <aUTc6kypmsbHNWC1@black.igk.intel.com> <aUV4eX7XXpApdnCN@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUV4eX7XXpApdnCN@intel.com>
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

On Fri, Dec 19, 2025 at 11:08:25AM -0500, Rodrigo Vivi wrote:
> On Fri, Dec 19, 2025 at 06:04:42AM +0100, Raag Jadav wrote:
> > On Thu, Dec 18, 2025 at 10:46:10AM -0800, Matt Roper wrote:
> > > On Thu, Dec 18, 2025 at 12:12:59PM +0100, Raag Jadav wrote:
> > > > On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> > > > > On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > > > > > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > > > > > We've been historically ignoring GT resume failure. Since the function
> > > > > > > can return error, handle it properly.
> > > > > > 
> > > > > > I probably had a reason for it, but since I didn't document and
> > > > > > cannot remember it, let's go forward and make the clean flow.
> > > > > > 
> > > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > index 4390ba69610d..a8b50091d62e 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > > > > > >  
> > > > > > >  	xe_irq_resume(xe);
> > > > > > >  
> > > > > > > -	for_each_gt(gt, xe, id)
> > > > > > > -		xe_gt_resume(gt);
> > > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > > +		err = xe_gt_resume(gt);
> > > > > > > +		if (err)
> > > > > > > +			goto err;
> > > > > 
> > > > > When we propagate these errors upward, what's the end result / where
> > > > > does it eventually get handled?  If the device is still [partially]
> > > > > usable after an error, wouldn't it be better to not bail out of the loop
> > > > > immediately, but rather at least try to resume the other GTs, the
> > > > > display, etc. before returning the error at the end to indicate
> > > > > something failed?  Then you might still have a partially functioning
> > > > > device and have a better chance of at least having your screen turn back
> > > > > on to show the relevant error messages?
> > > > 
> > > > I had a similar question when I came across xe_device_probe(), but as
> > > > Lucas mentioned[1] that the expectation here is pretty much "all or
> > > > nothing". Again, not my call but I think we should be consistent.
> > > 
> > > I think device probe is a bit different --- if you can't bring up the
> > > hardware successfully at the very beginning then something is pretty
> > > wrong and it's best to just not enable and start using the device at
> > > all.  But the resume paths are different --- the device is already bound
> > > and in use, and was working properly previously.  If we intentionally
> > > don't even try to power up other parts of the device that might still
> > > work (display, other GTs, etc.), then we're making the situation worse
> > > and that could be the difference between the user having a functional UI
> > > that gives them a chance to save their work and shutdown/recover
> > > gracefully vs having to just power off the machine because their monitor
> > > is black and they don't have any idea what's going on.  Powering up
> > > other units like display also makes it more likely that we can get
> > > useful debugging information out of the machine to figure out what
> > > actually went wrong.
> > 
> > Fair, but this also means the existing error handing in resume path is
> > redundant and should be removed.
> 
> Not necessarily. Otherwise resume itself wouldn't have the failure path.
> I believe that Matt is suggesting is that we need to scrutinize them all
> and handle with care without a one-rule-fits-all.
> 
> If there's a chance of getting display back even without some engines
> for instance, perhaps we should try it.
> 
> Imagine that media gt failed to come back, but you still have everything
> else. But user will try to open the lid on their laptops and will just
> get a blank screen. We need to avoid this scenario and work for a more
> reliable platform with more granular and contained error handling.

Or perhaps we can reconsider the ordering to make sure we have essential
parts up and running before we move on to non-essentials?

I'm not a fan of hiding errors but upto you.

Raag

> > > > [1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/
> > > > 
> > > > > > > +	}
> > > > > > >  
> > > > > > >  	xe_display_pm_resume(xe);
> > > > > > >  
> > > > > > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > > > >  
> > > > > > >  	xe_irq_resume(xe);
> > > > > > >  
> > > > > > > -	for_each_gt(gt, xe, id)
> > > > > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > > +		if (err)
> > > > > > > +			goto out;
> > > > > > > +	}
> > > > > > >  
> > > > > > >  	xe_display_pm_runtime_resume(xe);
> > > > > > >  
> > > > > > > -- 
> > > > > > > 2.43.0
> > > > > > > 
