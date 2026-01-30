Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D6E6BF10
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D34610E106;
	Fri, 30 Jan 2026 21:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PxHhylMn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AB310E106;
 Fri, 30 Jan 2026 21:08:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D0D36013A;
 Fri, 30 Jan 2026 21:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94782C4CEF7;
 Fri, 30 Jan 2026 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1769807315;
 bh=NpIWKTcK0nElwmNCWQsMcXiocFq60OtqNvc0TmYMhpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PxHhylMnpGHxaYWvYQVZLPqe6RRG2x2B+ggYwZIU30b3Ew6cQLMcdWnHk4NxUd35q
 /DWbjjtUbgZoNxYCAIONothAH76NlkNHxJERU6WcPdb0qnRJIzB3EW/0MwUiv5SpA0
 6Sy9LCXY/OF0lVDCO1Q6CM7gE1uBdrVtvcIGVElA=
Date: Fri, 30 Jan 2026 13:08:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 <linux-mm@kvack.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260130130835.10d004cd79d67c55b10def74@linux-foundation.org>
In-Reply-To: <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
 <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
 <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 30 Jan 2026 13:01:24 -0800 Matthew Brost <matthew.brost@intel.com> wrote:

> > > Unfortunately hmm_range_fault() is typically called from a gpu
> > > pagefault handler and it's crucial to get the gpu up and running again
> > > as fast as possible.
> > 
> > Would a millisecond matter?  Regular old preemption will often cause
> > longer delays.
> > 
> 
> I think millisecond is too high. We are aiming to GPU page faults
> serviced in 10-15us of CPU time (GPU copy time varies based on size of
> fault / copy bus speed but still at most 200us).

But it's a rare case?

Am I incorrect in believing that getting preempted will cause latencies
much larger than this?

> Matt
> 
> > > Is there a way we could test for the cases where cond_resched() doesn't
> > > work and in that case instead call sched_yield(), at least on -EBUSY
> > > errors?
> > 
> > kernel-internal sched_yield() was taken away years ago and I don't
> > think there's a replacement, particularly one which will cause a
> > realtime-policy task to yield to a non-rt-policy one.
> > 
> > It's common for kernel code to forget that it could have realtime
> > policy - we probably have potential lockups in various places.
> > 
> > I suggest you rerun your testcase with this patch using `chrt -r', see
> > if my speculation is correct.

Please?
