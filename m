Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F168260A2602
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 01:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYVGEhIg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F3288DA9;
	Thu, 19 Nov 2026 01:11:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBF488DA9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 01:11:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B3FF9458B5;
 Thu, 19 Nov 2026 01:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6BC1F000C4;
 Thu, 19 Nov 2026 01:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795050702;
 bh=c7X6qb2STJVBJ0GFeIwa42GTxs0pMLVYFNP2WGoyFvU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mYVGEhIgy/l5+HwKSG3qOlzbdQIHFbfv6FM2v+861PlKnXLZAxS3XibOyhCi+AZ/b
 FZI54x1UdTzyRnKQ5hcQazPnEDJd1Y9dwhX+n/DaPHSZvMNFWXsCqADyHFpGJPjoYQ
 SQ4OPkmIFl8uys+sHN4c68cz4J7uwWagtSt8iH+1ji9rBSESGG06aexIZZFFw4VbYM
 hKDU/PkrNjHhWJRKYe7s2YnJ+eukWByqvS51TI6N+PmvMbL50NR40wLhImWhkmPqls
 jQwVYa0FqO1HhJUlAGqd450VVxp10879kD5XLMydmFyRoe2apEKoYZ23OWWpJtZJpN
 Weg3yW11vbFHA==
Message-ID: <sashiko-outbox-222279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 8/8] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119002737.3899877-18-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-18-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 01:11:41 +0000
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
- [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
  skips ttm.wq flush
- [Medium] drm/xe/oa: OA buffer BO references can outlive
  flush_workqueue() on unplug
- [Medium] drm/xe/oa: missing or blocking drain in xe_oa_stream_init()
  error path
- [Medium] drm/xe/oa: NULL sg_table deref on resume after
  xe_bo_dma_unmap_pinned()
- [Medium] drm/xe/oa: unconditional drain and batch submit on wedged
  device in destroy
--

commit 2b379416db1422398b8cce664304d4acea228c64
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams on driver unbind or PCI reset by
marking them dead and tearing down their hardware and device resources
while keeping the stream structure and pinned OA buffer allocated until
the stream file descriptor is closed.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 223419347eb7b..0b51bc818ef47 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -937,6 +959,13 @@ static void xe_oa_stream_destroy(struct xe_oa_stream=
 *stream)
>  	xe_oa_disable_metric_set(stream);
>  	xe_exec_queue_put(stream->k_exec_q);
> =20
> +	/*
> +	 * The OA buffer is freed on release of the stream fd, an mmap may stil=
l hold a
> +	 * reference on it. Drop its DMA mapping now, while pinned: the fd may =
be released, and
> +	 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the=
 BO lock.
> +	 */
> +	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
> +
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);

[Severity: Medium]
Can calling xe_bo_dma_unmap_pinned() here while stream->oa_buffer.bo stays
pinned on xe->pinned.early.kernel_bo_present cause a NULL pointer
dereference if the device suspends and resumes before
xe_oa_free_oa_buffer() unpins the BO?

CPU0                                  CPU1
xe_oa_release()
  xe_oa_destroy_locked()
    xe_oa_stream_destroy()
      xe_bo_dma_unmap_pinned(bo)
        xe_tt->sg =3D NULL
      xe_pm_runtime_put()
    xe_pm_runtime_put()
                                      xe_pm_suspend()
                                        xe_bo_evict_all()
                                      xe_pm_resume()
                                        xe_bo_restore_early()
                                          xe_bo_restore_and_map_ggtt()
                                            xe_ggtt_map_bo()
                                              xe_res_first_sg(NULL, ...)
                                                <-- NULL pointer dereference
  xe_oa_free_oa_buffer()
    xe_bo_unpin_map_no_vm(bo)

Non-MERT OA buffers are created with XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT
and remain linked on xe->pinned.early.kernel_bo_present until
xe_bo_unpin() removes bo->pinned_link.  Once xe_oa_destroy_locked() drops
the last runtime PM reference, a system or D3cold runtime suspend/resume
cycle will evict and restore the pinned BO via xe_ggtt_map_bo(), passing
xe_bo_sg(bo) =3D=3D NULL to xe_res_first_sg().

[ ... ]

> @@ -1754,19 +1786,35 @@ static long xe_oa_ioctl(struct file *file,
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
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> +	mutex_lock(&stream->stream_lock);
> +
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> =20
>  	if (stream->enabled)
>  		xe_oa_disable_locked(stream);
> =20
> +	wake_up_all(&stream->poll_wq);
> +
>  	xe_oa_stream_destroy(stream);

[Severity: Medium]
When the device is wedged, does xe_oa_stream_destroy() stall for multiple
seconds and log a timeout error?

xe_oa_stream_destroy() unconditionally calls xe_oa_stream_drain() and
xe_oa_disable_metric_set() without checking xe_wedged().  If
stream->last_fence is unsignaled when the device wedges (for example when
a config batch is waiting on an input fence or after xe_oa_emit_oa_config()
breaks out of its wait loop on wedge), xe_oa_stream_drain() sleeps
uninterruptibly for job_timeout_ms + HZ and prints "Timed out waiting for
OA batch".  Then, when stream->exec_q is set, xe_oa_disable_metric_set()
calls xe_oa_configure_oa_context(stream, false) to submit a new batch to
the already-wedged queue (which guc_exec_queue_run_job() does not submit
to hardware) and waits again in xe_oa_stream_drain() until TDR or timeout.

[Severity: Medium]
Similarly, in xe_oa_stream_init(), what happens when
xe_oa_enable_metric_set() -> xe_oa_emit_oa_config() cuts its synchronous
wait short on device unplug or wedge (introduced in commit "drm/xe/oa:
Fence OA ioctls and mmap against device unplug and wedging")?

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
	...
err_put_k_exec_q:
	xe_oa_disable_metric_set(stream);
	xe_exec_queue_put(stream->k_exec_q);
err_free_oa_buf:
	xe_oa_free_oa_buffer(stream);
err_fw_put:
	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
	xe_pm_runtime_put(stream->oa->xe);
	xe_oa_free_configs(stream);
	...
}

At that point the config batch has already been submitted to
stream->k_exec_q and recorded in stream->last_fence.  Unlike
xe_oa_stream_destroy(), err_put_k_exec_q does not call
xe_oa_stream_drain() before xe_oa_disable_metric_set().  When
stream->exec_q is NULL, the in-flight config batch on stream->k_exec_q is
never drained before OA registers, forcewake, and runtime PM are released.
When stream->exec_q is non-NULL, xe_oa_disable_metric_set() queues a
context-restore batch behind the unsignaled config batch and blocks in
xe_oa_stream_drain() for job_timeout_ms + HZ while still inside the
drm_dev_enter() section of xe_observation_ioctl(), blocking
drm_dev_unplug().

> =20
>  	if (stream->exec_q)
>  		xe_exec_queue_put(stream->exec_q);
> =20
>  	drm_syncobj_put(stream->ufence_syncobj);
> +	mutex_unlock(&stream->stream_lock);
>  	xe_pm_runtime_put(gt_to_xe(stream->gt));
>  }
> =20
> @@ -1775,14 +1823,24 @@ static int xe_oa_release(struct inode *inode, str=
uct file *file)
>  	struct xe_oa_stream *stream =3D file->private_data;
>  	struct xe_gt *gt =3D stream->gt;
> =20
> +	/* gt_lock serializes against xe_oa_fini(), which destroys the stream o=
n device removal */
>  	mutex_lock(&gt->oa.gt_lock);
> -	xe_oa_destroy_locked(stream);
> +	if (!stream->dead)
> +		xe_oa_destroy_locked(stream);
>  	mutex_unlock(&gt->oa.gt_lock);
> =20
>  	xe_oa_free_oa_buffer(stream);
>  	mutex_destroy(&stream->stream_lock);
>  	kfree(stream);
> =20
> +	/*
> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue.=
 Once the device
> +	 * is unplugged, this may be the last reference on the drm device, so l=
et the destroy
> +	 * finish before drm_dev_put() releases the GGTT.
> +	 */
> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
> +
>  	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);

[Severity: Medium]
Can xe_oa_release() race with drm_dev_unplug() and skip flushing
xe->ttm.wq before dropping the final drm_device reference?

CPU0                                  CPU1
xe_oa_release()
  xe_oa_free_oa_buffer(stream)
    ...
      queue_work(xe->ttm.wq,
                 &bo->delayed_delete)
  drm_dev_is_unplugged(&xe->drm)
    --> false
                                      xe_device_remove()
                                        drm_dev_unplug(&xe->drm)
                                        ...
                                        drm_dev_put(&xe->drm)
  drm_dev_put(&xe->drm)
    drm_managed_release()
      ggtt_fini_early()
        drm_mm_takedown(&ggtt->mm)
                                      ttm_bo_delayed_delete()
                                        xe_ttm_bo_destroy()
                                          xe_ggtt_remove_bo(ggtt, bo)
                                            <-- use-after-free on ggtt

drm_dev_is_unplugged() drops its SRCU read lock immediately, and nothing
during device removal flushes xe->ttm.wq for an already-deleted BO.  Because
ggtt_fini_early() is registered with drmm after xe_device_destroy()
(which calls ttm_device_fini() to drain xe->ttm.wq), the final
drm_dev_put() tears down and frees tile->mem.ggtt while
bo->delayed_delete is still pending on xe->ttm.wq.

[Severity: Medium]
Even after the device is already unplugged, can a temporary reference on
stream->oa_buffer.bo outlive xe_oa_free_oa_buffer() and cause
flush_workqueue(xe->ttm.wq) to run before bo->delayed_delete is queued?

CPU0                                  CPU1
xe_device_remove()
  ...
  xe_bo_pinned_fini()
    xe_bo_apply_to_pinned()
      xe_bo_get(bo)
      spin_unlock(&xe->pinned.lock)
                                      xe_oa_release()
                                        xe_oa_free_oa_buffer()
                                          xe_bo_unpin_map_no_vm(bo)
                                            xe_bo_put(bo)
                                        flush_workqueue(xe->ttm.wq)
      xe_bo_dma_unmap_pinned(bo)
      xe_bo_put(bo)
        queue_work(xe->ttm.wq,
                   &bo->delayed_delete)
  drm_dev_put(&xe->drm)
                                        drm_dev_put(&xe->drm)
                                          drm_managed_release()
                                            ggtt_fini_early()
                                              <-- ggtt freed before
                                                  bo->delayed_delete runs

Because xe_oa_stream_destroy() leaves stream->oa_buffer.bo on
xe->pinned.early.kernel_bo_present, xe_bo_pinned_fini() still visits it
and holds a reference outside xe->pinned.lock.  Similarly, in
xe_bo_unpin_map_no_vm(), xe_bo_unpin() puts the BO back on the TTM LRU
and unlocks dma-resv before xe_bo_put(bo), allowing xe_shrinker_scan() to
grab a temporary BO reference.  In either case, xe_oa_release() flushes
xe->ttm.wq before the last BO reference is dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119002737.3899=
877-10-umesh.nerlige.ramappa@intel.com?part=3D8
