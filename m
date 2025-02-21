Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBABEC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 15:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D510EAA2;
	Fri, 21 Feb 2025 15:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZYPsQwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2E910EAA2
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740151662; x=1771687662;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7EWYCK7Mo5RPEv6nqVPr63/zCeHzYKMlaHpX0wvgvDg=;
 b=XZYPsQwpisOk1L9a9z2nlRp9jJIDMhjUimgMHnig0t75RiL369Qyvj5s
 NXiQ4aGb4gQ/CTRmbrjCbDjY5IyQ3zzhhWo2FpyAWV3t9gpECelmnk2ua
 2VzsuhJ30hI5ys67+UPPVR3MbKh0qEhN0/R8g9s8DfPiDhh7xZss4c11T
 unJoopB92fT4NCTbmdwEejKTAdsgDn65Dtz9Djxdao1Xx3i7pHhmKtQ8c
 uLJhfO0lhxdvzADVAaS9T/xrvTWqO9bltptkrfU3Vo/jp7XqKD6mocitE
 dfCRo9JuQT4CabJV+B0xbyhT7WPt97ACHjRo9NJ7+wiR9u+x2rCTwlfN2 Q==;
X-CSE-ConnectionGUID: EN9iOuAESc2xORNyF7VVKA==
X-CSE-MsgGUID: zFl4d9JCTYaEKNq9vITHgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58522660"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58522660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:27:41 -0800
X-CSE-ConnectionGUID: Uma4KltBSS+8XlQQ/DFmTA==
X-CSE-MsgGUID: 6mPVrls4RZurm2FhZV7JxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120322799"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.42])
 ([10.245.246.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:27:39 -0800
Message-ID: <fc92aa5518b0969a504b5849d21ee4866ec4965a.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Date: Fri, 21 Feb 2025 16:27:36 +0100
In-Reply-To: <Z7iQ/Y2VIo8sjvsh@lstrano-desk.jf.intel.com>
References: <20250220234557.2613010-1-matthew.brost@intel.com>
 <20250220234557.2613010-3-matthew.brost@intel.com>
 <7685842d544a4e9673dc4ec2645044a8ded58848.camel@linux.intel.com>
 <Z7iQ/Y2VIo8sjvsh@lstrano-desk.jf.intel.com>
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

On Fri, 2025-02-21 at 06:43 -0800, Matthew Brost wrote:
> On Fri, Feb 21, 2025 at 12:34:12PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2025-02-20 at 15:45 -0800, Matthew Brost wrote:
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
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into
> > > single
> > > job")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/regs/xe_gtt_defs.h |=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 86 +++++++++++++++++++--
> > > ----
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_pt_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > =C2=A04 files changed, 64 insertions(+), 28 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > index 4389e5a76f89..ab281e721d94 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > @@ -13,6 +13,7 @@
> > > =C2=A0
> > > =C2=A0#define GUC_GGTT_TOP		0xFEE00000
> > > =C2=A0
> > > +#define XE_PPGTT_IS_LEAF		BIT_ULL(63)
> > > =C2=A0#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> > > =C2=A0#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> > > =C2=A0#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..26b513a54113 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -389,6 +389,8 @@ xe_pt_insert_entry(struct
> > > xe_pt_stage_bind_walk
> > > *xe_walk, struct xe_pt *parent,
> > > =C2=A0		idx =3D offset - entry->ofs;
> > > =C2=A0		entry->pt_entries[idx].pt =3D xe_child;
> > > =C2=A0		entry->pt_entries[idx].pte =3D pte;
> > > +		if (!xe_child)
> > > +			entry->pt_entries[idx].pte |=3D
> > > XE_PPGTT_IS_LEAF;
> >=20
> > I don't think this is needed.
> >=20
>=20
> It is. Will explain below.
>=20
> > > =C2=A0		entry->qwords++;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -792,6 +794,24 @@ static const struct xe_pt_walk_ops
> > > xe_pt_zap_ptes_ops =3D {
> > > =C2=A0	.pt_entry =3D xe_pt_zap_ptes_entry,
> > > =C2=A0};
> > > =C2=A0
> > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > *vma)
> > > +{
> > > +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> > > +		.base =3D {
> > > +			.ops =3D &xe_pt_zap_ptes_ops,
> > > +			.shifts =3D xe_normal_pt_shifts,
> > > +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > > +		},
> > > +		.tile =3D tile,
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
> > > @@ -810,24 +830,12 @@ static const struct xe_pt_walk_ops
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
> > > +	return __xe_pt_zap_ptes(tile, vma);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void
> > > @@ -843,9 +851,10 @@ xe_vm_populate_pgtable(struct
> > > xe_migrate_pt_update *pt_update, struct xe_tile *t
> > > =C2=A0	for (i =3D 0; i < num_qwords; i++) {
> > > =C2=A0		if (map)
> > > =C2=A0			xe_map_wr(tile_to_xe(tile), map,
> > > (qword_ofs
> > > + i) *
> > > -				=C2=A0 sizeof(u64), u64,
> > > ptes[i].pte);
> > > +				=C2=A0 sizeof(u64), u64, ptes[i].pte
> > > &
> > > +				=C2=A0 ~XE_PPGTT_IS_LEAF);
> > > =C2=A0		else
> > > -			ptr[i] =3D ptes[i].pte;
> > > +			ptr[i] =3D ptes[i].pte &
> > > ~XE_PPGTT_IS_LEAF;
> > > =C2=A0	}
> > > =C2=A0}
> > > =C2=A0
> > > @@ -1201,7 +1210,30 @@ static bool
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
> > > +	int i, j, k;
> > > +
> > > +	for (i =3D 0; i < pt_update->current_op; ++i) {
> > > +		struct xe_vm_pgtable_update_op *op =3D &pt_update-
> > > > ops[i];
> > > +
> > > +		if (vma =3D=3D op->vma && (op->bind || op->rebind))
> > > {
> > > +			for (j =3D 0; j < op->num_entries; ++j) {
> > > +				for (k =3D 0; k < op-
> > > > entries[j].qwords; ++k)
> > > +					if (op-
> > > > entries[j].pt_entries[k].pte &
> > > +					=C2=A0=C2=A0=C2=A0 XE_PPGTT_IS_LEAF)
> >=20
> > IIRC It's a leaf iff op->entries[j].pt->level =3D=3D 0 ||
> > xe_pte_is_huge(pte) (xe_pte_is_huge(pte) needs to be coded)
> >=20
>=20
> The 'op->entries[j].pt' here is overidden at this point as part of
> the
> code which handles the unwind on error. See
> xe_pt_commit_prepare_bind.
>=20
> We can't reason whether the pte is a leaf without knowing the level,
> thus the extra bit here. Ofc this could be coded differently. Open to
> ideas but this might not needed if we just return -EAGAIN - see
> below.=20
>=20
> > > +						op-
> > > > entries[j].pt_entries[k].pte =3D 0;
> >=20
> > This should be a scratch pte unless it's a faulting VM?
> >=20
>=20
> Yes, if the VM is in scratch mode, this should be set scratch.
>=20
> >=20
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	__xe_pt_zap_ptes(tile, vma);
> >=20
> > Umm, A zap here would race completely with other pipelined updates
> > right? Why is it needed?
> >=20
>=20
> The PT tree is fully updated at this point. The nature of an array of
> binds means each operation must fully updated the PT tree before
> running
> the next operation. Thus is safe to call zap here.
>=20
> This is needed for invalidating leafs which are part of an
> unconnected
> tree always setup by the CPU.
>=20
> e.g. A 4k bind on empty does this:
>=20
> - 1 PT op to prune in a PTE at the highest level
> - (Highest level - 1) to 0 are part of an unconnected tree setup by
> CPU
>=20
> Here we'd only want to invalidate the level 0 PTE which
> __xe_pt_zap_ptes
> does.
>=20
> What is missing, as above, the zap would need program a scratch entry
> in
> the VM has scratch enabled.

What I meant was let's say you have *pipelined* a number of bind-exec-
unbinds, Then the zap might be landing between a previous bind and
exec, since it's touching shared page-tables. The userptr notifier
waits for all previous PT modifications to complete to avoid this.

The rule we have is pt structure updates are done sync, but pt value
updates are queued, unless they are touching nonshared pagetables that
aren't published yet.

>=20
> > > +}
> > > +
> > > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm
> > > *vm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> > > *pt_update)
> > > =C2=A0{
> > > =C2=A0	struct xe_userptr_vma *uvma;
> > > @@ -1215,9 +1247,6 @@ static int vma_check_userptr(struct xe_vm
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
> > > @@ -1231,6 +1260,8 @@ static int vma_check_userptr(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->userptr.invalidate=
d);
> > > =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> > > =C2=A0
> > > +		vma_convert_to_invalidation(tile, vma,
> > > pt_update);
> > > +
> > > =C2=A0		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > =C2=A0			struct dma_resv_iter cursor;
> > > =C2=A0			struct dma_fence *fence;
> >=20
> > And I really think here we should remove the open-coded and
> > undocumented invalidation (It took me like 15 minutes to understand
> > what the code did, and then I'm already up-to-date with how
> > invalidation works).
> >=20
>=20
> Yea, this ended up being more complicated that I though it would be
> and
> took me several hours to get this (mostly) right.
>=20
> > If just returning -EAGAIN doesn't really work here for the preempt-
>=20
> I think return -EAGAIN should work. A quick hack got what appears to
> be
> livelock on xe_vm.munmap-style-unbind-userptr-one-partial with error
> injection enabled. Need to dig in more, but my guess is this test
> does
> user bind which results in enough internal OPs so the error injection
> is
> always hit on every user bind. If this is the case, we could tweak
> the
> injection algorithm to use a counter based on user binds not internal
> OPs.
>=20
> In practice, getting an invalidation between getting the CPU pages
> and
> this step of the bind should be exceedingly rare, so return -EAGAIN
> doesn't seem like a huge deal. But this code path could really help
> for
> SVM prefetches where perhaps a single page is touched by the CPU,
> thus
> aborting the entire prefetch. If we could just squash that part of
> the
> prefetch into an invalidation, that could be useful. So weighing the
> complexity of an invalidation vs -EAGAIN needs to be considered.
>=20
> > fence case, Then I suggest that the error injection intstead
> > triggers a
> > real invalidation outside of the notifier lock.
>=20
> If the error injection really kicked the notifier, that would be
> better.
>=20
> > Perhaps using mmu_notifier_invalidate_range[start|end]()?
> >=20
>=20
> Off the top of my head unsure how this would be implemented or if it
> is
> possible. Generally a bad idea to call low level core MM functions
> though and I could see that upsetting the core MM people too if they
> make changes to whatever functions we need to call.

Good point. Maybe we could call our userptr notifier and update it so
that the check for first bind is done after the list addition.

>=20
> > But for now since this is a fix, restrict the -EINVAL inject to
> > cases
> > where it works and that we want to test.
> >=20
>=20
> Not following this.

What I meant was Just test the -EINVAL error injection in the cases
where aborting the whole operation is the expected result (IIRC that
was with page-faulting).

/Thomas


>=20
> Matt
>=20
> > Thanks,
> >=20
> > /Thomas
> >=20
> >=20
> > > @@ -1252,7 +1283,8 @@ static int vma_check_userptr(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
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
> > > @@ -1264,18 +1296,21 @@ static int op_check_userptr(struct xe_vm
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
> > > @@ -1301,7 +1336,8 @@ static int xe_pt_userptr_pre_commit(struct
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
> > > index 384cc04de719..0f9b7650cd6f 100644
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

