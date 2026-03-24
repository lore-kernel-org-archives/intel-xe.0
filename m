Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F6F54AC1
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388910E6E8;
	Tue, 24 Mar 2026 14:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wm/T+wZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387EB10E6E8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774361628; x=1805897628;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9+YaDTr7ReEO15DmtCqeOKNWDqpKS0oJoMXwqd+bu+A=;
 b=Wm/T+wZftutKEumT2iLb6u7a690jArdMuT+lJYXjy2t5Y83IxO43ZKoL
 XwRNGZM4owUnrjxuSe1dK2QbYVYb+0mEfPyF9sgjLcnQd6G413F8Temc2
 HF12sa3fFht5rdKLrP7dvdyTCBVWR4t/4P0W2GWkyg0DeOP0Re+RXolos
 GYdh5PpNfdxlpPjVJCXXSbUZejzLqnSwRUiWzVMEdBDZFqGVkGTL+Hcoi
 GzZLiNd1r5oVsRD4mmWhB+paNAXIof4WnfHfp5ccI6u+WQ3BbaDCa5QoH
 21tUG9kqh61SLcCqQEYxnmyUYg4JoydjKRdxV4tCsSPCmvCkbaLLDDn7S Q==;
X-CSE-ConnectionGUID: Zw+x5RKqQaaWWoTY228yJQ==
X-CSE-MsgGUID: itstywEwSnSIOdFgeFr5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100823839"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100823839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:13:48 -0700
X-CSE-ConnectionGUID: nz0E2fJXTTKMTOhf+hJ9jA==
X-CSE-MsgGUID: n6+WaqpKTwWoyP+fla20EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229113087"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.208])
 ([10.245.244.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:13:45 -0700
Message-ID: <09f09c546971b217caef004e20deadd9bff32b2f.camel@linux.intel.com>
Subject: Re: [PATCH v7 07/12] drm/xe/madvise: Block imported and exported
 dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 24 Mar 2026 15:13:43 +0100
In-Reply-To: <20260323093106.2986900-8-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-8-arvind.yadav@intel.com>
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
> Prevent marking imported or exported dma-bufs as purgeable.
> External devices may be accessing these buffers without our
> knowledge, making purging unsafe.
>=20
> Check drm_gem_is_imported() for buffers created by other
> drivers and obj->dma_buf for buffers exported to other
> drivers. Silently skip these BOs during madvise processing.
>=20
> This follows drm_gem_shmem's purgeable implementation and
> prevents data corruption from purging actively-used shared
> buffers.
>=20
> v3:
> =C2=A0=C2=A0 - Addresses review feedback from Matt Roper about handling
> =C2=A0=C2=A0=C2=A0=C2=A0 imported/exported BOs correctly in the purgeable=
 BO
> =C2=A0=C2=A0=C2=A0=C2=A0 implementation.
>=20
> v4:
> =C2=A0=C2=A0 - Check should be add to xe_vm_madvise_purgeable_bo.
>=20
> v5:
> =C2=A0=C2=A0 - Rename xe_bo_is_external_dmabuf() to xe_bo_is_dmabuf_share=
d()
> =C2=A0=C2=A0=C2=A0=C2=A0 for clarity (Thomas)
> =C2=A0=C2=A0 - Update comments to clarify why both imports and exports
> =C2=A0=C2=A0=C2=A0=C2=A0 are unsafe to purge.
>=20
> v6:
> =C2=A0 - No PTEs to zap for shared dma-bufs.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 38
> ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index ed1940da7739..340e83764a76 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -185,6 +185,34 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +
> +/**
> + * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
> + * @bo: Buffer object
> + *
> + * Prevent marking imported or exported dma-bufs as purgeable.
> + * For imported BOs, Xe doesn't own the backing store and cannot
> + * safely reclaim pages (exporter or other devices may still be
> + * using them). For exported BOs, external devices may have active
> + * mappings we cannot track.
> + *
> + * Return: true if BO is imported or exported, false otherwise
> + */
> +static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
> +{
> +	struct drm_gem_object *obj =3D &bo->ttm.base;
> +
> +	/* Imported: exporter owns backing store */
> +	if (drm_gem_is_imported(obj))
> +		return true;
> +
> +	/* Exported: external devices may be accessing */
> +	if (obj->dma_buf)
> +		return true;
> +
> +	return false;
> +}
> +
> =C2=A0/**
> =C2=A0 * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> =C2=A0 *
> @@ -234,6 +262,10 @@ static enum xe_bo_vmas_purge_state
> xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> =C2=A0
> =C2=A0	xe_bo_assert_held(bo);
> =C2=A0
> +	/* Shared dma-bufs cannot be purgeable */
> +	if (xe_bo_is_dmabuf_shared(bo))
> +		return XE_BO_VMAS_STATE_WILLNEED;
> +
> =C2=A0	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> =C2=A0		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> =C2=A0			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> @@ -335,6 +367,12 @@ static void __maybe_unused
> madvise_purgeable(struct xe_device *xe,
> =C2=A0		/* BO must be locked before modifying madv state */
> =C2=A0		xe_bo_assert_held(bo);
> =C2=A0
> +		/* Skip shared dma-bufs - no PTEs to zap */
> +		if (xe_bo_is_dmabuf_shared(bo)) {
> +			vmas[i]->skip_invalidation =3D true;
> +			continue;
> +		}
> +
> =C2=A0		/*
> =C2=A0		 * Once purged, always purged. Cannot transition
> back to WILLNEED.
> =C2=A0		 * This matches i915 semantics where purged BOs are
> permanently invalid.
