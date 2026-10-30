Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC439606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 23:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/31CJ8N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B4310E284;
	Fri, 30 Oct 2026 23:14:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C9510E284
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 23:14:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B89DC601EE;
 Fri, 30 Oct 2026 23:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510F61F000C1;
 Fri, 30 Oct 2026 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793402089;
 bh=pNJKgOwAYxToqaxzOdiXO4//baDZHvXZbUxvh1Ui1t0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=H/31CJ8NcgAFSeM48giVJEMjQiwXMKLvVMnW5aQqx+yWnuE1MhXHER/MWk5k9uD1H
 tP60UtBsTT2AgGW7GxYHTUGMjjmFUEbZxJ23LtnT9/KrWPfWAubhIwErcdHjJspNOB
 lRqS9MLJq5IyYUX4kuxz42Z5qof89RgoCB+pPd33/ykIACW+EF8xQCKz/KpMD8jJpN
 fxysbBL2DXy7P2G4HizbKPZ047jleSXaA1z8HxzePMLRpviCgmKR6/4/gT+L/YvCQB
 zI7yC5EElx8z7Lb31H19DrvvHZcJreLAyC5NrfTM0ELmpg6Jugq2P9Tn+dZ0pRqWxP
 dcfdQuaiwn5jA==
Message-ID: <sashiko-outbox-191625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030223056.2266638-8-umesh.nerlige.ramappa@intel.com>
References: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
 <20261030223056.2266638-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 23:14:48 +0000
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] drm/xe/oa: NULL deref and dummy page race in xe_oa_buffer_fault()
- [High] drm/xe/oa: mapped OA BO left DMA-mapped and un-evicted in xe_oa_qu=
iesce()
- [High] drm/xe/oa: ungated xe_bo_vm_access() in xe_oa_vm_ops after quiesce
- [High] drm/xe/oa: race between in-flight observation ioctls and xe_oa_fin=
i()
- [High] drm/xe/oa: lock inversion holding mmap_mutex across xe_oa_quiesce_=
oa_unit()
- [High] drm/xe/oa: unwaited LRI job in xe_oa_quiesce_oa_unit() races devre=
s teardown
--

commit 6eef6267f9216029752eabf4c50aa7de5a8ca9d1
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit adds xe_oa_quiesce() to disable active OA streams, cancel their
poll timers, unmap OA buffers, and release device-bound resources during
driver unbind and PCI slot reset when xe_oa_fini() runs.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4916101fce541..6faa40d7ebbe7 100644
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
Can xe_oa_buffer_fault() dereference a NULL pointer when racing with
xe_oa_fini(), or still install a dummy page PTE?

If a fault enters xe_oa_buffer_fault() and observes READ_ONCE(stream->dead)
as false just before xe_oa_quiesce_oa_unit() sets stream->dead =3D true,
xe_oa_fini() can finish xe_oa_quiesce() and clear oa->xe:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_fini() {
	...
	xe_oa_quiesce(xe);

	idr_for_each(&oa->metrics_idr, destroy_config, oa);
	idr_destroy(&oa->metrics_idr);

	oa->xe =3D NULL;
}

When xe_oa_buffer_fault() then evaluates the second operand of the logical
or, stream->oa->xe is NULL, so &stream->oa->xe->drm is NULL and
drm_dev_is_unplugged() dereferences NULL in drm_dev_enter() (whereas
xe_oa_mmap(), xe_oa_destroy_locked(), and xe_oa_release() use
gt_to_xe(stream->gt)).

In addition, drm_dev_is_unplugged() immediately drops its SRCU read lock via
drm_dev_exit(). If drm_dev_unplug() and drm_vma_node_unmap() complete in the
window between drm_dev_is_unplugged() in xe_oa_buffer_fault() and
drm_dev_enter() in xe_bo_cpu_fault(), or if the device is wedged before
unplug (such as during PCI error recovery), xe_bo_cpu_fault() still hits:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_cpu_fault() {
	...
	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);

and installs a dummy page PTE instead of returning VM_FAULT_SIGBUS.

> @@ -1745,18 +1792,12 @@ static const struct vm_operations_struct xe_oa_vm=
_ops =3D {
>  	.access	=3D xe_bo_vm_access,
>  };

[Severity: High]
What prevents userspace from accessing the OA buffer via xe_bo_vm_access()
after xe_oa_quiesce()?

While xe_oa_vm_ops gates .fault with xe_oa_buffer_fault(), .access is wired
directly to xe_bo_vm_access():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_vm_access() {
	struct ttm_buffer_object *ttm_bo =3D vma->vm_private_data;
	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
	struct xe_device *xe =3D xe_bo_device(bo);

	guard(xe_pm_runtime)(xe);
	return ttm_bo_vm_access(vma, addr, buf, len, write);
}

Because an existing VMA holds a GEM reference to stream->oa_buffer.bo in
vma->vm_private_data until munmap() or process exit, reading the VMA via
/proc/self/mem, ptrace, or process_vm_readv() after xe_oa_quiesce() will get
VM_FAULT_SIGBUS from xe_oa_buffer_fault() and fall back to
vma->vm_ops->access() -> xe_bo_vm_access(). That acquires runtime PM on the
removed device and accesses the BO backing store (including unmapped
vram->mapping or torn-down migration state when the OA buffer is in VRAM
under mert_wa_14026633728()). Should .access also be wrapped to check
stream->dead and drm_dev_enter()?

[ ... ]

> @@ -1925,6 +1988,12 @@ static int xe_oa_stream_open_ioctl_locked(struct x=
e_oa *oa,
>  	int stream_fd;
>  	int ret;
> =20
> +	if (param->hwe->gt->oa.quiesced) {
> +		drm_dbg(&oa->xe->drm, "OA is quiesced\n");
> +		ret =3D -ENODEV;
> +		goto exit;
> +	}
> +

[Severity: High]
Could an in-flight observation ioctl that entered drm_ioctl() before
drm_dev_unplug() race with xe_oa_fini() before reaching gt_lock?

In xe_oa_stream_open_ioctl(), oa->xe is only checked unlocked at entry befo=
re
sleeping copy_from_user() calls in xe_oa_user_extensions() and before taking
gt_lock:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_open_ioctl() {
	...
	if (!oa->xe) {
		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
		return -ENODEV;
	}

	param.xef =3D xef;
	param.period_exponent =3D -1;
	ret =3D xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &par=
am);
	if (ret)
		return ret;

	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
	if (!param.oa_unit)
		param.oa_unit =3D &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];

If xe_oa_fini() runs concurrently and sets oa->xe =3D NULL right after
xe_oa_quiesce(), an in-flight xe_oa_stream_open_ioctl() can dereference NULL
oa->xe in xe_oa_lookup_oa_unit(), xe_root_mmio_gt(oa->xe),
oa_unit_supports_oa_format(), or even in drm_dbg(&oa->xe->drm, ...) inside
xe_oa_stream_open_ioctl_locked() above. When param.period_exponent >=3D 0,
xe_oa_stream_open_ioctl() also calls oa_exponent_to_ns() ->
xe_oa_timestamp_frequency() -> xe_mmio_read32() before acquiring gt_lock and
checking gt->oa.quiesced.

Similarly, in-flight xe_oa_add_config_ioctl() and xe_oa_remove_config_ioctl=
()
calls that already passed their unlocked !oa->xe check can dereference NULL
oa->xe in xe_oa_is_valid_config_reg() or access oa->metrics_idr while
xe_oa_fini() destroys oa->metrics_idr without holding oa->metrics_lock.

[ ... ]

> @@ -2617,6 +2686,92 @@ static void xe_oa_unregister(void *arg)
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
> +	mutex_lock(&stream->mmap_mutex);
> +	if (stream->enabled && hw_accessible)
> +		xe_oa_disable_locked(stream);
> +
> +	stream->enabled =3D false;
> +
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
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
> +
> +	xe_oa_stream_free_resources(stream);

[Severity: High]
Does holding stream->mmap_mutex across xe_oa_stream_hw_teardown() and
xe_oa_stream_free_resources() introduce a lock ordering inversion with
mm->mmap_lock?

In xe_oa_mmap(), stream->mmap_mutex is taken inside file->f_op->mmap under
mm->mmap_lock, which is why struct xe_oa_stream documents mmap_mutex as a
leaf lock.

However, xe_oa_quiesce_oa_unit() holds stream->mmap_mutex across:
- xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
  xe_oa_configure_oa_context() -> xe_oa_load_with_lri() ->
  xe_oa_submit_bb() -> xe_oa_lock_vma(), which takes down_read(&q->vm->lock)
  and xe_vm_lock(q->vm, false)
- xe_oa_stream_free_resources() -> xe_oa_free_oa_buffer() ->
  xe_bo_unpin_map_no_vm(), which locks the BO dma_resv

Since normal VM and fault paths establish vm->lock -> mm->mmap_lock ->
dma_resv, taking vm->lock and dma_resv under stream->mmap_mutex inverts the
lock hierarchy. Since xe_oa_mmap_locked() only checks READ_ONCE(stream->dea=
d)
and maps stream->oa_buffer.bo, could stream->mmap_mutex be held only around
setting stream->dead =3D true?

[Severity: High]
When userspace has an active mmap VMA on the OA stream during unbind or PCI
slot reset, does stream->oa_buffer.bo miss both eviction and DMA unmapping?

In xe_oa_mmap_locked(), drm_gem_mmap_obj() takes a GEM reference on
stream->oa_buffer.bo that is held by vma->vm_private_data until munmap() or
process exit. During device removal:

1. xe_device_remove() calls xe_bo_pci_dev_remove_all(xe) before devm actions
   run. At that point stream->oa_buffer.bo is still pinned (pin_count =3D=
=3D 1 on
   xe->pinned.early.kernel_bo_present), so ttm_resource_manager_evict_all()
   skips it.
2. Next, devres runs xe_oa_fini() -> xe_oa_quiesce_oa_unit() ->
   xe_oa_stream_free_resources() -> xe_oa_free_oa_buffer() ->
   xe_bo_unpin_map_no_vm(stream->oa_buffer.bo). Because drm_vma_node_unmap()
   only zaps PTEs without closing the VMA, xe_bo_unpin_map_no_vm() unpins t=
he
   BO, removes bo->pinned_link from xe->pinned.early.kernel_bo_present, and
   drops one reference, leaving the BO alive with refcount >=3D 1.
3. When the devm action xe_bo_pinned_fini() subsequently runs to call
   xe_bo_dma_unmap_pinned() on kernel_bo_present, stream->oa_buffer.bo is no
   longer on the list.

As a result, the OA BO remains allocated with its DMA mapping and TTM
resource active after PCI device removal until userspace closes the VMA.

[Severity: High]
In xe_oa_quiesce_oa_unit(), can the asynchronous batchbuffer submitted by
xe_oa_stream_hw_teardown() race with subsequent devres teardown of GuC
submission and fence IRQs?

When hw_accessible is true and stream->exec_q is set,
xe_oa_stream_hw_teardown() calls:

  xe_oa_disable_metric_set()
    -> xe_oa_configure_oa_context(stream, false)
      -> xe_oa_load_with_lri()

which submits a batchbuffer job onto stream->exec_q via xe_oa_submit_bb(),
hands the unsignaled fence to xe_bb_free(bb, fence), and returns immediately
without waiting for the fence to signal.

xe_oa_quiesce_oa_unit() then immediately drops forcewake, the runtime PM
reference, and stream->exec_q, and returns to devres_release_all(), which
proceeds to guc_submit_fini() and xe_gt_fini() -> xe_hw_fence_irq_finish().
If the scheduler arms job->fence onto gt->fence_irq[i].pending before GuC
teardown / TDR signals it, won't xe_hw_fence_irq_finish() trigger
XE_WARN_ON(!list_empty(&irq->pending)) or leave the context restore LRI
unexecuted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030223056.2266=
638-5-umesh.nerlige.ramappa@intel.com?part=3D3
