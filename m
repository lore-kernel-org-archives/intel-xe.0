Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8973CD41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 10:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05910E19E;
	Mon, 15 Dec 2025 10:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bO1aRGHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A732B10E19E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793884; x=1797329884;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+raHULuNBZqjaxqT85WLaTgFY0PKZ5tawT0kVF9tbdI=;
 b=bO1aRGHePdE5OBOfjLjn9PtV2HkX4cW4p6lgPhE1kSbhp9YJqtto1gzr
 7J4fY0D7VymKnHh2yuB87+lpTB/PatwOTjzY/MbqKlTlexvTQctsIe2iP
 k1kZRinuZmd7OvbtIU0RICk1As98B6vPLJBYtU741/tXF+xEV0bpwJL5a
 HA/1Oq9i3cp65SCHxe8ZitbL+zrRgWnD0FT/Bo8Z92W4lggND/BP3ujBo
 bWo/ziG3ke2kS/qgX6dmmq3/dFsutPSudR4F91Qtt/z8GIJdZl7624lnG
 FTIrecBbUoq2fySPGms6K2P/kPKGytZsqtbeqoZC0mCqPDFikyxQmswuc A==;
X-CSE-ConnectionGUID: M7OJqFfxTk+KScgUwYRBEQ==
X-CSE-MsgGUID: H1c5UmecQcKq2F0SitRnsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67628679"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67628679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:18:03 -0800
X-CSE-ConnectionGUID: RQzcSkbXQqS/OWU1LRuf1Q==
X-CSE-MsgGUID: qw0msL13QM60hQ9vRymQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197959404"
Received: from zzombora-mobl1 (HELO [10.245.244.10]) ([10.245.244.10])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:18:02 -0800
Message-ID: <be77dc73a4a164f0676d35cc397f45fda24d0085.camel@linux.intel.com>
Subject: Re: [PATCH v2 6/7] drm/xe: Add GT stats ktime helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 11:17:59 +0100
In-Reply-To: <20251212182847.1683222-7-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-7-matthew.brost@intel.com>
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

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> Normalize GT stats that record execution periods in code paths by
> adding helpers to perform the ktime calculation. Use these helpers in
> the SVM code.
>=20
> Suggested-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_stats.h | 33
> +++++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 ++++=
+++++-------------------
> =C2=A02 files changed, 41 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h
> b/drivers/gpu/drm/xe/xe_gt_stats.h
> index e8aea32bc971..456782f23f39 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -6,6 +6,8 @@
> =C2=A0#ifndef _XE_GT_STATS_H_
> =C2=A0#define _XE_GT_STATS_H_
> =C2=A0
> +#include <linux/ktime.h>
> +
> =C2=A0#include "xe_gt_stats_types.h"
> =C2=A0
> =C2=A0struct xe_gt;
> @@ -21,6 +23,35 @@ xe_gt_stats_incr(struct xe_gt *gt, const enum
> xe_gt_stats_id id,
> =C2=A0		 int incr)
> =C2=A0{
> =C2=A0}
> -

Unrelated change

With that fixed,=20
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> =C2=A0#endif
> +
> +/**
> + * xe_gt_stats_ktime_us_delta() - Get delta in microseconds between
> now and a
> + * start time
> + * @start: Start time
> + *
> + * Helper for GT stats to get delta in microseconds between now and
> a start
> + * time, compiles out if GT stats are disabled.
> + *
> + * Return: Delta in microseconds between now and a start time
> + */
> +static inline s64 xe_gt_stats_ktime_us_delta(ktime_t start)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> +		ktime_us_delta(ktime_get(), start) : 0;
> +}
> +
> +/**
> + * xe_gt_stats_ktime_get() - Get current ktime
> + *
> + * Helper for GT stats to get current ktime, compiles out if GT
> stats are
> + * disabled.
> + *
> + * Return: Get current ktime
> + */
> +static inline ktime_t xe_gt_stats_ktime_get(void)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> +}
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 46977ec1e0de..93550c7c84ac 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -176,24 +176,13 @@ xe_svm_range_notifier_event_end(struct xe_vm
> *vm, struct drm_gpusvm_range *r,
> =C2=A0						=C2=A0=C2=A0 mmu_range);
> =C2=A0}
> =C2=A0
> -static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> -		ktime_us_delta(ktime_get(), start) : 0;
> -}
> -
> =C2=A0static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_=
t
> start)
> =C2=A0{
> -	s64 us_delta =3D xe_svm_stats_ktime_us_delta(start);
> +	s64 us_delta =3D xe_gt_stats_ktime_us_delta(start);
> =C2=A0
> =C2=A0	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> us_delta);
> =C2=A0}
> =C2=A0
> -static ktime_t xe_svm_stats_ktime_get(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> -}
> -
> =C2=A0static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *notif=
ier,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range)
> @@ -202,7 +191,7 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0	struct xe_device *xe =3D vm->xe;
> =C2=A0	struct drm_gpusvm_range *r, *first;
> =C2=A0	struct xe_tile *tile;
> -	ktime_t start =3D xe_svm_stats_ktime_get();
> +	ktime_t start =3D xe_gt_stats_ktime_get();
> =C2=A0	u64 adj_start =3D mmu_range->start, adj_end =3D mmu_range->end;
> =C2=A0	u8 tile_mask =3D 0, id;
> =C2=A0	long err;
> @@ -442,7 +431,7 @@ static void xe_svm_copy_us_stats_incr(struct
> xe_gt *gt,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t start)
> =C2=A0{
> -	s64 us_delta =3D xe_svm_stats_ktime_us_delta(start);
> +	s64 us_delta =3D xe_gt_stats_ktime_us_delta(start);
> =C2=A0
> =C2=A0	if (dir =3D=3D XE_SVM_COPY_TO_VRAM) {
> =C2=A0		switch (npages) {
> @@ -494,7 +483,7 @@ static int xe_svm_copy(struct page **pages,
> =C2=A0	u64 vram_addr =3D XE_VRAM_ADDR_INVALID;
> =C2=A0	int err =3D 0, pos =3D 0;
> =C2=A0	bool sram =3D dir =3D=3D XE_SVM_COPY_TO_SRAM;
> -	ktime_t start =3D xe_svm_stats_ktime_get();
> +	ktime_t start =3D xe_gt_stats_ktime_get();
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * This flow is complex: it locates physically contiguous
> device pages,
> @@ -986,7 +975,7 @@ static void
> xe_svm_range_##elem##_us_stats_incr(struct xe_gt *gt, \
> =C2=A0						struct xe_svm_range
> *range, \
> =C2=A0						ktime_t start) \
> =C2=A0{ \
> -	s64 us_delta =3D xe_svm_stats_ktime_us_delta(start); \
> +	s64 us_delta =3D xe_gt_stats_ktime_us_delta(start); \
> =C2=A0\
> =C2=A0	switch (xe_svm_range_size(range)) { \
> =C2=A0	case SZ_4K: \
> @@ -1031,7 +1020,7 @@ static int __xe_svm_handle_pagefault(struct
> xe_vm *vm, struct xe_vma *vma,
> =C2=A0	struct drm_pagemap *dpagemap;
> =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> =C2=A0	int migrate_try_count =3D ctx.devmem_only ? 3 : 1;
> -	ktime_t start =3D xe_svm_stats_ktime_get(), bind_start,
> get_pages_start;
> +	ktime_t start =3D xe_gt_stats_ktime_get(), bind_start,
> get_pages_start;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&vm->lock);
> @@ -1070,7 +1059,7 @@ static int __xe_svm_handle_pagefault(struct
> xe_vm *vm, struct xe_vma *vma,
> =C2=A0
> =C2=A0	if (--migrate_try_count >=3D 0 &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 xe_svm_range_needs_migrate_to_vram(range, vma,
> !!dpagemap || ctx.devmem_only)) {
> -		ktime_t migrate_start =3D xe_svm_stats_ktime_get();
> +		ktime_t migrate_start =3D xe_gt_stats_ktime_get();
> =C2=A0
> =C2=A0		/* TODO : For multi-device dpagemap will be used to
> find the
> =C2=A0		 * remote tile and remote device. Will need to
> modify
> @@ -1107,7 +1096,7 @@ static int __xe_svm_handle_pagefault(struct
> xe_vm *vm, struct xe_vma *vma,
> =C2=A0	}
> =C2=A0
> =C2=A0get_pages:
> -	get_pages_start =3D xe_svm_stats_ktime_get();
> +	get_pages_start =3D xe_gt_stats_ktime_get();
> =C2=A0
> =C2=A0	range_debug(range, "GET PAGES");
> =C2=A0	err =3D xe_svm_range_get_pages(vm, range, &ctx);
> @@ -1134,7 +1123,7 @@ static int __xe_svm_handle_pagefault(struct
> xe_vm *vm, struct xe_vma *vma,
> =C2=A0	xe_svm_range_get_pages_us_stats_incr(gt, range,
> get_pages_start);
> =C2=A0	range_debug(range, "PAGE FAULT - BIND");
> =C2=A0
> -	bind_start =3D xe_svm_stats_ktime_get();
> +	bind_start =3D xe_gt_stats_ktime_get();
> =C2=A0	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct
> xe_val_flags) {}, err) {
> =C2=A0		err =3D xe_vm_drm_exec_lock(vm, &exec);
> =C2=A0		drm_exec_retry_on_contention(&exec);

