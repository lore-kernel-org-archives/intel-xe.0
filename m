Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3BECA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 08:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA7A10E353;
	Wed, 20 Aug 2025 08:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCa0eryb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800DE10E353
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755679100; x=1787215100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5NzqaIzl1vmJXHr7n34imiKqgYNaFK1I5nLYEx0uXkI=;
 b=iCa0erybyQ4oZccNK45GO2SNn8ib5WBI2m+1fcTs80ppMoRRs3xsjmXO
 CSZzNbmlDO6alkRV702+5SftexrpSMH6/U9RaiT4+qBJtBeBTdi3kRHSt
 BjOdKv61mk4sHa0rTzdFOYty4nkPixY5jOq2c1jOy1bLZADV4R1zjS8qG
 IFec6U85B2KC7i7w7rGBhnLluX4QxPR52JepbVoC6qFhtDSP5iPwiyt1b
 Nknl68Eo8vc5NXTUl4X02xM2HiwgF+xERSNHlVUyfIX1P84/vxA+cu1qu
 kJ8SxkG5mDHZQOBs7voGpk5BqE7dAlLVrrbvw2XhXfCYmSNVwKnEyKzKH A==;
X-CSE-ConnectionGUID: ElvpEjUAQsG4i20Gtdyztg==
X-CSE-MsgGUID: AIPZUxhMSvmHZqohxMrV3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57799433"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57799433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:38:19 -0700
X-CSE-ConnectionGUID: kp27JTq8QKe8Nub/S60kNQ==
X-CSE-MsgGUID: pnHzYt1zRL2OAe0SEW9zkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="199073071"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.248])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:38:17 -0700
Date: Wed, 20 Aug 2025 10:38:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe_sync: avoid race during ufence signaling
Message-ID: <kkhmpcfyzsxcqdrnfldosnuwyg6lfkbyikdyurvxd2kgjssoq7@o555bvkytas7>
References: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
 <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
 <aKUYOzi09QwH/bgt@lstrano-desk.jf.intel.com>
 <aKUZZGMS4WRd4Byc@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKUZZGMS4WRd4Byc@lstrano-desk.jf.intel.com>
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

On Tue, Aug 19, 2025 at 05:40:04PM -0700, Matthew Brost wrote:
> On Tue, Aug 19, 2025 at 05:35:07PM -0700, Matthew Brost wrote:
> > On Tue, Aug 19, 2025 at 08:44:04PM +0200, Zbigniew Kempczyński wrote:
> > > During vm-bind ioctl ops execute fence may be signaled during the call.
> > > If vm-bind syncs to user-fence it creates a race because signaling
> > > happens in the worker. This means control may return from vm-bind
> > > ioctl and consecutive vm-bind operation to same vma (unmap) may happen
> > > on still not signaled user-fence. This finally ends with -EBUSY error
> > > because even if vma operations completed fence still exists but
> > > userspace was unblocked with copy_to_user() call.
> > > 
> > > Instead of releasing user-fences in workqueue for already signaled
> > > ops put them synchronously in the same vm-bind ioctl call.
> > > 
> > 
> > I'm not really following this explaination. I think the actual problem
> > is in user_fence_worker() the copy to user to done before
> > WRITE_ONCE(ufence->signalled, 1). If there were re-ordered, I think
> > that would fix this problem.
> > 
> 
> Also, as a follow-on optimization, you could keep it as you have here,
> but this patch has the same ordering issue. That should be fixed for
> consistency, even though it would still be functional because vm->lock
> protects against the misordering.

Unfortunately I can't use this, lockdep complained I've violated locking
rules. To properly handle this I likely could collect all user-fences to
signal outside of drm_exec loop in vm_bind_ioctl_ops_execute(). But I
don't know should I complicate the code for this particular case.

Thanks for the review, I've sent simple reorder patch which should fix
the 5536 issue.

--
Zbigniew

> 
> Matt
> 
> > Matt
> > 
> > > Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > > index f87276df18f2..8becc3755649 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -103,6 +103,15 @@ static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> > >  	dma_fence_put(fence);
> > >  }
> > >  
> > > +static void kick_ufence_sync(struct xe_user_fence *ufence, struct dma_fence *fence)
> > > +{
> > > +	if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> > > +		XE_WARN_ON("Copy to user failed");
> > > +	WRITE_ONCE(ufence->signalled, 1);
> > > +	user_fence_put(ufence);
> > > +	dma_fence_put(fence);
> > > +}
> > > +
> > >  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > >  {
> > >  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
> > > @@ -244,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> > >  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
> > >  					     user_fence_cb);
> > >  		if (err == -ENOENT) {
> > > -			kick_ufence(sync->ufence, fence);
> > > +			kick_ufence_sync(sync->ufence, fence);
> > >  		} else if (err) {
> > >  			XE_WARN_ON("failed to add user fence");
> > >  			user_fence_put(sync->ufence);
> > > -- 
> > > 2.43.0
> > > 
