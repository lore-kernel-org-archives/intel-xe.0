Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D977EFD20B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 09:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285B110E728;
	Wed, 25 Feb 2026 09:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldt5/ebG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3510E728
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772011135; x=1803547135;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5GMj4AK7yTK0dQ4LYRYT8aY7USG4qWbLB3o1GmxHycw=;
 b=ldt5/ebGc2qIMnTu/JIX3g+hhZOJ9oqGC5qSYapvP/5ST4TIVp1at11M
 MHZlY7VNawYMEVlKB0eVjFswPiaU+u1cNgjarK9NEsl/MqV+TL0iCm6F9
 wKvrp6NIA1nJtDWRRt5c24f9Od3pGncK9/Uhub6dLjafezIFm2VtoitC6
 xeH1LKYqWkyY1BNMHRY/4/qUeDk1llyIDEqkstAABugoj8mDRg0h9MyJC
 JTPw3fs8muvf+CMyeHVmuARZ3V/cX6NUV3LspB9YjVmMa5sTOB+XoIocF
 RBp1niikfxYb1RcT4nrHRSY2zEVJ9pWO7RVwOzX+hGmwqxpWfOQeFkAlD g==;
X-CSE-ConnectionGUID: ssIY+ZfxQIiRlnIY/hkTZQ==
X-CSE-MsgGUID: 78PdIKq5T+eN3sI2gtOMHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90459940"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="90459940"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:18:55 -0800
X-CSE-ConnectionGUID: SHhZZdOVS9GRlqf0GM+nrA==
X-CSE-MsgGUID: 2cEfODqwQ+i5YfzZFGvOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="246730260"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:18:52 -0800
Message-ID: <1fd477061dedf58f0e23d6b8e6715fdab50f88ef.camel@linux.intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable
 state tracking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Yadav, Arvind" <arvind.yadav@intel.com>,
 intel-xe@lists.freedesktop.org, 	himal.prasad.ghimiray@intel.com,
 pallavi.mishra@intel.com
Date: Wed, 25 Feb 2026 10:18:47 +0100
In-Reply-To: <aZ67AoEmxHz9rkly@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
 <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
 <14753c79-df95-4c14-b78b-cbee2670dac4@intel.com>
 <de396c52e6ca7377cd9f6e58b172b2232da4de4c.camel@linux.intel.com>
 <aZ67AoEmxHz9rkly@lstrano-desk.jf.intel.com>
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

On Wed, 2026-02-25 at 01:04 -0800, Matthew Brost wrote:
> On Wed, Feb 25, 2026 at 09:21:10AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-02-25 at 11:05 +0530, Yadav, Arvind wrote:
> > >=20
> > > On 24-02-2026 22:06, Matthew Brost wrote:
> > > > On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
> > > > > On 24-02-2026 18:18, Thomas Hellstr=C3=B6m wrote:
> > > > > > On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> > > > > > > Track purgeable state per-VMA instead of using a coarse
> > > > > > > shared
> > > > > > > BO check. This prevents purging shared BOs until all VMAs
> > > > > > > across
> > > > > > > all VMs are marked DONTNEED.
> > > > > > >=20
> > > > > > > Add xe_bo_all_vmas_dontneed() to check all VMAs before
> > > > > > > marking
> > > > > > > a BO purgeable. Add
> > > > > > > xe_bo_recheck_purgeable_on_vma_unbind()
> > > > > > > to
> > > > > > > handle state transitions when VMAs are destroyed - if all
> > > > > > > remaining VMAs are DONTNEED the BO can become purgeable,
> > > > > > > or
> > > > > > > if
> > > > > > > no VMAs remain it transitions to WILLNEED.
> > > > > > >=20
> > > > > > > The per-VMA purgeable_state field stores the madvise hint
> > > > > > > for
> > > > > > > each mapping. Shared BOs can only be purged when all VMAs
> > > > > > > unanimously indicate DONTNEED.
> > > > > > >=20
> > > > > > > One thing to note: when the last VMA goes away, we
> > > > > > > default
> > > > > > > back to
> > > > > > > WILLNEED. DONTNEED is a per-mapping hint, and without any
> > > > > > > mappings
> > > > > > > there is no remaining madvise state to justify purging.
> > > > > > > This
> > > > > > > prevents
> > > > > > > BOs from becoming purgeable solely due to being
> > > > > > > temporarily
> > > > > > > unmapped.
> > > > > > >=20
> > > > > > > v3:
> > > > > > > =C2=A0 =C2=A0 - This addresses Thomas Hellstr=C3=B6m's feedba=
ck: "loop
> > > > > > > over
> > > > > > > all vmas
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 attached to the bo and check that t=
hey all say
> > > > > > > WONTNEED. This
> > > > > > > will
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 also need a check at VMA unbinding"
> > > > > > >=20
> > > > > > > v4:
> > > > > > > =C2=A0 =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change=
 across all
> > > > > > > relevant
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 patches (Matt)
> > > > > > >=20
> > > > > > > v5:
> > > > > > > =C2=A0 =C2=A0 - Call xe_bo_recheck_purgeable_on_vma_unbind() =
from
> > > > > > > xe_vma_destroy()
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 right after drm_gpuva_unlink() wher=
e we already
> > > > > > > hold
> > > > > > > the BO lock,
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 drop the trylock-based late destroy=
 path (Matt)
> > > > > > > =C2=A0 =C2=A0 - Move purgeable_state into xe_vma_mem_attr wit=
h the
> > > > > > > other madvise
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 attributes (Matt)
> > > > > > > =C2=A0 =C2=A0 - Drop READ_ONCE since the BO lock already prot=
ects
> > > > > > > us
> > > > > > > (Matt)
> > > > > > > =C2=A0 =C2=A0 - Keep returning false when there are no VMAs -
> > > > > > > otherwise
> > > > > > > we'd mark
> > > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0 BOs purgeable without any user hint=
 (Matt)
> > > > > > > =C2=A0 =C2=A0 - Use xe_bo_set_purgeable_state() instead of di=
rect
> > > > > > > initialization(Matt)
> > > > > > > =C2=A0 =C2=A0 - use xe_assert instead of drm_war (Thomas)
> > > > > > Typo.
> > > > >=20
> > > > > Noted,
> > > > >=20
> > > > > > There were also a couple of review issues in my reply here:
> > > > > >=20
> > > > > > https://patchwork.freedesktop.org/patch/699451/?series=3D156651=
&rev=3D5
> > > > > >=20
> > > > > > that were never addressed or at least commented upon.
> > > > > >=20
> > > > > > The comment there on retaining purgeable state after the
> > > > > > last
> > > > > > vma is
> > > > > > unmapped could be discussed, though.
> > > > > >=20
> > > > > > Let's say we unmap a vma marking a bo purgeable. It then
> > > > > > becomes either
> > > > > > purged or non-purgeable.
> > > > > >=20
> > > > > > Then an app tries to access it either using a new vma or
> > > > > > CPU
> > > > > > map. Then
> > > > > > it will typically succeed, or might occasionally fail if
> > > > > > the bo
> > > > > > happened to be purged in between.
> > > > > >=20
> > > > > > How do we handle new vma map requests and cpu-faults to a
> > > > > > bo in
> > > > > > purgeable state? Do we block those?
> > > > >=20
> > > > > @Thomas,
> > > > >=20
> > > > > The implementation already blocks new access to purged BOs:
> > > > > =C2=A0=C2=A01. New VMA mappings (Patch 0005): vma_lock_and_valida=
te()
> > > > > rejects MAP
> > > > > operations to purged BOs with -EINVAL via the check_purged
> > > > > flag.
> > > > > =C2=A0=C2=A02. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and
> > > > > xe_gem_mmap_offset()
> > > > > return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing
> > > > > purged
> > > > > BOs.
> > > > > =C2=A0=C2=A03 . "Once purged, always purged": Even when the last =
VMA is
> > > > > unmapped,
> > > > > xe_bo_recompute_purgeable_state() preserves the PURGED state
> > > > > - it
> > > > > never
> > > > > transitions back to WILLNEED or DONTNEED (see early return at
> > > > > the
> > > > > top of the
> > > > > function).
> > > > >=20
> > > > > The only way forward for the application is to destroy the
> > > > > purged
> > > > > BO and
> > > > > create a new one.
> > > > >=20
> > > > > Regarding the 'no VMAs =E2=86=92 WILLNEED' logic: this only appli=
es
> > > > > to
> > > > > non-purged
> > > > > BOs that happen to be temporarily unmapped. Purged BOs remain
> > > > > permanently
> > > > > invalid.
> > > > So I think xe_bo_all_vmas_dontneed() isn't 100% correct...
> > > >=20
> > > > I think should return an enum...
> > > >=20
> > > > enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
> > > > 	XE_BO_VMAS_STATE_DONTNEED =3D 0,
> > > > 	XE_BO_VMAS_STATE_WILLNEED =3D 1,
> > > > 	XE_BO_VMAS_STATE_NO_VMAS =3D 2,
> > > > };
> > > >=20
> > > >=20
> > > > Then in xe_bo_recompute_purgeable_state() something like this:
> > > >=20
> > > > void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > > {
> > > > 	enum xe_bo_vma_purge_state state;
> > > >=20
> > > > 	if (!bo)
> > > > 		return;
> > > >=20
> > > > 	xe_bo_assert_held(bo);
> > > >=20
> > > > 	/*
> > > > 	 * Once purged, always purged. Cannot transition back
> > > > to
> > > > WILLNEED.
> > > > 	 * This matches i915 semantics where purged BOs are
> > > > permanently invalid.
> > > > 	 */
> > > > 	if (bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED)
> > > > 		return;
> > > >=20
> > > > 	state =3D xe_bo_all_vmas_dontneed(bo);
> > > > 	if (state =3D=3D XE_BO_VMAS_STATE_DONTNEED) {
> > > > 		/* All VMAs are DONTNEED - mark BO purgeable
> > > > */
> > > > 		if (bo->madv_purgeable !=3D
> > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > 			xe_bo_set_purgeable_state(bo,
> > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > 	} else if (state =3D=3D XE_BO_VMAS_STATE_WILLNEED) {
> > > > 		/* At least one VMA is WILLNEED - BO must not
> > > > be
> > > > purgeable */
> > > > 		if (bo->madv_purgeable !=3D
> > > > XE_MADV_PURGEABLE_WILLNEED)
> > > > 			xe_bo_set_purgeable_state(bo,
> > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > 	}
> > > > }
> > > >=20
> > > > I think would avoid the last unbind unintentionally flipping
> > > > from
> > > > DONTNEED -> WILLNEED.
> > > >=20
> > > > What do you both of you (Thomas, Arvind) think?
> > >=20
> > >=20
> > > @Matt,
> > >=20
> > > Good catch=E2=80=94I missed that transition. You=E2=80=99re right: wh=
en the last
> > > VMA
> > > is=20
> > > unmapped from a DONTNEED BO, the current logic can flip it back
> > > to=20
> > > WILLNEED, which discards the user=E2=80=99s hint. That=E2=80=99s wron=
g.
> > >=20
> > > =C2=A0=C2=A0 I like the enum approach to distinguish:
> > > =C2=A0=C2=A0 =C2=A0 -=C2=A0 *_DONTNEED: all VMAs are DONTNEED
> > > =C2=A0=C2=A0 =C2=A0 - *_WILLNEED: at least one VMA is WILLNEED
> > > =C2=A0=C2=A0 =C2=A0 - *_NO_VMAS: no VMAs present
> > >=20
> > > With that, xe_bo_recompute_purgeable_state() can avoid changing
> > > state
> > > on=20
> > > NO_VMAS and preserve "once purged, always purged," matching i915=20
> > > semantics. This also addresses Thomas's earlier question about
> > > new=20
> > > VMA/CPU access to purgeable BOs=E2=80=94the enum makes it clear we on=
ly=20
> > > transition on explicit VMA state, not on absence of VMAs.
> > >=20
> > > I'll rework xe_bo_all_vmas_dontneed() to return the enum and
> > > update
> > > the=20
> > > recompute path accordingly.
> > >=20
> > >=20
> > > @Thomas,
> > >=20
> > > Does this direction look good to you? If yes, I will send updated
> > > patch.
> >=20
> > Yes, but I'm also as mentioned concerned about whether we can add
> > new
> > vmas, cpu faults and exports in the WONTNEED state. If we can do
> > that,
> > it might succeed most of the time making a well-behave appearance
> > in
> > user-space, but if on occation the bo gets purged, the app would
> > seeming unexpectedly fail.
> >=20
> > So do we block new vmas cpu-faults and exports in the WONTNEED
> > state?
> >=20
>=20
> I=E2=80=99ve thought about the same thing. The new vmas semantics are a b=
it
> odd,
> because if you unbind the BO in WONTNEED and disallow creating new
> VMAs,
> the BO can never be used again=E2=80=94madvise requires a VMA to operate =
thus
> you can't move a BO out of WONTNEED. Maybe that=E2=80=99s acceptable or e=
ven
> desirable, but it would need to be documented, and ultimately we=E2=80=99=
d
> need
> a UMD ack for those semantics.
>=20
> CPU faults or exports in WONTNEED also seem like they should be
> disallowed with less odd sematics, but again, this should be
> documented
> and require UMD ack.

Hmm. With WONTNEED really to do as little as possible. So we shouldn't
go to into any sort of unmapping GPU- or CPU ptes. That means the end
behaviour might still be a bit erratic on access of a WONTNEED bo,
depending on previous access pattern we may or may not fault.

So we should probably disallow mmap(), VM_BIND and export, but allow
CPU- and GPU pagefaults. And document.

Speaking of pagefaults, I noticed that when *purged*, it looks like we
populate with scratch PTEs also on faulting VMs. I think this is the
correct approach, though, to avoid the prefetch pagefaults wreaking
havoc if accessing vmas with purged bos.

/Thomas


>=20
> Matt
>=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > Thanks,
> > > Arvind
> > >=20
> > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > > Thanks,
> > > > > Arvind
> > > > > > Thanks,
> > > > > > Thomas
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > > > Cc: Himal Prasad Ghimiray
> > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > > > > ---
> > > > > > > =C2=A0 =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > > > > =C2=A0 =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++-
> > > > > > > =C2=A0 =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 98
> > > > > > > ++++++++++++++++++++++++++++--
> > > > > > > =C2=A0 =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.h |=C2=A0 3 +
> > > > > > > =C2=A0 =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 | 1=
1 ++++
> > > > > > > =C2=A0 =C2=A05 files changed, 116 insertions(+), 6 deletions(=
-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > index cda3bf7e2418..329c77aa5c20 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > @@ -318,6 +318,7 @@ static void
> > > > > > > xe_vma_set_default_attributes(struct
> > > > > > > xe_vma *vma)
> > > > > > > =C2=A0 =C2=A0		.preferred_loc.migration_policy =3D
> > > > > > > DRM_XE_MIGRATE_ALL_PAGES,
> > > > > > > =C2=A0 =C2=A0		.pat_index =3D vma-
> > > > > > > >attr.default_pat_index,
> > > > > > > =C2=A0 =C2=A0		.atomic_access =3D
> > > > > > > DRM_XE_ATOMIC_UNDEFINED,
> > > > > > > +		.purgeable_state =3D
> > > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > > > =C2=A0 =C2=A0	};
> > > > > > > =C2=A0 =C2=A0	xe_vma_mem_attr_copy(&vma->attr, &default_attr)=
;
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > index 71cf3ce6c62b..e84b9e7cb5eb 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > @@ -39,6 +39,7 @@
> > > > > > > =C2=A0 =C2=A0#include "xe_tile.h"
> > > > > > > =C2=A0 =C2=A0#include "xe_tlb_inval.h"
> > > > > > > =C2=A0 =C2=A0#include "xe_trace_bo.h"
> > > > > > > +#include "xe_vm_madvise.h"
> > > > > > > =C2=A0 =C2=A0#include "xe_wa.h"
> > > > > > > =C2=A0 =C2=A0static struct drm_gem_object *xe_vm_obj(struct x=
e_vm
> > > > > > > *vm)
> > > > > > > @@ -1085,6 +1086,7 @@ static struct xe_vma
> > > > > > > *xe_vma_create(struct
> > > > > > > xe_vm *vm,
> > > > > > > =C2=A0 =C2=A0static void xe_vma_destroy_late(struct xe_vma *v=
ma)
> > > > > > > =C2=A0 =C2=A0{
> > > > > > > =C2=A0 =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > > > > > +	struct xe_bo *bo =3D xe_vma_bo(vma);
> > > > > > > =C2=A0 =C2=A0	if (vma->ufence) {
> > > > > > > =C2=A0 =C2=A0		xe_sync_ufence_put(vma->ufence);
> > > > > > > @@ -1099,7 +1101,7 @@ static void
> > > > > > > xe_vma_destroy_late(struct
> > > > > > > xe_vma
> > > > > > > *vma)
> > > > > > > =C2=A0 =C2=A0	} else if (xe_vma_is_null(vma) ||
> > > > > > > xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > > > =C2=A0 =C2=A0		xe_vm_put(vm);
> > > > > > > =C2=A0 =C2=A0	} else {
> > > > > > > -		xe_bo_put(xe_vma_bo(vma));
> > > > > > > +		xe_bo_put(bo);
> > > > > > > =C2=A0 =C2=A0	}
> > > > > > > =C2=A0 =C2=A0	xe_vma_free(vma);
> > > > > > > @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct
> > > > > > > dma_fence
> > > > > > > *fence,
> > > > > > > =C2=A0 =C2=A0static void xe_vma_destroy(struct xe_vma *vma, s=
truct
> > > > > > > dma_fence
> > > > > > > *fence)
> > > > > > > =C2=A0 =C2=A0{
> > > > > > > =C2=A0 =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > > > > > +	struct xe_bo *bo =3D xe_vma_bo(vma);
> > > > > > > =C2=A0 =C2=A0	lockdep_assert_held_write(&vm->lock);
> > > > > > > =C2=A0 =C2=A0	xe_assert(vm->xe, list_empty(&vma-
> > > > > > > > combined_links.destroy));
> > > > > > > @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct
> > > > > > > xe_vma *vma,
> > > > > > > struct dma_fence *fence)
> > > > > > > =C2=A0 =C2=A0		xe_assert(vm->xe, vma->gpuva.flags &
> > > > > > > XE_VMA_DESTROYED);
> > > > > > > =C2=A0 =C2=A0		xe_userptr_destroy(to_userptr_vma(vma));
> > > > > > > =C2=A0 =C2=A0	} else if (!xe_vma_is_null(vma) &&
> > > > > > > !xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > > > -		xe_bo_assert_held(xe_vma_bo(vma));
> > > > > > > +		xe_bo_assert_held(bo);
> > > > > > > =C2=A0 =C2=A0		drm_gpuva_unlink(&vma->gpuva);
> > > > > > > +		xe_bo_recompute_purgeable_state(bo);
> > > > > > > =C2=A0 =C2=A0	}
> > > > > > > =C2=A0 =C2=A0	xe_vm_assert_held(vm);
> > > > > > > @@ -2681,6 +2685,7 @@ static int
> > > > > > > vm_bind_ioctl_ops_parse(struct xe_vm
> > > > > > > *vm, struct drm_gpuva_ops *ops,
> > > > > > > =C2=A0 =C2=A0				.atomic_access =3D
> > > > > > > DRM_XE_ATOMIC_UNDEFINED,
> > > > > > > =C2=A0 =C2=A0				.default_pat_index =3D op-
> > > > > > > > map.pat_index,
> > > > > > > =C2=A0 =C2=A0				.pat_index =3D op-
> > > > > > > > map.pat_index,
> > > > > > > +				.purgeable_state =3D
> > > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > > > =C2=A0 =C2=A0			};
> > > > > > > =C2=A0 =C2=A0			flags |=3D op->map.vma_flags &
> > > > > > > XE_VMA_CREATE_MASK;
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > index d9cfba7bfe0b..c184426546a2 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > @@ -12,6 +12,7 @@
> > > > > > > =C2=A0 =C2=A0#include "xe_pat.h"
> > > > > > > =C2=A0 =C2=A0#include "xe_pt.h"
> > > > > > > =C2=A0 =C2=A0#include "xe_svm.h"
> > > > > > > +#include "xe_vm.h"
> > > > > > > =C2=A0 =C2=A0struct xe_vmas_in_madvise_range {
> > > > > > > =C2=A0 =C2=A0	u64 addr;
> > > > > > > @@ -183,6 +184,89 @@ static void madvise_pat_index(struct
> > > > > > > xe_device
> > > > > > > *xe, struct xe_vm *vm,
> > > > > > > =C2=A0 =C2=A0	}
> > > > > > > =C2=A0 =C2=A0}
> > > > > > > +/**
> > > > > > > + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO
> > > > > > > are
> > > > > > > marked
> > > > > > > DONTNEED
> > > > > > > + * @bo: Buffer object
> > > > > > > + *
> > > > > > > + * Check all VMAs across all VMs to determine if BO can
> > > > > > > be
> > > > > > > purged.
> > > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > > mappings.
> > > > > > > + *
> > > > > > > + * Caller must hold BO dma-resv lock.
> > > > > > > + *
> > > > > > > + * Return: true if all VMAs are DONTNEED, false
> > > > > > > otherwise
> > > > > > > + */
> > > > > > > +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > > > > > > +{
> > > > > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > > > > +	struct drm_gpuva *gpuva;
> > > > > > > +	struct drm_gem_object *obj =3D &bo->ttm.base;
> > > > > > > +	bool has_vmas =3D false;
> > > > > > > +
> > > > > > > +	xe_bo_assert_held(bo);
> > > > > > > +
> > > > > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > > > > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > > > > > +			struct xe_vma *vma =3D
> > > > > > > gpuva_to_vma(gpuva);
> > > > > > > +
> > > > > > > +			has_vmas =3D true;
> > > > > > > +
> > > > > > > +			/* Any non-DONTNEED VMA prevents
> > > > > > > purging */
> > > > > > > +			if (vma->attr.purgeable_state !=3D
> > > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > > +				return false;
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * No VMAs =3D> no mapping-level DONTNEED hint.
> > > > > > > +	 * Default to WILLNEED to avoid making BOs
> > > > > > > purgeable
> > > > > > > without
> > > > > > > +	 * explicit user intent.
> > > > > > > +	 */
> > > > > > > +	if (!has_vmas)
> > > > > > > +		return false;
> > > > > > > +
> > > > > > > +	return true;
> > > > > > > +}
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * xe_bo_recompute_purgeable_state() - Recompute BO
> > > > > > > purgeable state
> > > > > > > from VMAs
> > > > > > > + * @bo: Buffer object
> > > > > > > + *
> > > > > > > + * Walk all VMAs to determine if BO should be purgeable
> > > > > > > or
> > > > > > > not.
> > > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > > mappings.
> > > > > > > + *
> > > > > > > + * Locking: Caller must hold BO dma-resv lock. When
> > > > > > > iterating GPUVM
> > > > > > > lists,
> > > > > > > + * VM lock must also be held (write) to prevent
> > > > > > > concurrent
> > > > > > > VMA
> > > > > > > modifications.
> > > > > > > + * This is satisfied at both call sites:
> > > > > > > + * - xe_vma_destroy(): holds vm->lock write
> > > > > > > + * - madvise_purgeable(): holds vm->lock write (from
> > > > > > > madvise
> > > > > > > ioctl
> > > > > > > path)
> > > > > > > + *
> > > > > > > + * Return: nothing
> > > > > > > + */
> > > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > > > > > +{
> > > > > > > +	if (!bo)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	xe_bo_assert_held(bo);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Once purged, always purged. Cannot transition
> > > > > > > back to
> > > > > > > WILLNEED.
> > > > > > > +	 * This matches i915 semantics where purged BOs
> > > > > > > are
> > > > > > > permanently invalid.
> > > > > > > +	 */
> > > > > > > +	if (bo->madv_purgeable =3D=3D
> > > > > > > XE_MADV_PURGEABLE_PURGED)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (xe_bo_all_vmas_dontneed(bo)) {
> > > > > > > +		/* All VMAs are DONTNEED - mark BO
> > > > > > > purgeable
> > > > > > > */
> > > > > > > +		if (bo->madv_purgeable !=3D
> > > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > > +	} else {
> > > > > > > +		/* At least one VMA is WILLNEED - BO
> > > > > > > must
> > > > > > > not be
> > > > > > > purgeable */
> > > > > > > +		if (bo->madv_purgeable !=3D
> > > > > > > XE_MADV_PURGEABLE_WILLNEED)
> > > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > > +	}
> > > > > > > +}
> > > > > > > +
> > > > > > > =C2=A0 =C2=A0/**
> > > > > > > =C2=A0 =C2=A0 * madvise_purgeable - Handle purgeable buffer o=
bject
> > > > > > > advice
> > > > > > > =C2=A0 =C2=A0 * @xe: XE device
> > > > > > > @@ -231,14 +315,20 @@ static void __maybe_unused
> > > > > > > madvise_purgeable(struct xe_device *xe,
> > > > > > > =C2=A0 =C2=A0		switch (op->purge_state_val.val) {
> > > > > > > =C2=A0 =C2=A0		case
> > > > > > > DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > > +			vmas[i]->attr.purgeable_state =3D
> > > > > > > XE_MADV_PURGEABLE_WILLNEED;
> > > > > > > +
> > > > > > > +			/* Update BO purgeable state */
> > > > > > > +			xe_bo_recompute_purgeable_state(
> > > > > > > bo);
> > > > > > > =C2=A0 =C2=A0			break;
> > > > > > > =C2=A0 =C2=A0		case
> > > > > > > DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > > +			vmas[i]->attr.purgeable_state =3D
> > > > > > > XE_MADV_PURGEABLE_DONTNEED;
> > > > > > > +
> > > > > > > +			/* Update BO purgeable state */
> > > > > > > +			xe_bo_recompute_purgeable_state(
> > > > > > > bo);
> > > > > > > =C2=A0 =C2=A0			break;
> > > > > > > =C2=A0 =C2=A0		default:
> > > > > > > -			drm_warn(&vm->xe->drm, "Invalid
> > > > > > > madvice
> > > > > > > value =3D %d\n",
> > > > > > > -				 op-
> > > > > > > >purge_state_val.val);
> > > > > > > +			/* Should never hit - values
> > > > > > > validated in
> > > > > > > madvise_args_are_sane() */
> > > > > > > +			xe_assert(vm->xe, 0);
> > > > > > > =C2=A0 =C2=A0			return;
> > > > > > > =C2=A0 =C2=A0		}
> > > > > > > =C2=A0 =C2=A0	}
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > index b0e1fc445f23..39acd2689ca0 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > @@ -8,8 +8,11 @@
> > > > > > > =C2=A0 =C2=A0struct drm_device;
> > > > > > > =C2=A0 =C2=A0struct drm_file;
> > > > > > > +struct xe_bo;
> > > > > > > =C2=A0 =C2=A0int xe_vm_madvise_ioctl(struct drm_device *dev, =
void
> > > > > > > *data,
> > > > > > > =C2=A0 =C2=A0			struct drm_file *file);
> > > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> > > > > > > +
> > > > > > > =C2=A0 =C2=A0#endif
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > index 43203e90ee3e..fd563039e8f4 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
> > > > > > > =C2=A0 =C2=A0	 * same as default_pat_index unless overwritten
> > > > > > > by
> > > > > > > madvise.
> > > > > > > =C2=A0 =C2=A0	 */
> > > > > > > =C2=A0 =C2=A0	u16 pat_index;
> > > > > > > +
> > > > > > > +	/**
> > > > > > > +	 * @purgeable_state: Purgeable hint for this VMA
> > > > > > > mapping
> > > > > > > +	 *
> > > > > > > +	 * Per-VMA purgeable state from madvise. Valid
> > > > > > > states are
> > > > > > > WILLNEED (0)
> > > > > > > +	 * or DONTNEED (1). Shared BOs require all VMAs
> > > > > > > to
> > > > > > > be
> > > > > > > DONTNEED before
> > > > > > > +	 * the BO can be purged. PURGED state exists
> > > > > > > only at
> > > > > > > BO
> > > > > > > level.
> > > > > > > +	 *
> > > > > > > +	 * Protected by BO dma-resv lock. Set via
> > > > > > > DRM_IOCTL_XE_MADVISE.
> > > > > > > +	 */
> > > > > > > +	u32 purgeable_state;
> > > > > > > =C2=A0 =C2=A0};
> > > > > > > =C2=A0 =C2=A0struct xe_vma {
