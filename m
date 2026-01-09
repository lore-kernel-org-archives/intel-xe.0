Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A7D232E2
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 05:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D7910E173;
	Fri,  9 Jan 2026 05:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOWsUo81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08D110E173
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 05:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767938299; x=1799474299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JMK0O83OZsByg47PX7o0W3kFOC6uA7oSTKA26RDU3y0=;
 b=WOWsUo81GG/n1B3tlcDkUu0JqVU4TU4ixjqlwQ6zVoKoYJgkW/mr/bnt
 GDgAuljNoBD06jG5pbVXyXz7iZOvUJ2XB8NYMqCgye+7mpEWOyNfZBuPF
 a4+eol5ZenVRyidK/Sbkq12QWRliQimSX9QKSOqGs2sBuFFi6Xgy59GxY
 eK7xQ3FWxC9durZTHyX0efM/TRmFo3HzMc0ouW57AnSzKWHsLhq9q5r0Y
 cdofcYrUB0NV6AoAuCYj4vbA7NWkitfmP6sAXjFgYlKUq4o0g4oNRat3j
 NRoWdHKKQPOLznlaH0M/n5/IkztTr85NpOvxDVrEe1PZ2C8ETn62BoNt1 w==;
X-CSE-ConnectionGUID: cNdJkv7mR+SZExQud9dbkQ==
X-CSE-MsgGUID: BaKBOZBvQa+4RDL1/F4vjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69370082"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69370082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 21:58:18 -0800
X-CSE-ConnectionGUID: 48hpek96Q8q37AoCwDaPPw==
X-CSE-MsgGUID: n+mdh+FZQmKTsZABVyEwlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="207528414"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 21:58:16 -0800
Date: Fri, 9 Jan 2026 06:58:13 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 karthik.poosa@intel.com, matthew.d.roper@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Message-ID: <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
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

On Fri, Jan 09, 2026 at 08:14:05AM +0530, Nilawar, Badal wrote:
> On 20-12-2025 13:06, Raag Jadav wrote:
> > We've been historically ignoring GT resume failure. Since the function
> > can return error, handle it properly.
> > 
> > v2: Bring up display before bailing (Matt Roper, Rodrigo)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
> >   1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 4390ba69610d..559cf5490ac0 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
> >   	xe_irq_resume(xe);
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_resume(gt);
> > +		if (err)
> > +			break;
> 
> GT and SAMedia are different entities (even if both are treated as GTs in
> software), should we not continue attempting to resume the remaining GT even
> if resuming first one fails.

My limited understanding is that GUI needs render engine, which the user
won't be getting back either way.

Raag

> > +	}
> > +	/*
> > +	 * Try to bring up display before bailing from GT resume failure,
> > +	 * so we don't leave the user clueless with a blank screen.
> > +	 */
> >   	xe_display_pm_resume(xe);
> > +	if (err)
> > +		goto err;
> >   	err = xe_bo_restore_late(xe);
> >   	if (err)
> > @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	xe_irq_resume(xe);
> > -	for_each_gt(gt, xe, id)
> > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > +		if (err)
> > +			break;
> > +	}
> > +	/*
> > +	 * Try to bring up display before bailing from GT resume failure,
> > +	 * so we don't leave the user clueless with a blank screen.
> > +	 */
> >   	xe_display_pm_runtime_resume(xe);
> > +	if (err)
> > +		goto out;
> >   	if (xe->d3cold.allowed) {
> >   		err = xe_bo_restore_late(xe);
