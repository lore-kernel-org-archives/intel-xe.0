Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673F606A337
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeCYRDd0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E0310E0AC;
	Sat, 21 Nov 2026 02:37:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E6010E0AC
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:37:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 89499605F0;
 Sat, 21 Nov 2026 02:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9929C1F000C6;
 Sat, 21 Nov 2026 02:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795228649;
 bh=Gk0En1o3ca8kG6CqnMWjQ/YPmfrWusPflEQ2TTifBoM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=BeCYRDd0DeYgtEstyemN5XA0TCR6RPU6LDixkNnOloUBTfKjSY9YZIt7/BUqxsFui
 iquTTYMcO8lLYPyNewRmDbCQkEhPf7HGmZJlQVix4H2LFQ/9YS7wwtfcqSEKyT0+cJ
 xoa9GDSIeqxTtx4RHU2vryf465WcbNA3UQzzUMBgJRXYwQzR1bkkoxq/7rHyVdMoUn
 NLDErj3hocKIz31S+M4756B3k7aX2/7xVn8Z2TmvrE6Vkkqay66yrcqXTXpv/urWL/
 VQZyBtUx2+kg2+CEMOSvVqgG85CJ9QFB+M3c8qQ3eQJTw8iJZFo2UhuB5VwPCzRJJt
 cuqm31oArqTng==
Message-ID: <sashiko-outbox-226548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261121020145.147384-16-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
 <20261121020145.147384-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 02:37:29 +0000
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
- [Medium] drm/xe/oa: xe_oa_release() drops gt_lock before
  xe_oa_free_oa_buffer()
- [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
  skips ttm.wq flush
- [Medium] drm/xe/oa: OA buffer BO references can outlive
  flush_workqueue() on unplug
- [Medium] drm/xe/oa: unlocked stream->dead check for runtime PM in
  xe_oa_release()
- [Medium] drm/xe/oa: xe_oa_disable_metric_set() submits batch on wedged
  device
--

commit ee62062a6a8afa8ac686e03248886c0c4f01f369
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams on driver unbind and PCI slot reset
by marking streams dead, tearing down hardware and device-bound state in
xe_oa_fini(), and deferring OA buffer and stream struct deallocation until
xe_oa_release().

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index e719cd92b271b..e8228a244cc2e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -865,7 +887,9 @@ static void xe_oa_stream_drain(struct xe_oa_stream *s=
tream)
>  	struct xe_exec_queue *q =3D stream->exec_q ?: stream->k_exec_q;
>  	long timeout;
> =20
> -	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
> +	/* Nothing in the ring runs anymore on a wedged device */
> +	if (xe_wedged(stream->oa->xe) || !stream->last_fence ||
> +	    dma_fence_is_signaled(stream->last_fence))
>  		return;
> =20
>  	/*

[Severity: Medium]
When a stream with stream->exec_q is destroyed on a wedged device, does
xe_oa_disable_metric_set() still submit a context-restore batch whose
fence will never signal?

drivers/gpu/drm/xe/xe_oa.c:xe_oa_disable_metric_set() {
    ...
	if (stream->exec_q) {
		xe_oa_configure_oa_context(stream, false);
		xe_oa_stream_drain(stream);
	}
    ...
}

xe_oa_configure_oa_context() pushes a new job onto the already-wedged
stream->exec_q and replaces stream->last_fence with the new unsignaled job
fence, which xe_oa_stream_drain() skips waiting for and
xe_oa_free_configs() attaches to every oa_bo->bb suballocation in
kernel_bb_pool.  On a long-running queue where guc_exec_queue_kill()
already ran at wedge time, work_tdr is never scheduled for the new job,
leaking the job, stream->exec_q and its drm_device reference.

Guarding the xe_oa_configure_oa_context() call in
xe_oa_disable_metric_set() with !xe_wedged(stream->oa->xe) would avoid
submitting a batch to a wedged device.

[ ... ]

> @@ -1754,33 +1781,67 @@ static long xe_oa_ioctl(struct file *file,
>  	return ret;
>  }
> =20
> +/*
> + * Disable the stream, restore the HW state and release everything but t=
he OA buffer and the
> + * stream struct, the same whether the stream fd is closed or the device=
 goes away, and
> + * whether or not the HW still responds: all HW waits are bounded. After=
wards the stream is
> + * dead and any further read, poll, mmap or ioctl on the stream fd fails=
 with -ENODEV.
> + */
>  static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>  {
> +	unsigned long flags;
> +
> +	mutex_lock(&stream->stream_lock);
> +
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +
>  	if (stream->enabled)
>  		xe_oa_disable_locked(stream);
> =20
> +	wake_up_all(&stream->poll_wq);
> +
>  	xe_oa_stream_destroy(stream);
> =20
>  	if (stream->exec_q)
>  		xe_exec_queue_put(stream->exec_q);
> =20
>  	drm_syncobj_put(stream->ufence_syncobj);
> +	mutex_unlock(&stream->stream_lock);
>  }
> =20
>  static int xe_oa_release(struct inode *inode, struct file *file)
>  {
>  	struct xe_oa_stream *stream =3D file->private_data;
>  	struct xe_gt *gt =3D stream->gt;
> +	/*
> +	 * Don't wake a removed device for a stream xe_oa_fini() destroyed. If =
xe_oa_fini()
> +	 * marks the stream dead only after this, the device is still bound whi=
le it does.
> +	 */
> +	bool rpm =3D !READ_ONCE(stream->dead);
> =20
> -	xe_pm_runtime_get(gt_to_xe(gt));
> +	if (rpm)
> +		xe_pm_runtime_get(gt_to_xe(gt));

[Severity: Medium]
Can sampling stream->dead before acquiring gt->oa.gt_lock still wake or
touch runtime PM on an unbound device?

CPU0                              CPU1
xe_oa_release()
  rpm =3D !READ_ONCE(stream->dead);
  /* rpm =3D=3D true */
                                  xe_device_remove()
                                    ...
                                    xe_oa_fini()
                                      xe_oa_quiesce_gt()
                                        mutex_lock(&gt->oa.gt_lock)
                                        xe_oa_destroy_locked(stream)
                                          stream->dead =3D true
                                        mutex_unlock(&gt->oa.gt_lock)
                                    /* driver unbind completes */
  xe_pm_runtime_get(...)  <-- runtime PM on unbound device
  ...
  xe_pm_runtime_put(...)

Nothing in xe_oa_fini() or devres_release_all() waits for an in-flight
xe_oa_release() that has not yet acquired gt->oa.gt_lock.

> +	/* gt_lock serializes against xe_oa_fini(), which destroys the stream o=
n device removal */
>  	mutex_lock(&gt->oa.gt_lock);
> -	xe_oa_destroy_locked(stream);
> +	if (!stream->dead)
> +		xe_oa_destroy_locked(stream);
>  	mutex_unlock(&gt->oa.gt_lock);
> =20
>  	xe_oa_free_oa_buffer(stream);

[Severity: Medium]
Can dropping gt->oa.gt_lock before xe_oa_free_oa_buffer() let
xe_bo_pinned_fini() race with unpinning stream->oa_buffer.bo?

CPU0                              CPU1
xe_oa_release()
  mutex_lock(&gt->oa.gt_lock)
  xe_oa_destroy_locked(stream)
    u->exclusive_stream =3D NULL
  mutex_unlock(&gt->oa.gt_lock)
                                  xe_oa_quiesce_gt()
                                    mutex_lock(&gt->oa.gt_lock)
                                    /* exclusive_stream is NULL, skips
                                       xe_bo_dma_unmap_pinned() */
                                    mutex_unlock(&gt->oa.gt_lock)
                                  xe_bo_pinned_fini()
                                    xe_bo_apply_to_pinned()
                                      xe_bo_dma_unmap_pinned(bo)
  xe_oa_free_oa_buffer(stream)
    xe_bo_unpin_map_no_vm(bo)  <-- races on xe_tt->sg without bo lock

Once xe_bo_unpin_map_no_vm() unpins and unlocks the BO while
xe_bo_apply_to_pinned() still holds its temporary BO reference, a
concurrent shrinker unmap (xe_tt_unmap_sg()) and xe_bo_dma_unmap_pinned()
can both unmap and free xe_tt->sg.  Keeping xe_oa_free_oa_buffer() inside
gt->oa.gt_lock (or DMA-unmapping before clearing exclusive_stream) would
close this window.

>  	mutex_destroy(&stream->stream_lock);
>  	kfree(stream);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> +	if (rpm)
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	/*
> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue.=
 Once the device
> +	 * is unplugged, this may be the last reference on the drm device, so l=
et the destroy
> +	 * finish before drm_dev_put() releases the GGTT.
> +	 */
> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
> =20
>  	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);

[Severity: Medium]
Can drm_dev_is_unplugged() return false right before drm_dev_unplug() runs
on driver unbind, skipping flush_workqueue() when bo->delayed_delete is
already queued on xe->ttm.wq?

CPU0                              CPU1
xe_oa_release()
  xe_oa_free_oa_buffer(stream)
    /* queues bo->delayed_delete
       on xe->ttm.wq */
  drm_dev_is_unplugged(...)
    /* returns false */
                                  xe_device_remove()
                                    drm_dev_unplug(&xe->drm)
                                    ...
                                    /* devm drops its drm_dev_put() */
  drm_dev_put(&xe->drm)
    drm_managed_release()
      ggtt_fini_early()
                                  ttm_bo_delayed_delete()
                                    xe_ttm_bo_destroy()
                                      xe_ggtt_remove_bo()  <-- UAF on ggtt

ggtt_fini_early() is registered with drmm after xe_device_destroy(), so on
the final drm_dev_put() it tears down ggtt->mm and frees tile->mem.ggtt
before xe_device_destroy() calls ttm_device_fini() to drain xe->ttm.wq.

[ ... ]

> @@ -2673,6 +2740,49 @@ static void xe_oa_unregister(void *arg)
>  	oa->metrics_kobj =3D NULL;
>  }
> =20
> +static void xe_oa_quiesce_gt(struct xe_gt *gt)
> +{
> +	int i;
> +
> +	mutex_lock(&gt->oa.gt_lock);
> +	for (i =3D 0; i < gt->oa.num_oa_units; i++) {
> +		struct xe_oa_stream *stream =3D gt->oa.oa_unit[i].exclusive_stream;
> +
> +		if (!stream)
> +			continue;
> +
> +		xe_oa_destroy_locked(stream);
> +
> +		/*
> +		 * The OA buffer stays pinned until the stream fd is released, an mmap=
 may still
> +		 * hold a reference on it. Drop its DMA mapping now: the fd may be rel=
eased, and
> +		 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without th=
e BO lock.
> +		 */
> +		xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);

[Severity: Medium]
Even after the device is unplugged, can a temporary reference on
stream->oa_buffer.bo outlive xe_oa_release()'s flush_workqueue(xe->ttm.wq)
so that bo->delayed_delete is queued only after the flush?

xe_bo_dma_unmap_pinned() leaves bo->pinned_link on
xe->pinned.early.kernel_bo_present, where xe_bo_pinned_fini() ->
xe_bo_apply_to_pinned() grabs a temporary reference via xe_bo_get(bo) and
drops xe->pinned.lock before calling xe_bo_put(bo):

CPU0                              CPU1
xe_bo_pinned_fini()
  xe_bo_apply_to_pinned()
    xe_bo_get(bo)
    spin_unlock(&xe->pinned.lock)
                                  xe_oa_release()
                                    xe_oa_free_oa_buffer(stream)
                                      xe_bo_unpin(bo)
                                      xe_bo_put(bo) /* refcount > 0 */
                                    flush_workqueue(xe->ttm.wq)
    xe_bo_dma_unmap_pinned(bo)
    xe_bo_put(bo)
      /* queues bo->delayed_delete
         after flush_workqueue() */
                                    drm_dev_put(&xe->drm)
                                      ggtt_fini_early()  <-- UAF in destroy

The same can happen if memory reclaim (xe_shrinker_scan()) grabs a
temporary reference on the BO between xe_bo_unpin() + xe_bo_unlock() and
xe_bo_put() in xe_bo_unpin_map_no_vm().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121020145.1473=
84-9-umesh.nerlige.ramappa@intel.com?part=3D7
