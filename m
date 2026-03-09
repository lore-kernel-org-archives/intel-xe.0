Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B1AEFCD6D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1E610E4B8;
	Mon,  9 Mar 2026 09:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEUzd9iN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B2896C7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048780; x=1804584780;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xvPmRT/RkU7zDaohEehNpMSGNsLv4qlUNImPit9KnK4=;
 b=EEUzd9iN0SrPLuWCGAB8oV6dJdj0vu9X3WhoFO5sS4q/c8LLNXlpHsrG
 XVFqUFi5dGThXqcWa9kFi/5dFKV3+S8HRB8urhcykdS63rvwHEC8AlT4A
 BetsUGOr9s1nnudoRC9BOTnL1BuCpqtbh0c2gxfyCz+DvSAaAS9uG0UQC
 wdLY+57tX1kSktKdghBIQ3Hzqtl71nL/hICAFgtxSxT0O+9Kk02TFD16q
 ZqCW8Rx9zRqjWlqs8ok42bzrqyqfkzj7uDPTj5tjJA+scg8NNmkzWwDZt
 Wh01ZxB9HvpTfsPMHu5KcVQ4YK2KkvaqJ6Gi07zxL0zBX43L815w0TuX/ Q==;
X-CSE-ConnectionGUID: EWU+mtGjTse/7pIeoScEhg==
X-CSE-MsgGUID: 17Ns94nCQoKhH2kvPbsF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74259709"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74259709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:33:00 -0700
X-CSE-ConnectionGUID: j8uvdzsBRhyUfThBcJEvVw==
X-CSE-MsgGUID: /x/pWDKlTWmlQlXEbZ5sHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219673237"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.171])
 ([10.245.245.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:32:59 -0700
Message-ID: <9500a8631dc402b690b4849fd482e436cb425ca8.camel@linux.intel.com>
Subject: Re: [RFC 4/7] drm/xe/vm: Add madvise autoreset interval notifier
 worker infrastructure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com
Date: Mon, 09 Mar 2026 10:32:35 +0100
In-Reply-To: <70f3a306-15e4-4eb1-82da-74818f35b437@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-5-arvind.yadav@intel.com>
 <aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com>
 <70f3a306-15e4-4eb1-82da-74818f35b437@intel.com>
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

On Mon, 2026-03-09 at 12:37 +0530, Yadav, Arvind wrote:
>=20
> On 26-02-2026 05:04, Matthew Brost wrote:
> > On Thu, Feb 19, 2026 at 02:43:09PM +0530, Arvind Yadav wrote:
> > > MADVISE_AUTORESET needs to reset VMA attributes when userspace
> > > unmaps
> > > CPU-only ranges, but the MMU invalidate callback cannot take vm-
> > > >lock
> > > due to lock ordering (mmap_lock is already held).
> > >=20
> > > Add mmu_interval_notifier that queues work items for
> > > MMU_NOTIFY_UNMAP
> > > events. The worker runs under vm->lock and resets attributes for
> > > VMAs
> > > still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-
> > > touched).
> > >=20
> > > Work items are allocated from a mempool to handle atomic context
> > > in the
> > > callback. The notifier is deactivated when GPU touches the VMA.
> > >=20
> > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m<thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm_madvise.c | 394
> > > +++++++++++++++++++++++++++++
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm_madvise.h |=C2=A0=C2=A0 8 +
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 |=C2=A0 41 +++
> > > =C2=A0 3 files changed, 443 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > index 52147f5eaaa0..4c0ffb100bcc 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -6,9 +6,12 @@
> > > =C2=A0 #include "xe_vm_madvise.h"
> > > =C2=A0=20
> > > =C2=A0 #include <linux/nospec.h>
> > > +#include <linux/mempool.h>
> > > +#include <linux/workqueue.h>
> > > =C2=A0 #include <drm/xe_drm.h>
> > > =C2=A0=20
> > > =C2=A0 #include "xe_bo.h"
> > > +#include "xe_macros.h"
> > > =C2=A0 #include "xe_pat.h"
> > > =C2=A0 #include "xe_pt.h"
> > > =C2=A0 #include "xe_svm.h"
> > > @@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device
> > > *dev, void *data, struct drm_file *fil
> > > =C2=A0=C2=A0	xe_vm_put(vm);
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0 }
> > > +
> > > +/**
> > > + * struct xe_madvise_work_item - Work item for unmap processing
> > > + * @work: work_struct
> > > + * @vm: VM reference
> > > + * @pool: Mempool for recycling
> > > + * @start: Start address
> > > + * @end: End address
> > > + */
> > > +struct xe_madvise_work_item {
> > > +	struct work_struct work;
> > > +	struct xe_vm *vm;
> > > +	mempool_t *pool;
> > Why mempool? Seems like we could just do kmalloc with correct gfp
> > flags.
>=20
>=20
> I tried kmalloc first, but ran into two issues:
> GFP_KERNEL =E2=80=94 fails because MMU notifier callbacks must not block,=
 and
> GFP_KERNEL can sleep waiting for memory reclaim.
> GFP_ATOMIC =E2=80=94 triggers a circular lockdep warning: the MMU notifie=
r
> holds=20
> mmu_notifier_invalidate_range_start, and GFP_ATOMIC internally tries
> to=20
> acquire fs_reclaim, which already depends on the MMU notifier lock.
>=20
> Agreed. mempool looks unnecessary here. I re-tested this with=20
> kmalloc(..., GFP_NOWAIT) and that avoids both blocking and the=20
> reclaim-related lockdep issue I saw with the earlier approach. I will
> switch to that and drop the pool in the next version.

Note that GFP_NOWAIT can only be used as a potential optimization in
case memory happens to be available. GFP_NOWAIT is very likely to fail
in a reclaim situation and should not be used unless there is a backup
path. We shouldn't really try to work around lockdep problems with GFP
flags.

/Thomas



>=20
>=20
> >=20
> > > +	u64 start;
> > > +	u64 end;
> > > +};
> > > +
> > > +static void xe_vma_set_default_attributes(struct xe_vma *vma)
> > > +{
> > > +	vma->attr.preferred_loc.devmem_fd =3D
> > > DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> > > +	vma->attr.preferred_loc.migration_policy =3D
> > > DRM_XE_MIGRATE_ALL_PAGES;
> > > +	vma->attr.pat_index =3D vma->attr.default_pat_index;
> > > +	vma->attr.atomic_access =3D DRM_XE_ATOMIC_UNDEFINED;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_madvise_process_unmap - Process munmap for all VMAs in
> > > range
> > > + * @vm: VM
> > > + * @start: Start of unmap range
> > > + * @end: End of unmap range
> > > + *
> > > + * Processes all VMAs overlapping the unmap range. An unmap can
> > > span multiple
> > > + * VMAs, so we need to loop and process each segment.
> > > + *
> > > + * Return: 0 on success, negative error otherwise
> > > + */
> > > +static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64
> > > start, u64 end)
> > > +{
> > > +	u64 addr =3D start;
> > > +	int err;
> > > +
> > > +	lockdep_assert_held_write(&vm->lock);
> > > +
> > > +	if (xe_vm_is_closed_or_banned(vm))
> > > +		return 0;
> > > +
> > > +	while (addr < end) {
> > > +		struct xe_vma *vma;
> > > +		u64 seg_start, seg_end;
> > > +		bool has_default_attr;
> > > +
> > > +		vma =3D xe_vm_find_overlapping_vma(vm, addr, end);
> > > +		if (!vma)
> > > +			break;
> > > +
> > > +		/* Skip GPU-touched VMAs - SVM handles them */
> > > +		if (!xe_vma_has_cpu_autoreset_active(vma)) {
> > > +			addr =3D xe_vma_end(vma);
> > > +			continue;
> > > +		}
> > > +
> > > +		has_default_attr =3D
> > > xe_vma_has_default_mem_attrs(vma);
> > > +		seg_start =3D max(addr, xe_vma_start(vma));
> > > +		seg_end =3D min(end, xe_vma_end(vma));
> > > +
> > > +		/* Expand for merging if VMA already has default
> > > attrs */
> > > +		if (has_default_attr &&
> > > +		=C2=A0=C2=A0=C2=A0 xe_vma_start(vma) >=3D start &&
> > > +		=C2=A0=C2=A0=C2=A0 xe_vma_end(vma) <=3D end) {
> > > +			seg_start =3D xe_vma_start(vma);
> > > +			seg_end =3D xe_vma_end(vma);
> > > +			xe_vm_find_cpu_addr_mirror_vma_range(vm,
> > > &seg_start, &seg_end);
> > > +		} else if (xe_vma_start(vma) =3D=3D seg_start &&
> > > xe_vma_end(vma) =3D=3D seg_end) {
> > > +			xe_vma_set_default_attributes(vma);
> > > +			addr =3D seg_end;
> > > +			continue;
> > > +		}
> > > +
> > > +		if (xe_vma_start(vma) =3D=3D seg_start &&
> > > +		=C2=A0=C2=A0=C2=A0 xe_vma_end(vma) =3D=3D seg_end &&
> > > +		=C2=A0=C2=A0=C2=A0 has_default_attr) {
> > > +			addr =3D seg_end;
> > > +			continue;
> > > +		}
> > > +
> > > +		err =3D xe_vm_alloc_cpu_addr_mirror_vma(vm,
> > > seg_start, seg_end - seg_start);
> > > +		if (err) {
> > > +			if (err =3D=3D -ENOENT) {
> > > +				addr =3D seg_end;
> > > +				continue;
> > > +			}
> > > +			return err;
> > > +		}
> > > +
> > > +		addr =3D seg_end;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_madvise_work_func - Worker to process unmap
> > > + * @w: work_struct
> > > + *
> > > + * Processes a single unmap by taking vm->lock and calling the
> > > helper.
> > > + * Each unmap has its own work item, so no interval loss.
> > > + */
> > > +static void xe_madvise_work_func(struct work_struct *w)
> > > +{
> > > +	struct xe_madvise_work_item *item =3D container_of(w,
> > > struct xe_madvise_work_item, work);
> > > +	struct xe_vm *vm =3D item->vm;
> > > +	int err;
> > > +
> > > +	down_write(&vm->lock);
> > > +	err =3D xe_vm_madvise_process_unmap(vm, item->start, item-
> > > >end);
> > > +	if (err)
> > > +		drm_warn(&vm->xe->drm,
> > > +			 "madvise autoreset failed [%#llx-
> > > %#llx]: %d\n",
> > > +			 item->start, item->end, err);
> > > +	/*
> > > +	 * Best-effort: Log failure and continue.
> > > +	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
> > > +	 */
> > > +	up_write(&vm->lock);
> > > +	xe_vm_put(vm);
> > > +	mempool_free(item, item->pool);
> > > +}
> > > +
> > > +/**
> > > + * xe_madvise_notifier_callback - MMU notifier callback for CPU
> > > munmap
> > > + * @mni: mmu_interval_notifier
> > > + * @range: mmu_notifier_range
> > > + * @cur_seq: current sequence number
> > > + *
> > > + * Queues work to reset VMA attributes. Cannot take vm->lock
> > > (circular locking),
> > > + * so uses workqueue. GFP_ATOMIC allocation may fail; drops
> > > event if so.
> > > + *
> > > + * Return: true (never blocks)
> > > + */
> > > +static bool xe_madvise_notifier_callback(struct
> > > mmu_interval_notifier *mni,
> > > +					 const struct
> > > mmu_notifier_range *range,
> > > +					 unsigned long cur_seq)
> > > +{
> > > +	struct xe_madvise_notifier *notifier =3D
> > > +		container_of(mni, struct xe_madvise_notifier,
> > > mmu_notifier);
> > > +	struct xe_vm *vm =3D notifier->vm;
> > > +	struct xe_madvise_work_item *item;
> > > +	struct workqueue_struct *wq;
> > > +	mempool_t *pool;
> > > +	u64 start, end;
> > > +
> > > +	if (range->event !=3D MMU_NOTIFY_UNMAP)
> > > +		return true;
> > > +
> > > +	/*
> > > +	 * Best-effort: skip in non-blockable contexts to avoid
> > > building up work.
> > > +	 * Correctness does not rely on this notifier -
> > > CPU_AUTORESET_ACTIVE flag
> > > +	 * prevents GPU PTE zaps on CPU-only VMAs in the zap
> > > path.
> > > +	 */
> > > +	if (!mmu_notifier_range_blockable(range))
> > > +		return true;
> > > +
> > > +	/* Consume seq (interval-notifier convention) */
> > > +	mmu_interval_set_seq(mni, cur_seq);
> > > +
> > > +	/* Best-effort: core correctness from
> > > CPU_AUTORESET_ACTIVE check in zap path */
> > > +
> > > +	start =3D max_t(u64, range->start, notifier->vma_start);
> > > +	end =3D min_t(u64, range->end, notifier->vma_end);
> > > +
> > > +	if (start >=3D end)
> > > +		return true;
> > > +
> > > +	pool =3D READ_ONCE(vm->svm.madvise_work.pool);
> > > +	wq =3D READ_ONCE(vm->svm.madvise_work.wq);
> > > +	if (!pool || !wq || atomic_read(&vm-
> > > >svm.madvise_work.closing))
> > Can you explain the use of READ_ONCE, xchg, and atomics? At first
> > glance
> > it seems unnecessary or overly complicated. Let=E2=80=99s start with th=
e
> > problem
> > this is trying to solve and see if we can find a simpler approach.
> >=20
> > My initial thought is a VM-wide rwsem, marked as reclaim-safe. The
> > notifiers would take it in read mode to check whether the VM is
> > tearing
> > down, and the fini path would take it in write mode to initiate
> > teardown...
>=20
>=20
> Agreed. This got more complicated than it needs to be. I reworked it
> to=20
> use a VM-wide rw_semaphore for teardown serialization, so the
> atomic_t,=20
> READ_ONCE(), and xchg() go away..
>=20
> >=20
> > > +		return true;
> > > +
> > > +	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier
> > > context */
> > > +	item =3D mempool_alloc(pool, GFP_ATOMIC);
> > Again, probably just use kmalloc. Also s/GFP_ATOMIC/GFP_NOWAIT. We
> > really shouldn=E2=80=99t be using GFP_ATOMIC in Xe per the DRM docs unl=
ess
> > a
> > failed memory allocation would take down the device. We likely
> > abuse
> > GFP_ATOMIC in several places that we should clean up, but in this
> > case
> > it=E2=80=99s pretty clear GFP_NOWAIT is what we want, as failure isn=E2=
=80=99t
> > fatal=E2=80=94just sub-optimal.
>=20
>=20
> Agreed. This should be |GFP_NOWAIT|, not |GFP_ATOMIC|. Allocation=20
> failure here is non-fatal, so |GFP_NOWAIT| is the right fit. I willl=20
> switch to |kmalloc(..., GFP_NOWAIT)| and drop the mempool.
>=20
> >=20
> > > +	if (!item)
> > > +		return true;
> > > +
> > > +	memset(item, 0, sizeof(*item));
> > > +	INIT_WORK(&item->work, xe_madvise_work_func);
> > > +	item->vm =3D xe_vm_get(vm);
> > > +	item->pool =3D pool;
> > > +	item->start =3D start;
> > > +	item->end =3D end;
> > > +
> > > +	if (unlikely(atomic_read(&vm-
> > > >svm.madvise_work.closing))) {
> > Same as above the atomic usage...
>=20
>=20
> Noted, Will remove.
>=20
> >=20
> > > +		xe_vm_put(item->vm);
> > > +		mempool_free(item, pool);
> > > +		return true;
> > > +	}
> > > +
> > > +	queue_work(wq, &item->work);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static const struct mmu_interval_notifier_ops
> > > xe_madvise_notifier_ops =3D {
> > > +	.invalidate =3D xe_madvise_notifier_callback,
> > > +};
> > > +
> > > +/**
> > > + * xe_vm_madvise_init - Initialize madvise notifier
> > > infrastructure
> > > + * @vm: VM
> > > + *
> > > + * Sets up workqueue and mempool for async munmap processing.
> > > + *
> > > + * Return: 0 on success, -ENOMEM on failure
> > > + */
> > > +int xe_vm_madvise_init(struct xe_vm *vm)
> > > +{
> > > +	struct workqueue_struct *wq;
> > > +	mempool_t *pool;
> > > +
> > > +	/* Always initialize list and mutex - fini may be called
> > > on partial init */
> > > +	INIT_LIST_HEAD(&vm->svm.madvise_notifiers.list);
> > > +	mutex_init(&vm->svm.madvise_notifiers.lock);
> > > +
> > > +	wq =3D READ_ONCE(vm->svm.madvise_work.wq);
> > > +	pool =3D READ_ONCE(vm->svm.madvise_work.pool);
> > > +
> > > +	/* Guard against double initialization and detect
> > > partial init */
> > > +	if (wq || pool) {
> > > +		XE_WARN_ON(!wq || !pool);
> > > +		return 0;
> > > +	}
> > > +
> > > +	WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
> > > +	WRITE_ONCE(vm->svm.madvise_work.pool, NULL);
> > > +	atomic_set(&vm->svm.madvise_work.closing, 1);
> > > +
> > > +	/*
> > > +	 * WQ_UNBOUND: best-effort optimization, not critical
> > > path.
> > > +	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops
> > > with GFP_KERNEL).
> > > +	 * Not on reclaim path - merely resets attributes after
> > > munmap.
> > > +	 */
> > > +	vm->svm.madvise_work.wq =3D alloc_workqueue("xe_madvise",
> > > WQ_UNBOUND, 0);
> > > +	if (!vm->svm.madvise_work.wq)
> > > +		return -ENOMEM;
> > > +
> > > +	/* Mempool for GFP_ATOMIC allocs in notifier callback */
> > > +	vm->svm.madvise_work.pool =3D
> > > +		mempool_create_kmalloc_pool(64,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct
> > > xe_madvise_work_item));
> > > +	if (!vm->svm.madvise_work.pool) {
> > > +		destroy_workqueue(vm->svm.madvise_work.wq);
> > > +		WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	atomic_set(&vm->svm.madvise_work.closing, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_madvise_fini - Cleanup all madvise notifiers
> > > + * @vm: VM
> > > + *
> > > + * Tears down notifiers and drains workqueue. Safe if init
> > > partially failed.
> > > + * Order: closing flag =E2=86=92 remove notifiers (SRCU sync) =E2=86=
=92 drain wq
> > > =E2=86=92 destroy.
> > > + */
> > > +void xe_vm_madvise_fini(struct xe_vm *vm)
> > > +{
> > > +	struct xe_madvise_notifier *notifier, *next;
> > > +	struct workqueue_struct *wq;
> > > +	mempool_t *pool;
> > > +	LIST_HEAD(tmp);
> > > +
> > > +	atomic_set(&vm->svm.madvise_work.closing, 1);
> > > +
> > > +	/*
> > > +	 * Detach notifiers under lock, then remove outside lock
> > > (SRCU sync can be slow).
> > > +	 * Splice avoids holding mutex across
> > > mmu_interval_notifier_remove() SRCU sync.
> > > +	 * Removing notifiers first (before drain) prevents new
> > > invalidate callbacks.
> > > +	 */
> > > +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> > > +	list_splice_init(&vm->svm.madvise_notifiers.list, &tmp);
> > > +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> > > +
> > > +	/* Now remove notifiers without holding lock -
> > > mmu_interval_notifier_remove() SRCU-syncs */
> > > +	list_for_each_entry_safe(notifier, next, &tmp, list) {
> > > +		list_del(&notifier->list);
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >mmu_notifier);
> > > +		xe_vm_put(notifier->vm);
> > > +		kfree(notifier);
> > > +	}
> > > +
> > > +	/* Drain and destroy workqueue */
> > > +	wq =3D xchg(&vm->svm.madvise_work.wq, NULL);
> > > +	if (wq) {
> > > +		drain_workqueue(wq);
> > Work items in wq call xe_madvise_work_func, which takes vm->lock in
> > write mode. If we try to drain here after the work item executing
> > xe_madvise_work_func has started or is queued, I think we could
> > deadlock. Lockdep should complain about this if you run a test that
> > triggers xe_madvise_work_func at least once =E2=80=94 or at least it
> > should. If
> > it doesn=E2=80=99t, then workqueues likely have an issue in their lockd=
ep
> > implementation as 'drain_workqueue' should touch its lockdep map
> > which
> > has tainted vm->lock (i.e., is outside of it).
> >=20
> > So perhaps call this function without vm->lock and take as need in
> > the
> > this function, then drop it drain the work queue, etc...
>=20
>=20
> Good catch. Draining the workqueue while holding |vm->lock| can
> deadlock=20
> against a worker that takes |vm->lock|. I fixed that by dropping=20
> > vm->lock| before |xe_vm_madvise_fini()|. In the reworked teardown
> > path,=20
> > drain_workqueue()| runs with neither |vm->lock| nor the teardown=20
> semaphore held.
>=20
>=20
> >=20
> > > +		destroy_workqueue(wq);
> > > +	}
> > > +
> > > +	pool =3D xchg(&vm->svm.madvise_work.pool, NULL);
> > > +	if (pool)
> > > +		mempool_destroy(pool);
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_madvise_register_notifier_range - Register MMU notifier
> > > for address range
> > > + * @vm: VM
> > > + * @start: Start address (page-aligned)
> > > + * @end: End address (page-aligned)
> > > + *
> > > + * Registers interval notifier for munmap tracking. Uses
> > > addresses (not VMA pointers)
> > > + * to avoid UAF after dropping vm->lock. Deduplicates by range.
> > > + *
> > > + * Return: 0 on success, negative error code on failure
> > > + */
> > > +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64
> > > start, u64 end)
> > > +{
> > > +	struct xe_madvise_notifier *notifier, *existing;
> > > +	int err;
> > > +
> > I see this isn=E2=80=99t called under the vm->lock write lock. Is there=
 a
> > reason
> > not to? I think taking it under the write lock would help with the
> > teardown sequence, since you wouldn=E2=80=99t be able to get here if
> > xe_vm_is_closed_or_banned were stable=E2=80=94and we wouldn=E2=80=99t e=
nter this
> > function if that helper returned true.
>=20
>=20
> I can make the closed/banned check stable at the call site under=20
> > vm->lock|, but I don=E2=80=99t think I can hold it across=20
> > mmu_interval_notifier_insert()| itself since that may take
> > |mmap_lock|=20
> internally. I=E2=80=99ll restructure this so the state check happens unde=
r=20
> > vm->lock|, while the actual insert remains outside that lock.
>=20
> >=20
> > > +	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end,
> > > PAGE_SIZE))
> > > +		return -EINVAL;
> > > +
> > > +	if (WARN_ON_ONCE(end <=3D start))
> > > +		return -EINVAL;
> > > +
> > > +	if (atomic_read(&vm->svm.madvise_work.closing))
> > > +		return -ENOENT;
> > > +
> > > +	if (!READ_ONCE(vm->svm.madvise_work.wq) ||
> > > +	=C2=A0=C2=A0=C2=A0 !READ_ONCE(vm->svm.madvise_work.pool))
> > > +		return -ENOMEM;
> > > +
> > > +	/* Check mm early to avoid allocation if it's missing */
> > > +	if (!vm->svm.gpusvm.mm)
> > > +		return -EINVAL;
> > > +
> > > +	/* Dedupe: check if notifier exists for this range */
> > > +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> > If we had the vm->lock in write mode we could likely just drop
> > svm.madvise_notifiers.lock for now, but once we move to fine
> > grained
> > locking in page faults [1] we'd in fact need a dedicated lock. So
> > let's
> > keep this.
> >=20
> > [1]
> > https://patchwork.freedesktop.org/patch/707238/?series=3D162167&rev=3D2
>=20
>=20
> Agreed. We should keep a dedicated lock here.
>=20
> I donot think |vm->lock| can cover |mmu_interval_notifier_insert()|=20
> itself, since that path may take |mmap_lock| internally and would
> risk=20
> inverting the existing |mmap_lock -> vm->lock| ordering.
>=20
> So I will keep |svm.madvise_notifiers.lock| in place. That also lines
> up=20
> better with the planned fine-grained page-fault locking work.
>=20
> >=20
> > > +	list_for_each_entry(existing, &vm-
> > > >svm.madvise_notifiers.list, list) {
> > > +		if (existing->vma_start =3D=3D start && existing-
> > > >vma_end =3D=3D end) {
> > This is O(N) which typically isn't ideal. Better structure here?
> > mtree?
> > Does an mtree have its own locking so svm.madvise_notifiers.lock
> > could
> > just be dropped? I'd look into this.
>=20
>=20
> Agreed. I switched this over to a maple tree, so the exact-range
> lookup=20
> is no longer O(N). That also lets me drop the list walk in the
> duplicate=20
> check.
>=20
> >=20
> > > +			mutex_unlock(&vm-
> > > >svm.madvise_notifiers.lock);
> > > +			return 0;
> > > +		}
> > > +	}
> > > +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> > > +
> > > +	notifier =3D kzalloc(sizeof(*notifier), GFP_KERNEL);
> > > +	if (!notifier)
> > > +		return -ENOMEM;
> > > +
> > > +	notifier->vm =3D xe_vm_get(vm);
> > > +	notifier->vma_start =3D start;
> > > +	notifier->vma_end =3D end;
> > > +	INIT_LIST_HEAD(&notifier->list);
> > > +
> > > +	err =3D mmu_interval_notifier_insert(&notifier-
> > > >mmu_notifier,
> > > +					=C2=A0=C2=A0 vm->svm.gpusvm.mm,
> > > +					=C2=A0=C2=A0 start,
> > > +					=C2=A0=C2=A0 end - start,
> > > +					=C2=A0=C2=A0
> > > &xe_madvise_notifier_ops);
> > > +	if (err) {
> > > +		xe_vm_put(notifier->vm);
> > > +		kfree(notifier);
> > > +		return err;
> > > +	}
> > > +
> > > +	/* Re-check closing to avoid teardown race */
> > > +	if (unlikely(atomic_read(&vm-
> > > >svm.madvise_work.closing))) {
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >mmu_notifier);
> > > +		xe_vm_put(notifier->vm);
> > > +		kfree(notifier);
> > > +		return -ENOENT;
> > > +	}
> > > +
> > > +	/* Add to list - check again for concurrent registration
> > > race */
> > > +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> > If we had the vm->lock in write mode, we couldn't get concurrent
> > registrations.
> >=20
> > I likely have more comments, but I have enough concerns with the
> > locking
> > and structure in this patch that I=E2=80=99m going to pause reviewing t=
he
> > series
> > until most of my comments are addressed. It=E2=80=99s hard to focus on
> > anything
> > else until we get these issues worked out.
>=20
>=20
> I think the main issue is exactly the locking story around notifier=20
> insert/remove. We cannot hold |vm->lock| across=20
> > mmu_interval_notifier_insert()| because that may take |mmap_lock|=20
> internally and invert the existing ordering.
>=20
> I have reworked this to simplify the teardown/registration side: drop
> the atomic/READ_ONCE/xchg handling, use a single teardown |rwsem|,
> and=20
> replace the list-based dedupe with a maple tree.
> I will send a cleaned-up version with the locking documented more=20
> clearly. Sorry for the churn here.
>=20
>=20
> Thanks,
> Arvind
>=20
> >=20
> > Matt
> >=20
> > > +	list_for_each_entry(existing, &vm-
> > > >svm.madvise_notifiers.list, list) {
> > > +		if (existing->vma_start =3D=3D start && existing-
> > > >vma_end =3D=3D end) {
> > > +			mutex_unlock(&vm-
> > > >svm.madvise_notifiers.lock);
> > > +			mmu_interval_notifier_remove(&notifier-
> > > >mmu_notifier);
> > > +			xe_vm_put(notifier->vm);
> > > +			kfree(notifier);
> > > +			return 0;
> > > +		}
> > > +	}
> > > +	list_add(&notifier->list, &vm-
> > > >svm.madvise_notifiers.list);
> > > +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > index b0e1fc445f23..ba9cd7912113 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > @@ -6,10 +6,18 @@
> > > =C2=A0 #ifndef _XE_VM_MADVISE_H_
> > > =C2=A0 #define _XE_VM_MADVISE_H_
> > > =C2=A0=20
> > > +#include <linux/types.h>
> > > +
> > > =C2=A0 struct drm_device;
> > > =C2=A0 struct drm_file;
> > > +struct xe_vm;
> > > +struct xe_vma;
> > > =C2=A0=20
> > > =C2=A0 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > > =C2=A0=C2=A0			struct drm_file *file);
> > > =C2=A0=20
> > > +int xe_vm_madvise_init(struct xe_vm *vm);
> > > +void xe_vm_madvise_fini(struct xe_vm *vm);
> > > +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64
> > > start, u64 end);
> > > +
> > > =C2=A0 #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 29ff63503d4c..eb978995000c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -12,6 +12,7 @@
> > > =C2=A0=20
> > > =C2=A0 #include <linux/dma-resv.h>
> > > =C2=A0 #include <linux/kref.h>
> > > +#include <linux/mempool.h>
> > > =C2=A0 #include <linux/mmu_notifier.h>
> > > =C2=A0 #include <linux/scatterlist.h>
> > > =C2=A0=20
> > > @@ -29,6 +30,26 @@ struct xe_user_fence;
> > > =C2=A0 struct xe_vm;
> > > =C2=A0 struct xe_vm_pgtable_update_op;
> > > =C2=A0=20
> > > +/**
> > > + * struct xe_madvise_notifier - CPU madvise notifier for memory
> > > attribute reset
> > > + *
> > > + * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
> > > + * When userspace unmaps CPU memory, this notifier processes
> > > attribute reset
> > > + * via work queue to avoid circular locking (can't take vm->lock
> > > in callback).
> > > + */
> > > +struct xe_madvise_notifier {
> > > +	/** @mmu_notifier: MMU interval notifier */
> > > +	struct mmu_interval_notifier mmu_notifier;
> > > +	/** @vm: VM this notifier belongs to (holds reference
> > > via xe_vm_get) */
> > > +	struct xe_vm *vm;
> > > +	/** @vma_start: Start address of VMA being tracked */
> > > +	u64 vma_start;
> > > +	/** @vma_end: End address of VMA being tracked */
> > > +	u64 vma_end;
> > > +	/** @list: Link in vm->svm.madvise_notifiers.list */
> > > +	struct list_head list;
> > > +};
> > > +
> > > =C2=A0 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > =C2=A0 #define TEST_VM_OPS_ERROR
> > > =C2=A0 #define FORCE_OP_ERROR	BIT(31)
> > > @@ -212,6 +233,26 @@ struct xe_vm {
> > > =C2=A0=C2=A0		struct xe_pagemap
> > > *pagemaps[XE_MAX_TILES_PER_DEVICE];
> > > =C2=A0=C2=A0		/** @svm.peer: Used for pagemap connectivity
> > > computations. */
> > > =C2=A0=C2=A0		struct drm_pagemap_peer peer;
> > > +
> > > +		/**
> > > +		 * @svm.madvise_notifiers: Active CPU madvise
> > > notifiers
> > > +		 */
> > > +		struct {
> > > +			/** @svm.madvise_notifiers.list: List of
> > > active notifiers */
> > > +			struct list_head list;
> > > +			/** @svm.madvise_notifiers.lock:
> > > Protects notifiers list */
> > > +			struct mutex lock;
> > > +		} madvise_notifiers;
> > > +
> > > +		/** @svm.madvise_work: Workqueue for async
> > > munmap processing */
> > > +		struct {
> > > +			/** @svm.madvise_work.wq: Workqueue */
> > > +			struct workqueue_struct *wq;
> > > +			/** @svm.madvise_work.pool: Mempool for
> > > work items */
> > > +			mempool_t *pool;
> > > +			/** @svm.madvise_work.closing: Teardown
> > > flag */
> > > +			atomic_t closing;
> > > +		} madvise_work;
> > > =C2=A0=C2=A0	} svm;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	struct xe_device *xe;
> > > --=20
> > > 2.43.0
