Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F51EC021B5
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7101A10E312;
	Mon, 24 Feb 2025 13:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdU2LI5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6085310E16F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740385276; x=1771921276;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zwgPnbh24MhKNK0IzDJHxLWQJ0NOQpyZ5Rtp6sZjBW0=;
 b=EdU2LI5eSIbRmnzIsNaNy+DJ7eZp3G7NZy3I7GV9181wLa+RSFyqSRtt
 +ZQ6/IU1q0DSZ2qCE3EGvIrpBluh9vGw01AB2+9IW+Js5zZSS4/ZoDUKp
 X5C33qyGEZB6F3fzGgV/++o9I/ygvLLu4220fEWghTNs8MaeDkCuEpUG9
 o4/XPBr762iJPGqaIQci23IPAh3v3HY79317bYVvRbTPMP8HGRTkrbabW
 jJGr0dYH7MY1KbxXPG30bu6EEd0ePhbojy34tM5M5soV5jsGYoY60HDji
 QSIEGYR6aggbeHgBmY5MR4Nj6IGSYeJX1ClsDJh0snk8PT6ZmEaR7l5CW w==;
X-CSE-ConnectionGUID: v75EM7A6RX6vGfUdYl3bjQ==
X-CSE-MsgGUID: iAq0fakeQoWxgIaTubccXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41005168"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41005168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 00:21:15 -0800
X-CSE-ConnectionGUID: xA/oR7hiQBKMIs9HcRNF4Q==
X-CSE-MsgGUID: au1KUDbMSpWSIOWCfP/kgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115970760"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.134])
 ([10.245.246.134])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 00:21:13 -0800
Message-ID: <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Date: Mon, 24 Feb 2025 09:21:09 +0100
In-Reply-To: <20250224040529.3025963-3-matthew.brost@intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
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

On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> Squash bind operation after userptr invalidation into a clearing of
> PTEs. Will prevent valid GPU page tables from pointing to stale CPU
> pages.
>=20
> Fixup initial bind handling always add VMAs to invalidation list and
> clear PTEs.
>=20
> Remove unused rebind variable in xe_pt.
>=20
> Always hold notifier across TLB invalidation in notifier to prevent a
> UAF if an unbind races.
>=20
> Including all of the above changes for Fixes patch in hopes of an
> easier
> backport which fix a single patch.
>=20
> v2:
> =C2=A0- Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> =C2=A0- Support scratch page on invalidation (Thomas)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single
> job")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=
6 +++++++++++++++++++++++------
> --
> =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +-
> =C2=A03 files changed, 115 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..add521b5c6ae 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> struct xe_pt *parent,
> =C2=A0 */
> =C2=A0static int
> =C2=A0xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct
> xe_pt *parent,
> -		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child, u64 pte)
> +		=C2=A0=C2=A0 pgoff_t offset, struct xe_pt *xe_child, u64 pte,
> +		=C2=A0=C2=A0 unsigned int level)
> =C2=A0{
> =C2=A0	struct xe_pt_update *upd =3D &xe_walk->wupd.updates[parent-
> >level];
> =C2=A0	struct xe_pt_update *child_upd =3D xe_child ?
> @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk
> *xe_walk, struct xe_pt *parent,
> =C2=A0		idx =3D offset - entry->ofs;
> =C2=A0		entry->pt_entries[idx].pt =3D xe_child;
> =C2=A0		entry->pt_entries[idx].pte =3D pte;
> +		entry->pt_entries[idx].level =3D level;
> +		if (likely(!xe_child))
> +			entry->pt_entries[idx].level |=3D
> XE_PT_IS_LEAF;
> =C2=A0		entry->qwords++;
> =C2=A0	}
> =C2=A0
> @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0			}
> =C2=A0		}
> =C2=A0
> -		ret =3D xe_pt_insert_entry(xe_walk, xe_parent, offset,
> NULL, pte);
> +		ret =3D xe_pt_insert_entry(xe_walk, xe_parent, offset,
> NULL, pte,
> +					 level);
> =C2=A0		if (unlikely(ret))
> =C2=A0			return ret;
> =C2=A0
> @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0
> =C2=A0		pte =3D vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> pat_index) | flags;
> =C2=A0		ret =3D xe_pt_insert_entry(xe_walk, xe_parent, offset,
> xe_child,
> -					 pte);
> +					 pte, level);
> =C2=A0	}
> =C2=A0
> =C2=A0	*action =3D ACTION_SUBTREE;
> @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> =C2=A0	/* Input parameters for the walk */
> =C2=A0	/** @tile: The tile we're building for */
> =C2=A0	struct xe_tile *tile;
> +	/** @vm: VM we're building for */
> +	struct xe_vm *vm;
> +	/** @scratch: write entries with scratch */
> +	bool scratch;
> =C2=A0
> =C2=A0	/* Output */
> =C2=A0	/** @needs_invalidate: Whether we need to invalidate TLB*/
> @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw
> *parent, pgoff_t offset,
> =C2=A0	 */
> =C2=A0	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> action, &offset,
> =C2=A0				=C2=A0=C2=A0=C2=A0 &end_offset)) {
> -		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child-
> >bo->vmap,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) * sizeof(u64));
> +		if (unlikely(xe_walk->scratch)) {
> +			u64 pte =3D __xe_pt_empty_pte(xe_walk->tile,
> xe_walk->vm,
> +						=C2=A0=C2=A0=C2=A0 level);
> +
> +			for (; offset < end_offset; ++offset)
> +				xe_pt_write(tile_to_xe(xe_walk-
> >tile),
> +					=C2=A0=C2=A0=C2=A0 &xe_child->bo->vmap,
> offset, pte);
> +		} else {
> +			xe_map_memset(tile_to_xe(xe_walk->tile),
> &xe_child->bo->vmap,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) *
> sizeof(u64));
> +		}
> =C2=A0		xe_walk->needs_invalidate =3D true;
> =C2=A0	}
> =C2=A0
> @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> xe_pt_zap_ptes_ops =3D {
> =C2=A0	.pt_entry =3D xe_pt_zap_ptes_entry,
> =C2=A0};
> =C2=A0
> +struct xe_pt_zap_ptes_flags {
> +	bool scratch:1;
> +};
> +
> +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> *vma,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_pt_zap_ptes_flags flags)
> +{
> +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> +		.base =3D {
> +			.ops =3D &xe_pt_zap_ptes_ops,
> +			.shifts =3D xe_normal_pt_shifts,
> +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile =3D tile,
> +		.vm =3D xe_vma_vm(vma),
> +		.scratch =3D flags.scratch,
> +	};
> +	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> xe_vma_start(vma),
> +				xe_vma_end(vma), &xe_walk.base);
> +
> +	return xe_walk.needs_invalidate;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> =C2=A0 * @tile: The tile we're zapping for.
> @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> xe_pt_zap_ptes_ops =3D {
> =C2=A0 */
> =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> =C2=A0{
> -	struct xe_pt_zap_ptes_walk xe_walk =3D {
> -		.base =3D {
> -			.ops =3D &xe_pt_zap_ptes_ops,
> -			.shifts =3D xe_normal_pt_shifts,
> -			.max_level =3D XE_PT_HIGHEST_LEVEL,
> -		},
> -		.tile =3D tile,
> -	};
> -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_pt_zap_ptes_flags flags =3D {};
> =C2=A0	u8 pt_mask =3D (vma->tile_present & ~vma->tile_invalidated);
> =C2=A0
> =C2=A0	if (!(pt_mask & BIT(tile->id)))
> =C2=A0		return false;
> =C2=A0
> -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> xe_vma_start(vma),
> -				xe_vma_end(vma), &xe_walk.base);
> -
> -	return xe_walk.needs_invalidate;
> +	return __xe_pt_zap_ptes(tile, vma, flags);
> =C2=A0}
> =C2=A0
> =C2=A0static void
> @@ -1201,7 +1233,46 @@ static bool xe_pt_userptr_inject_eagain(struct
> xe_userptr_vma *uvma)
> =C2=A0
> =C2=A0#endif
> =C2=A0
> -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
> +static void
> +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> *vma,
> +			=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update)
> +{
> +	struct xe_pt_zap_ptes_flags flags =3D { .scratch =3D true, };
> +	int i, j, k;
> +
> +	/*
> +	 * Need to update this function to bypass scratch setup if
> in fault mode
> +	 */
> +	xe_assert(xe_vma_vm(vma)->xe,
> !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> +
> +	for (i =3D 0; i < pt_update->current_op; ++i) {
> +		struct xe_vm_pgtable_update_op *op =3D &pt_update-
> >ops[i];
> +
> +		if (vma !=3D op->vma || (!op->bind && !op->rebind))
> +			continue;
> +
> +		for (j =3D 0; j < op->num_entries; ++j) {
> +			for (k =3D 0; k < op->entries[j].qwords; ++k)
> {
> +				struct xe_pt_entry *entry =3D
> +					&op-
> >entries[j].pt_entries[k];
> +				unsigned int level =3D entry->level;
> +
> +				if (!(level & XE_PT_IS_LEAF))
> +					continue;
> +
> +				level &=3D ~XE_PT_IS_LEAF;
> +				entry->pte =3D __xe_pt_empty_pte(tile,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> xe_vma_vm(vma),
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> level);
> +			}
> +		}
> +	}
> +
> +	__xe_pt_zap_ptes(tile, vma, flags);

As mentioned in my previous email, I'm pretty sure if we modify all the
ptes in the entry array, not just the leaves, (that's basically all
ptes of shared page-table entries) that will be equivalent to a zap.

/Thomas


> +}
> +
> +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update)
> =C2=A0{
> =C2=A0	struct xe_userptr_vma *uvma;
> @@ -1215,9 +1286,6 @@ static int vma_check_userptr(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	uvma =3D to_userptr_vma(vma);
> =C2=A0	notifier_seq =3D uvma->userptr.notifier_seq;
> =C2=A0
> -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> -		return 0;
> -
> =C2=A0	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 notifier_seq) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 !xe_pt_userptr_inject_eagain(uvma))
> @@ -1226,6 +1294,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_vm_in_fault_mode(vm)) {
> =C2=A0		return -EAGAIN;
> =C2=A0	} else {
> +		long err;
> +
> =C2=A0		spin_lock(&vm->userptr.invalidated_lock);
> =C2=A0		list_move_tail(&uvma->userptr.invalidate_link,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->userptr.invalidated);
> @@ -1234,25 +1304,27 @@ static int vma_check_userptr(struct xe_vm
> *vm, struct xe_vma *vma,
> =C2=A0		if (xe_vm_in_preempt_fence_mode(vm)) {
> =C2=A0			struct dma_resv_iter cursor;
> =C2=A0			struct dma_fence *fence;
> -			long err;
> =C2=A0
> =C2=A0			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> =C2=A0					=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP);
> =C2=A0			dma_resv_for_each_fence_unlocked(&cursor,
> fence)
> =C2=A0				dma_fence_enable_sw_signaling(fence)
> ;
> =C2=A0			dma_resv_iter_end(&cursor);
> -
> -			err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> -						=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> -						=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> -			XE_WARN_ON(err <=3D 0);
> =C2=A0		}
> +
> +		err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> +					=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> +					=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> +		XE_WARN_ON(err <=3D 0);
> +
> +		vma_convert_to_invalidation(tile, vma, pt_update);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> +static int op_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> +			=C2=A0=C2=A0=C2=A0 struct xe_vma_op *op,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update)
> =C2=A0{
> =C2=A0	int err =3D 0;
> @@ -1264,18 +1336,21 @@ static int op_check_userptr(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> =C2=A0			break;
> =C2=A0
> -		err =3D vma_check_userptr(vm, op->map.vma, pt_update);
> +		err =3D vma_check_userptr(tile, vm, op->map.vma,
> pt_update);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> =C2=A0		if (op->remap.prev)
> -			err =3D vma_check_userptr(vm, op->remap.prev,
> pt_update);
> +			err =3D vma_check_userptr(tile, vm, op-
> >remap.prev,
> +						pt_update);
> =C2=A0		if (!err && op->remap.next)
> -			err =3D vma_check_userptr(vm, op->remap.next,
> pt_update);
> +			err =3D vma_check_userptr(tile, vm, op-
> >remap.next,
> +						pt_update);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> -		err =3D vma_check_userptr(vm, gpuva_to_vma(op-
> >base.prefetch.va),
> +		err =3D vma_check_userptr(tile, vm,
> +					gpuva_to_vma(op-
> >base.prefetch.va),
> =C2=A0					pt_update);
> =C2=A0		break;
> =C2=A0	default:
> @@ -1301,7 +1376,8 @@ static int xe_pt_userptr_pre_commit(struct
> xe_migrate_pt_update *pt_update)
> =C2=A0	down_read(&vm->userptr.notifier_lock);
> =C2=A0
> =C2=A0	list_for_each_entry(op, &vops->list, link) {
> -		err =3D op_check_userptr(vm, op, pt_update_ops);
> +		err =3D op_check_userptr(&vm->xe->tiles[pt_update-
> >tile_id],
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm, op, pt_update_ops);
> =C2=A0		if (err) {
> =C2=A0			up_read(&vm->userptr.notifier_lock);
> =C2=A0			break;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..6f99ff2b8fce 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -29,7 +29,6 @@ struct xe_pt {
> =C2=A0	struct xe_bo *bo;
> =C2=A0	unsigned int level;
> =C2=A0	unsigned int num_live;
> -	bool rebind;
> =C2=A0	bool is_compact;
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> =C2=A0	/** addr: Virtual address start address of the PT. */
> @@ -52,6 +51,8 @@ struct xe_pt_ops {
> =C2=A0struct xe_pt_entry {
> =C2=A0	struct xe_pt *pt;
> =C2=A0	u64 pte;
> +#define XE_PT_IS_LEAF	BIT(31)
> +	unsigned int level;
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_vm_pgtable_update {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ea2e287e6526..f90e5c92010c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
> =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> =C2=A0	}
> =C2=A0
> -	up_write(&vm->userptr.notifier_lock);
> -
> =C2=A0	/*
> =C2=A0	 * Preempt fences turn into schedule disables, pipeline
> these.
> =C2=A0	 * Note that even in fault mode, we need to wait for binds
> and
> @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
> =C2=A0		XE_WARN_ON(err);
> =C2=A0	}
> =C2=A0
> +	up_write(&vm->userptr.notifier_lock);
> +
> =C2=A0	trace_xe_vma_userptr_invalidate_complete(vma);
> =C2=A0
> =C2=A0	return true;

