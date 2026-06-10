Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F2CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 09:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED15A10E4BF;
	Wed, 10 Jun 2026 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2xERM5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888BE10E4BF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781082465; x=1812618465;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V6H+j8vV5ZKU+SUTbdZdEuudSa15/NRWcpxTTQPqeco=;
 b=Q2xERM5ZEdQjDvvLe/lq7LEEspujatnlKZn7bK1Q65i5OFfDRIXJR8TP
 sDDq9ogVbpPRwl2mpMIWThVZGqFdohK1RUZ+4SUt/sBhZPLB2hlFIb+jW
 gVHPR7oLGOHN98dE4054+Uy7yIk/oODxnk1Vm43NdSP3QlidUVzOdcYT2
 xH0v9ulO72Y13VBPFOJALZI5QAZ6XV41pmsLLZI1NnFJbYZL+FdDNSVxM
 IgCJVFNahrpXfZpdzrlE1jRLb7S9oYpoQ2Fz5a/mu1+9GYyjRMiOGF8bw
 KyK2EKBLWcDUGFij+gjjSYkVGI4p7ASa5qQGgOUoaniW7hWLPD0XOzCo6 Q==;
X-CSE-ConnectionGUID: AE0CE2C+QNaDYjTxQhKDuw==
X-CSE-MsgGUID: hHgMzUQLRXOBedrv1W9R2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92976443"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92976443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:07:16 -0700
X-CSE-ConnectionGUID: lggGgYOhS+KZTuBENuOemQ==
X-CSE-MsgGUID: XZlHHIYITken4BdSreCvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="247971495"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.27])
 ([10.245.244.27])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:07:13 -0700
Message-ID: <b35603bebdab62b381cf30b6ebcef0c9e07a7e1b.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix use-after-free race in xe_pt_zap_ptes and
 xe_pt_zap_ptes_range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 11:07:11 +0200
In-Reply-To: <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
References: <20260605105202.1664464-1-francois.dugast@intel.com>
 <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
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

On Mon, 2026-06-08 at 10:33 -0700, Matthew Brost wrote:
> On Fri, Jun 05, 2026 at 12:52:02PM +0200, Francois Dugast wrote:
> > xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table
> > tree
> > holding only the BO reservation or SVM notifier_lock respectively.
> > Concurrently, xe_pt_update_ops_run() (vm->lock write) calls
> > xe_pt_commit()
> > which swaps children[] pointers and immediately frees the replaced
> > xe_pt
> > via xe_pt_destroy().=C2=A0 xe_vm_pt_destroy() has the same exposure
> > during VM
> > teardown.=C2=A0 Either path can produce a use-after-free when a
> > concurrent walk
> > dereferences a just-freed node. Fix by introducing a per-VM
> > rw_semaphore
> > pt_lock.

When commiting a pt walk, The xe_pt_commit_locks_assert() should be
ensuring the zaps are locked out:

If zap is holding the resv (bo eviction), then a walk touching the same
bo would also be holding that resv.

For userptr, the same is true, but with the SVM notifier lock.

One corner-case, though, might be if the touched regions are disjoint,
and the pt_update_ops_run() frees a shared page-table. Let me check
that.

/Thomas



> >=20
>=20
> This locking is very hard to reason about. I believe I understand the
> issue=E2=80=94zap holds the SVM notifier_lock, but an unbind with only th=
e VM
> resv lock (non-userptr/SVM) could race and cause a UAF, right? These
> operations=C2=A0 should be touching different PTEs or they would both hol=
d
> SVM notifier_lock so it ought to be safe, but perhaps I=E2=80=99m missing
> something.
>=20
> Again, the existing code somewhat confusing and a bit hand-wavy. With
> that - regardless, I=E2=80=99m okay with introducing a dedicated lock, as
> this
> series does, to ensure safety / make the locking clear.
>=20
> A couple nits below.
>=20
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>=20
> I=E2=80=99d also like Thomas=E2=80=99s input here before merging, as lock=
ing is
> difficult and the more eyes on it, the better.
>=20
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
47 ++++++++++++++++++++++------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ++
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 5 ++++
> > =C2=A03 files changed, 40 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index 15ce77ce7793..2dada51469c9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -919,10 +919,10 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops =3D {
> > =C2=A0 * Eviction and Userptr invalidation needs to be able to zap the
> > =C2=A0 * gpu ptes of a given address range in pagefaulting mode.
> > =C2=A0 * In order to be able to do that, that function needs access to
> > the shared
> > - * page-table entrieaso it can either clear the leaf PTEs or
> > - * clear the pointers to lower-level page-tables. The caller is
> > required
> > - * to hold the necessary locks to ensure neither the page-table
> > connectivity
> > - * nor the page-table entries of the range is updated from under
> > us.
> > + * page-table entries so it can either clear the leaf PTEs or
> > + * clear the pointers to lower-level page-tables. The function
> > acquires
> > + * vm->pt_lock (read) to protect against concurrent page-table
> > tree
> > + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
> > =C2=A0 *
> > =C2=A0 * Return: Whether ptes were actually updated and a TLB
> > invalidation is
> > =C2=A0 * required.
> > @@ -937,19 +937,24 @@ bool xe_pt_zap_ptes(struct xe_tile *tile,
> > struct xe_vma *vma)
> > =C2=A0		},
> > =C2=A0		.tile =3D tile,
> > =C2=A0	};
> > -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +	struct xe_pt *pt;
> > =C2=A0	u8 pt_mask =3D (vma->tile_present & ~vma->tile_invalidated);
> > =C2=A0
> > =C2=A0	if (xe_vma_bo(vma))
> > =C2=A0		xe_bo_assert_held(xe_vma_bo(vma));
> > =C2=A0	else if (xe_vma_is_userptr(vma))
> > -		lockdep_assert_held(&xe_vma_vm(vma)-
> > >svm.gpusvm.notifier_lock);
> > +		lockdep_assert_held(&vm-
> > >svm.gpusvm.notifier_lock);
> > =C2=A0
> > =C2=A0	if (!(pt_mask & BIT(tile->id)))
> > =C2=A0		return false;
> > =C2=A0
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > +	down_read(&vm->pt_lock);
>=20
> Style nit - can we use guards or scoped guards in this series?
>=20
> > +	pt =3D vm->pt_root[tile->id];
> > +	if (pt)
> > +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > +					xe_vma_end(vma),
> > &xe_walk.base);
> > +	up_read(&vm->pt_lock);
> > =C2=A0
> > =C2=A0	return xe_walk.needs_invalidate;
> > =C2=A0}
> > @@ -963,8 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile,
> > struct xe_vma *vma)
> > =C2=A0 * SVM invalidation needs to be able to zap the gpu ptes of a
> > given address
> > =C2=A0 * range. In order to be able to do that, that function needs
> > access to the
> > =C2=A0 * shared page-table entries so it can either clear the leaf PTEs
> > or
> > - * clear the pointers to lower-level page-tables. The caller is
> > required
> > - * to hold the SVM notifier lock.
> > + * clear the pointers to lower-level page-tables. The function
> > acquires
> > + * vm->pt_lock (read) to protect against concurrent page-table
> > tree
> > + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
> > =C2=A0 *
> > =C2=A0 * Return: Whether ptes were actually updated and a TLB
> > invalidation is
> > =C2=A0 * required.
> > @@ -980,14 +986,16 @@ bool xe_pt_zap_ptes_range(struct xe_tile
> > *tile, struct xe_vm *vm,
> > =C2=A0		},
> > =C2=A0		.tile =3D tile,
> > =C2=A0	};
> > -	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > +	struct xe_pt *pt;
> > =C2=A0	u8 pt_mask =3D (range->tile_present & ~range-
> > >tile_invalidated);
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * Locking rules:
> > =C2=A0	 *
> > -	 * - notifier_lock (write): full protection against page
> > table changes
> > -	 *=C2=A0=C2=A0 and MMU notifier invalidations.
> > +	 * - notifier_lock (write): excludes concurrent MMU
> > notifier
> > +	 *=C2=A0=C2=A0 invalidations, but does NOT exclude
> > xe_pt_update_ops_run() which
> > +	 *=C2=A0=C2=A0 holds vm->lock (write).=C2=A0 pt_lock (read) is theref=
ore
> > required to
> > +	 *=C2=A0=C2=A0 serialise against concurrent xe_pt_commit() /
> > xe_pt_destroy() calls.
> > =C2=A0	 *
> > =C2=A0	 * - notifier_lock (read) + vm_lock (write): combined
> > protection against
> > =C2=A0	 *=C2=A0=C2=A0 invalidations and concurrent page table
> > modifications. (e.g., madvise)
> > @@ -1000,8 +1008,13 @@ bool xe_pt_zap_ptes_range(struct xe_tile
> > *tile, struct xe_vm *vm,
> > =C2=A0	if (!(pt_mask & BIT(tile->id)))
> > =C2=A0		return false;
> > =C2=A0
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_svm_range_start(range),
> > -				xe_svm_range_end(range),
> > &xe_walk.base);
> > +	down_read(&vm->pt_lock);
>=20
> Should be assert vm->pt_lock in held in xe_pt_zap_ptes_entry or do we
> not have the VM there?
>=20
> Matt
>=20
> > +	pt =3D vm->pt_root[tile->id];
> > +	if (pt)
> > +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> > +					xe_svm_range_start(range),
> > +					xe_svm_range_end(range),
> > &xe_walk.base);
> > +	up_read(&vm->pt_lock);
> > =C2=A0
> > =C2=A0	return xe_walk.needs_invalidate;
> > =C2=A0}
> > @@ -1079,6 +1092,8 @@ static void xe_pt_commit_locks_assert(struct
> > xe_vma *vma)
> > =C2=A0
> > =C2=A0	if (xe_vma_is_userptr(vma))
> > =C2=A0		xe_svm_assert_held_read(vm);
> > +
> > +	lockdep_assert_held_write(&vm->pt_lock);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_pt_commit(struct xe_vma *vma,
> > @@ -2638,6 +2653,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Point of no return - VM killed if failure after this */
> > +	down_write(&vm->pt_lock);
> > =C2=A0	for (i =3D 0; i < pt_update_ops->current_op; ++i) {
> > =C2=A0		struct xe_vm_pgtable_update_op *pt_op =3D
> > &pt_update_ops->ops[i];
> > =C2=A0
> > @@ -2645,6 +2661,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 pt_op->num_entries, &pt_update_ops-
> > >deferred);
> > =C2=A0		pt_op->vma =3D NULL;	/* skip in
> > xe_pt_update_ops_abort */
> > =C2=A0	}
> > +	up_write(&vm->pt_lock);
> > =C2=A0
> > =C2=A0	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> > =C2=A0				=C2=A0 &xe_range_fence_kfree_ops,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 080c2fff0e95..b711c12bf751 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1580,12 +1580,14 @@ static void xe_vm_pt_destroy(struct xe_vm
> > *vm)
> > =C2=A0
> > =C2=A0	xe_vm_assert_held(vm);
> > =C2=A0
> > +	down_write(&vm->pt_lock);
> > =C2=A0	for_each_tile(tile, vm->xe, id) {
> > =C2=A0		if (vm->pt_root[id]) {
> > =C2=A0			xe_pt_destroy(vm->pt_root[id], vm->flags,
> > NULL);
> > =C2=A0			vm->pt_root[id] =3D NULL;
> > =C2=A0		}
> > =C2=A0	}
> > +	up_write(&vm->pt_lock);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_vm_init_prove_locking(struct xe_device *xe, struct
> > xe_vm *vm)
> > @@ -1644,6 +1646,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> > =C2=A0	} else {
> > =C2=A0		init_rwsem(&vm->lock);
> > =C2=A0	}
> > +	init_rwsem(&vm->pt_lock);
> > =C2=A0	mutex_init(&vm->snap_mutex);
> > =C2=A0
> > =C2=A0	INIT_LIST_HEAD(&vm->rebind_list);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 635ed29b9a69..3bc45991f607 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -271,6 +271,11 @@ struct xe_vm {
> > =C2=A0	 * VM
> > =C2=A0	 */
> > =C2=A0	struct rw_semaphore lock;
> > +	/**
> > +	 * @pt_lock: Protects page-table tree structural
> > modifications from
> > +	 * concurrent reads during page-table walks (e.g.,
> > xe_pt_zap_ptes).
> > +	 */
> > +	struct rw_semaphore pt_lock;
> > =C2=A0	/**
> > =C2=A0	 * @snap_mutex: Mutex used to guard insertions and
> > removals from gpuva,
> > =C2=A0	 * so we can take a snapshot safely from devcoredump.
> > --=20
> > 2.43.0
> >=20
