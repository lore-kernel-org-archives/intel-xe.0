Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0080FE9B269
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 14:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D3310E58C;
	Tue, 24 Feb 2026 14:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTn3MgjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EE110E58C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771942530; x=1803478530;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rhZpYWRcnYuVFWtfjfzAeun0wD/ROTRmBl1ES7WLn4I=;
 b=YTn3MgjNu7LoCqZLg/Rc6JyIPxgQqtE72jYWEYNzLqfsncdOmm2PLomi
 59DmiLETrtLlqysrXwMBT8CkpeVvHenEy+BngiaOuODludtEpCVInO+uZ
 aJMLcGwfOz4TJGYDlGMk5ar9VRqe8twe+W7HKmY+IXAQM8+DOqp9eFu7o
 x1uzH1VhvIQ189q0xyhS2HD3BZzUttZjSUCVw6aYmTWdarQtcxGAY9zTY
 1D9xjSiUXgtHuf7UxZGp417kryUnzaE0Tu8HV+EHtJAwkktVBwFd/m1Sq
 K73PXIt8hzVtkJJ72WafsGsKHhCg8zPr2eSUBB8KJEEzD1/+chd/X4KIH g==;
X-CSE-ConnectionGUID: 3ulqLYWLTKqHMHXACAZK0w==
X-CSE-MsgGUID: ChAt9z/GR7urAAlHxJXNgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72831359"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72831359"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:15:30 -0800
X-CSE-ConnectionGUID: jJ554VtQShOAE77IfdvbPQ==
X-CSE-MsgGUID: 5wGSQMeKR1WmuSsX4lvAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246488751"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:15:28 -0800
Message-ID: <a221b642ba435c6a203e79e114544df7b815fde5.camel@linux.intel.com>
Subject: Re: [PATCH v5 7/9] drm/xe/madvise: Block imported and exported
 dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 24 Feb 2026 15:15:26 +0100
In-Reply-To: <20260211152644.1661165-8-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-8-arvind.yadav@intel.com>
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

On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 35
> ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c184426546a2..8d55ea78b6d1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -184,6 +184,33 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
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

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


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
> =C2=A0 * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked
> DONTNEED
> =C2=A0 * @bo: Buffer object
> @@ -204,6 +231,10 @@ static bool xe_bo_all_vmas_dontneed(struct xe_bo
> *bo)
> =C2=A0
> =C2=A0	xe_bo_assert_held(bo);
> =C2=A0
> +	/* Shared dma-bufs cannot be purgeable */
> +	if (xe_bo_is_dmabuf_shared(bo))
> +		return false;
> +
> =C2=A0	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> =C2=A0		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> =C2=A0			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> @@ -304,6 +335,10 @@ static void __maybe_unused
> madvise_purgeable(struct xe_device *xe,
> =C2=A0		/* BO must be locked before modifying madv state */
> =C2=A0		xe_bo_assert_held(bo);
> =C2=A0
> +		/* Skip shared dma-bufs */
> +		if (xe_bo_is_dmabuf_shared(bo))
> +			continue;
> +
> =C2=A0		/*
> =C2=A0		 * Once purged, always purged. Cannot transition
> back to WILLNEED.
> =C2=A0		 * This matches i915 semantics where purged BOs are
> permanently invalid.
