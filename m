Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED2C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 21:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E177112162;
	Thu, 21 Mar 2024 21:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej22Ol0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C216112162
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711056893; x=1742592893;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rCxYICAZJBnYXRRYIqpLK7cLWdDFh2/VD9bdERa6FWg=;
 b=Ej22Ol0MzuV6GyHuKskwTGy1V8BwQaveUeOmwyexXcNzAlv9ukNE0+HK
 1T8+WxzmriDfNRurTV1XCFxe/vCXOIXPlvy/TkA/E+FTK7IbQ/D5z2F0m
 MbOUKKq7wWLLhCHzpiHUTS7r6MCgaXAbIhPkxHUc7e8IJcwQ3dkA+twbz
 zqw5Ztf9zL5d24W443Cxw+gtn4CDXbaFwYlB+2DsM0uaKb7Tb/n34HG2p
 X4sRZNm8XIMYPRDwqaZuCZ/MaZdMu5XmQDWT/eZkM/Wu8MIzfWiAFxIpa
 JOY9CknnwKVS9D7gbUksQmFXIahPzmcEdbbh6kXFuIX8yMCOuWVsZ/sX1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16633430"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="16633430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="19374545"
Received: from sinampud-mobl.amr.corp.intel.com (HELO [10.249.254.176])
 ([10.249.254.176])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:34:52 -0700
Message-ID: <16ee51cbc2df381c1ff9bac339d704c0f7ac9c19.camel@linux.intel.com>
Subject: Re: [PATCH 3/7] drm/xe: Reserve fences where needed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Date: Thu, 21 Mar 2024 22:34:49 +0100
In-Reply-To: <ZfyUUOYtnOwz56sB@DUT025-TGLU.fm.intel.com>
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
 <20240321113720.120865-7-thomas.hellstrom@linux.intel.com>
 <ZfyUUOYtnOwz56sB@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Thu, 2024-03-21 at 20:10 +0000, Matthew Brost wrote:
> On Thu, Mar 21, 2024 at 12:37:15PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Reserve fence slots where actually needed rather than trying to
> > predict how many fence slots will be needed over a complete
> > wound-wait transaction.
> >=20
>=20
> You include this patch twice in the series.

Yes, the whole series got mixed up due to me forgetting to remove the
old series before sending patches out.

Please don't bother continue reviewing until v2 is out!

Some answers below.

>=20
> > Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 27 +---------------
> > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 48 +++++++++++++-----------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> > =C2=A05 files changed, 40 insertions(+), 55 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 7692ebfe7d47..511d23426a5e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -96,41 +96,16 @@
> > =C2=A0
> > =C2=A0static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
> > =C2=A0{
> > -	struct xe_vm *vm =3D container_of(vm_exec->vm, struct xe_vm,
> > gpuvm);
> > =C2=A0	struct drm_gem_object *obj;
> > =C2=A0	unsigned long index;
> > -	int num_fences;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > -	/*
> > -	 * 1 fence slot for the final submit, and 1 more for every
> > per-tile for
> > -	 * GPU bind and 1 extra for CPU bind. Note that there are
> > potentially
> > -	 * many vma per object/dma-resv, however the fence slot
> > will just be
> > -	 * re-used, since they are largely the same timeline and
> > the seqno
> > -	 * should be in order. In the case of CPU bind there is
> > dummy fence used
> > -	 * for all CPU binds, so no need to have a per-tile slot
> > for that.
> > -	 */
> > -	num_fences =3D 1 + 1 + vm->xe->info.tile_count;
> > -
> > -	/*
> > -	 * We don't know upfront exactly how many fence slots we
> > will need at
> > -	 * the start of the exec, since the TTM bo_validate above
> > can consume
> > -	 * numerous fence slots. Also due to how the
> > dma_resv_reserve_fences()
> > -	 * works it only ensures that at least that many fence
> > slots are
> > -	 * available i.e if there are already 10 slots available
> > and we reserve
> > -	 * two more, it can just noop without reserving anything.=C2=A0
> > With this it
> > -	 * is quite possible that TTM steals some of the fence
> > slots and then
> > -	 * when it comes time to do the vma binding and final exec
> > stage we are
> > -	 * lacking enough fence slots, leading to some nasty
> > BUG_ON() when
> > -	 * adding the fences. Hence just add our own fences here,
> > after the
> > -	 * validate stage.
> > -	 */
> > =C2=A0	drm_exec_for_each_locked_object(&vm_exec->exec, index,
> > obj) {
> > -		ret =3D dma_resv_reserve_fences(obj->resv,
> > num_fences);
> > +		ret =3D dma_resv_reserve_fences(obj->resv, 1);
> > =C2=A0		if (ret)
> > =C2=A0			return ret;
> > =C2=A0	}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 241c294270d9..fa9e9853c53b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -100,10 +100,9 @@ static int xe_pf_begin(struct drm_exec *exec,
> > struct xe_vma *vma,
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > -	unsigned int num_shared =3D 2; /* slots for bind + move */
> > =C2=A0	int err;
> > =C2=A0
> > -	err =3D xe_vm_prepare_vma(exec, vma, num_shared);
> > +	err =3D xe_vm_lock_vma(exec, vma);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index 109c26e5689e..7add08b2954e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1235,6 +1235,13 @@ __xe_pt_bind_vma(struct xe_tile *tile,
> > struct xe_vma *vma, struct xe_exec_queue
> > =C2=A0	err =3D xe_pt_prepare_bind(tile, vma, entries,
> > &num_entries);
> > =C2=A0	if (err)
> > =C2=A0		goto err;
> > +
> > +	err =3D dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> > +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +		err =3D dma_resv_reserve_fences(xe_vma_bo(vma)-
> > >ttm.base.resv, 1);
> > +	if (err)
> > +		goto err;
> > +
>=20
> Again not a huge fan of updating __xe_pt_bind_vma /
> __xe_pt_unbind_vma
> here because these are going away [1] but again conceptually this is
> more or less correct the place.
>=20
> [1] https://patchwork.freedesktop.org/series/125608/
>=20
> > =C2=A0	xe_tile_assert(tile, num_entries <=3D ARRAY_SIZE(entries));
> > =C2=A0
> > =C2=A0	xe_vm_dbg_print_entries(tile_to_xe(tile), entries,
> > num_entries);
> > @@ -1576,6 +1583,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile,
> > struct xe_vma *vma, struct xe_exec_queu
> > =C2=A0	struct dma_fence *fence =3D NULL;
> > =C2=A0	struct invalidation_fence *ifence;
> > =C2=A0	struct xe_range_fence *rfence;
> > +	int err;
> > =C2=A0
> > =C2=A0	LLIST_HEAD(deferred);
> > =C2=A0
> > @@ -1593,6 +1601,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile,
> > struct xe_vma *vma, struct xe_exec_queu
> > =C2=A0	xe_pt_calc_rfence_interval(vma, &unbind_pt_update,
> > entries,
> > =C2=A0				=C2=A0=C2=A0 num_entries);
> > =C2=A0
> > +	err =3D dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> > +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +		err =3D dma_resv_reserve_fences(xe_vma_bo(vma)-
> > >ttm.base.resv, 1);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > =C2=A0	ifence =3D kzalloc(sizeof(*ifence), GFP_KERNEL);
> > =C2=A0	if (!ifence)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 80d43d75b1da..cff8db605743 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -485,14 +485,11 @@ static int xe_gpuvm_validate(struct
> > drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> > =C2=A0static int xe_preempt_work_begin(struct drm_exec *exec, struct
> > xe_vm *vm,
> > =C2=A0				 bool *done)
> > =C2=A0{
> > +	struct drm_gem_object *obj;
> > +	unsigned long index;
> > =C2=A0	int err;
> > =C2=A0
> > -	/*
> > -	 * 1 fence for each preempt fence plus a fence for each
> > tile from a
> > -	 * possible rebind
> > -	 */
> > -	err =3D drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm-
> > >preempt.num_exec_queues +
> > -				=C2=A0=C2=A0 vm->xe->info.tile_count);
> > +	err =3D drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > @@ -507,7 +504,7 @@ static int xe_preempt_work_begin(struct
> > drm_exec *exec, struct xe_vm *vm,
> > =C2=A0		return 0;
> > =C2=A0	}
> > =C2=A0
> > -	err =3D drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm-
> > >preempt.num_exec_queues);
> > +	err =3D drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
>=20
> I think this needs to be 1 as drm_gpuvm_validate needs a fence slot,
> right?

You mean for the bo move? It should be allocated by TTM on demand.

>=20
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > @@ -515,7 +512,17 @@ static int xe_preempt_work_begin(struct
> > drm_exec *exec, struct xe_vm *vm,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> > +	err =3D drm_gpuvm_validate(&vm->gpuvm, exec);
> > +	if (err)
> > +		return err;
> > +
> > +	drm_exec_for_each_locked_object(exec, index, obj) {
> > +		err =3D dma_resv_reserve_fences(obj->resv, vm-
> > >preempt.num_exec_queues);
>=20
> What if we only have external BOs? Do we allocate slots in the VM
> dma-resv slot with this loop?

Yes we do.

>=20
> Also what is the behavior of?
>=20
> dma_resv_reserve_fences(obj, 1);
> dma_resv_reserve_fences(obj, 1);
>=20
> Do we have 2 slots now? e.g. to calls to reserve slots accumulate?

Nope, there is only guaranteed to be 1. (There have been several
attempts to change those semantics, but I don't know what happened to
those TBH). I think we need to follow the principle=C2=A0

"Anything that attaches a fence needs to reserve it, and no recursion
to be future-proof".


>=20
> Lastly, strickly speaking I don't we need to patch in this series, do
> we? It doesn't appaer to being fixing anything unless I'm missing
> something.

It's actually the removed comment:

" ...however the fence slot will just be
* re-used, since they are largely the same timeline and the seqno
* should be in order. In the case of CPU bind there is dummy
fence used..."=C2=A0

That made me scared. With the change of invalidation fences, that is
not true anymore, and with multiple tiles we now do the right thing
with this patch AFAICT.

/Thomas



>=20
> Matt
>=20
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void preempt_rebind_work_func(struct work_struct *w)
> > @@ -1004,35 +1011,26 @@ static void xe_vma_destroy(struct xe_vma
> > *vma, struct dma_fence *fence)
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > - * xe_vm_prepare_vma() - drm_exec utility to lock a vma
> > + * xe_vm_lock_vma() - drm_exec utility to lock a vma
> > =C2=A0 * @exec: The drm_exec object we're currently locking for.
> > =C2=A0 * @vma: The vma for witch we want to lock the vm resv and any
> > attached
> > =C2=A0 * object's resv.
> > - * @num_shared: The number of dma-fence slots to pre-allocate in
> > the
> > - * objects' reservation objects.
> > =C2=A0 *
> > =C2=A0 * Return: 0 on success, negative error code on error. In
> > particular
> > =C2=A0 * may return -EDEADLK on WW transaction contention and -EINTR if
> > =C2=A0 * an interruptible wait is terminated by a signal.
> > =C2=A0 */
> > -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_shared)
> > +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
> > =C2=A0{
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > =C2=A0	int err;
> > =C2=A0
> > =C2=A0	XE_WARN_ON(!vm);
> > -	if (num_shared)
> > -		err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm),
> > num_shared);
> > -	else
> > -		err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
> > -	if (!err && bo && !bo->vm) {
> > -		if (num_shared)
> > -			err =3D drm_exec_prepare_obj(exec, &bo-
> > >ttm.base, num_shared);
> > -		else
> > -			err =3D drm_exec_lock_obj(exec, &bo-
> > >ttm.base);
> > -	}
> > +
> > +	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
> > +	if (!err && bo && !bo->vm)
> > +		err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
> > =C2=A0
> > =C2=A0	return err;
> > =C2=A0}
> > @@ -1044,7 +1042,7 @@ static void xe_vma_destroy_unlocked(struct
> > xe_vma *vma)
> > =C2=A0
> > =C2=A0	drm_exec_init(&exec, 0, 0);
> > =C2=A0	drm_exec_until_all_locked(&exec) {
> > -		err =3D xe_vm_prepare_vma(&exec, vma, 0);
> > +		err =3D xe_vm_lock_vma(&exec, vma);
> > =C2=A0		drm_exec_retry_on_contention(&exec);
> > =C2=A0		if (XE_WARN_ON(err))
> > =C2=A0			break;
> > @@ -2511,7 +2509,7 @@ static int op_execute(struct drm_exec *exec,
> > struct xe_vm *vm,
> > =C2=A0
> > =C2=A0	lockdep_assert_held_write(&vm->lock);
> > =C2=A0
> > -	err =3D xe_vm_prepare_vma(exec, vma, 1);
> > +	err =3D xe_vm_lock_vma(exec, vma);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 6df1f1c7f85d..47f3960120a0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -242,8 +242,7 @@ bool xe_vm_validate_should_retry(struct
> > drm_exec *exec, int err, ktime_t *end);
> > =C2=A0
> > =C2=A0int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int
> > gt_id);
> > =C2=A0
> > -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_shared);
> > +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * xe_vm_resv() - Return's the vm's reservation object
> > --=20
> > 2.44.0
> >=20

