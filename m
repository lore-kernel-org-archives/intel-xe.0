Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37947F3D311
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 15:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED36B10EC3A;
	Thu,  5 Mar 2026 15:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvlPkHMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6D910EC3A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772725139; x=1804261139;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nu9pFmfbcoVqoff+DeFgSrcSfjSxojEz/EzKb0yoVI8=;
 b=kvlPkHMCauYksQc7VOxaku4BVy3zyK4hPJk5TlYmxsvwT0zRw5k+BmjN
 VWYTjZReB0K1OAGj9XnOslf7b8pXtAjwxYC0kfc8kt3XBAMe7dyTdpfnJ
 sebpovpOmaAfnYk9h3DHFq+3/dckq1Prt/N6NYwgpiL6+16YmBiT4NimV
 Y5i7De+I9KVwZBif54g6vCWmmBb6GGnLwoRt7x23sqPg2/FXBpdP8qd5e
 8q6usSgogNZ35kA70RLhmd7VjQjk1C/cfLdtzTPJCp0lz8G4ZS2/frr2j
 1Byy8zH+xKjV4SVpKN32OpWGE+vVydUjevmUBXYSo8fo6JePikO3k6ajW A==;
X-CSE-ConnectionGUID: QNVPrUfKTn2m33NWqFm9Mg==
X-CSE-MsgGUID: 8BxyLQVSQ6yHhxOWsOhUkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91390424"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91390424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:38:59 -0800
X-CSE-ConnectionGUID: INzQZtm1RHu3aZZRbDiFkQ==
X-CSE-MsgGUID: Ex3E44okT72fo7T9pYPeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="256606709"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:38:57 -0800
Message-ID: <d5bea30262495b41f0ce97ba5b62161bb8c52e3b.camel@linux.intel.com>
Subject: Re: [PATCH v6 05/12] drm/xe/vm: Prevent binding of purged buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 05 Mar 2026 16:38:53 +0100
In-Reply-To: <20260303152015.3499248-6-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-6-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
> Add purge checking to vma_lock_and_validate() to block new mapping
> operations on purged BOs while allowing cleanup operations to
> proceed.
>=20
> Purged BOs have their backing pages freed by the kernel. New
> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
> -EINVAL to prevent GPU access to invalid memory. Cleanup
> operations (UNMAP) must be allowed so applications can release
> resources after detecting purge via the retained field.
>=20
> REMAP operations require mixed handling - reject new prev/next
> VMAs if the BO is purged, but allow the unmap portion to proceed
> for cleanup.
>=20
> The check_purged flag in struct xe_vma_lock_and_validate_flags
> distinguishes between these cases: true for new mappings (must
> reject),
> false for cleanup (allow).
>=20
> v2:
> =C2=A0 - Clarify that purged BOs are permanently invalid (i915 semantics)
> =C2=A0 - Remove incorrect claim about madvise(WILLNEED) restoring purged
> BOs
>=20
> v3:
> =C2=A0 - Move xe_bo_is_purged check under vma_lock_and_validate (Matt)
> =C2=A0 - Add check_purged parameter to distinguish new mappings from
> cleanup
> =C2=A0 - Allow UNMAP operations to prevent resource leaks
> =C2=A0 - Handle REMAP operation's dual nature (cleanup + new mappings)
>=20
> v5:
> =C2=A0 - Replace three boolean parameters with struct
> xe_vma_lock_and_validate_flags
> =C2=A0=C2=A0=C2=A0 to improve readability and prevent argument transposit=
ion (Matt)
> =C2=A0 - Use u32 bitfields instead of bool members to match
> xe_bo_shrink_flags
> =C2=A0=C2=A0=C2=A0 pattern - more efficient packing and follows xe driver
> conventions (Thomas)
> =C2=A0 - Pass struct as const since flags are read-only (Thomas)
>=20
> v6:
> =C2=A0 - Block VM_BIND to DONTNEED BOs with -EBUSY (Thomas, Matt)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 71 ++++++++++++++++++++++++++++++++---=
-
> --
> =C2=A01 file changed, 60 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c65d014c7491..4a8abdcfb912 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2917,8 +2917,20 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * struct xe_vma_lock_and_validate_flags - Flags for
> vma_lock_and_validate()
> + * @res_evict: Allow evicting resources during validation
> + * @validate: Perform BO validation
> + * @check_purged: Reject operation if BO is purged
> + */
> +struct xe_vma_lock_and_validate_flags {
> +	u32 res_evict : 1;
> +	u32 validate : 1;
> +	u32 check_purged : 1;
> +};
> +
> =C2=A0static int vma_lock_and_validate(struct drm_exec *exec, struct
> xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 const struct
> xe_vma_lock_and_validate_flags *flags)

Small structs like these can be passed by value rather than by
reference. It's done elsewhere in the xe driver, but we've also seen
people complain about ABI incompatibilities. I'd recommend passing by
value here to make the driver style consistent.

Other than that LGTM.



> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> @@ -2927,10 +2939,19 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> =C2=A0	if (bo) {
> =C2=A0		if (!bo->vm)
> =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> >ttm.base);
> -		if (!err && validate)
> +
> +		/* Reject new mappings to DONTNEED/purged BOs; allow
> cleanup operations */
> +		if (!err && flags->check_purged) {
> +			if (xe_bo_madv_is_dontneed(bo))
> +				err =3D -EBUSY;=C2=A0 /* BO marked
> purgeable */
> +			else if (xe_bo_is_purged(bo))
> +				err =3D -EINVAL; /* BO already purged
> */
> +		}
> +
> +		if (!err && flags->validate)
> =C2=A0			err =3D xe_bo_validate(bo, vm,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0
> xe_vm_allow_vm_eviction(vm) &&
> -					=C2=A0=C2=A0=C2=A0=C2=A0 res_evict, exec);
> +					=C2=A0=C2=A0=C2=A0=C2=A0 flags->res_evict,
> exec);
> =C2=A0	}
> =C2=A0
> =C2=A0	return err;
> @@ -3023,9 +3044,12 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0	case DRM_GPUVA_OP_MAP:
> =C2=A0		if (!op->map.invalidate_on_bind)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >map.vma,
> -						=C2=A0=C2=A0=C2=A0 res_evict,
> -						=C2=A0=C2=A0=C2=A0
> !xe_vm_in_fault_mode(vm) ||
> -						=C2=A0=C2=A0=C2=A0 op-
> >map.immediate);
> +						=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +							=C2=A0=C2=A0=C2=A0
> .res_evict =3D res_evict,
> +							=C2=A0=C2=A0=C2=A0
> .validate =3D !xe_vm_in_fault_mode(vm) ||
> +							=09
> 	op->map.immediate,
> +							=C2=A0=C2=A0=C2=A0
> .check_purged =3D true
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> =C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> >base.remap.unmap->va));
> @@ -3034,13 +3058,25 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.remap.unmap->va),
> -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> +					=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> false
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && op->remap.prev)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >remap.prev,
> -						=C2=A0=C2=A0=C2=A0 res_evict,
> true);
> +						=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +							=C2=A0=C2=A0=C2=A0
> .res_evict =3D res_evict,
> +							=C2=A0=C2=A0=C2=A0
> .validate =3D true,
> +							=C2=A0=C2=A0=C2=A0
> .check_purged =3D true
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && op->remap.next)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >remap.next,
> -						=C2=A0=C2=A0=C2=A0 res_evict,
> true);
> +						=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +							=C2=A0=C2=A0=C2=A0
> .res_evict =3D res_evict,
> +							=C2=A0=C2=A0=C2=A0
> .validate =3D true,
> +							=C2=A0=C2=A0=C2=A0
> .check_purged =3D true
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> =C2=A0		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -3049,7 +3085,11 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.unmap.va),
> -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> +					=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> false
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0	{
> @@ -3062,9 +3102,18 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0				=C2=A0 region <=3D
> ARRAY_SIZE(region_to_mem_type));
> =C2=A0		}
> =C2=A0
> +		/*
> +		 * Prefetch attempts to migrate BO's backing store
> without
> +		 * repopulating it first. Purged BOs have no backing
> store
> +		 * to migrate, so reject the operation.
> +		 */
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.prefetch.va),
> -					=C2=A0=C2=A0=C2=A0 res_evict, false);
> +					=C2=A0=C2=A0=C2=A0 &(struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> true
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> =C2=A0					=C2=A0=C2=A0=C2=A0
> region_to_mem_type[region],
