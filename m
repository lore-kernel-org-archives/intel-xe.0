Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9FFD1A627
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834110E8D2;
	Fri,  9 Jan 2026 13:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7fN0YV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C2910E8D2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767966205; x=1799502205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t8pL0R/BzX+XBSzUmnfrKyRqq6ma79hvutwFeit6fKk=;
 b=A7fN0YV0RUklyBJMesBOQaC6BNZ8D6428Qh6giWESFyZj0rCcdvGkQP+
 aQLoTikh8154jh3hhME79LkWBCjs9L+I1Ovr1Gdp9NCkT1V22Xr6PkxAq
 tDIfDGelSQcu0FiOIWqfpxyvjOgKgcHVlXGqJxwpw/rZt3A+khwi5rk9l
 fid3F6NCrQfYE8RFN5TAs1jsfRmt1d2F3DhC/1HDFl+ehhPb1Sgy+hYWv
 rNyJQuw8VXKVsXupy7QPrtRoK/ilnzxCo/ezmQYJwsFpz9OMdD8vDZR/m
 EF+uFUOSfNVjRo9mouKTArZkI8Oo9eXoSHUDOy/Q1QfmjA74dGH3C5eK9 g==;
X-CSE-ConnectionGUID: xOjWT0PGTcKyIpGayu2H6g==
X-CSE-MsgGUID: 9VKuMK2uR9uuP3XBCzv+9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="56901486"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="56901486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:43:25 -0800
X-CSE-ConnectionGUID: Cg3PmPtrRX6Y90onxnP9lg==
X-CSE-MsgGUID: eOi1uOq2Ry6/UhWm+46EAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="207953377"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:43:23 -0800
Date: Fri, 9 Jan 2026 14:43:20 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 karthik.poosa@intel.com, matthew.d.roper@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Message-ID: <aWEF-MRhF5PiGTkP@black.igk.intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
 <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
 <7fe6e5fc-532d-4b27-878c-de47520f2482@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fe6e5fc-532d-4b27-878c-de47520f2482@intel.com>
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

On Fri, Jan 09, 2026 at 04:37:39PM +0530, Nilawar, Badal wrote:
> On 09-01-2026 11:28, Raag Jadav wrote:
> > On Fri, Jan 09, 2026 at 08:14:05AM +0530, Nilawar, Badal wrote:
> > > On 20-12-2025 13:06, Raag Jadav wrote:
> > > > We've been historically ignoring GT resume failure. Since the function
> > > > can return error, handle it properly.
> > > > 
> > > > v2: Bring up display before bailing (Matt Roper, Rodrigo)
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
> > > >    1 file changed, 22 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 4390ba69610d..559cf5490ac0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
> > > >    	xe_irq_resume(xe);
> > > > -	for_each_gt(gt, xe, id)
> > > > -		xe_gt_resume(gt);
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe_gt_resume(gt);
> > > > +		if (err)
> > > > +			break;
> > > GT and SAMedia are different entities (even if both are treated as GTs in
> > > software), should we not continue attempting to resume the remaining GT even
> > > if resuming first one fails.
> > My limited understanding is that GUI needs render engine, which the user
> > won't be getting back either way.
> 
> Ok, but how about multi-tile platform like PVC which doesn't have Render
> engine and Media?

I'm assuming we don't need display to be able to debug them?

Regardless, a semi-working hardware would cause even more problems than
solve IMHO but I'll leave to the experts to decide.

Raag

> > > > +	}
> > > > +	/*
> > > > +	 * Try to bring up display before bailing from GT resume failure,
> > > > +	 * so we don't leave the user clueless with a blank screen.
> > > > +	 */
> > > >    	xe_display_pm_resume(xe);
> > > > +	if (err)
> > > > +		goto err;
> > > >    	err = xe_bo_restore_late(xe);
> > > >    	if (err)
> > > > @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >    	xe_irq_resume(xe);
> > > > -	for_each_gt(gt, xe, id)
> > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > +		if (err)
> > > > +			break;
> > > > +	}
> > > > +	/*
> > > > +	 * Try to bring up display before bailing from GT resume failure,
> > > > +	 * so we don't leave the user clueless with a blank screen.
> > > > +	 */
> > > >    	xe_display_pm_runtime_resume(xe);
> > > > +	if (err)
> > > > +		goto out;
> > > >    	if (xe->d3cold.allowed) {
> > > >    		err = xe_bo_restore_late(xe);
