Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02389E6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 20:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B7710E381;
	Fri, 30 Jan 2026 20:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pBile50Q";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA4D10E178;
 Fri, 30 Jan 2026 20:38:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 21A6D43893;
 Fri, 30 Jan 2026 20:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9694EC4CEF7;
 Fri, 30 Jan 2026 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1769805491;
 bh=ZtMtrB2Y+G7ZscbAHQAFYF5f2VD5t3/mtZEyvZca4WU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pBile50QnlGw8x75Ig9U45/zvrTbeGA0ov5UjecXOYj8eYIHEOhIX+dMpbkvVuR0W
 KaxG0ErlZlPaC9kxvgycPVLALXmhDSQoT1+nQjyuzLDUT5H8vJmsc62X6Y0T9uQaHR
 4Qo3+b9PwRuH9v2n3d6JoxuwZYR/0fN/oL8ep4/Q=
Date: Fri, 30 Jan 2026 12:38:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, linux-mm@kvack.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
In-Reply-To: <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Fri, 30 Jan 2026 20:56:31 +0100 Thomas Hellstr=F6m <thomas.hellstrom@lin=
ux.intel.com> wrote:

> >=20
> > > --- a/mm/hmm.c
> > > +++ b/mm/hmm.c
> > > @@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
> > > =A0			return -EBUSY;
> > > =A0		ret =3D walk_page_range(mm, hmm_vma_walk.last,
> > > range->end,
> > > =A0				=A0=A0=A0=A0=A0 &hmm_walk_ops,
> > > &hmm_vma_walk);
> > > +		/*
> > > +		 * Conditionally reschedule to let other work
> > > items get
> > > +		 * a chance to unlock device-private pages whose
> > > locks
> > > +		 * we're spinning on.
> > > +		 */
> > > +		cond_resched();
> > > +
> > > =A0		/*
> > > =A0		 * When -EBUSY is returned the loop restarts with
> > > =A0		 * hmm_vma_walk.last set to an address that has
> > > not been stored
> >=20
> > If the process which is running hmm_range_fault() has
> > SCHED_FIFO/SHCED_RR then cond_resched() doesn't work.=A0 An explicit
> > msleep() would be better?
>=20
> Unfortunately hmm_range_fault() is typically called from a gpu
> pagefault handler and it's crucial to get the gpu up and running again
> as fast as possible.

Would a millisecond matter?  Regular old preemption will often cause
longer delays.

> Is there a way we could test for the cases where cond_resched() doesn't
> work and in that case instead call sched_yield(), at least on -EBUSY
> errors?

kernel-internal sched_yield() was taken away years ago and I don't
think there's a replacement, particularly one which will cause a
realtime-policy task to yield to a non-rt-policy one.

It's common for kernel code to forget that it could have realtime
policy - we probably have potential lockups in various places.

I suggest you rerun your testcase with this patch using `chrt -r', see
if my speculation is correct.
