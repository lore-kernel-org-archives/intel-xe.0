Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F39E9A77C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 12:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEF610E679;
	Tue, 24 Mar 2026 12:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="an0+oeEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A925510E679
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774354897; x=1805890897;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FwQUKI9TwHrqu999V79Ftsh2mWLqTlBnrue6l5TaFaQ=;
 b=an0+oeEiTel3qXwhYDs3uO5v3GDLIdSIlux9g0tPI5VvV1syPgDk6d2Y
 /OQSXSEamwolTAw5vt61rjJ5qDSpIW4NssI55hbaMG9ZvJyi2ndhVO/tt
 YrTOUrRd9z7hftaVl6MZGLbpp3bfUlZu5xp0Y2J0E4BKUgDc8tA6GDEW0
 Is7Wf9GYjnGbyImC6hWOnQ8QPgfUOqgCpPXpTwnDLNpLAb8xJgC/RPDYr
 vNOyzJzGpbKpeoDhw+deLeH/3VU/AmOTNxnPO9PF2yw2rOv9BXmU6/M81
 acEj6Kf7SMiReEnDKZUQZJMbU6FF2I01Pq1anBzeMyBBQEx8qOga8DqLX g==;
X-CSE-ConnectionGUID: lxgARTNAR9ivO12afXvlMg==
X-CSE-MsgGUID: +DrG6aUbTCCdCRjBcpdfqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92747010"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="92747010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 05:21:36 -0700
X-CSE-ConnectionGUID: a4Kt1NOZQJWiVVTDKNf3pg==
X-CSE-MsgGUID: D/399IL9Sn+1PAaQHlLCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="217761358"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.208])
 ([10.245.244.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 05:21:34 -0700
Message-ID: <f1d430d0177f033f6460a93c9650e6594b8a344e.camel@linux.intel.com>
Subject: Re: [PATCH v7 05/12] drm/xe/vm: Prevent binding of purged buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 24 Mar 2026 13:21:32 +0100
In-Reply-To: <20260323093106.2986900-6-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-6-arvind.yadav@intel.com>
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

On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
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
> =C2=A0 - Pass struct as const since flags are read-only (Matt)
>=20
> v6:
> =C2=A0 - Block VM_BIND to DONTNEED BOs with -EBUSY (Thomas, Matt)
>=20
> v7:
> =C2=A0 - Pass xe_vma_lock_and_validate_flags by value instead of by
> =C2=A0=C2=A0=C2=A0 pointer, consistent with xe driver style. (Thomas)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 82 ++++++++++++++++++++++++++++++++---=
-
> --
> =C2=A01 file changed, 69 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0ade67d616e..9c1a82b64a43 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2918,8 +2918,22 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * struct xe_vma_lock_and_validate_flags - Flags for
> vma_lock_and_validate()
> + * @res_evict: Allow evicting resources during validation
> + * @validate: Perform BO validation
> + * @request_decompress: Request BO decompression
> + * @check_purged: Reject operation if BO is purged
> + */
> +struct xe_vma_lock_and_validate_flags {
> +	u32 res_evict : 1;
> +	u32 validate : 1;
> +	u32 request_decompress : 1;
> +	u32 check_purged : 1;
> +};
> +
> =C2=A0static int vma_lock_and_validate(struct drm_exec *exec, struct
> xe_vma *vma,
> -				 bool res_evict, bool validate, bool
> request_decompress)
> +				 struct
> xe_vma_lock_and_validate_flags flags)
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> @@ -2928,15 +2942,24 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> =C2=A0	if (bo) {
> =C2=A0		if (!bo->vm)
> =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> >ttm.base);
> -		if (!err && validate)
> +
> +		/* Reject new mappings to DONTNEED/purged BOs; allow
> cleanup operations */
> +		if (!err && flags.check_purged) {
> +			if (xe_bo_madv_is_dontneed(bo))
> +				err =3D -EBUSY;=C2=A0 /* BO marked
> purgeable */
> +			else if (xe_bo_is_purged(bo))
> +				err =3D -EINVAL; /* BO already purged
> */
> +		}
> +
> +		if (!err && flags.validate)
> =C2=A0			err =3D xe_bo_validate(bo, vm,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0
> xe_vm_allow_vm_eviction(vm) &&
> -					=C2=A0=C2=A0=C2=A0=C2=A0 res_evict, exec);
> +					=C2=A0=C2=A0=C2=A0=C2=A0 flags.res_evict, exec);
> =C2=A0
> =C2=A0		if (err)
> =C2=A0			return err;
> =C2=A0
> -		if (request_decompress)
> +		if (flags.request_decompress)
> =C2=A0			err =3D xe_bo_decompress(bo);
> =C2=A0	}
> =C2=A0
> @@ -3030,10 +3053,13 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0	case DRM_GPUVA_OP_MAP:
> =C2=A0		if (!op->map.invalidate_on_bind)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >map.vma,
> -						=C2=A0=C2=A0=C2=A0 res_evict,
> -						=C2=A0=C2=A0=C2=A0
> !xe_vm_in_fault_mode(vm) ||
> -						=C2=A0=C2=A0=C2=A0 op-
> >map.immediate,
> -						=C2=A0=C2=A0=C2=A0 op-
> >map.request_decompress);
> +						=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +							.res_evict =3D
> res_evict,
> +							.validate =3D
> !xe_vm_in_fault_mode(vm) ||
> +								=C2=A0=C2=A0=C2=A0
> op->map.immediate,
> +							.request_dec
> ompress =3D op->map.request_decompress,
> +							.check_purge
> d =3D true,
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> =C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> >base.remap.unmap->va));
> @@ -3042,13 +3068,28 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.remap.unmap->va),
> -					=C2=A0=C2=A0=C2=A0 res_evict, false,
> false);
> +					=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0
> .request_decompress =3D false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> false,
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && op->remap.prev)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >remap.prev,
> -						=C2=A0=C2=A0=C2=A0 res_evict, true,
> false);
> +						=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +							=C2=A0=C2=A0=C2=A0
> .res_evict =3D res_evict,
> +							=C2=A0=C2=A0=C2=A0
> .validate =3D true,
> +							=C2=A0=C2=A0=C2=A0
> .request_decompress =3D false,
> +							=C2=A0=C2=A0=C2=A0
> .check_purged =3D true,
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && op->remap.next)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >remap.next,
> -						=C2=A0=C2=A0=C2=A0 res_evict, true,
> false);
> +						=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +							=C2=A0=C2=A0=C2=A0
> .res_evict =3D res_evict,
> +							=C2=A0=C2=A0=C2=A0
> .validate =3D true,
> +							=C2=A0=C2=A0=C2=A0
> .request_decompress =3D false,
> +							=C2=A0=C2=A0=C2=A0
> .check_purged =3D true,
> +						=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> =C2=A0		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -3057,7 +3098,12 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.unmap.va),
> -					=C2=A0=C2=A0=C2=A0 res_evict, false,
> false);
> +					=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0
> .request_decompress =3D false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> false,
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0	{
> @@ -3070,9 +3116,19 @@ static int op_lock_and_prep(struct drm_exec
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
> -					=C2=A0=C2=A0=C2=A0 res_evict, false,
> false);
> +					=C2=A0=C2=A0=C2=A0 (struct
> xe_vma_lock_and_validate_flags) {
> +						=C2=A0=C2=A0=C2=A0 .res_evict =3D
> res_evict,
> +						=C2=A0=C2=A0=C2=A0 .validate =3D
> false,
> +						=C2=A0=C2=A0=C2=A0
> .request_decompress =3D false,
> +						=C2=A0=C2=A0=C2=A0 .check_purged =3D
> true,
> +					=C2=A0=C2=A0=C2=A0 });
> =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> =C2=A0					=C2=A0=C2=A0=C2=A0
> region_to_mem_type[region],
