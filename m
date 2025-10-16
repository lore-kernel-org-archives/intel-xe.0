Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3596CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E6E10E9CA;
	Thu, 16 Oct 2025 12:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/jv2P/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD1310E9CA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760617274; x=1792153274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0qlxxdt2FGnQoln2jbo7tGppt7sNuGQUurx7hNXYTbw=;
 b=m/jv2P/cF6bYVouGvuoXHXVdNfdiLS4YXRQgRY4DmAN3MoMlFEgA2KhN
 5+AYIg1vFLZn/nctpzflFvpMAysEie7wW6E6i675WD2GyBaLOtJDMS1NG
 Bm/DAmhcr5PArRQVaeRbJ9shF8hMUkDEheqfTPmPgkLKrLU2X3pdPPNc+
 UP6KLwK9uLg2d+MIuF7w4Zhdr+HpJy5Ti3qFqdgdFVvsDpNCEMYnIvaSe
 AMhMbjHAzC0i2W8O7ZEoCedoVRuiwS1Wmrel4p+oocmuFC85vsa/USr4w
 tA86v0OZNZDDLRFrMnybZ5JgkQsogjbaQ996+rrnDNUNnCfxpUsz1f5bu w==;
X-CSE-ConnectionGUID: 21WsrCt1TRyYCprnpY52UQ==
X-CSE-MsgGUID: Ft+H/Sh4TMa+Xq5hEoOqpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80442977"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80442977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:21:13 -0700
X-CSE-ConnectionGUID: oTn4VRJXQYy08bZh67N5/g==
X-CSE-MsgGUID: +93P16s3SP2dYdnOo+WjZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183233661"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:21:12 -0700
Date: Thu, 16 Oct 2025 14:21:09 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Make xe_guc_submit_pause() available
 for non-VF cases
Message-ID: <aPDjNWORoOC7SccI@black.igk.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-2-raag.jadav@intel.com>
 <aO6Rzzh7YNzpVy/0@lstrano-desk.jf.intel.com>
 <aO9Hbfo06ZrVShss@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO9Hbfo06ZrVShss@black.igk.intel.com>
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

On Wed, Oct 15, 2025 at 09:04:18AM +0200, Raag Jadav wrote:
> On Tue, Oct 14, 2025 at 11:09:19AM -0700, Matthew Brost wrote:
> > On Tue, Oct 14, 2025 at 01:00:35PM +0530, Raag Jadav wrote:
> > > Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()
> > > available for non-VF cases.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 0ef67d3523a7..3cc428d45b4a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2170,8 +2170,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> > >  	struct xe_exec_queue *q;
> > >  	unsigned long index;
> > >  
> > > -	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> > > -
> > 
> > This function does a lot of things specific to VF recovery, it should
> > not be called in runtime PM flows. Same goes for xe_guc_submit_unpause.
> 
> Can we branch them out inside pause/unpause()? Or is there a better
> alternative?
> 
> Considering we'd still like to achieve the original pause/unpause()
> behaviour here (stop/start submission on a scheduler without loosing
> GuC state), do you suspect any side-effects?

I came up with something like this, but not sure if this is correct way
to do this. Let me know what you think.

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..8ee6069abe99 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2127,6 +2127,11 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
+
+	/* Non-VF cases don't need migration */
+	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+		return;
+
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&q->guc->lr_tdr);
 	else
@@ -2170,8 +2175,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
-	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
-
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		/* Prevent redundant attempts to stop parallel queues */
@@ -2325,6 +2328,12 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	lockdep_assert_held(&guc->submission_state.lock);
 
+	/* Non-VF cases don't need migration */
+	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
+		xe_sched_submission_start(sched);
+		return;
+	}
+
 	xe_sched_resubmit_jobs(sched);
 	guc_exec_queue_replay_pending_state_change(q);
 	xe_sched_submission_start(sched);
