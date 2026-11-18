Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BE606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjE3TFeL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39510E554;
	Wed, 18 Nov 2026 03:51:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AB210E554
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 03:51:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E4A544881;
 Wed, 18 Nov 2026 03:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F491F000C4;
 Wed, 18 Nov 2026 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794973863;
 bh=yf/YlRjGXOdELR1wflnLBhn12VTv3Sq/jIv7xb8cTnQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jjE3TFeL+SmrmDNGtrcM8XndKMCyyAOeZmzVxqLgXxWx4IyjWuxLGmogN60yBvIQL
 N5gz2OiDKw3uJWOXulTBC7jiUHd6EqEVWJWNADV9pPDVVEMLyuDdGFdJGCG/GwAcPF
 Vn8CTf68/H+zn0BbJSIxmY7cTOQOYKW0fDpkKuJhwv0l885H3+vOW3/H76OHNZTEGn
 WKFVpdC81ifEiHUsJEpZp5McLHzk2bJqxVwO6osHtXcXKOZ2iezkF41IvvKhOS/AHD
 +uK4NUv/L9APvKegQ1FB79i6xHsXjsDeYBI74SKCfMQ++t+80yrRQ0y3kMskD7iPeT
 snKhOWNztGQ6A==
Message-ID: <sashiko-outbox-220052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118025140.3782678-16-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
 <20261118025140.3782678-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:51:02 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] drm/xe/oa: out-of-bounds vmap read in
  xe_oa_buffer_check_unlocked() on reset
- [Medium] drm/xe/oa: HW access and missing drain in xe_oa_stream_init()
  error path
- [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
  skips ttm.wq flush
- [Medium] drm/xe/oa: OA buffer BO destroy can outlive flush_workqueue()
  on unplug
- [Medium] drm/xe/oa: unnecessary fence wait in xe_oa_quiesce_oa_unit()
  when wedged
--

commit 3beacae376d78af14b851e582701fe6ee70c6d4c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams on driver unbind and PCI reset by
marking streams dead, releasing device-bound resources, and rejecting
further operations on the stream fd until it is closed.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index c7ccf273ced75..07ec4255cf089 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -261,13 +261,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream=
 *s)
> =20
>  static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>  {
> -	u32 gtt_offset =3D xe_bo_ggtt_addr(stream->oa_buffer.bo);
> -	u32 tail, hw_tail, partial_report_size, available;
> +	u32 gtt_offset, tail, hw_tail, partial_report_size, available;
>  	int report_size =3D stream->oa_buffer.format->size;
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> =20
> +	if (stream->dead) {
> +		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +		return false;
> +	}
> +
> +	gtt_offset =3D xe_bo_ggtt_addr(stream->oa_buffer.bo);
>  	hw_tail =3D xe_oa_hw_tail_read(stream);
>  	hw_tail -=3D gtt_offset;

[Severity: High]
Can xe_oa_buffer_check_unlocked() read stream->oa_buffer.bo->vmap out of
bounds when the device is wedged or resetting before xe_oa_fini() runs?

stream->dead is only set in xe_oa_quiesce_oa_unit() during xe_oa_fini().
During a PCI slot reset (between prepare_device_for_reset() and
devres_release_group() in xe_pci_error_slot_reset()), surprise hot-unplug,
or runtime wedge, stream->dead is still false while the 200 Hz
poll_check_timer and xe_oa_read() continue calling
xe_oa_buffer_check_unlocked().

When xe_oa_hw_tail_read() returns 0xffffffff on a disabled PCI device or 0
after a secondary bus reset, subtracting gtt_offset wraps the u32 hw_tail
to a value >=3D stream->oa_buffer.circ_size. Because xe_oa_circ_diff() does
not clamp or wrap values >=3D circ_size, the backward walk passes that tail
offset into oa_report_id(stream, tail) and indexes stream->oa_buffer.bo's
vmap past the end of the buffer.

[ ... ]

> @@ -1129,12 +1152,28 @@ static int xe_oa_emit_oa_config(struct xe_oa_stre=
am *stream, struct xe_oa_config
>  	if (err =3D=3D -ENOENT)
>  		xe_oa_config_cb(fence, &ofence->cb);
> =20
> -	/* If nothing needs to be signaled we wait synchronously */
> +	/*
> +	 * If nothing needs to be signaled we wait synchronously unless the dev=
ice
> +	 * is unplugged/wedged.
> +	 */
>  	if (!num_signal) {
> -		dma_fence_wait(&ofence->base, false);
> +		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10)) {
> +			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm)) {
> +				ret =3D -ENODEV;
> +				break;
> +			}
> +			if (xe_wedged(gt_to_xe(stream->gt))) {
> +				ret =3D -ECANCELED;
> +				break;
> +			}
> +		}
>  		dma_fence_put(&ofence->base);
>  	}
> =20
> +	/* The callers clean up the syncs on error */
> +	if (ret)
> +		return ret;

[Severity: Medium]
When xe_oa_emit_oa_config() returns early here during xe_oa_stream_init()
-> xe_oa_enable_metric_set(), does the error unwind path in
xe_oa_stream_init() mishandle the in-flight batch and wedged state?

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
    ...
err_put_k_exec_q:
	xe_oa_disable_metric_set(stream);
	xe_exec_queue_put(stream->k_exec_q);
err_free_oa_buf:
	xe_oa_free_oa_buffer(stream);
err_fw_put:
	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
    ...
}

Because stream->oa_unit->exclusive_stream has not been set yet,
stream->dead is false. If the wait aborted because the device wedged,
err_put_k_exec_q still performs MMIO in xe_oa_disable_metric_set() and
xe_force_wake_put(), and when stream->exec_q is set it submits a context
restore batch and waits in xe_oa_stream_drain() on the wedged device.

If the wait aborted because the device was unplugged, when stream->exec_q
is set xe_oa_disable_metric_set() sees !stream->dead and blocks in
xe_oa_stream_drain() inside the drm_dev_enter() section of xe_oa_ioctl();
when stream->exec_q is NULL, nothing drains stream->last_fence before
xe_oa_disable_metric_set(), xe_force_wake_put(), and xe_pm_runtime_put()
run.

[ ... ]

> @@ -1753,17 +1811,37 @@ static void xe_oa_destroy_locked(struct xe_oa_str=
eam *stream)
>  	kfree(stream);
>  }
> =20
> +static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u, bool hw_accessib=
le);
> +
>  static int xe_oa_release(struct inode *inode, struct file *file)
>  {
>  	struct xe_oa_stream *stream =3D file->private_data;
>  	struct xe_gt *gt =3D stream->gt;
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	int idx;
> =20
>  	mutex_lock(&gt->oa.gt_lock);
> -	xe_oa_destroy_locked(stream);
> +	if (drm_dev_enter(&xe->drm, &idx)) {
> +		xe_oa_destroy_locked(stream);
> +		drm_dev_exit(idx);
> +	} else {
> +		if (!stream->dead)
> +			xe_oa_quiesce_oa_unit(stream->oa_unit, !xe_wedged(xe));
> +
> +		xe_oa_destroy_locked(stream);
> +	}
>  	mutex_unlock(&gt->oa.gt_lock);
> =20
> +	/*
> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue.=
 Once the device
> +	 * is unplugged, this may be the last reference on the drm device, so l=
et the destroy
> +	 * finish before drm_dev_put() releases the GGTT.
> +	 */
> +	if (drm_dev_is_unplugged(&xe->drm))
> +		flush_workqueue(xe->ttm.wq);
> +
>  	/* Release the reference the OA stream kept on the driver */
> -	drm_dev_put(&gt_to_xe(gt)->drm);
> +	drm_dev_put(&xe->drm);
> =20
>  	return 0;
>  }

[Severity: Medium]
Can xe_oa_release() race with drm_dev_unplug() after drm_dev_exit() and
skip flush_workqueue(xe->ttm.wq) before dropping the last drm_device
reference?

CPU0                                  CPU1
xe_oa_release()
  drm_dev_enter(&xe->drm, &idx)
  xe_oa_destroy_locked(stream)
    ...
      queue_work(xe->ttm.wq, ...)
  drm_dev_exit(idx)
  if (drm_dev_is_unplugged(&xe->drm))
    --> false
                                      xe_pci_remove()
                                        xe_device_remove()
                                          drm_dev_unplug(&xe->drm)
                                        ...
                                        devm_drm_dev_init_release()
                                          drm_dev_put(&xe->drm)
  drm_dev_put(&xe->drm)
    drm_dev_release()
      ggtt_fini_early()               <-- runs before ttm.wq destroys BO

Because ggtt_fini_early() is registered via drmm after xe_device_destroy()
(which calls ttm_device_fini(&xe->ttm)), dropping the last drm_device
reference without flushing xe->ttm.wq tears down ggtt->mm while
ttm_bo_delayed_delete() -> xe_ggtt_remove_bo() is still queued.

[ ... ]

> @@ -2633,6 +2734,97 @@ static void xe_oa_unregister(void *arg)
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
> +
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +
> +	if (stream->enabled && hw_accessible)
> +		xe_oa_disable_locked(stream);
> +
> +	stream->enabled =3D false;
> +
> +	if (stream->sample)
> +		hrtimer_cancel(&stream->poll_check_timer);
> +
> +	wake_up_all(&stream->poll_wq);
> +
> +	xe_oa_stream_drain(stream);
> +
> +	/*
> +	 * Restore the HW state while the stream still holds its runtime PM ref=
 and exec_q.
> +	 * The device is not reset on unbind, so this can't be left to a later =
reset.
> +	 */
> +	if (hw_accessible)
> +		xe_oa_stream_hw_teardown(stream);

[Severity: Medium]
Should xe_oa_stream_drain(stream) be skipped when !hw_accessible?

When the device is wedged, xe_oa_stream_hw_teardown() is skipped and
free_oa_config_bo() hands stream->last_fence to xe_bb_free(), which does
not require the fence to be signaled first. However, stream->last_fence
can remain unsignaled on a wedged device (for example when
xe_oa_emit_oa_config() broke out of its wait with -ECANCELED, or when an
OA batch is waiting on an unsignaled input dependency), causing
xe_oa_stream_drain() to stall uninterruptibly for job_timeout_ms + HZ and
log a timeout error.

> +
> +	/*
> +	 * Keep the OA buffer pinned until xe_oa_release(). An mmap holds a ref=
erence on the
> +	 * BO, so unpinning it here leaves it on the TTM LRU, where the shrinke=
r may take the
> +	 * last reference and free the BO after the GGTT and the shrinker itsel=
f are gone.
> +	 * drm_dev_unplug() has zapped the userspace mappings and refaults get =
a dummy page.
> +	 * Drop the DMA mapping now, while pinned: the fd may be released, and =
the BO
> +	 * unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO loc=
k.
> +	 */
> +	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);

[Severity: Medium]
Can the final reference on stream->oa_buffer.bo be dropped after
xe_oa_release() flushes xe->ttm.wq?

xe_bo_dma_unmap_pinned() leaves bo->pinned_link on
xe->pinned.early.kernel_bo_present, where xe_bo_pinned_fini() ->
xe_bo_apply_to_pinned() still visits it and takes a temporary reference on
the BO outside xe->pinned.lock:

CPU0 (devres_release_all)             CPU1 (close OA fd)
xe_bo_pinned_fini()
  xe_bo_apply_to_pinned()
    xe_bo_get(bo)
    spin_unlock(&xe->pinned.lock)
                                      xe_oa_release()
                                        xe_oa_destroy_locked()
                                          xe_bo_unpin_map_no_vm(bo)
                                            xe_bo_unpin(bo)
                                            xe_bo_put(bo)  <-- ref > 0
                                        flush_workqueue(xe->ttm.wq)
    xe_bo_dma_unmap_pinned(bo)
    xe_bo_put(bo)
      ttm_bo_release()
        queue_work(xe->ttm.wq, ...)
  ...
  devm_drm_dev_init_release()
    drm_dev_put(&xe->drm)             drm_dev_put(&xe->drm)
      ggtt_fini_early()               <-- runs before ttm.wq destroys BO

Because CPU0 holds a reference on bo while CPU1 runs xe_bo_put(bo) and
flush_workqueue(xe->ttm.wq), CPU0's xe_bo_put(bo) queues delayed BO
destruction onto xe->ttm.wq after the flush, allowing ggtt_fini_early()
and xe_shrinker_fini() to tear down the GGTT and shrinker before the BO is
destroyed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118025140.3782=
678-9-umesh.nerlige.ramappa@intel.com?part=3D7
