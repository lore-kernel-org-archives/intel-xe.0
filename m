Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41459D277CC
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 07:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CB510E07D;
	Sat, 10 Jan 2026 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ck7IiRr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DFA10E07D
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768030535; x=1799566535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eFOgjH/ONrM7j9awzbb0ArYZmIKZJoe1/Ttwqun3q7g=;
 b=Ck7IiRr7GLV5PucZmSHoy1Dv3VRVuvZAU0CnpdTN2/1If1SwKjYW7DMd
 vlRrVLsYjM7WpHo+Ht+HdBQf5WBi3k3ieemxSUQRTuTTpnQasPRBeL8H/
 TcvhY4TUzR3+iCGvsIGKwr/XhQnTMXMGqhOJFwffoHV57tx51vr+/xcwB
 cERfVRDW+eNay3Pqx9zEN+uqYHdrKWZQDBf7m0hO6U4qihQdLtA8rEhUk
 MgQPy36mKfa4uk+kR1xrFfOP5U2T7bZXbtATASLkCSocjSubp/2lfQOyE
 pQAwSH+oBUrHW5S/+KpcF8+WGQqffGu+YqPzYW7CqGeI1+Yg1W85C9a2W w==;
X-CSE-ConnectionGUID: Z35iDGwIR3GiB+zSVUd4Pw==
X-CSE-MsgGUID: /BwQ29d7SZGfLLOjMjtI9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69380836"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69380836"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 23:35:34 -0800
X-CSE-ConnectionGUID: ow0ywQHTR+yAdIFITCFEYg==
X-CSE-MsgGUID: 8YpE8EC9RXWoDLBY4VjUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208482786"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 23:35:31 -0800
Date: Sat, 10 Jan 2026 08:35:29 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Message-ID: <aWIBQTLkpx2D-2n5@black.igk.intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
 <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
 <7fe6e5fc-532d-4b27-878c-de47520f2482@intel.com>
 <aWEF-MRhF5PiGTkP@black.igk.intel.com>
 <a8d6db36025d026a07eb7c1de07dfff376b69cc2.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8d6db36025d026a07eb7c1de07dfff376b69cc2.camel@intel.com>
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

On Fri, Jan 09, 2026 at 08:20:12PM +0530, Vivi, Rodrigo wrote:
> On Fri, 2026-01-09 at 14:43 +0100, Raag Jadav wrote:
> > On Fri, Jan 09, 2026 at 04:37:39PM +0530, Nilawar, Badal wrote:
> > > On 09-01-2026 11:28, Raag Jadav wrote:
> > > > On Fri, Jan 09, 2026 at 08:14:05AM +0530, Nilawar, Badal wrote:
> > > > > On 20-12-2025 13:06, Raag Jadav wrote:
> > > > > > We've been historically ignoring GT resume failure. Since the
> > > > > > function
> > > > > > can return error, handle it properly.
> > > > > > 
> > > > > > v2: Bring up display before bailing (Matt Roper, Rodrigo)
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
> > > > > >    1 file changed, 22 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > index 4390ba69610d..559cf5490ac0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
> > > > > >    	xe_irq_resume(xe);
> > > > > > -	for_each_gt(gt, xe, id)
> > > > > > -		xe_gt_resume(gt);
> > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > +		err = xe_gt_resume(gt);
> > > > > > +		if (err)
> > > > > > +			break;
> > > > > GT and SAMedia are different entities (even if both are treated
> > > > > as GTs in
> > > > > software), should we not continue attempting to resume the
> > > > > remaining GT even
> > > > > if resuming first one fails.
> > > > My limited understanding is that GUI needs render engine, which
> > > > the user
> > > > won't be getting back either way.
> > > 
> > > Ok, but how about multi-tile platform like PVC which doesn't have
> > > Render
> > > engine and Media?
> > 
> > I'm assuming we don't need display to be able to debug them?
> > 
> > Regardless, a semi-working hardware would cause even more problems
> > than
> > solve IMHO but I'll leave to the experts to decide.
> 
> What I liked in this Raag's version is that this is the most generic
> best-effort attempt we can get to still bring some display for some
> debug or information instead of only a blank screen or only keep
> moving as if nothing had happened.
> 
> A more complete version would be checks per platform and per type of
> GT etc. We can still attempt to try this as a follow up.
> 
> For server platforms such as PVC it is a bogus discussion. System
> Suspend is not a valid case there. Period.
> 
> For some discrete like BMG where render is there in the main GT,
> but display is fused off, we can simply return the error.

Display helpers already handle fused off cases.

	if (!xe->info.probe_display)
		return;

> For the case where main GT failed, we still can try to bring display
> up and get some output like Raag's attempt.
> 
> For the case where media GT failed we could proceed with the resume,
> but kind of a partial wedge of the media gt...

We can try to introduce some kind of per-gt wedging but that's pretty
much a driver wide redesign.

Raag

> > > > > > +	}
> > > > > > +	/*
> > > > > > +	 * Try to bring up display before bailing from GT
> > > > > > resume failure,
> > > > > > +	 * so we don't leave the user clueless with a blank
> > > > > > screen.
> > > > > > +	 */
> > > > > >    	xe_display_pm_resume(xe);
> > > > > > +	if (err)
> > > > > > +		goto err;
> > > > > >    	err = xe_bo_restore_late(xe);
> > > > > >    	if (err)
> > > > > > @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct
> > > > > > xe_device *xe)
> > > > > >    	xe_irq_resume(xe);
> > > > > > -	for_each_gt(gt, xe, id)
> > > > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) :
> > > > > > xe_gt_runtime_resume(gt);
> > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt)
> > > > > > : xe_gt_runtime_resume(gt);
> > > > > > +		if (err)
> > > > > > +			break;
> > > > > > +	}
> > > > > > +	/*
> > > > > > +	 * Try to bring up display before bailing from GT
> > > > > > resume failure,
> > > > > > +	 * so we don't leave the user clueless with a blank
> > > > > > screen.
> > > > > > +	 */
> > > > > >    	xe_display_pm_runtime_resume(xe);
> > > > > > +	if (err)
> > > > > > +		goto out;
> > > > > >    	if (xe->d3cold.allowed) {
> > > > > >    		err = xe_bo_restore_late(xe);
