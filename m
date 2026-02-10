Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B0E94628
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 01:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16BA10E39D;
	Tue, 10 Feb 2026 01:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2n4Qvnv3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A310E139;
 Tue, 10 Feb 2026 01:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F2CE60008;
 Tue, 10 Feb 2026 01:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F5BC116C6;
 Tue, 10 Feb 2026 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1770687287;
 bh=T/HCmpcNqFcFD7xZ86y+ZqO8jXnLnbpyYwBENPJl2eI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2n4Qvnv3dtojiMggwW254KgxnSn9CjO1dUWy3GOSer8V7sbAUuJUTPUZ4qine7txY
 V0v6T4Ggpk2LSpnLqB0OWN7YCvMGMU4/BzUzjxpvxFWoZLP+xlzPqjvxQstWW9Gw/O
 Yq/kTGRQ24+XqR4ouSD4ZmCR29P6yO2J3fgcgqNA=
Date: Mon, 9 Feb 2026 17:34:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Matthew Brost <matthew.brost@intel.com>, John
 Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260209173446.b76547c4028132f71de1b8eb@linux-foundation.org>
In-Reply-To: <89cb1d4744789702cd80dba8eb40dd50bf053b4e.camel@linux.intel.com>
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
 <89cb1d4744789702cd80dba8eb40dd50bf053b4e.camel@linux.intel.com>
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

On Mon, 09 Feb 2026 15:47:38 +0100 Thomas Hellstr=F6m <thomas.hellstrom@lin=
ux.intel.com> wrote:

> @Alistair, any chance of an R-B for the below version?

Yes please.

> @Andrew, will this go through the -mm tree or alternaltively an ack for
> merging through drm-xe-fixes?

Either works.  I'll grab a copy.  It you want to take this via drm then
I'll drop the mm.git copy once the drm tree's version appears in linux-next.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

> > The lru_add_drain_all() function requires a short work-item

Pet peeve: s/the foo() function/foo()/g.  It's just as good!

> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > =A0				unlock_page(vmf->page);
> > =A0				put_page(vmf->page);
> > =A0			} else {
> > -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				pte_unmap(vmf->pte);
> > +				softleaf_entry_wait_on_locked(entry, vmf->ptl);
> > =A0			}
> > =A0		} else if (softleaf_is_hwpoison(entry)) {
> > =A0			ret =3D VM_FAULT_HWPOISON;

So apart from the rename, this is the whole patch.  This got nicer!
