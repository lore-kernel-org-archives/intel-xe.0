Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7404C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F4B10E448;
	Mon, 24 Feb 2025 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEBOFH0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841B10E448
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740414168; x=1771950168;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zQef/KbekOp9XroNWVlbPTBOE2G0awbAzwurdNmVd6M=;
 b=FEBOFH0RdfoVurggeoK9sEUORI1UltBL3EE7x/hlEI+PlP4sQIgMBtun
 ynaHjZmJ++Rz3qhzFMOBnBvq54rauVHO5X0iBhLbe7Fx57/8BMwhs19U3
 dTWi4ljj/6ycKFZdIytjX49vd/62fVzrEPrpIjowSGi62v94qkGnrDFCa
 BCgjXF8Qp+cr+lwZSGs0xHTwFGuuvCa3WR9xmklaZueqGBywvc4ivjGyT
 7vmeGQJo4U9BO4VoUqV9W+1mZbZNFxncmbpG2cU8cK7N/T3Wcjk+/b/WV
 U/wfMur049+fGgP4prP4edqZ4OPH4C+cvqwpH3t1A09DvOcoDwlLi2cOu w==;
X-CSE-ConnectionGUID: Wfu2roE7Qoatso23yJ5RQg==
X-CSE-MsgGUID: N5SiEW9aQVCIKJrkINU1ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51804921"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51804921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:22:45 -0800
X-CSE-ConnectionGUID: FPHz+x9xSGmfDgqN5/wK+g==
X-CSE-MsgGUID: gq1icQVGS82gWJ4Poa/duw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="146948140"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.197])
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:22:43 -0800
Message-ID: <5514d8b6b2305581014fcfe178e40449758c1e7f.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Date: Mon, 24 Feb 2025 17:22:40 +0100
In-Reply-To: <Z7yRtqjxmFUcTWVG@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
 <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
 <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
 <2f1e88d3a2e6041a49684025b037f2ee4098a369.camel@linux.intel.com>
 <Z7yRtqjxmFUcTWVG@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-02-24 at 07:35 -0800, Matthew Brost wrote:
> On Mon, Feb 24, 2025 at 04:20:07PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2025-02-24 at 07:06 -0800, Matthew Brost wrote:
> > > On Mon, Feb 24, 2025 at 09:21:09AM +0100, Thomas Hellstr=C3=B6m wrote=
:
> > > > On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > > > > Squash bind operation after userptr invalidation into a
> > > > > clearing
> > > > > of
> > > > > PTEs. Will prevent valid GPU page tables from pointing to
> > > > > stale
> > > > > CPU
> > > > > pages.
> > > > >=20
> > > > > Fixup initial bind handling always add VMAs to invalidation
> > > > > list
> > > > > and
> > > > > clear PTEs.
> > > > >=20
> > > > > Remove unused rebind variable in xe_pt.
> > > > >=20
> > > > > Always hold notifier across TLB invalidation in notifier to
> > > > > prevent a
> > > > > UAF if an unbind races.
> > > > >=20
> > > > > Including all of the above changes for Fixes patch in hopes
> > > > > of an
> > > > > easier
> > > > > backport which fix a single patch.
> > > > >=20
> > > > > v2:
> > > > > =C2=A0- Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > > > =C2=A0- Support scratch page on invalidation (Thomas)
> > > > >=20
> > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > Cc: <stable@vger.kernel.org>
> > > > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > > > single
> > > > > job")
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 146
> > > > > +++++++++++++++++++++++--
> > > > > ----
> > > > > --
> > > > > =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0=C2=A0 3 +-
> > > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +-
> > > > > =C2=A03 files changed, 115 insertions(+), 38 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > > index 1ddcc7e79a93..add521b5c6ae 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update
> > > > > *wupd,
> > > > > struct xe_pt *parent,
> > > > > =C2=A0 */
> > > > > =C2=A0static int
> > > > > =C2=A0xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk,
> > > > > struct
> > > > > xe_pt *parent,
> > > > > -		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child,
> > > > > u64
> > > > > pte)
> > > > > +		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child,
> > > > > u64
> > > > > pte,
> > > > > +		=C2=A0=C2=A0 unsigned int level)
> > > > > =C2=A0{
> > > > > =C2=A0	struct xe_pt_update *upd =3D &xe_walk-
> > > > > > wupd.updates[parent-
> > > > > > level];
> > > > > =C2=A0	struct xe_pt_update *child_upd =3D xe_child ?
> > > > > @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct
> > > > > xe_pt_stage_bind_walk
> > > > > *xe_walk, struct xe_pt *parent,
> > > > > =C2=A0		idx =3D offset - entry->ofs;
> > > > > =C2=A0		entry->pt_entries[idx].pt =3D xe_child;
> > > > > =C2=A0		entry->pt_entries[idx].pte =3D pte;
> > > > > +		entry->pt_entries[idx].level =3D level;
> > > > > +		if (likely(!xe_child))
> > > > > +			entry->pt_entries[idx].level |=3D
> > > > > XE_PT_IS_LEAF;
> > > > > =C2=A0		entry->qwords++;
> > > > > =C2=A0	}
> > > > > =C2=A0
> > > > > @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > > > *parent,
> > > > > pgoff_t offset,
> > > > > =C2=A0			}
> > > > > =C2=A0		}
> > > > > =C2=A0
> > > > > -		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > offset,
> > > > > NULL, pte);
> > > > > +		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > offset,
> > > > > NULL, pte,
> > > > > +					 level);
> > > > > =C2=A0		if (unlikely(ret))
> > > > > =C2=A0			return ret;
> > > > > =C2=A0
> > > > > @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > > > *parent,
> > > > > pgoff_t offset,
> > > > > =C2=A0
> > > > > =C2=A0		pte =3D vm->pt_ops->pde_encode_bo(xe_child-
> > > > > >bo, 0,
> > > > > pat_index) | flags;
> > > > > =C2=A0		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > offset,
> > > > > xe_child,
> > > > > -					 pte);
> > > > > +					 pte, level);
> > > > > =C2=A0	}
> > > > > =C2=A0
> > > > > =C2=A0	*action =3D ACTION_SUBTREE;
> > > > > @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> > > > > =C2=A0	/* Input parameters for the walk */
> > > > > =C2=A0	/** @tile: The tile we're building for */
> > > > > =C2=A0	struct xe_tile *tile;
> > > > > +	/** @vm: VM we're building for */
> > > > > +	struct xe_vm *vm;
> > > > > +	/** @scratch: write entries with scratch */
> > > > > +	bool scratch;
> > > > > =C2=A0
> > > > > =C2=A0	/* Output */
> > > > > =C2=A0	/** @needs_invalidate: Whether we need to invalidate
> > > > > TLB*/
> > > > > @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct
> > > > > xe_ptw
> > > > > *parent, pgoff_t offset,
> > > > > =C2=A0	 */
> > > > > =C2=A0	if (xe_pt_nonshared_offsets(addr, next, --level,
> > > > > walk,
> > > > > action, &offset,
> > > > > =C2=A0				=C2=A0=C2=A0=C2=A0 &end_offset)) {
> > > > > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > > > > &xe_child-
> > > > > > bo->vmap,
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) *
> > > > > sizeof(u64));
> > > > > +		if (unlikely(xe_walk->scratch)) {
> > > > > +			u64 pte =3D __xe_pt_empty_pte(xe_walk-
> > > > > > tile,
> > > > > xe_walk->vm,
> > > > > +						=C2=A0=C2=A0=C2=A0 level);
> > > > > +
> > > > > +			for (; offset < end_offset;
> > > > > ++offset)
> > > > > +				xe_pt_write(tile_to_xe(xe_wa
> > > > > lk-
> > > > > > tile),
> > > > > +					=C2=A0=C2=A0=C2=A0 &xe_child->bo-
> > > > > >vmap,
> > > > > offset, pte);
> > > > > +		} else {
> > > > > +			xe_map_memset(tile_to_xe(xe_walk-
> > > > > >tile),
> > > > > &xe_child->bo->vmap,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64),
> > > > > 0,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset)
> > > > > *
> > > > > sizeof(u64));
> > > > > +		}
> > > > > =C2=A0		xe_walk->needs_invalidate =3D true;
> > > > > =C2=A0	}
> > > > > =C2=A0
> > > > > @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> > > > > xe_pt_zap_ptes_ops =3D {
> > > > > =C2=A0	.pt_entry =3D xe_pt_zap_ptes_entry,
> > > > > =C2=A0};
> > > > > =C2=A0
> > > > > +struct xe_pt_zap_ptes_flags {
> > > > > +	bool scratch:1;
> > > > > +};
> > > > > +
> > > > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct
> > > > > xe_vma
> > > > > *vma,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_pt_zap_ptes_flags
> > > > > flags)
> > > > > +{
> > > > > +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> > > > > +		.base =3D {
> > > > > +			.ops =3D &xe_pt_zap_ptes_ops,
> > > > > +			.shifts =3D xe_normal_pt_shifts,
> > > > > +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > > > > +		},
> > > > > +		.tile =3D tile,
> > > > > +		.vm =3D xe_vma_vm(vma),
> > > > > +		.scratch =3D flags.scratch,
> > > > > +	};
> > > > > +	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile-
> > > > > >id];
> > > > > +
> > > > > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > > xe_vma_start(vma),
> > > > > +				xe_vma_end(vma),
> > > > > &xe_walk.base);
> > > > > +
> > > > > +	return xe_walk.needs_invalidate;
> > > > > +}
> > > > > +
> > > > > =C2=A0/**
> > > > > =C2=A0 * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address
> > > > > range
> > > > > =C2=A0 * @tile: The tile we're zapping for.
> > > > > @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> > > > > xe_pt_zap_ptes_ops =3D {
> > > > > =C2=A0 */
> > > > > =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > > > *vma)
> > > > > =C2=A0{
> > > > > -	struct xe_pt_zap_ptes_walk xe_walk =3D {
> > > > > -		.base =3D {
> > > > > -			.ops =3D &xe_pt_zap_ptes_ops,
> > > > > -			.shifts =3D xe_normal_pt_shifts,
> > > > > -			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > > > > -		},
> > > > > -		.tile =3D tile,
> > > > > -	};
> > > > > -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile-
> > > > > >id];
> > > > > +	struct xe_pt_zap_ptes_flags flags =3D {};
> > > > > =C2=A0	u8 pt_mask =3D (vma->tile_present & ~vma-
> > > > > > tile_invalidated);
> > > > > =C2=A0
> > > > > =C2=A0	if (!(pt_mask & BIT(tile->id)))
> > > > > =C2=A0		return false;
> > > > > =C2=A0
> > > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > > xe_vma_start(vma),
> > > > > -				xe_vma_end(vma),
> > > > > &xe_walk.base);
> > > > > -
> > > > > -	return xe_walk.needs_invalidate;
> > > > > +	return __xe_pt_zap_ptes(tile, vma, flags);
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > =C2=A0static void
> > > > > @@ -1201,7 +1233,46 @@ static bool
> > > > > xe_pt_userptr_inject_eagain(struct
> > > > > xe_userptr_vma *uvma)
> > > > > =C2=A0
> > > > > =C2=A0#endif
> > > > > =C2=A0
> > > > > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma
> > > > > *vma,
> > > > > +static void
> > > > > +vma_convert_to_invalidation(struct xe_tile *tile, struct
> > > > > xe_vma
> > > > > *vma,
> > > > > +			=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> > > > > *pt_update)
> > > > > +{
> > > > > +	struct xe_pt_zap_ptes_flags flags =3D { .scratch =3D
> > > > > true,
> > > > > };
> > > > > +	int i, j, k;
> > > > > +
> > > > > +	/*
> > > > > +	 * Need to update this function to bypass scratch
> > > > > setup
> > > > > if
> > > > > in fault mode
> > > > > +	 */
> > > > > +	xe_assert(xe_vma_vm(vma)->xe,
> > > > > !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > > > +
> > > > > +	for (i =3D 0; i < pt_update->current_op; ++i) {
> > > > > +		struct xe_vm_pgtable_update_op *op =3D
> > > > > &pt_update-
> > > > > > ops[i];
> > > > > +
> > > > > +		if (vma !=3D op->vma || (!op->bind && !op-
> > > > > > rebind))
> > > > > +			continue;
> > > > > +
> > > > > +		for (j =3D 0; j < op->num_entries; ++j) {
> > > > > +			for (k =3D 0; k < op-
> > > > > >entries[j].qwords;
> > > > > ++k)
> > > > > {
> > > > > +				struct xe_pt_entry *entry =3D
> > > > > +					&op-
> > > > > > entries[j].pt_entries[k];
> > > > > +				unsigned int level =3D entry-
> > > > > > level;
> > > > > +
> > > > > +				if (!(level &
> > > > > XE_PT_IS_LEAF))
> > > > > +					continue;
> > > > > +
> > > > > +				level &=3D ~XE_PT_IS_LEAF;
> > > > > +				entry->pte =3D
> > > > > __xe_pt_empty_pte(tile,
> > > > > +							=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > =C2=A0=C2=A0
> > > > > xe_vma_vm(vma),
> > > > > +							=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > =C2=A0=C2=A0
> > > > > level);
> > > > > +			}
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	__xe_pt_zap_ptes(tile, vma, flags);
> > > >=20
> > > > As mentioned in my previous email, I'm pretty sure if we modify
> > > > all
> > > > the
> > > > ptes in the entry array, not just the leaves, (that's basically
> > > > all
> > > > ptes of shared page-table entries) that will be equivalent to a
> > > > zap.
> > > >=20
> > >=20
> > > That doesn't work. I had that way originally but IGTs fail with
> > > IOMMU
> > > CAT errors (e.g. xe_exec_basic.once-userptr fails like this [1])
> > >=20
> > > Let me explain with example.
> > >=20
> > > Array of bind 0x0000-0x1000 (A), 0x1000-0x2000 (B)
> > >=20
> > > - (A) hits userptr invalidation
> > > 	- If modify all ptes in the entry array, highest level
> > > PDE
> > > is
> > > 	=C2=A0 invalidated. Both (A) and (B) either are 0 or scratch
> > > - (A) does rebind in exec
> > > 	- We only modify leaf entry, not the highest level PDE
> > > which
> > > is
> > > 	=C2=A0 0 or scratch
> > >=20
> > > Matt
> >=20
> > Argh. You're right. What would happen if we don't do anything to
> > the
> > ptes, then? It looks from the code in faulting mode we error and
> > unwind
> > with -EAGAIN.
> >=20
> > =C2=A0In preempt-fence mode and !LR we could instead ensure properly
> > stop
> > gpu access and put the userptr on the invalidated list in the
> > notifier.
> >=20
>=20
> In dma-fence mode we'd have a window where existing (previously
> submited) GPU jobs could corrupt pages which have been invalidated.
> Unlikely but a very subtle security / data corruption issue.

Agree we should not allow that to happen however small the chance is.

However, I was thinking of something along the following. I can't see
any dma-fence jobs accessing the invalidated pages here, since we wait
for already submitted jobs to complete, and no new ones could be
submitted unless the userptr has been rebound.

Or are you thinking about the iommu issue where we should really
dma_unmap() in the notifier, like the SVM code does?=C2=A0

Or could you describe the race more in detail?

/Thomas


diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..c90c0687be51 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -605,12 +605,6 @@ static bool vma_userptr_invalidate(struct
mmu_interval_notifier *mni,
        down_write(&vm->userptr.notifier_lock);
        mmu_interval_set_seq(mni, cur_seq);
=20
-       /* No need to stop gpu access if the userptr is not yet bound.
*/
-       if (!userptr->initial_bind) {
-               up_write(&vm->userptr.notifier_lock);
-               return true;
-       }
-
        /*
         * Tell exec and rebind worker they need to repin and rebind
this
         * userptr.
@@ -623,8 +617,6 @@ static bool vma_userptr_invalidate(struct
mmu_interval_notifier *mni,
                spin_unlock(&vm->userptr.invalidated_lock);
        }
=20
-       up_write(&vm->userptr.notifier_lock);
-
        /*
         * Preempt fences turn into schedule disables, pipeline these.
         * Note that even in fault mode, we need to wait for binds and
@@ -642,11 +634,13 @@ static bool vma_userptr_invalidate(struct
mmu_interval_notifier *mni,
                                    false, MAX_SCHEDULE_TIMEOUT);
        XE_WARN_ON(err <=3D 0);
=20
-       if (xe_vm_in_fault_mode(vm)) {
+       if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
                err =3D xe_vm_invalidate_vma(vma);
                XE_WARN_ON(err);
        }
=20
+       up_write(&vm->userptr.notifier_lock);
+
        trace_xe_vma_userptr_invalidate_complete(vma);
=20
        return true;
(END)


