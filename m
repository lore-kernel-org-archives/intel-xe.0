Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB15CCCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C04810E420;
	Mon,  3 Nov 2025 15:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmIhiv9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3E710E420
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183168; x=1793719168;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=mvZJFmFogd79abcWgHcMnM2FEhwNp0zpJImZUlWR3Oo=;
 b=mmIhiv9zVp5VN4nmG9oRud5qrhRJv5BBIY9IqWSjiUbZeZ022t5bd4p/
 W6QDqdFnhv5XUUchWM5KXlZkiQMvbjSP+tr3yRLod5pBfU1l0/wWrbMS4
 oi6Ae+5vf4AJGS55YHh8Stj/0NLbH8zZgGikxXARfW9LUPalGPu0oniix
 4cvvk2FsfP89Tc+sS4l/MjEd+qbojt2NwYDUGMagXvbfJH5vFzQwe7teq
 s2PA6YRqpBJJ2oRNdF6jaGg2baB4EzRZBz2LeEUPsJAiYu0Lu19oonFwC
 jKpjqtvRbsJo5B5k3dGcUET9ZzB1BFlp2eOXI+8U9ZPrcNks/k64B9RjG g==;
X-CSE-ConnectionGUID: c4Z/TC9yQhC7lcbeI7xcfw==
X-CSE-MsgGUID: NzMylSEISae41XMtb0Typw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63956687"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63956687"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:19:28 -0800
X-CSE-ConnectionGUID: WxB/3pbJRFaeNu2MTTFNKQ==
X-CSE-MsgGUID: ao2euDh/TPyJa/3yW5HWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186759445"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.36])
 ([10.245.245.36])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:19:27 -0800
Message-ID: <131569db27f56fa9ab4e3e193261e267ed2476ae.camel@linux.intel.com>
Subject: Re: [PATCH v5 4/6] drm/xe: Skip TLB invalidation waits in page
 fault binds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 16:19:15 +0100
In-Reply-To: <20251029205719.2746501-5-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-5-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> Avoid waiting on unrelated TLB invalidations when servicing page
> fault
> binds. Since the migrate queue is shared across processes, TLB
> invalidations triggered by other processes may occur concurrently but
> are not relevant to the current bind. Teach the bind pipeline to skip
> waits on such invalidations to prevent unnecessary serialization.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 1 +
> =C2=A02 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7a6e254996fb..6c77ff109fe4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -755,6 +755,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm,
> struct xe_vma *vma, u8 tile_ma
> =C2=A0	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> =C2=A0
> =C2=A0	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	vops.flags |=3D XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
> =C2=A0	for_each_tile(tile, vm->xe, id) {
> =C2=A0		vops.pt_update_ops[id].wait_vm_bookkeep =3D true;
> =C2=A0		vops.pt_update_ops[tile->id].q =3D
> @@ -845,6 +846,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
> *vm,
> =C2=A0	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0
> =C2=A0	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	vops.flags |=3D XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
> =C2=A0	for_each_tile(tile, vm->xe, id) {
> =C2=A0		vops.pt_update_ops[id].wait_vm_bookkeep =3D true;
> =C2=A0		vops.pt_update_ops[tile->id].q =3D
> @@ -3111,8 +3113,13 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
> =C2=A0	if (number_tiles =3D=3D 0)
> =C2=A0		return ERR_PTR(-ENODATA);
> =C2=A0
> -	for_each_tile(tile, vm->xe, id)
> -		n_fence +=3D (1 + XE_MAX_GT_PER_TILE);
> +	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
> +		for_each_tile(tile, vm->xe, id)
> +			++n_fence;
> +	} else {
> +		for_each_tile(tile, vm->xe, id)
> +			n_fence +=3D (1 + XE_MAX_GT_PER_TILE);
> +	}
> =C2=A0
> =C2=A0	fences =3D kmalloc_array(n_fence, sizeof(*fences),
> GFP_KERNEL);
> =C2=A0	if (!fences) {
> @@ -3153,6 +3160,9 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
> =C2=A0
> =C2=A0collect_fences:
> =C2=A0		fences[current_fence++] =3D fence ?:
> dma_fence_get_stub();
> +		if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)
> +			continue;
> +
> =C2=A0		xe_migrate_job_lock(tile->migrate, q);
> =C2=A0		for_each_tlb_inval(i)
> =C2=A0			fences[current_fence++] =3D
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 542dbe2f9310..3766dc37b3ad 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -466,6 +466,7 @@ struct xe_vma_ops {
> =C2=A0#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> =C2=A0#define XE_VMA_OPS_FLAG_MADVISE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(1)
> =C2=A0#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> =C2=A0	u32 flags;
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0	/** @inject_error: inject error to test error handling */

