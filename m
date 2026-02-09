Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE76BE78D6A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 09:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797CB10E134;
	Mon,  9 Feb 2026 09:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNFhWGR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B263210E134
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770628155; x=1802164155;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LJhZwOQaF3Qxd7W9bhp3kinOPSPHx67D3K5urZ+dvCc=;
 b=PNFhWGR24VZ1jv8LpJx1woCk2rTJeOs2i6HB5CYfWvPExXOXzo4Raxxj
 RiaJjnt7SIOoiJgBNcnEIPvJLaNQlUvwSReg2hb8xkDcdy06G8X07MyDa
 N+NoAVwQDGa07hoSfFhrlVjhAjd/Z6bs3O/0HuJYZlaT7Wp6vDe/Wxdlo
 Dhq/8+YDncha+SlLbbzdTwnfC5ZyXM+Q1IEuwLMGKtYVAtD3h+UuCtJbG
 JqKqINvq90kKD4+SFpRG40HcbfssDSbj3u1gBqNGA5lbgJQpzYFwuy3aw
 R5sv1J7PtMzZCk5katA/v3pyVLbhf1F0B90bo1Ee+bfojCojLA86pO8vD g==;
X-CSE-ConnectionGUID: aofqZc+TRFOCFTxdfeGcZA==
X-CSE-MsgGUID: M6RJUkqIQcG/WcrKFANA5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71800393"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71800393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:09:15 -0800
X-CSE-ConnectionGUID: fzvSi1eiQe6wC/CseLP0RQ==
X-CSE-MsgGUID: gMJzggK2RCqdqOq+GMtDug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211537600"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.179])
 ([10.245.245.179])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:09:14 -0800
Message-ID: <b5ca8f95ae165a38cf5aa95d1aabd8e6c60847eb.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA
 manager swap_guard
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org, Michal Wajdeczko
 <michal.wajdeczko@intel.com>,  Matthew Auld <matthew.auld@intel.com>
Date: Mon, 09 Feb 2026 10:09:11 +0100
In-Reply-To: <aYYy6S+wb7LFA0G0@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
 <65de6e6accc8e4344d9d068523fe01a6ecc3cff0.camel@linux.intel.com>
 <aYYy6S+wb7LFA0G0@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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


Hi,

On Fri, 2026-02-06 at 10:28 -0800, Matthew Brost wrote:
> On Fri, Feb 06, 2026 at 05:17:46PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Hi
> >=20
> > On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> > > Annotate the SA manager init path to model taking swap_guard
> > > while
> > > under
> > > reclaim context. This helps lockdep catch potential circular
> > > dependencies
> > > between fs_reclaim and swap_guard in debug builds.
> > >=20
> > > Signed-off-by: Satyanarayana K V P
> > > <satyanarayana.k.v.p@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > >=20
> > > ---
> > > V1 -> V2:
> > > - None.
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
> > > =C2=A01 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_sa.c
> > > b/drivers/gpu/drm/xe/xe_sa.c
> > > index b738102575d4..5efbb5a09f77 100644
> > > --- a/drivers/gpu/drm/xe/xe_sa.c
> > > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > > @@ -89,6 +89,12 @@ struct xe_sa_manager
> > > *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> > > =C2=A0 if (ret)
> > > =C2=A0 return ERR_PTR(ret);
> > > =C2=A0
> > > + if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > + fs_reclaim_acquire(GFP_KERNEL);
> > > + might_lock(&sa_manager->swap_guard);
> > > + fs_reclaim_release(GFP_KERNEL);
> > > + }
> > > +
> > > =C2=A0 shadow =3D xe_managed_bo_create_pin_map(xe, tile, size,
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> >=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > In addition to this, a couple of comments to the code that is
> > already
> > in the driver:
> >=20
> > It would be beneficial for understanding if a document section was
> > added for the typical usage flow of the shadow buffer, something
> > like
> > the below (hope I got this correct).
> >=20
> > *) Clearly stating the use-case: That the whole buffer is bound to
> > HW
> > and can execute at any time. The shadow buffer is part of a double
> > buffering scheme so that updates are visible to the hardware
> > atomically.
> >=20
> > *) The flow:
> > -lock()
> > -Swap buffers: The buffers are identical. The buffer bound to
> > hardware
> > becomes the shadow.
> > -Update the primary buffer.
> > -Flush the cpu buffer to primary on DGFX (BTW IIRC this was missing
> > in
> > the code). -Point the HW to the primary buffer.
> > -sync the shadow to the primary.
> > -unlock()
> >=20
>=20
> This is is roughly correct. I agree a kernel doc section would be
> good.
>=20
> > In addition perhaps more lockdep asserts an also perhaps pin the
> > lock
>=20
> More lockdep is also good. What functions do you think are missing
> asserts?
>=20
> These are two possible ones I came up with:
>=20
> xe_sriov_vf_ccs_rw_update_bb_addr


> xe_bb_ccs_new

These are possible candidates, But I was mostly thinking of the xe_sa
functions involved in the above flow. So that would essentially be
xe_sa_bo_flush_write() missing asserts.


>=20
> > in swap buffers and unpin in sync to shadow so that if anybody
> > releases
>=20
> Pin/unpin isn=E2=80=99t a bad idea. We could also have xe_sa_bo_swap_shad=
ow /
> xe_sa_bo_sync_shadow acquire and release the swap lock, since that
> clearly
> defines the critical section for this lock - what do think?
>=20
> > the lock in between you'd get a warning.
> >=20
> > But this can be done as a follow-up, (beware the possibly missing
> > cpu
>=20
> There are barriers in xe_sriov_vf_ccs_rw_update_bb_addr, do you think
> anything else is missing?

Yes, on DGFX we maintain a system memory buffer to avoid read
operations over PCIe. So writes to the sa memory doesn't immediately
appear in primary gpu memory. It needs a xe_sa_bo_flush_write(). I
might have missed it, but I don't see it in the code?

Also as an unrelated item, I think we should use scoped_guard() instead
of guard() for xe_bo_swap_guard() to clearly mark the region where the
lock is strictly needed? Would make it easier for a new developer
reading the code or somebody updating the code at the end of the
function to not add unnecessary stuff in the critical section.

Thanks,
Thomas

>=20
> Matt
>=20
> > buffer flush, though). I think it's worth spending some time on
> > this.
> >=20
> > Thanks,
> > Thomas
> > =C2=A0=C2=A0 A.=20
