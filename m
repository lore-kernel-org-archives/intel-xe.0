Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1270ED6CFD1
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 12:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C812810E119;
	Fri, 23 Jan 2026 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlgaV7HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF910EAD3
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769171844; x=1800707844;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rKG8nF2mhACUyREzoDe+JAk/JkRN1n6eg9W0AN+KXLA=;
 b=MlgaV7HELTu8e9+eGNEBJKp9aX2twD/6H/UQcLUe/Hbw46tpm9T51FbG
 mBFHrGc57NODJxFgHQyYJ1PuQzSuojSZOeN+hLYTtFyL9fYxXhYSxJ8yj
 3aNO7tF2grX4aXL1cyfPVbGZatK/6Djlxn3h7w2dy3fbEOvHFopJN8o9D
 zbgxqE0GJdAKe+ybfq/gKN5nsXrEK8t9cukZ89dojryuIQGC8QItsFClR
 2+HqbEXtb0fVsqLwBTb6fOJsuctg7TJS0jclhO84m2FTo/nuAzzEO5LcS
 6fZr8c4M749e22umsjX/LTmfWEW5SAoJDeHBTClowp53E1RMbyyOHu6IZ g==;
X-CSE-ConnectionGUID: Gx+AsND/R+eh7tAEpJicqg==
X-CSE-MsgGUID: cNz7zUDOS9+xnuJ/cNmBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87842343"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87842343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:37:24 -0800
X-CSE-ConnectionGUID: ddigG6M4QzCcNH8XJrH6zg==
X-CSE-MsgGUID: erB7K0UBTpeASXNQVP+00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206276540"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.177])
 ([10.245.244.177])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:37:22 -0800
Message-ID: <bedb36f03c7e82ffca688a1ba69929a343bc4f37.camel@linux.intel.com>
Subject: Re: [PATCH v4 5/8] drm/xe/vm: Prevent binding of purged buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Fri, 23 Jan 2026 13:37:19 +0100
In-Reply-To: <7614efa2-b126-4fa6-8213-a8cd764e4419@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-6-arvind.yadav@intel.com>
 <aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com>
 <7614efa2-b126-4fa6-8213-a8cd764e4419@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Fri, 2026-01-23 at 11:11 +0530, Yadav, Arvind wrote:
>=20
> On 20-01-2026 22:57, Matthew Brost wrote:
> > On Tue, Jan 20, 2026 at 11:38:51AM +0530, Arvind Yadav wrote:
> > > Add check_purged parameter to vma_lock_and_validate() to block
> > > new mapping operations on purged BOs while allowing cleanup
> > > operations to proceed.
> > >=20
> > > Purged BOs have their backing pages freed by the kernel. New
> > > mapping operations (MAP, PREFETCH, REMAP) must be rejected with
> > > -EINVAL to prevent GPU access to invalid memory. Cleanup
> > > operations (UNMAP) must be allowed so applications can release
> > > resources after detecting purge via the retained field.
> > >=20
> > > REMAP operations require mixed handling - reject new prev/next
> > > VMAs if the BO is purged, but allow the unmap portion to proceed
> > > for cleanup.
> > >=20
> > > The check_purged parameter distinguishes between these cases:
> > > true for new mappings (must reject), false for cleanup (allow).
> > >=20
> > > v2:
> > > =C2=A0=C2=A0 - Clarify that purged BOs are permanently invalid (i915
> > > semantics)
> > > =C2=A0=C2=A0 - Remove incorrect claim about madvise(WILLNEED) restori=
ng
> > > purged BOs
> > >=20
> > > v3:
> > > =C2=A0=C2=A0 - Move xe_bo_is_purged check under vma_lock_and_validate
> > > (Matthew Brost)
> > > =C2=A0=C2=A0 - Add check_purged parameter to distinguish new mappings=
 from
> > > cleanup
> > > =C2=A0=C2=A0 - Allow UNMAP operations to prevent resource leaks
> > > =C2=A0=C2=A0 - Handle REMAP operation's dual nature (cleanup + new
> > > mappings)
> > >=20
> > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m<thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
> > > =C2=A0 1 file changed, 13 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index c3a5fe76ff96..f250daae3012 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2883,7 +2883,7 @@ static void vm_bind_ioctl_ops_unwind(struct
> > > xe_vm *vm,
> > > =C2=A0 }
> > >=20
> > > =C2=A0 static int vma_lock_and_validate(struct drm_exec *exec, struct
> > > xe_vma *vma,
> > > -				 bool res_evict, bool validate)
> > > +				 bool res_evict, bool validate,
> > > bool check_purged)
> > It probably time to add something like this to avoid transposing
> > arguments.
> >=20
> > struct lock_and_validate_flags {
> > 	bool res_evict;
> > 	bool validate;
> > 	bool check_purged;
> > };
> >=20
> > Logic in the patch looks correct though.
>=20
>=20
> Noted, I will add "struct xe_lock_and_validate_flags" Thanks, Arvind

Note that if you follow the pattern of struct xe_bo_shink_flags,
passing the struct as a const and using

struct lock_and_validate_flags {
	u32 res_evict : 1;
        u32 validate : 1;
        u32 check_purged : 1;
};

This will be more or less equivalent to passing a bit-field with type-
checking.

Some reviewers frown on using "bool" in compound types although we
accept that in the xe driver.

Otherwise patch LGTM as well.

/Thomas


>=20
> >=20
> > Matt
> >=20
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > > =C2=A0=C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > @@ -2892,6 +2892,11 @@ static int vma_lock_and_validate(struct
> > > drm_exec *exec, struct xe_vma *vma,
> > > =C2=A0=C2=A0	if (bo) {
> > > =C2=A0=C2=A0		if (!bo->vm)
> > > =C2=A0=C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> > > >ttm.base);
> > > +
> > > +		/* Reject new mappings to purged BOs; allow
> > > cleanup operations */
> > > +		if (!err && check_purged && xe_bo_is_purged(bo))
> > > +			err =3D -EINVAL;
> > > +
> > > =C2=A0=C2=A0		if (!err && validate)
> > > =C2=A0=C2=A0			err =3D xe_bo_validate(bo, vm,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0
> > > !xe_vm_in_preempt_fence_mode(vm) &&
> > > @@ -2990,7 +2995,8 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > > =C2=A0=C2=A0			err =3D vma_lock_and_validate(exec, op-
> > > >map.vma,
> > > =C2=A0=C2=A0						=C2=A0=C2=A0=C2=A0 res_evict,
> > > =C2=A0=C2=A0						=C2=A0=C2=A0=C2=A0
> > > !xe_vm_in_fault_mode(vm) ||
> > > -						=C2=A0=C2=A0=C2=A0 op-
> > > >map.immediate);
> > > +						=C2=A0=C2=A0=C2=A0 op-
> > > >map.immediate,
> > > +						=C2=A0=C2=A0=C2=A0 true);
> > > =C2=A0=C2=A0		break;
> > > =C2=A0=C2=A0	case DRM_GPUVA_OP_REMAP:
> > > =C2=A0=C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> > > >base.remap.unmap->va));
> > > @@ -2999,13 +3005,13 @@ static int op_lock_and_prep(struct
> > > drm_exec *exec, struct xe_vm *vm,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		err =3D vma_lock_and_validate(exec,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > > >base.remap.unmap->va),
> > > -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> > > +					=C2=A0=C2=A0=C2=A0 res_evict, false,
> > > false);
> > > =C2=A0=C2=A0		if (!err && op->remap.prev)
> > > =C2=A0=C2=A0			err =3D vma_lock_and_validate(exec, op-
> > > >remap.prev,
> > > -						=C2=A0=C2=A0=C2=A0 res_evict,
> > > true);
> > > +						=C2=A0=C2=A0=C2=A0 res_evict,
> > > true, true);
> > > =C2=A0=C2=A0		if (!err && op->remap.next)
> > > =C2=A0=C2=A0			err =3D vma_lock_and_validate(exec, op-
> > > >remap.next,
> > > -						=C2=A0=C2=A0=C2=A0 res_evict,
> > > true);
> > > +						=C2=A0=C2=A0=C2=A0 res_evict,
> > > true, true);
> > > =C2=A0=C2=A0		break;
> > > =C2=A0=C2=A0	case DRM_GPUVA_OP_UNMAP:
> > > =C2=A0=C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> > > >base.unmap.va));
> > > @@ -3014,7 +3020,7 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		err =3D vma_lock_and_validate(exec,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > > >base.unmap.va),
> > > -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> > > +					=C2=A0=C2=A0=C2=A0 res_evict, false,
> > > false);
> > > =C2=A0=C2=A0		break;
> > > =C2=A0=C2=A0	case DRM_GPUVA_OP_PREFETCH:
> > > =C2=A0=C2=A0	{
> > > @@ -3029,7 +3035,7 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		err =3D vma_lock_and_validate(exec,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > > >base.prefetch.va),
> > > -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> > > +					=C2=A0=C2=A0=C2=A0 res_evict, false,
> > > true);
> > > =C2=A0=C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> > > =C2=A0=C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0
> > > region_to_mem_type[region],
> > > --=20
> > > 2.43.0
