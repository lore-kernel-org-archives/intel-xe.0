Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A090C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336B710E31C;
	Mon, 24 Feb 2025 15:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IppSuG1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2A10E31C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740410413; x=1771946413;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A/5SKDOmhJfN9Lxz4R+DSoMymzg337Y9PX6CnOTDCK4=;
 b=IppSuG1y0yuUL+SVo3gdShPg3M5OhcRdnSpD9cro4K3Onepl+CuSYdpM
 JBebYUPLHUgcA+JS3Z6OYCg5Dld8PK8LHqDlNS7OSzvPin6AUW5ocFKne
 cbc4paOCkpO26qRRYcuRwUYPCWVfJf58VV6blcRsANUU7j0OFKnuBqX8T
 8hvp/4H7o8t+PYeffLp0USJzA93TYYh/a3iG7k3yLksEWExlzWiZFWLH5
 vLYa8zyj2ySrqv8DB6yYJW/M4QZqxltxPZXGtDPLQ9j4B7piMUB4UyvHt
 cAqSkF5nzPzjy8p+yGyccbepkzFDBB86YtfcahSwxfgbRO4JMHuVTW8ky w==;
X-CSE-ConnectionGUID: 8eH436YwSDahbqLzXgZIXg==
X-CSE-MsgGUID: 5kF5Ya8XSku/hsDCzAZI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63636847"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="63636847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:20:13 -0800
X-CSE-ConnectionGUID: m9+YRRN0Q4uKmmfy81hGgQ==
X-CSE-MsgGUID: dikRDunwRcy71qIyGOppYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="116713120"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.186])
 ([10.245.246.186])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:20:10 -0800
Message-ID: <2f1e88d3a2e6041a49684025b037f2ee4098a369.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Date: Mon, 24 Feb 2025 16:20:07 +0100
In-Reply-To: <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
 <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
 <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
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

On Mon, 2025-02-24 at 07:06 -0800, Matthew Brost wrote:
> On Mon, Feb 24, 2025 at 09:21:09AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > > Squash bind operation after userptr invalidation into a clearing
> > > of
> > > PTEs. Will prevent valid GPU page tables from pointing to stale
> > > CPU
> > > pages.
> > >=20
> > > Fixup initial bind handling always add VMAs to invalidation list
> > > and
> > > clear PTEs.
> > >=20
> > > Remove unused rebind variable in xe_pt.
> > >=20
> > > Always hold notifier across TLB invalidation in notifier to
> > > prevent a
> > > UAF if an unbind races.
> > >=20
> > > Including all of the above changes for Fixes patch in hopes of an
> > > easier
> > > backport which fix a single patch.
> > >=20
> > > v2:
> > > =C2=A0- Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > =C2=A0- Support scratch page on invalidation (Thomas)
> > >=20
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > single
> > > job")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 146 +++++++++++++++++++++++--
> > > ----
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0=C2=A0 3 +-
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 4 +-
> > > =C2=A03 files changed, 115 insertions(+), 38 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..add521b5c6ae 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> > > struct xe_pt *parent,
> > > =C2=A0 */
> > > =C2=A0static int
> > > =C2=A0xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struc=
t
> > > xe_pt *parent,
> > > -		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child, u64
> > > pte)
> > > +		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child, u64
> > > pte,
> > > +		=C2=A0=C2=A0 unsigned int level)
> > > =C2=A0{
> > > =C2=A0	struct xe_pt_update *upd =3D &xe_walk-
> > > >wupd.updates[parent-
> > > > level];
> > > =C2=A0	struct xe_pt_update *child_upd =3D xe_child ?
> > > @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct
> > > xe_pt_stage_bind_walk
> > > *xe_walk, struct xe_pt *parent,
> > > =C2=A0		idx =3D offset - entry->ofs;
> > > =C2=A0		entry->pt_entries[idx].pt =3D xe_child;
> > > =C2=A0		entry->pt_entries[idx].pte =3D pte;
> > > +		entry->pt_entries[idx].level =3D level;
> > > +		if (likely(!xe_child))
> > > +			entry->pt_entries[idx].level |=3D
> > > XE_PT_IS_LEAF;
> > > =C2=A0		entry->qwords++;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > > =C2=A0			}
> > > =C2=A0		}
> > > =C2=A0
> > > -		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > offset,
> > > NULL, pte);
> > > +		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > offset,
> > > NULL, pte,
> > > +					 level);
> > > =C2=A0		if (unlikely(ret))
> > > =C2=A0			return ret;
> > > =C2=A0
> > > @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > > =C2=A0
> > > =C2=A0		pte =3D vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> > > pat_index) | flags;
> > > =C2=A0		ret =3D xe_pt_insert_entry(xe_walk, xe_parent,
> > > offset,
> > > xe_child,
> > > -					 pte);
> > > +					 pte, level);
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	*action =3D ACTION_SUBTREE;
> > > @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> > > =C2=A0	/* Input parameters for the walk */
> > > =C2=A0	/** @tile: The tile we're building for */
> > > =C2=A0	struct xe_tile *tile;
> > > +	/** @vm: VM we're building for */
> > > +	struct xe_vm *vm;
> > > +	/** @scratch: write entries with scratch */
> > > +	bool scratch;
> > > =C2=A0
> > > =C2=A0	/* Output */
> > > =C2=A0	/** @needs_invalidate: Whether we need to invalidate
> > > TLB*/
> > > @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct
> > > xe_ptw
> > > *parent, pgoff_t offset,
> > > =C2=A0	 */
> > > =C2=A0	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> > > action, &offset,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0 &end_offset)) {
> > > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > > &xe_child-
> > > > bo->vmap,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) *
> > > sizeof(u64));
> > > +		if (unlikely(xe_walk->scratch)) {
> > > +			u64 pte =3D __xe_pt_empty_pte(xe_walk-
> > > >tile,
> > > xe_walk->vm,
> > > +						=C2=A0=C2=A0=C2=A0 level);
> > > +
> > > +			for (; offset < end_offset; ++offset)
> > > +				xe_pt_write(tile_to_xe(xe_walk-
> > > > tile),
> > > +					=C2=A0=C2=A0=C2=A0 &xe_child->bo->vmap,
> > > offset, pte);
> > > +		} else {
> > > +			xe_map_memset(tile_to_xe(xe_walk->tile),
> > > &xe_child->bo->vmap,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) *
> > > sizeof(u64));
> > > +		}
> > > =C2=A0		xe_walk->needs_invalidate =3D true;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> > > xe_pt_zap_ptes_ops =3D {
> > > =C2=A0	.pt_entry =3D xe_pt_zap_ptes_entry,
> > > =C2=A0};
> > > =C2=A0
> > > +struct xe_pt_zap_ptes_flags {
> > > +	bool scratch:1;
> > > +};
> > > +
> > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > *vma,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_pt_zap_ptes_flags flags)
> > > +{
> > > +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> > > +		.base =3D {
> > > +			.ops =3D &xe_pt_zap_ptes_ops,
> > > +			.shifts =3D xe_normal_pt_shifts,
> > > +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > > +		},
> > > +		.tile =3D tile,
> > > +		.vm =3D xe_vma_vm(vma),
> > > +		.scratch =3D flags.scratch,
> > > +	};
> > > +	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> > > +
> > > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > xe_vma_start(vma),
> > > +				xe_vma_end(vma), &xe_walk.base);
> > > +
> > > +	return xe_walk.needs_invalidate;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> > > =C2=A0 * @tile: The tile we're zapping for.
> > > @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> > > xe_pt_zap_ptes_ops =3D {
> > > =C2=A0 */
> > > =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> > > =C2=A0{
> > > -	struct xe_pt_zap_ptes_walk xe_walk =3D {
> > > -		.base =3D {
> > > -			.ops =3D &xe_pt_zap_ptes_ops,
> > > -			.shifts =3D xe_normal_pt_shifts,
> > > -			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > > -		},
> > > -		.tile =3D tile,
> > > -	};
> > > -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> > > +	struct xe_pt_zap_ptes_flags flags =3D {};
> > > =C2=A0	u8 pt_mask =3D (vma->tile_present & ~vma-
> > > >tile_invalidated);
> > > =C2=A0
> > > =C2=A0	if (!(pt_mask & BIT(tile->id)))
> > > =C2=A0		return false;
> > > =C2=A0
> > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > xe_vma_start(vma),
> > > -				xe_vma_end(vma), &xe_walk.base);
> > > -
> > > -	return xe_walk.needs_invalidate;
> > > +	return __xe_pt_zap_ptes(tile, vma, flags);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void
> > > @@ -1201,7 +1233,46 @@ static bool
> > > xe_pt_userptr_inject_eagain(struct
> > > xe_userptr_vma *uvma)
> > > =C2=A0
> > > =C2=A0#endif
> > > =C2=A0
> > > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma
> > > *vma,
> > > +static void
> > > +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > > *vma,
> > > +			=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> > > *pt_update)
> > > +{
> > > +	struct xe_pt_zap_ptes_flags flags =3D { .scratch =3D true,
> > > };
> > > +	int i, j, k;
> > > +
> > > +	/*
> > > +	 * Need to update this function to bypass scratch setup
> > > if
> > > in fault mode
> > > +	 */
> > > +	xe_assert(xe_vma_vm(vma)->xe,
> > > !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > +
> > > +	for (i =3D 0; i < pt_update->current_op; ++i) {
> > > +		struct xe_vm_pgtable_update_op *op =3D &pt_update-
> > > > ops[i];
> > > +
> > > +		if (vma !=3D op->vma || (!op->bind && !op-
> > > >rebind))
> > > +			continue;
> > > +
> > > +		for (j =3D 0; j < op->num_entries; ++j) {
> > > +			for (k =3D 0; k < op->entries[j].qwords;
> > > ++k)
> > > {
> > > +				struct xe_pt_entry *entry =3D
> > > +					&op-
> > > > entries[j].pt_entries[k];
> > > +				unsigned int level =3D entry-
> > > >level;
> > > +
> > > +				if (!(level & XE_PT_IS_LEAF))
> > > +					continue;
> > > +
> > > +				level &=3D ~XE_PT_IS_LEAF;
> > > +				entry->pte =3D
> > > __xe_pt_empty_pte(tile,
> > > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > xe_vma_vm(vma),
> > > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > level);
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	__xe_pt_zap_ptes(tile, vma, flags);
> >=20
> > As mentioned in my previous email, I'm pretty sure if we modify all
> > the
> > ptes in the entry array, not just the leaves, (that's basically all
> > ptes of shared page-table entries) that will be equivalent to a
> > zap.
> >=20
>=20
> That doesn't work. I had that way originally but IGTs fail with IOMMU
> CAT errors (e.g. xe_exec_basic.once-userptr fails like this [1])
>=20
> Let me explain with example.
>=20
> Array of bind 0x0000-0x1000 (A), 0x1000-0x2000 (B)
>=20
> - (A) hits userptr invalidation
> 	- If modify all ptes in the entry array, highest level PDE
> is
> 	=C2=A0 invalidated. Both (A) and (B) either are 0 or scratch
> - (A) does rebind in exec
> 	- We only modify leaf entry, not the highest level PDE which
> is
> 	=C2=A0 0 or scratch
>=20
> Matt

Argh. You're right. What would happen if we don't do anything to the
ptes, then? It looks from the code in faulting mode we error and unwind
with -EAGAIN.

 In preempt-fence mode and !LR we could instead ensure properly stop
gpu access and put the userptr on the invalidated list in the notifier.

The reason I don't really like zapping here is it's yet another corner
case in the code. If it works by doing this in the notifier, we get rid
of two corner cases.

/Thomas




>=20
> [1]
> [=C2=A0 359.895920] [IGT] xe_exec_basic: starting subtest once-userptr
> [=C2=A0 359.902643] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ASID: 462
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 VFID: 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PDATA: 0x0c90
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Faulted Address: 0x00000000001a0000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 FaultType: 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 AccessType: 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 FaultLevel: 4
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 EngineClass: 0 rcs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 EngineInstance: 0
> [=C2=A0 359.902686] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault
> response: Unsuccessful -22
> [=C2=A0 359.902890] xe 0000:03:00.0:
> [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine
> memory cat error: engine_class=3Drcs, logical_mask: 0x1, guc_id=3D2
> [=C2=A0 359.905791] xe 0000:03:00.0: [drm] GT0: Engine reset:
> engine_class=3Drcs, logical_mask: 0x1, guc_id=3D2
> [=C2=A0 359.905826] xe 0000:03:00.0: [drm] GT0: Timedout job:
> seqno=3D4294967169, lrc_seqno=3D4294967169, guc_id=3D2, flags=3D0x0 in
> xe_exec_basic [9607]
> [=C2=A0 359.905831] xe 0000:03:00.0: [drm:xe_devcoredump [xe]] Multiple
> hangs are occurring, but only the first snapshot was taken
> [=C2=A0 359.962840] [IGT] xe_exec_basic: finished subtest once-userptr,
> FAIL
> [=C2=A0 359.963049] [IGT] xe_exec_basic: exiting, ret=3D98
>=20
>=20
> > /Thomas
> >=20
> >=20
> > > +}
> > > +
> > > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm
> > > *vm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> > > *pt_update)
> > > =C2=A0{
> > > =C2=A0	struct xe_userptr_vma *uvma;
> > > @@ -1215,9 +1286,6 @@ static int vma_check_userptr(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	uvma =3D to_userptr_vma(vma);
> > > =C2=A0	notifier_seq =3D uvma->userptr.notifier_seq;
> > > =C2=A0
> > > -	if (uvma->userptr.initial_bind &&
> > > !xe_vm_in_fault_mode(vm))
> > > -		return 0;
> > > -
> > > =C2=A0	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 notifier_seq) &&
> > > =C2=A0	=C2=A0=C2=A0=C2=A0 !xe_pt_userptr_inject_eagain(uvma))
> > > @@ -1226,6 +1294,8 @@ static int vma_check_userptr(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	if (xe_vm_in_fault_mode(vm)) {
> > > =C2=A0		return -EAGAIN;
> > > =C2=A0	} else {
> > > +		long err;
> > > +
> > > =C2=A0		spin_lock(&vm->userptr.invalidated_lock);
> > > =C2=A0		list_move_tail(&uvma->userptr.invalidate_link,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->userptr.invalidate=
d);
> > > @@ -1234,25 +1304,27 @@ static int vma_check_userptr(struct xe_vm
> > > *vm, struct xe_vma *vma,
> > > =C2=A0		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > =C2=A0			struct dma_resv_iter cursor;
> > > =C2=A0			struct dma_fence *fence;
> > > -			long err;
> > > =C2=A0
> > > =C2=A0			dma_resv_iter_begin(&cursor,
> > > xe_vm_resv(vm),
> > > =C2=A0					=C2=A0=C2=A0=C2=A0
> > > DMA_RESV_USAGE_BOOKKEEP);
> > > =C2=A0			dma_resv_for_each_fence_unlocked(&cursor
> > > ,
> > > fence)
> > > =C2=A0				dma_fence_enable_sw_signaling(fe
> > > nce)
> > > ;
> > > =C2=A0			dma_resv_iter_end(&cursor);
> > > -
> > > -			err =3D
> > > dma_resv_wait_timeout(xe_vm_resv(vm),
> > > -						=C2=A0=C2=A0=C2=A0
> > > DMA_RESV_USAGE_BOOKKEEP,
> > > -						=C2=A0=C2=A0=C2=A0 false,
> > > MAX_SCHEDULE_TIMEOUT);
> > > -			XE_WARN_ON(err <=3D 0);
> > > =C2=A0		}
> > > +
> > > +		err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > > +					=C2=A0=C2=A0=C2=A0
> > > DMA_RESV_USAGE_BOOKKEEP,
> > > +					=C2=A0=C2=A0=C2=A0 false,
> > > MAX_SCHEDULE_TIMEOUT);
> > > +		XE_WARN_ON(err <=3D 0);
> > > +
> > > +		vma_convert_to_invalidation(tile, vma,
> > > pt_update);
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op
> > > *op,
> > > +static int op_check_userptr(struct xe_tile *tile, struct xe_vm
> > > *vm,
> > > +			=C2=A0=C2=A0=C2=A0 struct xe_vma_op *op,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> > > *pt_update)
> > > =C2=A0{
> > > =C2=A0	int err =3D 0;
> > > @@ -1264,18 +1336,21 @@ static int op_check_userptr(struct xe_vm
> > > *vm,
> > > struct xe_vma_op *op,
> > > =C2=A0		if (!op->map.immediate &&
> > > xe_vm_in_fault_mode(vm))
> > > =C2=A0			break;
> > > =C2=A0
> > > -		err =3D vma_check_userptr(vm, op->map.vma,
> > > pt_update);
> > > +		err =3D vma_check_userptr(tile, vm, op->map.vma,
> > > pt_update);
> > > =C2=A0		break;
> > > =C2=A0	case DRM_GPUVA_OP_REMAP:
> > > =C2=A0		if (op->remap.prev)
> > > -			err =3D vma_check_userptr(vm, op-
> > > >remap.prev,
> > > pt_update);
> > > +			err =3D vma_check_userptr(tile, vm, op-
> > > > remap.prev,
> > > +						pt_update);
> > > =C2=A0		if (!err && op->remap.next)
> > > -			err =3D vma_check_userptr(vm, op-
> > > >remap.next,
> > > pt_update);
> > > +			err =3D vma_check_userptr(tile, vm, op-
> > > > remap.next,
> > > +						pt_update);
> > > =C2=A0		break;
> > > =C2=A0	case DRM_GPUVA_OP_UNMAP:
> > > =C2=A0		break;
> > > =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> > > -		err =3D vma_check_userptr(vm, gpuva_to_vma(op-
> > > > base.prefetch.va),
> > > +		err =3D vma_check_userptr(tile, vm,
> > > +					gpuva_to_vma(op-
> > > > base.prefetch.va),
> > > =C2=A0					pt_update);
> > > =C2=A0		break;
> > > =C2=A0	default:
> > > @@ -1301,7 +1376,8 @@ static int xe_pt_userptr_pre_commit(struct
> > > xe_migrate_pt_update *pt_update)
> > > =C2=A0	down_read(&vm->userptr.notifier_lock);
> > > =C2=A0
> > > =C2=A0	list_for_each_entry(op, &vops->list, link) {
> > > -		err =3D op_check_userptr(vm, op, pt_update_ops);
> > > +		err =3D op_check_userptr(&vm->xe->tiles[pt_update-
> > > > tile_id],
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm, op, pt_update_ops);
> > > =C2=A0		if (err) {
> > > =C2=A0			up_read(&vm->userptr.notifier_lock);
> > > =C2=A0			break;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 384cc04de719..6f99ff2b8fce 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -29,7 +29,6 @@ struct xe_pt {
> > > =C2=A0	struct xe_bo *bo;
> > > =C2=A0	unsigned int level;
> > > =C2=A0	unsigned int num_live;
> > > -	bool rebind;
> > > =C2=A0	bool is_compact;
> > > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> > > =C2=A0	/** addr: Virtual address start address of the PT. */
> > > @@ -52,6 +51,8 @@ struct xe_pt_ops {
> > > =C2=A0struct xe_pt_entry {
> > > =C2=A0	struct xe_pt *pt;
> > > =C2=A0	u64 pte;
> > > +#define XE_PT_IS_LEAF	BIT(31)
> > > +	unsigned int level;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0struct xe_vm_pgtable_update {
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index ea2e287e6526..f90e5c92010c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > > mmu_interval_notifier *mni,
> > > =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> > > =C2=A0	}
> > > =C2=A0
> > > -	up_write(&vm->userptr.notifier_lock);
> > > -
> > > =C2=A0	/*
> > > =C2=A0	 * Preempt fences turn into schedule disables, pipeline
> > > these.
> > > =C2=A0	 * Note that even in fault mode, we need to wait for
> > > binds
> > > and
> > > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > > mmu_interval_notifier *mni,
> > > =C2=A0		XE_WARN_ON(err);
> > > =C2=A0	}
> > > =C2=A0
> > > +	up_write(&vm->userptr.notifier_lock);
> > > +
> > > =C2=A0	trace_xe_vma_userptr_invalidate_complete(vma);
> > > =C2=A0
> > > =C2=A0	return true;
> >=20

