Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DD9D185E4
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 11:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439210E293;
	Thu,  8 Jan 2026 11:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmZyLCdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F010E293
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767873264; x=1799409264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N/CuS7bzKcK5hOHnBjGKMP2MEr9vbCe68B2L7lQEyz0=;
 b=SmZyLCdtHqR4m3ZWkLOflPPKpFAgEQJRNdaljyTA99CJ8figrrfg75Ko
 OTjyS7q1O4uEdN7vIJ6T2r9w92tplXCGna6qMKEsqWmST/hclUW14PvUM
 lSiKAM0kLdAYD+3BImSafW1Q//ObOOpX99KnRKtv3/CvFXFV7n6C1I1jA
 dshoH3cQ7SSrQHN8sGlXEkvo3IqZLhJIlgf0bH0ZExvFKlXmuZF0MJTXh
 W5V7JQOlOX/8X+RY17r0GCWUfZVwYBa5i/+1ZEgZirNBwy4fFR/WpngmT
 aqifaoJSGfI4K0M8JW+XzsRwG1d+5HGVpfcbHm4NZvLv3RSW8pW7Wt/71 w==;
X-CSE-ConnectionGUID: HItey6pbSJeeMhvWbAZcgw==
X-CSE-MsgGUID: IFb/74cLSkWXX9UE9q/l3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86665675"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="86665675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:54:23 -0800
X-CSE-ConnectionGUID: vHsAj58aQ0WMoiUzrRz6jQ==
X-CSE-MsgGUID: tYbgOaluTzON7yDOqqOkFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="207321884"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:54:21 -0800
Date: Thu, 8 Jan 2026 12:54:17 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Message-ID: <aV-a6ev2jb5VBoi-@black.igk.intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <1424d50e95dd5410a9e91527383fa9c8f1182298.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1424d50e95dd5410a9e91527383fa9c8f1182298.camel@intel.com>
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

On Sun, Dec 21, 2025 at 08:38:24AM +0530, Vivi, Rodrigo wrote:
> On Sat, 2025-12-20 at 13:06 +0530, Raag Jadav wrote:
> > We've been historically ignoring GT resume failure. Since the
> > function
> > can return error, handle it properly.
> > 
> > v2: Bring up display before bailing (Matt Roper, Rodrigo)
> 
> I'm afraid this is not exactly what we meant.
> 
> 1. it is not just about display.
> 2. display cases might depend on gt (the chicken and egg case I had
> mentioned).

Yes, this is based on commit cb8f81c17531.

> It won't be a simple solution. You probably will need to experiment
> with error injection cases and manual experiments before deciding
> the proper approach...

I did two experiments.

Without GUI: I injected errors in GT resume path at mulitple places and
still managed to land a working console after S3 resume.

With GUI: Crash and burn, but able to see resume failure on tty with
this patch.

Hope this helps.

Raag

> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 4390ba69610d..559cf5490ac0 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
> >  
> >  	xe_irq_resume(xe);
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_resume(gt);
> > +		if (err)
> > +			break;
> > +	}
> >  
> > +	/*
> > +	 * Try to bring up display before bailing from GT resume
> > failure,
> > +	 * so we don't leave the user clueless with a blank screen.
> > +	 */
> >  	xe_display_pm_resume(xe);
> > +	if (err)
> > +		goto err;
> >  
> >  	err = xe_bo_restore_late(xe);
> >  	if (err)
> > @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  
> >  	xe_irq_resume(xe);
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe->d3cold.allowed ? xe_gt_resume(gt) :
> > xe_gt_runtime_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) :
> > xe_gt_runtime_resume(gt);
> > +		if (err)
> > +			break;
> > +	}
> >  
> > +	/*
> > +	 * Try to bring up display before bailing from GT resume
> > failure,
> > +	 * so we don't leave the user clueless with a blank screen.
> > +	 */
> >  	xe_display_pm_runtime_resume(xe);
> > +	if (err)
> > +		goto out;
> >  
> >  	if (xe->d3cold.allowed) {
> >  		err = xe_bo_restore_late(xe);
