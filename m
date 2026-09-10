Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3174FC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FD210E274;
	Thu, 10 Sep 2026 11:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nTw7XZSa";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DD810E274
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 11:27:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D520843F8E;
 Thu, 10 Sep 2026 11:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BE71F00893;
 Thu, 10 Sep 2026 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789039673;
 bh=/nsYjcn8S7202k5/ADSwlw0tiFAx8M7ZhNOcB7egieI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nTw7XZSaDkNqRbhRjNGHjNk5PMaX33KSiRrJpnY1YFroT6wHJH9ppIWAPlCozFdnb
 6tOyYrjhUV5/vL457WleTv3Ej/c5HMh7WzwCrzO+ITSB7IsNm4lWA4Tv21KLz+c4xX
 Sp+LCJnCrsahKNE84rtMVPQNkSjTTXJU2F1aZvV34e7L6jgcTlR6QtqJw4ALrvdhhx
 XrM2haK41vdSaxjAopNfDQAKU/KrPeBqcjB5R0Jhq4gM1kR+dnuDpYf7N5bjE4VLov
 N/21Bh8AU67ozBeJ4fV3fhIAgh8lXYNhQ2yEbe9X2EwHq3kUdDCNGFULZ4IlWhQq3P
 SYMaESS6VoRAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] [CI-ONLY][DONOT-REVIEW] Access counter squash
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910111204.1708465-2-himal.prasad.ghimiray@intel.com>
References: <20260910111204.1708465-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 11:27:53 +0000
Message-Id: <20260910112753.97BE71F00893@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Access counter events for SVM ranges that cannot be migrated to VR=
AM will cause an infinite AC interrupt storm because the driver fails to se=
t the No-Count (NC) bit to silence the hardware.
- [High] Incorrect virtual address calculation in xe_guc_access_counter_pag=
e_va discards the sub-granule index, incorrectly shifting the entire access=
 counter window.
- [High] XE_VMA_MIGRATE_ON_ACC flag suppresses mandatory migrations for dev=
ice atomics and ignores explicit madvise preferred locations.
- [High] Returning -ENOSPC for a full advisory access counter queue trigger=
s a fatal GPU reset.
- [High] Use-after-free of pagefault_wq due to teardown asymmetry between w=
orkqueue destruction and GuC CT disablement.
- [High] Access counter triggers on non-migratable SVM ranges fail with -EA=
CCES instead of being gracefully skipped, due to unreachable code.
- [High] Overlapping bitmask definitions for ACC_GRANULARITY and ACC_VIRTUA=
L_ADDR_RANGE_LO cause virtual address corruption and incorrect granularity =
values.
--

commit d8aa5e34df6118bc5e5f7ead213c84de95b73180
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Access counter squash

This commit implements the Xe access counter mechanism for tracking memory
access frequency and migrating hot regions to VRAM. It sets up the access
counter queue, adds the GuC to host notification handler, and modifies the
SVM page fault handler to service access counter triggers.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -997,6 +998,10 @@ int xe_device_probe(struct xe_device *xe)
>  	err =3D xe_pagefault_init(xe);
>  	if (err)
>  		return err;
> +
> +	err =3D xe_access_counter_init(xe);
> +	if (err)
> +		return err;

[Severity: High]
Will this initialization order lead to a use-after-free during teardown?

Since xe_pagefault_init() occurs before xe_access_counter_init(), its
corresponding teardown will destroy pagefault_wq before the GuC CT is
disabled. If an access counter notification arrives during this window,
the handler will attempt to queue work on the destroyed pagefault_wq.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/=
xe_access_counter.c
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

[Severity: High]
Could this dereference the freed pagefault_wq during device removal?

As noted regarding the initialization order, a pending access counter
notification received while the driver unbinds might reach this point
after pagefault_wq has already been destroyed.

> +	} else {
> +		drm_warn(&xe->drm,
> +			 "AccessCounter Queue full, shouldn't be possible\n");
> +	}
> +	spin_unlock_irqrestore(&ac_queue->lock, flags);
> +
> +	return full ? -ENOSPC : 0;

[Severity: High]
Does returning -ENOSPC for a full advisory queue trigger a fatal GPU reset?

This error propagates back to process_g2h_msg(), which interprets a
non-zero return as a fatal error and calls CT_DEAD. If a heavy workload
temporarily fills the queue, it seems this will wedge the device instead
of gracefully dropping the hint.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm=
/xe/xe_guc_access_counter.c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
> @@ -0,0 +1,74 @@
[ ... ]
> +static u64 xe_guc_access_counter_page_va(struct xe_device *xe, u64 addr,=
 u8 gran)
> +{
> +	u64 gran_size =3D xe_access_counter_granularity_to_size(gran);
> +	u64 sub_gran_size =3D gran_size / 32;
> +	u64 region_base =3D ALIGN_DOWN(addr, gran_size);
> +	u64 offset_in_subchunk =3D addr & (sub_gran_size - 1);
> +	u64 page_va =3D region_base + offset_in_subchunk;

[Severity: High]
Does this math inadvertently drop the active sub-chunk index?

By masking the address with (sub_gran_size - 1), it strips out the
sub-granule offset. This will incorrectly shift the entire search
window backwards in the virtual address space.

> +
> +	xe_dbg(xe, "gran_size =3D %llx, addr =3D =3D %llx, region_base =3D %llx=
, page_va=3D%llx\n",
> +	       gran_size, addr, region_base, page_va);
> +	return page_va;
> +}
[ ... ]
> +int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
[ ... ]
> +	ac.consumer.counter_type =3D FIELD_GET(ACC_TYPE, msg[0]);
> +	if (ac.consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> +		return -EINVAL;
> +
> +	addr =3D ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
> +		(msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);

[Severity: High]
Does extracting the address with ACC_VIRTUAL_ADDR_RANGE_LO unintentionally
mix the granularity bits into the address?

Because the ACC_VIRTUAL_ADDR_RANGE_LO and ACC_GRANULARITY masks overlap,
this operation corrupts the virtual address by injecting the granularity
value into it.

> +	ac.consumer.page_va =3D xe_guc_access_counter_page_va(xe, addr, ac.cons=
umer.granularity);
> +	ac.gran_end =3D ac.consumer.page_va +
> +		      xe_access_counter_granularity_to_size(ac.consumer.granularity);

[Severity: High]
Will this boundary calculation use the corrupted start address from
xe_guc_access_counter_page_va() and shift the search window out of alignmen=
t?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
[ ... ]
> @@ -1753,6 +1754,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u3=
2 *msg, u32 len)
[ ... ]
>  	if (ret) {
>  		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>  			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}

[Severity: High]
When xe_guc_access_counter_handler() returns -ENOSPC due to a full queue,
does this block inadvertently trigger a fatal GPU reset?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc=
_fwif.h
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
[ ... ]
> +	u32 dw2;
> +#define ACC_VIRTUAL_ADDR_RANGE_LO	GENMASK(31, 12)
> +#define ACC_GRANULARITY	GENMASK(22, 20)

[Severity: High]
Do these bitmasks overlap?

Both masks cover bits 20-22, which causes the address reconstruction in
xe_guc_access_counter_handler() to mix granularity data into the
virtual address.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -862,6 +862,27 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma=
 *vma,
[ ... ]
> +	if (range) {
> +		/*
> +		 * Always set NC (no-count) on VRAM PTEs for SVM ranges so
> +		 * this GPU does not generate access counter events for memory
> +		 * it is already responsible for.  Today default_vram_pte
> +		 * covers only local VRAM; once UAL lands, remote-device VRAM
> +		 * pages will also flow through default_vram_pte =E2=80=94 NC remains
> +		 * the right setting there too, as the owning device handles
> +		 * AC for its own local memory.  Update this comment when UAL
> +		 * support is added and adjust if the semantics change.
> +		 */
> +		xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_NC;
> +		if (!xe_svm_range_allowed_in_devmem(range))
> +			xe_walk.default_system_pte |=3D XE_PPGTT_PTE_NC;

[Severity: High]
Could this logic omit the No-Count (NC) bit for un-migratable SVM ranges?

If a sub-64K range triggers an event on a platform that does not support
4K migration, xe_svm_range_allowed_in_devmem() remains true, so the NC
bit is not set here. The migration itself is skipped in
__xe_svm_range_setup(), leaving the hardware free to repeatedly trigger
access counter events for this same range, creating an interrupt storm.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1369,13 +1369,32 @@ static int __xe_svm_handle_pagefault(struct xe_vm=
 *vm, struct xe_vma *vma,
[ ... ]
>  	/* READ_ONCE pairs with WRITE_ONCE in drm_gpusvm_range_set_unmapped() */
>  	range_flags.__flags =3D READ_ONCE(range->base.flags.__flags);
>  	if (ctx.devmem_only && !range_flags.migrate_devmem) {
>  		err =3D -EACCES;
>  		goto err_out;
>  	}

[Severity: High]
Does this early error check prevent access counters from gracefully skipping
non-migratable ranges?

Because an access counter trigger sets ctx.devmem_only =3D true, encounteri=
ng
a non-migratable range here returns -EACCES. This aborts the worker for the
entire granularity window and prevents the graceful skip at the goto out
below, silently ignoring any other hot VMAs in the same window.

> =20
>  	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
>  		xe_svm_range_valid_fault_count_stats_incr(gt, range);
[ ... ]
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

[Severity: High]
Is this intended graceful exit actually dead code?

As mentioned above, the earlier check for !range_flags.migrate_devmem
already aborts the function with -EACCES before reaching this point.

> =20
> +	/*
> +	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
> +	 * counters: skip the eager migrate on a normal page fault, but still
> +	 * migrate when this setup was itself triggered by an AC event.
> +	 */
>  	if (--migrate_try_count >=3D 0 &&
> +	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {

[Severity: High]
Does checking XE_VMA_MIGRATE_ON_ACC here suppress mandatory migrations?

If userspace passes DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER but then
issues a device atomic operation (requiring VRAM) or sets an explicit
madvise preferred location, this check short-circuits. Skipping eager
migration in these cases violates UAPI guarantees for atomics and madvise.

Additionally, when an access counter event triggers for a range that is
un-migratable (e.g. sub-64K size), xe_svm_range_needs_migrate_to_vram()
returns false. This skips migration but takes no action to prevent further
access counter triggers for this range, contributing to the interrupt storm
issue mentioned earlier in xe_pt_stage_bind().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910111204.1708=
465-2-himal.prasad.ghimiray@intel.com?part=3D1
