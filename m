Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5143C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 11:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E610E58B;
	Tue, 27 Feb 2024 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7OQuluh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7610E58B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709034740; x=1740570740;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JxtkPTZknlPoq4aih8if9//oRR7mY1LzPOLlBd0Ur7w=;
 b=i7OQuluhwuSUTbsdcJf7pMWxdwJAp7PTDIREv9XCnLdafNRlDvGo61MX
 f1ElFTpLm09IiF/UWA2mWZbVAO3jINZT+REGScIaR/eBf1v9xnDFFo1/0
 fLRUJhG524AiEqVDXRzNuL0QESEGKX6IqfyCunbHNTexcnKcbHBu1+3yG
 +h6uYTk/3HBOQ3zEkSgTBpXIog0DLoMWta0j26FPChOV9r/QiI/J1ERJ8
 Nki99R9+FkPGpCuqGZNfA3e66Yv1sW3ADxtO21eW5X9O2o+z9nBZO5lla
 neRAfyP/4f41t4w17e/KanbaMGPQsBFi1x5HtTeUW+12i5RqCbFQe6DfE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20912879"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="20912879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11685712"
Received: from rbriscox-mobl1.ger.corp.intel.com (HELO [10.252.3.86])
 ([10.252.3.86])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:52:18 -0800
Message-ID: <56502b0edac0c63ac7ec3963be3b473aa659a585.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/bo: Forward the decision to evict local
 objects during validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 27 Feb 2024 12:52:14 +0100
In-Reply-To: <Zd0ET4wyT5MAOYWn@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-2-thomas.hellstrom@linux.intel.com>
 <Zd0ET4wyT5MAOYWn@DUT025-TGLU.fm.intel.com>
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

On Mon, 2024-02-26 at 21:36 +0000, Matthew Brost wrote:
> On Mon, Feb 26, 2024 at 05:44:53PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Currently we refuse evicting the VM's local objects. However that
> > is necessary for some objects. Most notably completely unbound
> > objects.
> > Forward this decision to be per-object based in the TTM
> > eviction_valuable() callback.
> >=20
> > Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external-
> > and evicted objects")
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
17 ++++++++++++++++-
> > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 ++++++--
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
> > =C2=A04 files changed, 34 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 76dfaf1cd200..143d93632253 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1049,6 +1049,21 @@ static void
> > xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +static bool xe_bo_eviction_valuable(struct ttm_buffer_object
> > *ttm_bo,
> > +				=C2=A0=C2=A0=C2=A0 const struct ttm_place *place)
> > +{
> > +	if (xe_bo_is_xe_bo(ttm_bo)) {
> > +		struct xe_bo *xe_bo =3D ttm_to_xe_bo(ttm_bo);
> > +		struct xe_vm *vm =3D xe_bo->vm;
> > +
> > +		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm,
> > &ttm_bo->base) &&
>=20
> Is this not redundant - if xe_bo->vm is set then it not an external
> BO?

It's to exclude the case where the resv is individualized as part of
destruction. Then drm_gpuvm_is_extobj() should return true.

>=20
> > +		=C2=A0=C2=A0=C2=A0 vm->is_validating)
> > +			return false;
> > +	}
> > +
> > +	return ttm_bo_eviction_valuable(ttm_bo, place);
> > +}
> > +
> > =C2=A0const struct ttm_device_funcs xe_ttm_funcs =3D {
> > =C2=A0	.ttm_tt_create =3D xe_ttm_tt_create,
> > =C2=A0	.ttm_tt_populate =3D xe_ttm_tt_populate,
> > @@ -1059,7 +1074,7 @@ const struct ttm_device_funcs xe_ttm_funcs =3D
> > {
> > =C2=A0	.io_mem_reserve =3D xe_ttm_io_mem_reserve,
> > =C2=A0	.io_mem_pfn =3D xe_ttm_io_mem_pfn,
> > =C2=A0	.release_notify =3D xe_ttm_bo_release_notify,
> > -	.eviction_valuable =3D ttm_bo_eviction_valuable,
> > +	.eviction_valuable =3D xe_bo_eviction_valuable,
> > =C2=A0	.delete_mem_notify =3D xe_ttm_bo_delete_mem_notify,
> > =C2=A0};
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 952496c6260d..e8eb09993485 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -102,7 +102,9 @@ static int xe_exec_fn(struct drm_gpuvm_exec
> > *vm_exec)
> > =C2=A0	int num_fences;
> > =C2=A0	int ret;
> > =C2=A0
> > +	vm->is_validating =3D true;
> > =C2=A0	ret =3D drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> > +	vm->is_validating =3D false;
>=20
> Can't say I love this coding pattern but you address this in the
> kernel
> doc for is_validating. Agree with updating TTM to avoid this.

Yeah.

>=20
> Also this is kinda racey too - e.g. 2 VMs could set vm->is_validating
> at
> the same time. We really want to check if BO being evicted VM's
> matches
> the VM we are trying to validate in the current context, right?

It's not racy AFAICT. Since it's protected by the vm resv, and only
ever set under the vm->resv. Any reader holding the vm->resv can thus
rely on its value.

>=20
> With that - maybe we try to update TTM in this series too?

I'd be good to have the completely unbound case fixed with 6.8 so
that's why this got a bit rushed.

>=20
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index e3bde897f6e8..07b0cda12d52 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct
> > drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> > =C2=A0		list_move_tail(&gpuva_to_vma(gpuva)-
> > >combined_links.rebind,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> > =C2=A0
> > -	ret =3D xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> > +	ret =3D xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, true);
>=20
> I think we likely can flip the last argument to true in a few other
> places too. Or maybe even drop the argument and either always set to
> true or true if not an ext obj?

Yeah we should indeed be able to set it elsewhere. The weird case is
when allocating page-table bos, because then we could accidently evict
the bo the page-tables are intended to point to, and we'd have to rerun
the validation again after binding. I'll see if I can get that going in
a not to complicated way.

/Thomas


>=20
> Matt
>=20
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > @@ -515,7 +515,11 @@ static int xe_preempt_work_begin(struct
> > drm_exec *exec, struct xe_vm *vm,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> > +	vm->is_validating =3D true;
> > +	err =3D drm_gpuvm_validate(&vm->gpuvm, exec);
> > +	vm->is_validating =3D false;
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void preempt_rebind_work_func(struct work_struct *w)
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 7d4f810f9c04..76c49fba9cd3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -286,6 +286,16 @@ struct xe_vm {
> > =C2=A0
> > =C2=A0	/** @batch_invalidate_tlb: Always invalidate TLB before
> > batch start */
> > =C2=A0	bool batch_invalidate_tlb;
> > +
> > +	/**
> > +	 * @is_validaing: Whether we are validating the vm's local
> > objects.
> > +	 * This field is protected by the vm's resv. Note that
> > this
> > +	 * is needed only since TTM doesn't forward the
> > ttm_operation_ctx to the
> > +	 * eviction_valuable() callback, so if / when that is in
> > place, this
> > +	 * should be removed.
> > +	 */
> > +	bool is_validating;
> > +
> > =C2=A0	/** @xef: XE file handle for tracking this VM's drm client
> > */
> > =C2=A0	struct xe_file *xef;
> > =C2=A0};
> > --=20
> > 2.43.0
> >=20

