Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A06E7E361
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 10:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6910E0D8;
	Fri,  3 Apr 2026 10:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvFXmveS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66D10E0D8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775210452; x=1806746452;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4JSRAw9km5Zo7bBKyhkiNKgxBjfgpidzKmClEAuBpuY=;
 b=lvFXmveS8UDO4ZsfymkPqpguwuu+APNLx8Q/Wh7uWD6b61Av3qZ6gp5O
 OUalfDdJugWxv7JLj1FPPPY3no75UWFryHK7WHOhB8xchtaQKWamaeKuX
 gSV2agODgpVsppoF4hYWDdY6E+9wwSYNeI1lTp5/zusMx61itJ14P9qQ0
 yp5dDYapNFHs6GwnJJ3f8XEmOsjDmBGUb0tu0ar1vmgXAfFWuPeCGtFXx
 XoMtCz3ruCJhDWZg3YG8BjdLNKce2NVn+4oMxWMyuH5+wbLIXVWPdOGki
 gsR83Mg2I2Wdzubz80clQJUDi3D56yCOFmvYlaXhGkWZ4KzwJ9Gxoyzd/ A==;
X-CSE-ConnectionGUID: qxyU65l7SjukeEVJ00IqIA==
X-CSE-MsgGUID: Aeggp7uKTXegur9c/efrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76161513"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76161513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 03:00:52 -0700
X-CSE-ConnectionGUID: FF06Eq2TQ5+RrGkR0aH7kw==
X-CSE-MsgGUID: 8GWrnRaJTNSUJaapYFuk7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="220581680"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.191])
 ([10.245.245.191])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 03:00:50 -0700
Message-ID: <de63e900ec874a731b1a9423ec45f1984e33b367.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix slab-out-of-bounds on PT update ops retry
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 stable@vger.kernel.org
Date: Fri, 03 Apr 2026 12:00:48 +0200
In-Reply-To: <ac8pYV9MTav7nmZu@gsse-cloud1.jf.intel.com>
References: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
 <ac8o/ubOXlXYTUeV@gsse-cloud1.jf.intel.com>
 <ac8pYV9MTav7nmZu@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Thu, 2026-04-02 at 19:43 -0700, Matthew Brost wrote:
> On Thu, Apr 02, 2026 at 07:42:06PM -0700, Matthew Brost wrote:
> > On Thu, Apr 02, 2026 at 11:15:39AM +0200, Thomas Hellstr=C3=B6m wrote:
> > > xe_pt_update_ops_prepare() calls xe_pt_update_ops_init() at the
> > > start of
> > > each invocation to reset per-attempt state, but current_op was
> > > not
> > > included in that reset. When vm_bind_ioctl_ops_execute() retries
> > > due to
> > > ww-mutex contention (drm_exec_retry_on_contention), ops_execute()
> > > calls
> >=20
> > I'm falling to see retry path around vm_bind_ioctl_ops_execute
> > related
> > to drm_exec_retry_on_contention... Also by the time we get to
> > vm_bind_ioctl_ops_execute we have all dma-resv, right?
>=20
> s/vm_bind_ioctl_ops_execute/ops_execute here...
>=20
> Matt

So indeed the error commit message states that the retry happens
earlier, but the KASAN message indicates that ops_execute() was already
started with the same vops. The patch indeed fixes the KASAN splat.

We might be looking at a bigger issue here, since when we
xe_vm_set_validation_exec() we need to be prepared to handle -EDEADLK
(and -ENOMEM) for that matter.

I guess in this situation those would primarily come from allocating
and validating page-table bos, and if there is a contention arising
from *any* ww lock (like in the future eviction) in ops_execute(), that
contention affects the __until_all_locked() and causes an implicit
rerun.

so I need to dig down into what's actually causing the rerun in this
case, and we need to ensure to properly handle -EDEADLKS and -ENOMEMS
after the xe_set_validation_exec() enclosed regions.

/Thomas.


>=20
> >=20
> > I believe the Kasan report but I just can't spot the bug - can you
> > point
> > out the retry path to me?
> >=20
> > Matt
> >=20
> > > xe_pt_update_ops_prepare() again. The second call walks the same
> > > op list
> > > and fills ops[] starting from current_op, which still holds the
> > > value
> > > from the first attempt. This indexes past the end of the ops
> > > array
> > > allocated by xe_vma_ops_alloc(), whose size was computed for a
> > > single
> > > pass.
> > >=20
> > > KASAN reported:
> > > =C2=A0 BUG: KASAN: slab-out-of-bounds in bind_op_prepare+0x89c/0xae0
> > > [xe]
> > > =C2=A0 Write of size 8 at addr ffff88812e72bae8 by task xe_evict/2848
> > > =C2=A0 [...]
> > > =C2=A0 bind_op_prepare+0x89c/0xae0 [xe]
> > > =C2=A0 xe_pt_update_ops_prepare+0xbd0/0x1570 [xe]
> > > =C2=A0 ops_execute+0x3ae/0x2030 [xe]
> > > =C2=A0 vm_bind_ioctl_ops_execute+0x4d5/0xed0 [xe]
> > >=20
> > > The write lands at ops[1].vma (offset 360 into the second element
> > > of a
> > > one-element 384-byte allocation) because entries[] is exactly 360
> > > bytes
> > > and current_op was 1 at the start of the retried prepare pass.
> > >=20
> > > Fix by resetting current_op to 0 in xe_pt_update_ops_init().
> > >=20
> > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > single job")
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: <stable@vger.kernel.org> # v6.12+
> > > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_pt.c | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 8e5f4f0dea3f..3607cd57fc4c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -2291,6 +2291,7 @@ xe_pt_update_ops_init(struct
> > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > =C2=A0	init_llist_head(&pt_update_ops->deferred);
> > > =C2=A0	pt_update_ops->start =3D ~0x0ull;
> > > =C2=A0	pt_update_ops->last =3D 0x0ull;
> > > +	pt_update_ops->current_op =3D 0;
> > > =C2=A0	xe_page_reclaim_list_init(&pt_update_ops->prl);
> > > =C2=A0}
> > > =C2=A0
> > > --=20
> > > 2.53.0
> > >=20
