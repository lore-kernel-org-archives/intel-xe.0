Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602C606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Oct 2026 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4ZDX45C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1260C10E3E2;
	Sat, 31 Oct 2026 00:04:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609F010E3E2
 for <intel-xe@lists.freedesktop.org>; Sat, 31 Oct 2026 00:04:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2845342ACC;
 Sat, 31 Oct 2026 00:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41011F000C1;
 Sat, 31 Oct 2026 00:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793405064;
 bh=iBCrtKfrG5RBYZwac88vAuiW3M1WRGVjghAPxK9p7Mw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=G4ZDX45Chij1EyOjb/mm34+GGaqUX0V4WpeY25T8SwRv+T9/lzcgGCJQxM79S00Cx
 EYf6JybcqmXFwsQsGgBSygC8IVHoH2yTdS1AVFedQOR257wXjrSGpKko55YiZyZsZK
 k1iskEgQjRnxkKVYWNovBqmHpqQ/QMsHJW55XJbL54FFxLCOTdSbeHuBeyVOL5bB/N
 uG5+cNh/95Gw4A39bhhsA7AeXpTPeJoyUXqocK8ySUtq82ZaOz/tc2nXx+BJEJ7GVW
 9OOtSMBYKl/eOooMlMOWzlGMLhbwN6YX9QAFk9yy5B+rbmMdzleGSA9xaepnVYhDtl
 emsSgY7sM7lGQ==
Message-ID: <sashiko-outbox-191663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030233839.2284694-8-umesh.nerlige.ramappa@intel.com>
References: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
 <20261030233839.2284694-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 00:04:23 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] drm/xe/oa: NULL deref and dummy page race in xe_oa_buffer_fault()
- [High] drm/xe/oa: race between in-flight observation ioctls and xe_oa_fin=
i()
- [High] drm/xe/oa: mapped OA BO left DMA-mapped and un-evicted in xe_oa_qu=
iesce()
- [High] drm/xe/oa: ungated xe_bo_vm_access() in xe_oa_vm_ops after quiesce
- [High] drm/xe/oa: unwaited LRI job in xe_oa_quiesce_oa_unit() races devre=
s teardown
--

commit 57d7033e8652d53b8521bba4a5103beb77f1ab8d
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit adds xe_oa_quiesce() to clean up active OA stream hardware state
and device-bound resources during driver unbind or PCI reset while keeping =
the
stream structure allocated until the file descriptor is closed. It also adds
stream->mmap_mutex to avoid a lock ordering inversion between mmap_lock and
stream_lock and introduces a per-GT quiesced flag to block new streams duri=
ng
teardown.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4916101fce541..f737ae4976a82 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -1731,8 +1775,11 @@ static vm_fault_t xe_oa_buffer_fault(struct vm_fau=
lt *vmf)
>  	 * Once the stream is dead its OA buffer may already be gone (or about
>  	 * to be). Refuse to (re-)install a PTE rather than letting the
>  	 * generic BO fault handler touch a buffer that's being torn down.
> +	 * drm_dev_unplug() zaps the mapping before the stream is marked dead,
> +	 * so also refuse once unplugged, the generic handler would install a
> +	 * dummy page.
>  	 */
> -	if (READ_ONCE(stream->dead))
> +	if (READ_ONCE(stream->dead) || drm_dev_is_unplugged(&stream->oa->xe->dr=
m))
>  		return VM_FAULT_SIGBUS;
> =20
>  	return xe_bo_cpu_fault(vmf);

[Severity: High]
As reported by Sashiko on v2 [1], can xe_oa_buffer_fault() dereference a NU=
LL
pointer or still install a dummy page when racing with device removal?

In drivers/gpu/drm/xe/xe_oa.c, xe_oa_buffer_fault() runs without holding
stream_lock, mmap_mutex, or gt_lock. If a fault evaluates
READ_ONCE(stream->dead) as false just before xe_oa_quiesce_oa_unit() sets
stream->dead =3D true, and xe_oa_fini() completes and sets oa->xe =3D NULL =
before
the second operand of the logical OR is evaluated:

    xe_oa_fini()
        xe_oa_quiesce(xe);
        ...
        oa->xe =3D NULL;

then &stream->oa->xe->drm evaluates to NULL (since drm is at offset 0 of
struct xe_device), and drm_dev_is_unplugged(NULL) calls drm_dev_enter(NULL,
&idx), dereferencing a NULL pointer (whereas xe_oa_mmap(),
xe_oa_destroy_locked(), and xe_oa_release() use gt_to_xe(stream->gt)).

Additionally, drm_dev_is_unplugged() immediately drops its SRCU read lock v=
ia
drm_dev_exit(). If drm_dev_unplug() and drm_vma_node_unmap() run between
drm_dev_is_unplugged() in xe_oa_buffer_fault() and drm_dev_enter() in
xe_bo_cpu_fault(), or if the device was marked wedged prior to unplug (such=
 as
in xe_pci_error_detected()), xe_bo_cpu_fault() hits:

    if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
        return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);

Would that still install a dummy page PTE instead of returning
VM_FAULT_SIGBUS?

> @@ -1745,18 +1792,12 @@ static const struct vm_operations_struct xe_oa_vm=
_ops =3D {
>  	.access	=3D xe_bo_vm_access,
>  };

[Severity: High]
As reported by Sashiko on v2 [2], does leaving .access wired directly to
xe_bo_vm_access in xe_oa_vm_ops allow userspace to access the OA buffer and
device state after xe_oa_quiesce()?

When xe_oa_quiesce_oa_unit() calls drm_vma_node_unmap(), PTEs are zapped, b=
ut
any existing userspace VMA remains open with VM_PFNMAP set and retains a GEM
reference on stream->oa_buffer.bo in vma->vm_private_data. If userspace rea=
ds
the mapping via /proc/self/mem, process_vm_readv(), or ptrace after
xe_oa_quiesce(), get_user_pages() receives VM_FAULT_SIGBUS from
xe_oa_buffer_fault() and __access_remote_vm() falls back to
vma->vm_ops->access(), calling xe_bo_vm_access():

    int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
                        void *buf, int len, int write)
    {
        struct ttm_buffer_object *ttm_bo =3D vma->vm_private_data;
        struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
        struct xe_device *xe =3D xe_bo_device(bo);

        guard(xe_pm_runtime)(xe);
        return ttm_bo_vm_access(vma, addr, buf, len, write);
    }

Because xe_bo_vm_access() does not check stream->dead or drm_dev_enter(), c=
an
this acquire runtime PM after xe_pm_fini() and, when the OA buffer is in VR=
AM
under mert_wa_14026633728, dereference vram->mapping in xe_ttm_access_memor=
y()
after vram_fini() has cleared and unmapped it?

[ ... ]

> @@ -2617,6 +2689,97 @@ static void xe_oa_unregister(void *arg)
>  	oa->metrics_kobj =3D NULL;
>  }
> =20
> +static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u, bool hw_accessib=
le)
> +{
> +	struct xe_oa_stream *stream =3D u->exclusive_stream;
> +	unsigned long flags;
> +
> +	if (!stream)
> +		return;
> +
> +	mutex_lock(&stream->stream_lock);
> +	if (stream->enabled && hw_accessible)
> +		xe_oa_disable_locked(stream);
> +
> +	stream->enabled =3D false;
> +
> +	/*
> +	 * Once dead is set under mmap_mutex, no new xe_oa_mmap() can reference=
 the OA buffer.
> +	 * Don't hold mmap_mutex any longer than that: it nests under mmap_lock=
, and the HW
> +	 * teardown below submits batches, taking vm->lock and the vm resv.
> +	 */
> +	mutex_lock(&stream->mmap_mutex);
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +	mutex_unlock(&stream->mmap_mutex);
> +
> +	if (stream->sample)
> +		hrtimer_cancel(&stream->poll_check_timer);
> +
> +	wake_up_all(&stream->poll_wq);
> +
> +	/* Zap userspace mappings of this OA buffer only, others in the address=
_space stay */
> +	drm_vma_node_unmap(&stream->oa_buffer.bo->ttm.base.vma_node,
> +			   stream->oa->xe->drm.anon_inode->i_mapping);
> +
> +	/*
> +	 * Restore the HW state while the stream still holds its runtime PM ref=
 and exec_q.
> +	 * The device is not reset on unbind, so this can't be left to a later =
reset.
> +	 */
> +	if (hw_accessible)
> +		xe_oa_stream_hw_teardown(stream);

[Severity: High]
As reported by Sashiko on v2 [3], when stream->exec_q is set, does
xe_oa_stream_hw_teardown() submit an asynchronous batchbuffer job without
waiting for it to complete before devres tears down GuC submission and fence
IRQs?

In xe_oa_quiesce_oa_unit(), xe_oa_stream_hw_teardown() calls
xe_oa_disable_metric_set(), which calls:

    if (stream->exec_q)
        xe_oa_configure_oa_context(stream, false);

xe_oa_configure_oa_context() -> xe_oa_load_with_lri() submits a batchbuffer=
 on
stream->exec_q via xe_oa_submit_bb(), passes the unsignaled fence to
xe_bb_free(bb, fence), and returns immediately without waiting for completi=
on:

    fence =3D xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
    if (IS_ERR(fence)) {
        err =3D PTR_ERR(fence);
        goto free_bb;
    }
    xe_bb_free(bb, fence);
    dma_fence_put(fence);

xe_oa_stream_hw_teardown() and xe_oa_quiesce_oa_unit() then immediately drop
forcewake, the runtime PM reference, and stream->exec_q, and devres proceeds
directly to guc_submit_fini() and xe_gt_fini() -> xe_hw_fence_irq_finish().
Can that leave the job's fence pending in irq->pending when
xe_hw_fence_irq_finish() checks XE_WARN_ON(!list_empty(&irq->pending)), or =
arm
the fence after xe_hw_fence_irq_finish() has already run?

> +
> +	xe_oa_stream_free_resources(stream);

[Severity: High]
As reported by Sashiko on v2 [4], if userspace has an active mmap VMA on the
OA stream across driver unbind or PCI slot reset, does unpinning
stream->oa_buffer.bo here leave the BO neither evicted nor DMA-unmapped aft=
er
PCI device removal?

In xe_oa_mmap_locked(), drm_gem_mmap_obj() takes a GEM reference on
stream->oa_buffer.bo that is held until ttm_bo_vm_close() runs when the VMA=
 is
closed. On remove:

1. xe_device_remove() calls xe_bo_pci_dev_remove_all(xe). Because xe_oa_fin=
i()
is a devm callback that has not run yet, stream->oa_buffer.bo still has
pin_count =3D=3D 1, so ttm_resource_manager_evict_all() skips it and
xe_bo_pci_dev_remove_pinned() only unmaps xe->pinned.late.external.

2. During devres release, xe_oa_fini() runs before xe_bo_pinned_fini().
drm_vma_node_unmap() only zaps PTEs without closing the VMA, and
xe_oa_stream_free_resources() -> xe_oa_free_oa_buffer() calls
xe_bo_unpin_map_no_vm(stream->oa_buffer.bo). That unpins the BO, removes
bo->pinned_link from xe->pinned.early.kernel_bo_present, and drops the
stream's BO reference, but the BO stays alive because the VMA still holds a
reference.

3. When xe_bo_pinned_fini() then runs, stream->oa_buffer.bo is no longer on
xe->pinned.early.kernel_bo_present, so xe_bo_dma_unmap_pinned() never runs =
on
it either.

Doesn't this leave the OA buffer's DMA mapping and TTM resource active after
the PCI device is removed until userspace eventually unmaps the VMA?

[ ... ]

> @@ -2928,6 +3091,12 @@ static void xe_oa_fini(void *arg)
>  	if (!oa->xe)
>  		return;
> =20
> +	/*
> +	 * Devm action, so this runs on unbind and PCI slot reset after xe_devi=
ce_remove() even
> +	 * if streams are still open. Quiesce them before the configs they hold=
 are destroyed.
> +	 */
> +	xe_oa_quiesce(xe);
> +
>  	idr_for_each(&oa->metrics_idr, destroy_config, oa);
>  	idr_destroy(&oa->metrics_idr);
> =20

[Severity: High]
As reported by Sashiko on v2 [5], can an in-flight observation ioctl that
entered drm_ioctl() before drm_dev_unplug() race with xe_oa_fini()
destroying oa->metrics_idr and setting oa->xe =3D NULL?

While xe_oa_stream_open_ioctl_locked() checks param->hwe->gt->oa.quiesced
under gt_lock, xe_oa_stream_open_ioctl() only checks !oa->xe unlocked at
entry before sleeping in copy_from_user() inside xe_oa_user_extensions() and
before acquiring gt_lock:

    if (!oa->xe) {
        drm_dbg(&xe->drm, "xe oa interface not available for this system\n"=
);
        return -ENODEV;
    }

    param.xef =3D xef;
    param.period_exponent =3D -1;
    ret =3D xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &=
param);
    if (ret)
        return ret;

    /* If not provided, OA unit defaults to OA unit 0 as per uapi */
    if (!param.oa_unit)
        param.oa_unit =3D &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];

If xe_oa_fini() runs concurrently and sets oa->xe =3D NULL after the initial
check, can xe_oa_stream_open_ioctl() dereference NULL oa->xe in
xe_oa_lookup_oa_unit(), xe_root_mmio_gt(oa->xe), oa_unit_supports_oa_format=
(),
or drm_dbg(&oa->xe->drm, ...) in xe_oa_stream_open_ioctl_locked(), or read
MMIO in oa_exponent_to_ns() -> xe_oa_timestamp_frequency() before taking
gt_lock?

Similarly, since xe_oa_fini() destroys oa->metrics_idr without taking
oa->metrics_lock, can an in-flight xe_oa_add_config_ioctl() or
xe_oa_remove_config_ioctl() dereference NULL oa->xe in
xe_oa_is_valid_config_reg() or access oa->metrics_idr concurrently with
idr_destroy()?

[1] https://lore.kernel.org/r/20261030223056.2266638-8-umesh.nerlige.ramapp=
a@intel.com
[2] https://lore.kernel.org/r/20261030223056.2266638-8-umesh.nerlige.ramapp=
a@intel.com
[3] https://lore.kernel.org/r/20261030223056.2266638-8-umesh.nerlige.ramapp=
a@intel.com
[4] https://lore.kernel.org/r/20261030223056.2266638-8-umesh.nerlige.ramapp=
a@intel.com
[5] https://lore.kernel.org/r/20261030223056.2266638-8-umesh.nerlige.ramapp=
a@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030233839.2284=
694-5-umesh.nerlige.ramappa@intel.com?part=3D3
