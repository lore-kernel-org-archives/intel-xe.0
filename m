Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2812EC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 09:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F610E2FE;
	Mon, 16 Jun 2025 09:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR88FttA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2764F10E2FE
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750065873; x=1781601873;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WX2M1BBPFx0tHr4ODkPYzpdMSMkKK9yOK/AxgUICSZo=;
 b=iR88FttAJeuc2xef4qoJYFfSdMxSHaDBb0K0bfbjweg1/oZy0NGzqnGF
 CRtnz/Prs0F9koXOcQEDETY+j2U3h8eNTnM2I7xgAPRfPxRxTUoH13AY0
 EJOzesvvQm3TSj+DJ2BbtQ2DzLLH4LF7OT9uh15/8SyrwvElWxxG6wMGZ
 yZ3IJ9UcWAGJHeJn4UUVDiLsavtuthoCeFR4zC5cMLtReZOydbclr8EsV
 O2EaE+KpqP9P51lA4TkhBQYod5Pq6Vo3ag4voP1AhDM8524TB/pZayt2N
 uz2ugqY5k3yt5jMgxgYpkfh10eo+I4RGMVaGqiuCqJC+EiaqgozRx8dE2 A==;
X-CSE-ConnectionGUID: r/rmFyFCSly+hJMjGwesnQ==
X-CSE-MsgGUID: 7sjnqfIeSqKOrtCKyck31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77598451"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="77598451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:24:33 -0700
X-CSE-ConnectionGUID: 0O1m7r4pTpa42x8mukjohw==
X-CSE-MsgGUID: S9BS/O14R82IWO8AtaEniw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="171637275"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.63])
 ([10.245.244.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:24:32 -0700
Message-ID: <9b68aa6f48644a383cb2e9ed5ca3a35a66546ac8.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Thread prefetch of SVM ranges
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 michal.mrozek@intel.com
Date: Mon, 16 Jun 2025 11:24:29 +0200
In-Reply-To: <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
 <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
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

On Mon, 2025-06-16 at 01:58 -0700, Matthew Brost wrote:
> On Mon, Jun 16, 2025 at 10:28:16AM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Sun, 2025-06-15 at 23:47 -0700, Matthew Brost wrote:
> > > The migrate_vma_* functions are very CPU-intensive; as a result,
> > > prefetching SVM ranges is limited by CPU performance rather than
> > > paging
> > > copy engine bandwidth. To accelerate SVM range prefetching, the
> > > step
> > > that calls migrate_vma_* is now threaded. This uses a dedicated
> > > workqueue, as the page fault workqueue cannot be shared without
> > > risking
> > > deadlocks=E2=80=94due to the prefetch IOCTL holding the VM lock in wr=
ite
> > > mode
> > > while work items in the page fault workqueue also require the VM
> > > lock.
> > >=20
> > > The prefetch workqueue is currently allocated in GT, similar to
> > > the
> > > page
> > > fault workqueue. While this is likely not the ideal location for
> > > either,
> > > refactoring will be deferred to a later patch.
> > >=20
> > > Running xe_exec_system_allocator --r prefetch-benchmark, which
> > > tests
> > > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s
> > > with
> > > this patch on drm-tip. Enabling high SLPC further increases
> > > throughput
> > > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16
> > > GB/s.
> > > Both
> > > of these optimizations are upcoming.
> > >=20
> > > v2:
> > > =C2=A0- Use dedicated prefetch workqueue
> > > =C2=A0- Pick dedicated prefetch thread count based on profiling
> > > =C2=A0- Skip threaded prefetch for only 1 range or if prefetching to
> > > SRAM
> > > =C2=A0- Fully tested
> > >=20
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Hi,
> > Is this really the right place to do optimizations like this?
> >=20
>=20
> Yes, for now.

I think it's pretty dangerous to rush in optimizations that add
technical depth. That was exactly what made i915 to what it was.=20

>=20
> > The migration takes place in xe_svm_alloc_vram() and is being moved
> > to
> > drm_pagemap_populate_mm(). If those functions are considered to be
> > slow
> > then they should be optimized, rather than calling them multiple
> > times
> > in parallel from an outer layer?
> >=20
>=20
> Shared code with an already-parallel fault handler... Prefetch is
> just
> adding parallelism too.

What I meant was thinking from a higher perspective. If we call
drm_pagemap_populate_mm() (that in theory is designed to be available
from another driver) we'd expect that function to perform in an optimal
way. If anywhare this parallelization should be placed in what is now
xe_svm_alloc_vram().

>=20
> > Before doing something like this I think we need to consider
> >=20
> > 1) Why are the migrate functions so cpu consuming? Do we have a
> > performance profile for it?
>=20
> Yes, I have profiled this. On BMG, a 2MB migrate takes approximately
> 300=C2=B5s of CPU overhead in the migrate_vma_* functions, while a copy
> job
> takes around 130=C2=B5s. The copy must complete between setup and
> finalize,
> which serializes this flow.

>=20
> Thus, as of now, the only way to saturate the copy engine is to use
> threads so that CPU cycles can overlap.

So we're not actually not using 100% CPU-time all the time but rather
spending time waiting for the GPU copy to finish? If so, the effect
comes more from being able to start the finalize() step early. Couldn't
that be made within a single thread using an alternative
synchronization strategy?

>=20
> Have you caught up on Nvidia's series [1] and what Francois is
> working
> on? I'd guess we'll go from ~300=C2=B5s to ~7=C2=B5s once that lands.

Yes, been discussing that a lot with Francois, but that's orthogonal to
this, right?

>=20
> I don't know why the migrate_vma_* functions take so long=E2=80=94the cor=
e MM
> code is tough to read. I suppose I could hack it to find out.
>=20
> [1]
> https://lore.kernel.org/linux-mm/20250306044239.3874247-1-balbirs@nvidia.=
com/
> =C2=A0
>=20
> > 2) Do we actually *want* to use 5 CPU cores for this?
>=20
> Yes, I profiled this with a test issuing 64MB prefetches=E2=80=945 thread=
s
> was
> ideal. I have a comment in the code about this. Once [1] lands, we=E2=80=
=99ll
> likely only need 2 threads on BMG. That would probably get us to a
> bus
> 8=C3=97 faster than BMG; for 16=C3=97, we might need more threads. But I =
think
> we=E2=80=99ll always want at least 2, as there will always be some CPU
> overhead
> that limits copy bandwidth due to serialization.

What I meant was IIRC NEO has previously been picky about starting
threads. Perhaps Michal can enlighten us here?

>=20
> > 3) Isn't a single CPU write-combined non-temporal CPU memcopy
> > enough to
> > saturate the system->VRAM bandwith?
> >=20
>=20
> I'm not entirely following (see above), but almost certainly not.

What I meant was instead of migrating using GPU with 5 threads to
mitigate GPU latencies, wouldn't a CPU optimized memcopy from system to
VRAM be able to saturate the PCIe bus at 16GiB/s without any latencies
to be considered at all.

/Thomas


>=20
> Maat
>=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 31 ++++++-
> > > =C2=A0drivers/gpu/drm/xe/xe_gt_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 128
> > > +++++++++++++++++++++----
> > > --
> > > =C2=A03 files changed, 135 insertions(+), 26 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index e2d975b2fddb..941cca3371f2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -400,6 +400,8 @@ static void pagefault_fini(void *arg)
> > > =C2=A0
> > > =C2=A0	destroy_workqueue(gt->usm.acc_wq);
> > > =C2=A0	destroy_workqueue(gt->usm.pf_wq);
> > > +	if (gt->usm.prefetch_wq)
> > > +		destroy_workqueue(gt->usm.prefetch_wq);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > > *pf_queue)
> > > @@ -438,10 +440,24 @@ static int xe_alloc_pf_queue(struct xe_gt
> > > *gt,
> > > struct pf_queue *pf_queue)
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +static int prefetch_thread_count(struct xe_device *xe)
> > > +{
> > > +	if (!IS_DGFX(xe))
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * Based on profiling large aligned 2M prefetches, this
> > > is
> > > the optimial
> > > +	 * number of threads on BMG (only platform currently
> > > supported). This
> > > +	 * should be tuned for each supported platform and can
> > > change on per
> > > +	 * platform basis as optimizations land (e.g., large
> > > device
> > > pages).
> > > +	 */
> > > +	return 5;
> > > +}
> > > +
> > > =C2=A0int xe_gt_pagefault_init(struct xe_gt *gt)
> > > =C2=A0{
> > > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > > -	int i, ret =3D 0;
> > > +	int i, count, ret =3D 0;
> > > =C2=A0
> > > =C2=A0	if (!xe->info.has_usm)
> > > =C2=A0		return 0;
> > > @@ -462,10 +478,23 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> > > =C2=A0	if (!gt->usm.pf_wq)
> > > =C2=A0		return -ENOMEM;
> > > =C2=A0
> > > +	count =3D prefetch_thread_count(xe);
> > > +	if (count) {
> > > +		gt->usm.prefetch_wq =3D
> > > alloc_workqueue("xe_gt_prefetch_work_queue",
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_UNBOUND
> > > |
> > > WQ_HIGHPRI,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 count);
> > > +		if (!gt->usm.prefetch_wq) {
> > > +			destroy_workqueue(gt->usm.pf_wq);
> > > +			return -ENOMEM;
> > > +		}
> > > +	}
> > > +
> > > =C2=A0	gt->usm.acc_wq =3D
> > > alloc_workqueue("xe_gt_access_counter_work_queue",
> > > =C2=A0					 WQ_UNBOUND |
> > > WQ_HIGHPRI,
> > > =C2=A0					 NUM_ACC_QUEUE);
> > > =C2=A0	if (!gt->usm.acc_wq) {
> > > +		if (gt->usm.prefetch_wq)
> > > +			destroy_workqueue(gt->usm.prefetch_wq);
> > > =C2=A0		destroy_workqueue(gt->usm.pf_wq);
> > > =C2=A0		return -ENOMEM;
> > > =C2=A0	}
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 7def0959da35..d9ba4921b8ce 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -239,6 +239,8 @@ struct xe_gt {
> > > =C2=A0		u16 reserved_bcs_instance;
> > > =C2=A0		/** @usm.pf_wq: page fault work queue, unbound,
> > > high
> > > priority */
> > > =C2=A0		struct workqueue_struct *pf_wq;
> > > +		/** @usm.prefetch_wq: prefetch work queue,
> > > unbound,
> > > high priority */
> > > +		struct workqueue_struct *prefetch_wq;
> > > =C2=A0		/** @usm.acc_wq: access counter work queue,
> > > unbound,
> > > high priority */
> > > =C2=A0		struct workqueue_struct *acc_wq;
> > > =C2=A0		/**
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 6ef8c4dab647..1ae8e03aead6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2885,52 +2885,130 @@ static int check_ufence(struct xe_vma
> > > *vma)
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op
> > > *op)
> > > +struct prefetch_thread {
> > > +	struct work_struct work;
> > > +	struct drm_gpusvm_ctx *ctx;
> > > +	struct xe_vma *vma;
> > > +	struct xe_svm_range *svm_range;
> > > +	struct xe_tile *tile;
> > > +	u32 region;
> > > +	int err;
> > > +};
> > > +
> > > +static void prefetch_work_func(struct work_struct *w)
> > > =C2=A0{
> > > -	bool devmem_possible =3D IS_DGFX(vm->xe) &&
> > > IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > > -	struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> > > +	struct prefetch_thread *thread =3D
> > > +		container_of(w, struct prefetch_thread, work);
> > > +	struct xe_vma *vma =3D thread->vma;
> > > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > +	struct xe_svm_range *svm_range =3D thread->svm_range;
> > > +	u32 region =3D thread->region;
> > > +	struct xe_tile *tile =3D thread->tile;
> > > =C2=A0	int err =3D 0;
> > > =C2=A0
> > > -	struct xe_svm_range *svm_range;
> > > +	if (!region) {
> > > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > > +	} else if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > > vma, region)) {
> > > +		err =3D xe_svm_alloc_vram(vm, tile, svm_range,
> > > thread-
> > > > ctx);
> > > +		if (err) {
> > > +			drm_dbg(&vm->xe->drm,
> > > +				"VRAM allocation failed, retry
> > > from
> > > userspace, asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > +			thread->err =3D -ENODATA;
> > > +			return;
> > > +		}
> > > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > > MIGRATED TO VRAM");
> > > +	}
> > > +
> > > +	err =3D xe_svm_range_get_pages(vm, svm_range, thread-
> > > >ctx);
> > > +	if (err) {
> > > +		drm_dbg(&vm->xe->drm, "Get pages failed,
> > > asid=3D%u,
> > > gpusvm=3D%p, errno=3D%pe\n",
> > > +			vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > +		if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err
> > > =3D=3D -
> > > EPERM)
> > > +			err =3D -ENODATA;
> > > +		thread->err =3D err;
> > > +		return;
> > > +	}
> > > +
> > > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET
> > > PAGES
> > > DONE");
> > > +}
> > > +
> > > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op
> > > *op)
> > > +{
> > > +	struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> > > +	u32 j, region =3D op->prefetch_range.region;
> > > =C2=A0	struct drm_gpusvm_ctx ctx =3D {};
> > > -	struct xe_tile *tile;
> > > +	struct prefetch_thread stack_thread;
> > > +	struct xe_svm_range *svm_range;
> > > +	struct xarray prefetches;
> > > +	bool sram =3D region_to_mem_type[region] =3D=3D XE_PL_TT;
> > > +	struct xe_tile *tile =3D sram ?
> > > xe_device_get_root_tile(vm-
> > > > xe) :
> > > +		&vm->xe->tiles[region_to_mem_type[region] -
> > > XE_PL_VRAM0];
> > > =C2=A0	unsigned long i;
> > > -	u32 region;
> > > +	bool devmem_possible =3D IS_DGFX(vm->xe) &&
> > > +		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > > +	bool skip_threads =3D op->prefetch_range.ranges_count =3D=3D 1
> > > ||
> > > sram;
> > > +	struct prefetch_thread *thread =3D skip_threads ?
> > > &stack_thread : NULL;
> > > +	int err =3D 0;
> > > =C2=A0
> > > =C2=A0	if (!xe_vma_is_cpu_addr_mirror(vma))
> > > =C2=A0		return 0;
> > > =C2=A0
> > > -	region =3D op->prefetch_range.region;
> > > +	if (!skip_threads)
> > > +		xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
> > > =C2=A0
> > > =C2=A0	ctx.read_only =3D xe_vma_read_only(vma);
> > > =C2=A0	ctx.devmem_possible =3D devmem_possible;
> > > =C2=A0	ctx.check_pages_threshold =3D devmem_possible ? SZ_64K :
> > > 0;
> > > =C2=A0
> > > -	/* TODO: Threading the migration */
> > > =C2=A0	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > -		if (!region)
> > > -			xe_svm_range_migrate_to_smem(vm,
> > > svm_range);
> > > +		if (!skip_threads) {
> > > +			thread =3D kmalloc(sizeof(*thread),
> > > GFP_KERNEL);
> > > +			if (!thread)
> > > +				goto wait_threads;
> > > =C2=A0
> > > -		if
> > > (xe_svm_range_needs_migrate_to_vram(svm_range,
> > > vma, region)) {
> > > -			tile =3D &vm->xe-
> > > > tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > > -			err =3D xe_svm_alloc_vram(vm, tile,
> > > svm_range,
> > > &ctx);
> > > +			err =3D xa_alloc(&prefetches, &j, thread,
> > > xa_limit_32b,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> > > =C2=A0			if (err) {
> > > -				drm_dbg(&vm->xe->drm, "VRAM
> > > allocation failed, retry from userspace, asid=3D%u, gpusvm=3D%p,
> > > errno=3D%pe\n",
> > > -					vm->usm.asid, &vm-
> > > > svm.gpusvm, ERR_PTR(err));
> > > -				return -ENODATA;
> > > +				kfree(thread);
> > > +				goto wait_threads;
> > > =C2=A0			}
> > > -			xe_svm_range_debug(svm_range, "PREFETCH
> > > -
> > > RANGE MIGRATED TO VRAM");
> > > =C2=A0		}
> > > =C2=A0
> > > -		err =3D xe_svm_range_get_pages(vm, svm_range,
> > > &ctx);
> > > -		if (err) {
> > > -			drm_dbg(&vm->xe->drm, "Get pages failed,
> > > asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> > > -				vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > -			if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT
> > > ||
> > > err =3D=3D -EPERM)
> > > -				err =3D -ENODATA;
> > > -			return err;
> > > +		INIT_WORK(&thread->work, prefetch_work_func);
> > > +		thread->ctx =3D &ctx;
> > > +		thread->vma =3D vma;
> > > +		thread->svm_range =3D svm_range;
> > > +		thread->tile =3D tile;
> > > +		thread->region =3D region;
> > > +		thread->err =3D 0;
> > > +
> > > +		if (skip_threads) {
> > > +			prefetch_work_func(&thread->work);
> > > +			if (thread->err)
> > > +				return thread->err;
> > > +		} else {
> > > +			/*
> > > +			 * Prefetch uses a dedicated workqueue,
> > > as
> > > the page
> > > +			 * fault workqueue cannot be shared
> > > without
> > > risking
> > > +			 * deadlocks=E2=80=94due to holding the VM lock
> > > in
> > > write mode
> > > +			 * here while work items in the page
> > > fault
> > > workqueue
> > > +			 * also require the VM lock.
> > > +			 */
> > > +			queue_work(tile->primary_gt-
> > > > usm.prefetch_wq,
> > > +				=C2=A0=C2=A0 &thread->work);
> > > +		}
> > > +	}
> > > +
> > > +wait_threads:
> > > +	if (!skip_threads) {
> > > +		xa_for_each(&prefetches, i, thread) {
> > > +			flush_work(&thread->work);
> > > +			if (thread->err && (!err || err =3D=3D -
> > > ENODATA))
> > > +				err =3D thread->err;
> > > +			kfree(thread);
> > > =C2=A0		}
> > > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > > GET
> > > PAGES DONE");
> > > +		xa_destroy(&prefetches);
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	return err;
> >=20

