Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA5C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE910E5FD;
	Thu, 10 Sep 2026 12:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iIKYfDm9";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F6C10E5FD
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:05:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E8664138F;
 Thu, 10 Sep 2026 12:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4175A1F000FF;
 Thu, 10 Sep 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789041902;
 bh=OMBHpuxSnG6koI5VxGnCM0JSVA7azUVctrQ4+dLNrqk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=iIKYfDm9Sdh4wFIlMoDv70ugz4pjUvoOtq6x1LhQYJKMJtDs8mDaCH37iQ+JYp3Iq
 K7j409curHd2bv0mCrruWIsbo9LQ9Q3NwmQfxHXGIafMZrksayIBAHgJB/BqFrxpA4
 YB2A3fkDHUZaXwHnnDOaT7jeMGdEKxZBoDpi6HEsRjZ/hYC8Awhx/mGir7VNpSffSI
 qn0PwWFNNYEg8pulb4j+ynPMlzP8yDtJ6j1udpvCBGet9uLJdw+WtL3Ih77UbWiGel
 QQGPg4EG1rsabudpD4Tx+xv0nBzddL4XXgnQfI7g8g5pcpCu25nbQAS5uTlboXbAfz
 hNJ41MHG0GQoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] [CI-ONLY][DONOT-REVIEW] Access counter squash
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910114407.1801795-2-himal.prasad.ghimiray@intel.com>
References: <20260910114407.1801795-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:05:01 +0000
Message-Id: <20260910120502.4175A1F000FF@smtp.kernel.org>
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
- [Critical] Returning -ENOSPC from `xe_access_counter_handler` when the qu=
eue is full causes a fatal GuC CT crash.
- [High] Incorrect calculation of `page_va` drops the sub-granularity index=
 and shifts the processing window.
- [High] Access counter events are silently dropped for non-faulting VMs be=
cause the handler strictly requires fault mode.
- [High] AC-triggered migrations for non-migratable ranges unconditionally =
fail with `-EACCES`, prematurely aborting the rest of the window.
- [High] Missing error check after `xe_vm_drm_exec_lock` allows rebind with=
out holding locks.
- [High] The `XE_VMA_MIGRATE_ON_ACC` flag incorrectly skips VRAM migration =
on first-touch for device atomics, causing an infinite fault loop.
- [Medium] Missing access counter queue reset during GT reset violates UAPI=
 documentation guarantees.
--

commit 3591a7b3a4219975acccb43af71c55d2243241d9
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Access counter squash

The commit introduces hardware access counters handling for the Xe driver. =
It
includes queue management, VM integration, SVM range setup based on counter=
s,
and user API extensions to control access counter parameters.

> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/=
xe_access_counter.c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
[ ... ]
> +static int xe_access_counter_service(struct xe_access_counter *ac)
> +{
[ ... ]
> +	vm =3D xe_device_asid_to_fault_vm(xe, ac->consumer.asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);

[Severity: High]
Does strict usage of xe_device_asid_to_fault_vm() here unintentionally drop
events for normal (non-SVM) buffer objects? xe_device_asid_to_fault_vm()
requires xe_vm_in_fault_mode(vm) to be true, but xe_vma_supports_access_ctr=
()
indicates access counters are also supported for standard VMs.

[ ... ]
> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_cou=
nter *ac)
> +{
[ ... ]
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

[Severity: Critical]
Is it safe to return -ENOSPC when the access counter queue is full? If this
error propagates to process_g2h_msg() in the GuC CT layer, it treats any
non-zero return value as a fatal error and calls CT_DEAD(), wedging the
device. Should we safely drop the event and return 0 instead of crashing the
GPU under heavy access counter loads?

> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm=
/xe/xe_guc_access_counter.c
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

[Severity: High]
Is this calculation for page_va correct? It extracts offset_in_subchunk usi=
ng
addr & (sub_gran_size - 1), but adding this directly to region_base discards
the higher bits of the subchunk index. Does this cause the sliding window
bounds [page_va, gran_end) to shift to unaligned addresses, corrupting the
migration target?

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> +static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
[ ... ]
> +	/* READ_ONCE pairs with WRITE_ONCE in drm_gpusvm_range_set_unmapped() */
> +	range_flags.__flags =3D READ_ONCE(range->base.flags.__flags);
> +	if (ctx.devmem_only && !range_flags.migrate_devmem) {
> +		err =3D -EACCES;
> +		goto err_out;
> +	}

[Severity: High]
Does this early check cause unintended failures for AC triggers? When trigg=
ered
by an AC event, ctx.devmem_only is forced to true. If this encounters a
non-migratable range, it returns -EACCES and aborts the entire window
iteration. Should this be safely skipped instead, since the code later tries
to handle if (acc_ctr_trigger && !range_flags.migrate_devmem) goto out;?

[ ... ]
> +	/*
> +	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
> +	 * counters: skip the eager migrate on a normal page fault, but still
> +	 * migrate when this setup was itself triggered by an AC event.
> +	 */
>  	if (--migrate_try_count >=3D 0 &&
> +	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {

[Severity: High]
Does applying the XE_VMA_MIGRATE_ON_ACC flag break device atomic accesses? =
If
a normal page fault is triggered for a device atomic operation, VRAM placem=
ent
is required for correctness. However, this condition suppresses VRAM migrat=
ion
on first-touch if MIGRATE_ON_ACC is set, causing an infinite fault loop when
xe_svm_range_get_pages() subsequently fails.

[ ... ]
> +	bind_start =3D xe_gt_stats_ktime_get();
> +	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {=
}, err) {
> +		err =3D xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +
> +		xe_vm_set_validation_exec(vm, &exec);
> +		fence =3D xe_vm_range_rebind(vm, vma, range, BIT(tile->id));

[Severity: High]
What happens if xe_vm_drm_exec_lock() fails with a non-contention error (li=
ke
-EINTR)? There doesn't seem to be an error check before calling
xe_vm_range_rebind(). Could this lead to VMA rebinding proceeding without
holding the necessary locks, causing use-after-free or data corruption?

> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
[ ... ]
> + * Access counter parameters cannot be removed or changed after the exec=
 queue
> + * is created.  During a GT reset the kernel squashes any in-flight acce=
ss
> + * counter notifications for that GT (pending work items are discarded),=
 but

[Severity: Medium]
The uAPI documentation for DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM
guarantees that in-flight access counter notifications are squashed during a
GT reset. I don't see a reset or squash hook in xe_access_counter.c to clear
xe->usm.ac_queue. Are stale access counter events persisting across GT rese=
ts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910114407.1801=
795-2-himal.prasad.ghimiray@intel.com?part=3D1
