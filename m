Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B98FD25955
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 07:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349AA10E4C5;
	Tue, 27 Jan 2026 07:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2Eqxca9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5277010E4C5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769498440; x=1801034440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TjECgx/1Sw7kFpsQY0yacqiHEfh0uZHNvA7zEAdAPWg=;
 b=c2Eqxca9WXBjq6nuswRyC0juS+thn4yCjVALT33gFVhEJ4pYmT8bGxTj
 qdAXcpEckKsflHdNhQMatDCWZ7XFiqn/hhLbWHGLFaESUrWEow+qLKYc2
 crDpN7c+uxd/qvevtxSqXajLZ+Bl+lQgyVDpaZnWecGvnR1Qj4KlEjgrX
 XSLAz2hii5bAsxagcYLakfmZVmGhureXQMJVbvROTwO80gHDTMsixsttu
 y8B6W55LCELsdNyY9wZFgJv25HRo6rNJPnI0kZ5fbIlMJatWYW4E1df24
 xyKkyKfJtsBTzy8OT1shCKJcnzLO/FyW1cLttN9o44LON9JCEuhXF2ICZ A==;
X-CSE-ConnectionGUID: l/Sl3RuJRXa8mFRiH5M8rw==
X-CSE-MsgGUID: 0lnHzn4ASJaqzfh+7vGElQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82114372"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82114372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:20:39 -0800
X-CSE-ConnectionGUID: 9tE8CA2PSTKe7CAY6cgzLQ==
X-CSE-MsgGUID: 3uZKKpNbSE+NWMpiVYsGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="230852642"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.11])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:20:38 -0800
Date: Tue, 27 Jan 2026 08:20:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <3ropzjiwoal64zajsgyba3nefzmntbvsk6oxp3pv2li4nfobiz@3gsjuhsuhkhn>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <aW/vdvCw/3DZwfpt@lstrano-desk.jf.intel.com>
 <ftzvlqcyj74d4bh25mreg64f647jintfteo7apctrnrsjgqbjs@k2ulohn2ycsg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ftzvlqcyj74d4bh25mreg64f647jintfteo7apctrnrsjgqbjs@k2ulohn2ycsg>
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

On Thu, Jan 22, 2026 at 09:44:14AM +0100, Zbigniew Kempczyński wrote:
> On Tue, Jan 20, 2026 at 01:11:18PM -0800, Matthew Brost wrote:
> > On Mon, Jan 19, 2026 at 01:01:34PM +0100, Zbigniew Kempczyński wrote:
> > > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > > would need to perform a context switch just to signal the fence, which
> > > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > > after executing the fence signaling instructions.
> > > > > > 
> > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > > >  
> > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > >  
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > >  	if (job->user_fence.used) {
> > > > > >  		i = emit_flush_dw(dw, i);
> > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > > >  
> > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > >  
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > >  	if (job->user_fence.used) {
> > > > > >  		i = emit_flush_dw(dw, i);
> > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > >  
> > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > >  
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > 
> > > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > > wait for completion, pipe-control is necessary to wait on
> > > > > compute-walker).
> > > > > 
> > > > 
> > > > This asynchronous behavior may explain things. Is this a common use
> > > > case?
> > > 
> > > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > > not doing this relying on kmd.
> > > 
> > 
> > It would be good confirm this.
> > 
> > > > 
> > > > Also do you know if render engines have similar asynchronous behaviors
> > > > or is this specific to compute engines?
> > > 
> > > I don't know, I think Mesa folks may know the answer.
> > >
> > 
> > Let me ask around about this.
> >  
> > > > 
> > > > Lastly, the i915 disables preemption on both render / compute engines
> > > > immediately after the BB before emitting the pipe control. Is this async
> > > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > > supports? This might explain why the i915 works and Xe does not.

We don't have platforms which supports WMTP in i915 driver. This imo explains why
there're no issues observed there. I mean regardless preemption state
disabled/enabled all instructions soon or later completes. 

> > > 
> > > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > > what test is doing has a meaning in this case. First compute-walker
> > > submits kernel which loops until it will observe some memory write.
> > > Second job executes compute-walker with kernel which does some quick job.
> > > But first occupies all EU's so second job can be preempted only when
> > > preemption occurs and SIP will be executed. So if we disable preemption
> > > immediately we submit compute-walker I think we have no change to enter
> > > SIP and switch. Even if I add pipe-control to batch level according
> > > to Daniele comment job it is still preemptable and we move pipe-control
> > > location from kmd -> batch level..
> > 
> > Does the test work with a pipe control in the batch? That would be a
> > good data point - if let me know how I can change the test I can test
> > out too.
> 
> I'm going to add appropriate pipe-control to pipeline and send the
> patch.

This change: https://patchwork.freedesktop.org/series/160484/

along with your patch passes the test.

--
Zbigniew

> 
> --
> Zbigniew
> 
> > 
> > It is fine the batch preempts, we actually want that. Mid-batch
> > preemption is not what we are trying to prevent - we are trying to
> > prevent preemption of the fence signaling after the batch is done. As
> > long as we don't regress any user applications we can safely make this
> > change - it is fine to break IGTs which are not doing the right thing
> > wrt to batch programming.
> > 
> > Matt
> > 
> > > 
> > > --
> > > Zbigniew
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > 
> > > > > --
> > > > > Zbigniew
> > > > > 
> > > > > >  	i = emit_render_cache_flush(job, dw, i);
> > > > > >  
> > > > > >  	if (job->user_fence.used)
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
