Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A928FC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 13:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677E210E10F;
	Mon, 13 May 2024 13:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4HZannq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EAE10E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715606235; x=1747142235;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=btXwDVylTrPqxe/OL/tB0zQ7EHg2CwiUVxqrULEIYTw=;
 b=V4HZannq7MkF/sUxTWu3SIQHaauRm1XvtgkAJBEnHA8KjaK1b1R8hdAO
 V+KRlburBsxPwPtmxSch7Nq5PcN0R5CRGDKVPFlWJ7eV/IykzzdTL7K4h
 FoczW2CWADh9DQJSL6Cilu2oI77DMysWM/oNm9SpI84DWguVH7DqXcCny
 3JmaOMEcF1OZXdWhWXeYGfcM59XTv4S2vnE/NHAO5C4PahWomxWWutYI+
 bTjRs3CzJOxW5+Z6M3vj3MRD5UU+pl5SbHw5ZiEJNJKfTMb0A54lGI20w
 /ChysDn4GjSASrhikwK7z/PaEEDNh40rQrUOYvbHEPprt4aW5r3ihq0Zn w==;
X-CSE-ConnectionGUID: G26Dpz2aQyO3tGnIhgf+jQ==
X-CSE-MsgGUID: PwcCiMhzR6GzRe5nZrk9ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11414138"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11414138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:16:43 -0700
X-CSE-ConnectionGUID: GvZkhTOJTPCxwbT9zHrVHQ==
X-CSE-MsgGUID: Nl7qIJ8ZSrSvpOrR9WA6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30285923"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.9])
 ([10.245.246.9])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:16:41 -0700
Message-ID: <b0c748ede678118890467b5cd71a8e226d6c63a2.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Francois Dugast <francois.dugast@intel.com>
Date: Mon, 13 May 2024 15:16:38 +0200
In-Reply-To: <ZjzwZvy5ZwHsYuLF@DUT025-TGLU.fm.intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
 <20240508200707.375414-4-rodrigo.vivi@intel.com>
 <ZjzwZvy5ZwHsYuLF@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Thu, 2024-05-09 at 15:48 +0000, Matthew Brost wrote:
> On Wed, May 08, 2024 at 04:07:04PM -0400, Rodrigo Vivi wrote:
> > In the regular use case scenario, user space will create a
> > VM, and keep it alive for the entire duration of its workload.
> >=20
> > For the regular desktop cases, it means that the VM
> > is alive even on idle scenarios where display goes off. This
> > is unacceptable since this would entirely block runtime PM
> > indefinitely, blocking deeper Package-C state. This would be
> > a waste drainage of power.
> >=20
> > Limit the VM protection solely for long-running workloads that
> > are not protected by display cases nor by the scheduler
> > references. By design, run_job for long-running workloads
> > returns NULL and the scheduler drops all the references of it,
> > hence protecting the VM for this case is necessary.
> >=20
> > This indeed opens up a risk of use case without display, and
> > without long-running workload, where memory might be mapped
> > and accessed with direct read and write operations without
> > any gpu execution involved. Because of this, extra protection
> > for the special vm_op access callback.
> >=20
> > In the ideal case of the mmapped scenario of vm_ops, we would
> > also get references in the 'open' and 'mmap' callbacks, and
> > put it back on the 'close' callback, for a balanced case.
> > However, this would also block the regular desktop case.
> >=20
> > v2: Update commit message to a more imperative language and to
> > =C2=A0=C2=A0=C2=A0 reflect why the VM protection is really needed.
> > =C2=A0=C2=A0=C2=A0 Also add a comment in the code to let the reason vis=
bible.
> >=20
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
> > =C2=A02 files changed, 25 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 03f7fe7acf8c..7980efe139ed 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1171,11 +1171,26 @@ static vm_fault_t xe_gem_fault(struct
> > vm_fault *vmf)
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +static int xe_vm_access(struct vm_area_struct *vma, unsigned long
> > addr,
> > +			void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *tbo =3D vma->vm_private_data;
> > +	struct drm_device *ddev =3D tbo->base.dev;
> > +	struct xe_device *xe =3D to_xe_device(ddev);
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret =3D ttm_bo_vm_access(vma, addr, buf, len, write);
>=20
> Trying to understand this case. Looking at ttm_bo_vm_access it
> appears
> to be a function in which a CPU VMA is read / wrote when it has a
> backing store of a TTM BO. System an TT placement defaults to a TTM
> function while VRAM access is implemented via the access_memory vfunc
> which we do not implement in Xe. Is this something we are missing?

Yes, looks like it. It's used by access_process_vm(). It looks like
that's used by ptrace.

/Thomas

>=20
> Patch itself makes sense, have a PM ref when accessing memory.
>=20
> Matt
>=20
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +
> > =C2=A0static const struct vm_operations_struct xe_gem_vm_ops =3D {
> > =C2=A0	.fault =3D xe_gem_fault,
> > =C2=A0	.open =3D ttm_bo_vm_open,
> > =C2=A0	.close =3D ttm_bo_vm_close,
> > -	.access =3D ttm_bo_vm_access
> > +	.access =3D xe_vm_access
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct drm_gem_object_funcs xe_gem_object_funcs =3D =
{
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index d17192c8b7de..f2915741fe16 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> > =C2=A0
> > =C2=A0	vm->pt_ops =3D &xelp_pt_ops;
> > =C2=A0
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	/*
> > +	 * Long-running workloads are not protected by the
> > scheduler references.
> > +	 * By design, run_job for long-running workloads returns
> > NULL and the
> > +	 * scheduler drops all the references of it, hence
> > protecting the VM
> > +	 * for this case is necessary.
> > +	 */
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> > =C2=A0		xe_pm_runtime_get_noresume(xe);
> > =C2=A0
> > =C2=A0	vm_resv_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
> > @@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> > =C2=A0	for_each_tile(tile, xe, id)
> > =C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> > =C2=A0	kfree(vm);
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> > =C2=A0		xe_pm_runtime_put(xe);
> > =C2=A0	return ERR_PTR(err);
> > =C2=A0}
> > @@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w)
> > =C2=A0
> > =C2=A0	mutex_destroy(&vm->snap_mutex);
> > =C2=A0
> > -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> > =C2=A0		xe_pm_runtime_put(xe);
> > =C2=A0
> > =C2=A0	for_each_tile(tile, xe, id)
> > --=20
> > 2.44.0
> >=20

