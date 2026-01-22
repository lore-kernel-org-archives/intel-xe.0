Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FDEC44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418A10E966;
	Thu, 22 Jan 2026 09:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9hNJyHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D61A10E048
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769073751; x=1800609751;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6keS0MqCQN6suV02StIgCS8Oru2kKF6XpfLKuY474Dw=;
 b=W9hNJyHlCuTEQL5o4b+SsaQnLtUNUD1YBhNfzIwiiCvcHteVjIJblJQ4
 Cyb13TwYLJyUAk498nCUtCIlBgN5QZ/gcjpCu714eNGNQsiIJXeHOvZXx
 FSYwMcocKQWaHa+OWW+M0T2Jg5M12l56nYV95BYYYae7UbT816r8MN6oM
 tzZ0i+41V9KFGiuR/SDNAfc762bSPDFYy8+zEGDdHxeceeZyIPjk5KfCe
 zbTJ3Wd/4LmM41Qhoaly8fAFAKXe+1XqIo1jDuGZkg5DDj5wNE64yH7Mo
 f5CQp/FPX67xEaMrsl7fDUIwEQjycLNeOz/pAaeIQiCX7/UFpFS8PJN6i g==;
X-CSE-ConnectionGUID: 09Ce7bZ3TA6LNUXIzhPZCQ==
X-CSE-MsgGUID: 0oFwYTIhSB+z9/CmN9XVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="92976202"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="92976202"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:22:30 -0800
X-CSE-ConnectionGUID: UZyBY1JPRH+AY+HAlkNk0w==
X-CSE-MsgGUID: nBXJjNwTRWOBi6k5DsUonQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="237946946"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:22:28 -0800
Date: Thu, 22 Jan 2026 10:22:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 intel-xe@lists.freedesktop.org, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <ykflaf7q4tizmft5gcyfnqg5asicwbz45nmp4cu7p452bfu3if@xignneucsxfg>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
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

On Tue, Jan 20, 2026 at 01:10:20PM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
> > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > would need to perform a context switch just to signal the fence, which
> > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > after executing the fence signaling instructions.
> > > > > 
> > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > >   1 file changed, 9 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >   	if (job->user_fence.used) {
> > > > >   		i = emit_flush_dw(dw, i);
> > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >   	if (job->user_fence.used) {
> > > > >   		i = emit_flush_dw(dw, i);
> > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > wait for completion, pipe-control is necessary to wait on
> > > > compute-walker).
> > > > 
> > > This asynchronous behavior may explain things. Is this a common use
> > > case?
> > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > not doing this relying on kmd.
> > 
> > > Also do you know if render engines have similar asynchronous behaviors
> > > or is this specific to compute engines?
> > I don't know, I think Mesa folks may know the answer.
> > 
> > > Lastly, the i915 disables preemption on both render / compute engines
> > > immediately after the BB before emitting the pipe control. Is this async
> > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > supports? This might explain why the i915 works and Xe does not.
> > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > what test is doing has a meaning in this case. First compute-walker
> > submits kernel which loops until it will observe some memory write.
> > Second job executes compute-walker with kernel which does some quick job.
> > But first occupies all EU's so second job can be preempted only when
> > preemption occurs and SIP will be executed. So if we disable preemption
> > immediately we submit compute-walker I think we have no change to enter
> > SIP and switch. Even if I add pipe-control to batch level according
> > to Daniele comment job it is still preemptable and we move pipe-control
> > location from kmd -> batch level..
> 
> So basically the test requires a preemption but does not put any preemption
> points within the batch? I'd argue that the fact that the test works at all
> is by chance, because the kernel just happens to add a preemption point
> after the BB and the batch doesn't wait for the results before completing.
> IMO it should be ok to go ahead with this patch and rework the test, but we
> probably need an ack from a maintainer because something that worked before
> (even if just by chance) is not going to work anymore.

Why user would need to explicitely add preemption points within batch?
It's imo driver responsibility to enable/disable preemption and additional
preemption points in the batch may change preemption distribution,
not the ability to preempt.

Compute-walkers we already had in IGT tests (gpgpu-fill) were called
in fire-and-forget mode leaving pipe-control to kmd. Code written
before I joined the team were written with this assumption and I haven't
seen any objection to this approach. So I assumed kmd will take care
of job completion when batch returns to ring. If this won't apply
anymore we just need to change IGT tests to add pipe-control in the
batch. And ensure nothing else is broken (compute / mesa).

I'm going to send pipe-control patch to IGTs, imo it will fix the
WMTP case. Sync wait at the batch level should keep execution with
preemption enabled allowing to call SIP and switch the context.

--
Zbigniew

> 
> Daniele
> 
> > 
> > --
> > Zbigniew
> > 
> > > Matt
> > > 
> > > > May you try to put arb disable after emit_render_cache_flush?
> > > > 
> > > > --
> > > > Zbigniew
> > > > 
> > > > >   	i = emit_render_cache_flush(job, dw, i);
> > > > >   	if (job->user_fence.used)
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
