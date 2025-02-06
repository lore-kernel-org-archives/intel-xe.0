Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FB5C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 20:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1FA10E30E;
	Thu,  6 Feb 2025 20:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDv7P7FD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464B010E30E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738872715; x=1770408715;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zxE26dhbt92JoHK0Lc7SCcmm+eIYHu8hQFF/t1Q5vCQ=;
 b=GDv7P7FDqVsSQoI6vZaKKN59EDnyZIsqC9Xf4oVoSzcy4cDNdx9YtslQ
 hEFAv7ti6Bi12XopUvfIe65Gg5m8JaE8W6da9Ra3Bio78vJkKQO0FFgHX
 5PTBXSVoH1wU9balvD2t9VazCgSMfRJ9gl9E3uQU+eWlQlb9P761+6Gp3
 vnhCNwwlkv/hDHnuV6CKf5FiyJkoJws5caiidsOWimtrvHUQcV/vB3nCt
 deG0LhB5BWIyjEBjYKfLwlWyj+BEJ03Uwn4LF6UUb89M4lmsLajcOCsxP
 IOXJAyKQFR0wfAI5vPCGo2k2p3q4pOiWwX13RATySHQ0XV4gqlBVSc8Q4 A==;
X-CSE-ConnectionGUID: 8VLidsctSNqNRf6Y1SPjCA==
X-CSE-MsgGUID: kIPG4YjcR06w4kxSecGRlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39392316"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39392316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 12:11:55 -0800
X-CSE-ConnectionGUID: oTZeA2ulQouqpGdj5pz3Dw==
X-CSE-MsgGUID: ILVZMR2CTrS4waYAzHL8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111932254"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.47])
 ([10.245.246.47])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 12:11:53 -0800
Message-ID: <8072ebc831a73b073421a5a43d5a19e13634ced5.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Date: Thu, 06 Feb 2025 21:11:51 +0100
In-Reply-To: <MN2PR11MB472818E2CC67EA97629704FA92F62@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-2-oak.zeng@intel.com>
 <a8445518d81b30f3e726be857538e7fa3dfba16b.camel@linux.intel.com>
 <MN2PR11MB4728BF17A22D2B51A033771C92F62@MN2PR11MB4728.namprd11.prod.outlook.com>
 <5240fcb0fe9d929c008fafee4ac3149a23346474.camel@linux.intel.com>
 <MN2PR11MB472818E2CC67EA97629704FA92F62@MN2PR11MB4728.namprd11.prod.outlook.com>
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

Hi, Oak,

On Thu, 2025-02-06 at 18:56 +0000, Zeng, Oak wrote:
> Hi Thomas!
>=20
> > -----Original Message-----
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Sent: February 6, 2025 7:52 AM
> > To: Zeng, Oak <oak.zeng@intel.com>; intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
> >=20
> > On Thu, 2025-02-06 at 01:52 +0000, Zeng, Oak wrote:
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Sent: February 5, 2025 9:36 AM
> > > > To: Zeng, Oak <oak.zeng@intel.com>; intel-
> > xe@lists.freedesktop.org
> > > > Cc: Brost, Matthew <matthew.brost@intel.com>; Cavitt, Jonathan
> > > > <jonathan.cavitt@intel.com>
> > > > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before
> > vm_bind
> > > >=20
> > > > On Tue, 2025-02-04 at 13:45 -0500, Oak Zeng wrote:
> > > > > When a vm runs under fault mode, if scratch page is enabled,
> > we
> > > > need
> > > > > to clear the scratch page mapping before vm_bind for the
> > vm_bind
> > > > > address range. Under fault mode, we depend on recoverable
> > page
> > > > fault
> > > > > to establish mapping in page table. If scratch page is not
> > > > > cleared,
> > > > > GPU access of address won't cause page fault because it
> > > > > always
> > > > > hits
> > > > > the existing scratch page mapping.
> > > >=20
> > > > I think we need to ephasize that we clear AT vm_bind time, not
> > > > before,
> > > > both in the commit description and the patch title.
> > >=20
> > > Will fix.
> > >=20
> > > >=20
> > > > >=20
> > > > > When vm_bind with IMMEDIATE flag, there is no need of
> > clearing as
> > > > > immediate bind can overwrite the scratch page mapping.
> > > > >=20
> > > > > So far only is xe2 and xe3 products are allowed to enable
> > > > > scratch
> > > > > page
> > > > > under fault mode. On other platform we don't allow scratch
> > page
> > > > under
> > > > > fault mode, so no need of such clearing.
> > > > >=20
> > > > > v2: Rework vm_bind pipeline to clear scratch page mapping.
> > > > > This
> > > > > is
> > > > > similar
> > > > > to a map operation, with the exception that PTEs are cleared
> > > > instead
> > > > > of
> > > > > pointing to valid physical pages. (Matt, Thomas)
> > > > >=20
> > > > > TLB invalidation is needed after clear scratch page mapping
> > > > > as
> > > > > larger
> > > > > scratch page mapping could be backed by physical page and
> > cached
> > > > in
> > > > > TLB. (Matt, Thomas)
> > > > >=20
> > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > ---
> > > > > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 66
> > ++++++++++++++++++++++--
> > > > ------
> > > > > --
> > > > > =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0 2 +
> > > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 29 ++++++++++++--
> > > > > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 2 +
> > > > > =C2=A04 files changed, 75 insertions(+), 24 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > > index 1ddcc7e79a93..3fd0ae2dbe7d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > > > > =C2=A0	 * granularity.
> > > > > =C2=A0	 */
> > > > > =C2=A0	bool needs_64K;
> > > > > +	/* @clear_pt: clear page table entries during the
> > > > > bind
> > > > > walk
> > > > > */
> > > > > +	bool clear_pt;
> > > > > =C2=A0	/**
> > > > > =C2=A0	 * @vma: VMA being mapped
> > > > > =C2=A0	 */
> > > > > @@ -497,21 +499,25 @@ xe_pt_stage_bind_entry(struct
> > xe_ptw
> > > > *parent,
> > > > > pgoff_t offset,
> > > > >=20
> > > > > =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> > > > >=20
> > > > > -		pte =3D vm->pt_ops->pte_encode_vma(is_null ? 0
> > > > > :
> > > > > -
> > > > > xe_res_dma(curs) +
> > > > > xe_walk->dma_offset,
> > > > > -						 xe_walk-
> > > > > >vma,
> > > > > pat_index, level);
> > > > > -		pte |=3D xe_walk->default_pte;
> > > > > +		if (xe_walk->clear_pt) {
> > > > > +			pte =3D 0;
> > > > > +		} else {
> > > > > +			pte =3D vm->pt_ops-
> > > > > >pte_encode_vma(is_null
> > > > > ?
> > > > 0
> > > > > :
> > > > > +					xe_res_dma(curs) +
> > > > > xe_walk-
> > > > > > dma_offset,
> > > > > +					xe_walk->vma,
> > > > > pat_index,
> > > > > level);
> > > > > +			pte |=3D xe_walk->default_pte;
> > > > >=20
> > > > > -		/*
> > > > > -		 * Set the XE_PTE_PS64 hint if possible,
> > > > > otherwise
> > > > > if
> > > > > -		 * this device *requires* 64K PTE size for
> > > > > VRAM,
> > > > > fail.
> > > > > -		 */
> > > > > -		if (level =3D=3D 0 && !xe_parent->is_compact) {
> > > > > -			if (xe_pt_is_pte_ps64K(addr, next,
> > > > > xe_walk))
> > > > > {
> > > > > -				xe_walk->vma->gpuva.flags |=3D
> > > > > XE_VMA_PTE_64K;
> > > > > -				pte |=3D XE_PTE_PS64;
> > > > > -			} else if (XE_WARN_ON(xe_walk-
> > > > > needs_64K)) {
> > > > > -				return -EINVAL;
> > > > > +			/*
> > > > > +			 * Set the XE_PTE_PS64 hint if
> > > > > possible,
> > > > > otherwise if
> > > > > +			 * this device *requires* 64K PTE
> > > > > size
> > > > > for
> > > > > VRAM, fail.
> > > > > +			 */
> > > > > +			if (level =3D=3D 0 && !xe_parent-
> > > > > > is_compact) {
> > > > > +				if (xe_pt_is_pte_ps64K(addr,
> > > > > next,
> > > > > xe_walk)) {
> > > > > +					xe_walk->vma-
> > > > > > gpuva.flags
> > > > > =3D
> > > > > XE_VMA_PTE_64K;
> > > > > +					pte |=3D XE_PTE_PS64;
> > > > > +				} else if
> > > > > (XE_WARN_ON(xe_walk-
> > > > > > needs_64K)) {
> > > > > +					return -EINVAL;
> > > > > +				}
> > > > > =C2=A0			}
> > > > > =C2=A0		}
> > > > >=20
> > > >=20
> > > > I think there might be some things missing here.
> > > > The bind should look exactly as a is_null bind, with the
> > > > exception
> > > > that
> > > > the pte should be 0, so might be able to benefit from is_null,
> > > > for
> > > > example xe_pg_hugepte_possible() short-circuit the dma-
> > address
> > > > check.
> > >=20
> > > You are right. Above code has a problem for huge pte cases: it
> > > wouldn't detect
> > > A huge pte for clear_pt case. I will fix it.
> > >=20
> > > I will not make is_null be true for clear_pt case, but will make
> > > similar logic to
> > > Let clear_pt benefit from is_null logic.
> > >=20
> > > > With clear_pt we don't want to use the XE_PTE_PS64K, though,
> > like
> > > > you
> > > > identified above.
> > > >=20
> > > > Will get back with a look at the invalidation.
> > >=20
> > > I don't quite get here. Please do let me know if you find
> > > anything.
> >=20
> > Yes, I meant I hadn't had time to look at this part yet.
> >=20
> > For binding with scratch, it looks like *all* binds need TLB
> > invalidation, not just clearing binds, So in the below code-path,
> > can't
> > we just replace the xe_vm_in_preempt_fence_mode() with
> > xe_vm_in_lr_mode()?
>=20
> I think you are correct.=20
>=20
> For long run vm, regardless it is in fault mode or not, we need to
> invalidate
> TLB scratch page caching during bind. Original codes only did TLB inv
> on non-
> Fault mode. On fault mode + LR,=C2=A0 this runs into two sub-cases:
> 1.=C2=A0 immediate bind
> 2. bind triggered by page fault: note this can actually runs into the
> !rebind case
> When the fault address is first time accessed by gpu. But the TLB
> cache for
> Scratch page mapping should have been invalidated by the
> "invalidate_on_bind"
> Condition.
>=20
> So this leaves case #1 problematic.
>=20
> It would be better for others to comment also, as in the comment
> below, it explicitly
> Called out "non-faulting LR". My understanding is, people didn't
> think of case #1 above.
>=20
> Since it is an existing issue, I will make it a separate patch for
> better tracking purpose.

Hmm. What is the existing issue, I don't quite follow?

/Thomas

>=20
> Oak=20
>=20
> >=20
> >=20
> > 		/*
> > 		 * If rebind, we have to invalidate TLB on !LR vms
> > to
> > invalidate
> > 		 * cached PTEs point to freed memory. On LR vms
> > this
> > is done
> > 		 * automatically when the context is re-enabled by
> > the
> > rebind worker,
> > 		 * or in fault mode it was invalidated on PTE
> > zapping.
> > 		 *
> > 		 * If !rebind, and scratch enabled VMs, there is a
> > chance the scratch
> > 		 * PTE is already cached in the TLB so it needs to
> > be
> > invalidated.
> > 		 * On !LR VMs this is done in the ring ops
> > preceding a
> > batch, but on
> > 		 * non-faulting LR, in particular on user-space
> > batch
> > buffer chaining,
> > 		 * it needs to be done here.
> > 		 */
> > 		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > 		=C2=A0=C2=A0=C2=A0=C2=A0 xe_vm_in_preempt_fence_mode(vm)))
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > Oak
> > > >=20
> > > >=20
> > > > > @@ -519,7 +525,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > > *parent,
> > > > > pgoff_t offset,
> > > > > =C2=A0		if (unlikely(ret))
> > > > > =C2=A0			return ret;
> > > > >=20
> > > > > -		if (!is_null)
> > > > > +		if (!is_null && !xe_walk->clear_pt)
> > > > > =C2=A0			xe_res_next(curs, next - addr);
> > > > > =C2=A0		xe_walk->va_curs_start =3D next;
> > > > > =C2=A0		xe_walk->vma->gpuva.flags |=3D (XE_VMA_PTE_4K
> > > > > <<
> > > > > level);
> > > > > @@ -589,6 +595,7 @@ static const struct xe_pt_walk_ops
> > > > > xe_pt_stage_bind_ops =3D {
> > > > > =C2=A0 * @vma: The vma indicating the address range.
> > > > > =C2=A0 * @entries: Storage for the update entries used for
> > > > > connecting
> > > > > the
> > > > > tree to
> > > > > =C2=A0 * the main tree at commit time.
> > > > > + * @clear_pt: Clear the page table entries.
> > > > > =C2=A0 * @num_entries: On output contains the number of @entries
> > > > used.
> > > > > =C2=A0 *
> > > > > =C2=A0 * This function builds a disconnected page-table tree for =
a
> > > > > given
> > > > > address
> > > > > @@ -602,7 +609,8 @@ static const struct xe_pt_walk_ops
> > > > > xe_pt_stage_bind_ops =3D {
> > > > > =C2=A0 */
> > > > > =C2=A0static int
> > > > > =C2=A0xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > > > -		 struct xe_vm_pgtable_update *entries, u32
> > > > > *num_entries)
> > > > > +		 struct xe_vm_pgtable_update *entries,
> > > > > +		 bool clear_pt, u32 *num_entries)
> > > > > =C2=A0{
> > > > > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > > > > =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > > > > @@ -622,10 +630,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> > > > struct
> > > > > xe_vma *vma,
> > > > > =C2=A0		.vma =3D vma,
> > > > > =C2=A0		.wupd.entries =3D entries,
> > > > > =C2=A0		.needs_64K =3D (xe_vma_vm(vma)->flags &
> > > > > XE_VM_FLAG_64K) && is_devmem,
> > > > > +		.clear_pt =3D clear_pt,
> > > > > =C2=A0	};
> > > > > =C2=A0	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile-
> > > > > >id];
> > > > > =C2=A0	int ret;
> > > > >=20
> > > > > +	if (clear_pt) {
> > > > > +		ret =3D xe_pt_walk_range(&pt->base, pt->level,
> > > > > xe_vma_start(vma),
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_end(vma),
> > > > > &xe_walk.base);
> > > > > +
> > > > > +		*num_entries =3D
> > > > > xe_walk.wupd.num_used_entries;
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > =C2=A0	/**
> > > > > =C2=A0	 * Default atomic expectations for different
> > > > > allocation
> > > > > scenarios are as follows:
> > > > > =C2=A0	 *
> > > > > @@ -981,12 +998,14 @@ static void xe_pt_free_bind(struct
> > > > > xe_vm_pgtable_update *entries,
> > > > >=20
> > > > > =C2=A0static int
> > > > > =C2=A0xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma=
,
> > > > > -		=C2=A0=C2=A0 struct xe_vm_pgtable_update *entries, u32
> > > > > *num_entries)
> > > > > +		=C2=A0=C2=A0 struct xe_vm_pgtable_update *entries,
> > > > > +		=C2=A0=C2=A0 bool invalidate_on_bind, u32
> > > > > *num_entries)
> > > > > =C2=A0{
> > > > > =C2=A0	int err;
> > > > >=20
> > > > > =C2=A0	*num_entries =3D 0;
> > > > > -	err =3D xe_pt_stage_bind(tile, vma, entries,
> > > > > num_entries);
> > > > > +	err =3D xe_pt_stage_bind(tile, vma, entries,
> > > > > invalidate_on_bind,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_entries);
> > > > > =C2=A0	if (!err)
> > > > > =C2=A0		xe_tile_assert(tile, *num_entries);
> > > > >=20
> > > > > @@ -1661,6 +1680,7 @@ static int bind_op_prepare(struct
> > xe_vm
> > > > *vm,
> > > > > struct xe_tile *tile,
> > > > > =C2=A0		return err;
> > > > >=20
> > > > > =C2=A0	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > > > +				 pt_update_ops-
> > > > > > invalidate_on_bind,
> > > > > =C2=A0				 &pt_op->num_entries);
> > > > > =C2=A0	if (!err) {
> > > > > =C2=A0		xe_tile_assert(tile, pt_op->num_entries <=3D
> > > > > @@ -1685,7 +1705,7 @@ static int bind_op_prepare(struct
> > xe_vm
> > > > *vm,
> > > > > struct xe_tile *tile,
> > > > > =C2=A0		 * it needs to be done here.
> > > > > =C2=A0		 */
> > > > > =C2=A0		if ((!pt_op->rebind && xe_vm_has_scratch(vm)
> > > > > &&
> > > > > -		=C2=A0=C2=A0=C2=A0=C2=A0 xe_vm_in_preempt_fence_mode(vm)))
> > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0 xe_vm_in_preempt_fence_mode(vm)) ||
> > > > > pt_update_ops->invalidate_on_bind)
> > > > > =C2=A0			pt_update_ops->needs_invalidation =3D
> > > > > true;
> > > > > =C2=A0		else if (pt_op->rebind &&
> > > > > !xe_vm_in_lr_mode(vm))
> > > > > =C2=A0			/* We bump also if
> > > > > batch_invalidate_tlb
> > > > > is
> > > > > true */
> > > > > @@ -1759,9 +1779,13 @@ static int op_prepare(struct xe_vm
> > *vm,
> > > > >=20
> > > > > =C2=A0	switch (op->base.op) {
> > > > > =C2=A0	case DRM_GPUVA_OP_MAP:
> > > > > -		if (!op->map.immediate &&
> > > > xe_vm_in_fault_mode(vm))
> > > > > +		if (!op->map.immediate &&
> > > > xe_vm_in_fault_mode(vm) &&
> > > > > +		=C2=A0=C2=A0=C2=A0 !op->map.invalidate_on_bind)
> > > > > =C2=A0			break;
> > > > >=20
> > > > > +		if (op->map.invalidate_on_bind)
> > > > > +			pt_update_ops->invalidate_on_bind =3D
> > > > > true;
> > > > > +
> > > > > =C2=A0		err =3D bind_op_prepare(vm, tile,
> > > > > pt_update_ops,
> > > > > op-
> > > > > > map.vma);
> > > > > =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> > > > > =C2=A0		break;
> > > > > @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct
> > xe_vm
> > > > *vm,
> > > > > struct xe_tile *tile,
> > > > > =C2=A0	}
> > > > > =C2=A0	vma->tile_present |=3D BIT(tile->id);
> > > > > =C2=A0	vma->tile_staged &=3D ~BIT(tile->id);
> > > > > +	if (pt_update_ops->invalidate_on_bind)
> > > > > +		vma->tile_invalidated |=3D BIT(tile->id);
> > > > > =C2=A0	if (xe_vma_is_userptr(vma)) {
> > > > > =C2=A0		lockdep_assert_held_read(&vm-
> > > > > > userptr.notifier_lock);
> > > > > =C2=A0		to_userptr_vma(vma)->userptr.initial_bind =3D
> > > > > true;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > index 384cc04de719..3d0aa2a5102e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > > > > =C2=A0	bool needs_userptr_lock;
> > > > > =C2=A0	/** @needs_invalidation: Needs invalidation */
> > > > > =C2=A0	bool needs_invalidation;
> > > > > +	/** @invalidate_on_bind: Invalidate the range before
> > > > > bind */
> > > > > +	bool invalidate_on_bind;
> > > > > =C2=A0	/**
> > > > > =C2=A0	 * @wait_vm_bookkeep: PT operations need to wait
> > > > > until
> > > > > VM
> > > > is
> > > > > idle
> > > > > =C2=A0	 * (bookkeep dma-resv slots are idle) and stage all
> > > > > future
> > > > > VM activity
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index d664f2e418b2..813d893d9b63 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device
> > *xe,
> > > > > struct drm_gpuva_op *op)
> > > > > =C2=A0}
> > > > > =C2=A0#endif
> > > > >=20
> > > > > +static bool __xe_vm_needs_clear_scratch_pages(struct
> > xe_vm
> > > > *vm, u32
> > > > > bind_flags)
> > > > > +{
> > > > > +	if (!xe_vm_in_fault_mode(vm))
> > > > > +		return false;
> > > > > +
> > > > > +	if (!NEEDS_SCRATCH(vm->xe))
> > > > > +		return false;
> > > > > +
> > > > > +	if (!xe_vm_has_scratch(vm))
> > > > > +		return false;
> > > > > +
> > > > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > > > +		return false;
> > > > > +
> > > > > +	return true;
> > > > > +}
> > > > > +
> > > > > =C2=A0/*
> > > > > =C2=A0 * Create operations list from IOCTL arguments, setup
> > operations
> > > > > fields so parse
> > > > > =C2=A0 * and commit steps are decoupled from IOCTL arguments. Thi=
s
> > > > step
> > > > > can fail.
> > > > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct
> > xe_vm
> > > > *vm,
> > > > > struct xe_bo *bo,
> > > > > =C2=A0			op->map.is_null =3D flags &
> > > > > DRM_XE_VM_BIND_FLAG_NULL;
> > > > > =C2=A0			op->map.dumpable =3D flags &
> > > > > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > > > > =C2=A0			op->map.pat_index =3D pat_index;
> > > > > +			op->map.invalidate_on_bind =3D
> > > > > +
> > > > 	__xe_vm_needs_clear_scratch_pages(vm
> > > > > , flags);
> > > > > =C2=A0		} else if (__op->op =3D=3D
> > > > > DRM_GPUVA_OP_PREFETCH) {
> > > > > =C2=A0			op->prefetch.region =3D
> > > > > prefetch_region;
> > > > > =C2=A0		}
> > > > > @@ -2188,7 +2207,8 @@ static int
> > vm_bind_ioctl_ops_parse(struct
> > > > xe_vm
> > > > > *vm, struct drm_gpuva_ops *ops,
> > > > > =C2=A0				return PTR_ERR(vma);
> > > > >=20
> > > > > =C2=A0			op->map.vma =3D vma;
> > > > > -			if (op->map.immediate ||
> > > > > !xe_vm_in_fault_mode(vm))
> > > > > +			if (op->map.immediate ||
> > > > > !xe_vm_in_fault_mode(vm) ||
> > > > > +			=C2=A0=C2=A0=C2=A0 op->map.invalidate_on_bind)
> > > > >=20
> > > > 	xe_vma_ops_incr_pt_update_ops(vops,
> > > > >=20
> > > > > op-
> > > > > > tile_mask);
> > > > > =C2=A0			break;
> > > > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> > > > drm_exec
> > > > > *exec, struct xe_vm *vm,
> > > > >=20
> > > > > =C2=A0	switch (op->base.op) {
> > > > > =C2=A0	case DRM_GPUVA_OP_MAP:
> > > > > -		err =3D vma_lock_and_validate(exec, op-
> > > > > >map.vma,
> > > > > -
> > > > > !xe_vm_in_fault_mode(vm)
> > > > > > >=20
> > > > > -					=C2=A0=C2=A0=C2=A0 op-
> > > > > >map.immediate);
> > > > > +		if (!op->map.invalidate_on_bind)
> > > > > +			err =3D vma_lock_and_validate(exec,
> > > > > op-
> > > > > > map.vma,
> > > > > +
> > > > > !xe_vm_in_fault_mode(vm) ||
> > > > > +						=C2=A0=C2=A0=C2=A0 op-
> > > > > > map.immediate);
> > > > > =C2=A0		break;
> > > > > =C2=A0	case DRM_GPUVA_OP_REMAP:
> > > > > =C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> > > > > > base.remap.unmap->va));
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > index 52467b9b5348..dace04f4ea5e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > > > > =C2=A0	bool is_null;
> > > > > =C2=A0	/** @dumpable: whether BO is dumped on GPU hang */
> > > > > =C2=A0	bool dumpable;
> > > > > +	/** @invalidate: invalidate the VMA before bind */
> > > > > +	bool invalidate_on_bind;
> > > > > =C2=A0	/** @pat_index: The pat index to use for this
> > > > > operation.
> > > > > */
> > > > > =C2=A0	u16 pat_index;
> > > > > =C2=A0};
> > >=20
>=20

