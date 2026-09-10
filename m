Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71EAC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 10:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F010E5D6;
	Thu, 10 Sep 2026 10:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E0xySe33";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470DA10E5D6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 10:35:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A030601EF;
 Thu, 10 Sep 2026 10:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A5B1F000FF;
 Thu, 10 Sep 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789036520;
 bh=6HHAnzJmbZcjH3ZaBbS23CrMuQDhDQsGHpFaKfeNaxc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E0xySe333SqG5eWRJ2KQaQqe2FVtHxOlmqxdO2Ep0itHBr+z6U5v+/xcut80RtuxE
 5uCU3rojoM86lwgBFrd9wcGg5VKKOuK+qEAPMh+rtZb+R8FxTvaPKPVggHD6Mc9KRA
 9Q+MS/1fdStXhadAym2weaT7eUIL8ceEob4wCal3/66YXm/r0z6CZ6isCOuzJrJ4Bm
 H3r30r6Xs05+nbYeWpaSuWv0Xnbh2hMH8O+ssvR6thm/0119yEwlo7JW1ctAGgu6Mo
 rjml96ir2vWvyuMpy7Y6Ve8P4Yl2oqc5fxf/XNY5o+KFAdO17oWfr2fGULv6CNsWEV
 WxJ3lbXmkz6/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] [CI-ONLY][DONOT-REVIEW] Access counter squash
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910102400.1652246-2-himal.prasad.ghimiray@intel.com>
References: <20260910102400.1652246-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:35:19 +0000
Message-Id: <20260910103519.E1A5B1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Leaked `drm_gpusvm_range` reference due to empty `xe_svm_range_put=
()` stub.
- [High] MIGRATE_ON_ACCESS_COUNTER unconditionally blocks required VRAM mig=
rations, breaking device atomics.
- [High] Advisory access counter queue overflow crashes the GuC CT (GPU res=
et).
- [Medium] Incorrect page_va calculation masks out the subchunk index, corr=
upting the access counter window boundaries.
- [Medium] Dead code and premature `-EACCES` abort in SVM range setup for a=
ccess counters.
--

commit 8ecf8e94242179d64ad6f6e867a90856cd275a2f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Access counter squash

This patch introduces access counter infrastructure for Xe, including USM
queue processing, GuC CT handlers, and SVM integration for page migration.

> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/=
xe_access_counter.c
> new file mode 100644
> index 0000000000000..ed1ed6091ac5b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c

[ ... ]

> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_cou=
nter *ac)
> +{
> +	struct xe_usm_queue *ac_queue =3D &xe->usm.ac_queue;
> +	int idx;
> +	unsigned long flags;
> +	bool full;
> +
> +	spin_lock_irqsave(&ac_queue->lock, flags);
> +	idx =3D xe_access_counter_work_index(xe);
> +	full =3D xe_usm_queue_full(ac_queue);
> +	if (!full) {
> +		xe_usm_queue_push(ac_queue, ac);
> +		queue_work(xe->usm.pagefault_wq, &xe->usm.ac_workers[idx].work);
> +	} else {
> +		drm_warn(&xe->drm,
> +			 "AccessCounter Queue full, shouldn't be possible\n");
> +	}
> +	spin_unlock_irqrestore(&ac_queue->lock, flags);
> +
> +	return full ? -ENOSPC : 0;
> +}

[Severity: High]
Does this cause an unnecessary GPU reset on advisory queue overflow?

If xe_access_counter_handler() returns -ENOSPC because the 128-entry
advisory queue is full, that error propagates up to process_g2h_msg()
via xe_guc_access_counter_handler().=20

In process_g2h_msg() in xe_guc_ct.c, a non-zero return value triggers
CT_DEAD(), which forces a GPU reset:

process_g2h_msg() {
    ...
    if (ret) {
        xe_gt_err(gt, "G2H action %#04x failed...");
        CT_DEAD(ct, NULL, PROCESS_FAILED);
    }
}

Since access counter events are purely advisory, could we safely ignore
the -ENOSPC error rather than crashing the GuC CT?

> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm=
/xe/xe_guc_access_counter.c
> new file mode 100644
> index 0000000000000..7e9b835e1ed67
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c

[ ... ]

> +static u64 xe_guc_access_counter_page_va(struct xe_device *xe, u64 addr,=
 u8 gran)
> +{
> +	u64 gran_size =3D xe_access_counter_granularity_to_size(gran);
> +	u64 sub_gran_size =3D gran_size / 32;
> +	u64 region_base =3D ALIGN_DOWN(addr, gran_size);
> +	u64 offset_in_subchunk =3D addr & (sub_gran_size - 1);
> +	u64 page_va =3D region_base + offset_in_subchunk;

[Severity: Medium]
Does this calculation drop the subchunk index from the starting virtual
address?

By doing addr & (sub_gran_size - 1), offset_in_subchunk only retains the
offset within the subchunk itself. The bits representing the subchunk
index (between sub_gran_size and gran_size) are masked out.

This causes page_va to point to the wrong virtual address, and subsequently
shifts the entire access counter window when xe_guc_access_counter_handler()
computes gran_end =3D page_va + gran_size. Should this preserve the full
offset within the granularity window?

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 6c3033fc4db73..2aafeedf05147 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c

[ ... ]

> @@ -1331,13 +1369,32 @@ static int __xe_svm_handle_pagefault(struct xe_vm=
 *vm, struct xe_vma *vma,
> =20
>  	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
>  		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> -		range_debug(range, "PAGE FAULT - VALID");
> +		range_debug(range, acc_ctr_trigger ?
> +			    "ACCESS COUNTER TRIGGERED - VALID" :
> +			    "PAGE FAULT - VALID");
>  		goto out;
>  	}
> =20
> -	range_debug(range, "PAGE FAULT");
> +	range_debug(range, acc_ctr_trigger ?
> +		    "ACCESS COUNTER TRIGGERED" : "PAGE FAULT");
> +
> +	/*
> +	 * AC-triggered setup: if the range is already in device memory a
> +	 * rebind is all that's needed.  Otherwise proceed to the
> +	 * migration path =E2=80=94 with no explicit madvise preferred location=
, the
> +	 * default first-touch-then-migrate-on-hot policy applies and we
> +	 * should attempt VRAM placement for this hot range.
> +	 */
> +	if (acc_ctr_trigger && !range_flags.migrate_devmem)
> +		goto out;

[Severity: Medium]
Is this goto out unreachable due to an earlier check in this function?

Earlier in __xe_svm_range_setup, there is this block:

	range_flags.__flags =3D READ_ONCE(range->base.flags.__flags);
	if (ctx.devmem_only && !range_flags.migrate_devmem) {
		err =3D -EACCES;
		goto err_out;
	}

For access counter triggers, ctx.devmem_only is set to true. If the range
does not have migrate_devmem set, the earlier block will catch it and
return -EACCES.

Returning -EACCES propagates to xe_access_counter_service(), which will
abort and discard any remaining VMAs in the advisory window instead of
gracefully skipping the non-migratable range. Could this be adjusted so
access counter hints gracefully skip non-migratable memory?

> +
> +	/*
> +	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
> +	 * counters: skip the eager migrate on a normal page fault, but still
> +	 * migrate when this setup was itself triggered by an AC event.
> +	 */
>  	if (--migrate_try_count >=3D 0 &&
> +	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {

[Severity: High]
Does this condition block required VRAM migrations for device atomics?

If userspace combines device atomics with the
DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER flag, a normal page fault
(acc_ctr_trigger =3D=3D false) with an atomic requirement (need_vram =3D=3D=
 true)
will evaluate this condition to false.

Because the required xe_svm_alloc_vram() is skipped, the fault handler falls
back to xe_svm_range_get_pages() with ctx.devmem_only =3D true for system
memory pages. This fails with -EOPNOTSUPP, causing the fault to retry until
the attempt count is exhausted and fail entirely.

Should migrations required for correctness bypass the MIGRATE_ON_ACC flag?

> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 2ef4ef026ccdc..cfc6eb840ca08 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h

[ ... ]

> @@ -270,6 +284,11 @@ struct xe_svm_range {
>  	u32 tile_invalidated;
>  };
> =20
> +struct xe_svm_range_setup_flags {
> +	u32 atomic : 1;
> +	u32 acc_ctr_trigger : 1;
> +};
> +
>  static inline void xe_svm_range_put(struct xe_svm_range *range)
>  {
>  }

[Severity: High]
Does this empty stub lead to a memory leak of drm_gpusvm_range objects?

When an access counter notification is serviced in
xe_access_counter_service(), it calls xe_svm_range_find_first(), which
acquires a reference via drm_gpusvm_range_get().=20

After servicing, it attempts to release the reference by calling
xe_svm_range_put(range). Since this stub is empty and fails to call
drm_gpusvm_range_put(), does it continuously leak memory for heavily
accessed ranges in the hardware-generated event worker?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910102400.1652=
246-2-himal.prasad.ghimiray@intel.com?part=3D1
