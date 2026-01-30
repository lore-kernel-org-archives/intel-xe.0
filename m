Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AF7E6BF2F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702E710EA3B;
	Fri, 30 Jan 2026 18:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gB6I7Wum";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83DA10EA39;
 Fri, 30 Jan 2026 18:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA34C6001A;
 Fri, 30 Jan 2026 18:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30691C4CEF7;
 Fri, 30 Jan 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1769796014;
 bh=AFVyapZz7+rnLVcwl8jFcNdohlBEAdutFNruQ1aqrP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gB6I7WumOiVus7/WSV+qgJ8RC4GHJIMv0c9/bfPssW0cj2v2O8c2Vr1yOFpxpaIfL
 606t/2u3ouWNJ6bwa1u+fRQUs4MTsPyVqGrH/GnFVGUoyC9tpvjpwO2XIha24hfAd9
 UozEq6LX5GI/tCl7U2fq5VpTpS4xqDqTcHxIavIk=
Date: Fri, 30 Jan 2026 10:00:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, linux-mm@kvack.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
In-Reply-To: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
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

On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=F6m <thomas.hellstrom@lin=
ux.intel.com> wrote:

> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
>=20
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
>=20
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.

This is pretty bad behavior from lru_add_drain_all().

> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
>=20
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
>=20
> Resolve this using a cond_resched() after each iteration in
> hmm_range_fault(). Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() out of the
> folio locked region.
>=20
> Also, hmm_range_fault() can be a very long-running function
> so a cond_resched() at the end of each iteration can be
> motivated even in the absence of an -EBUSY.
>=20
> Fixes: d28c2c9a4877 ("mm/hmm: make full use of walk_page_range()")

Six years ago.

> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
>  			return -EBUSY;
>  		ret =3D walk_page_range(mm, hmm_vma_walk.last, range->end,
>  				      &hmm_walk_ops, &hmm_vma_walk);
> +		/*
> +		 * Conditionally reschedule to let other work items get
> +		 * a chance to unlock device-private pages whose locks
> +		 * we're spinning on.
> +		 */
> +		cond_resched();
> +
>  		/*
>  		 * When -EBUSY is returned the loop restarts with
>  		 * hmm_vma_walk.last set to an address that has not been stored

If the process which is running hmm_range_fault() has
SCHED_FIFO/SHCED_RR then cond_resched() doesn't work.  An explicit
msleep() would be better?
