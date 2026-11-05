Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D2606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAzpXxK4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB710E2A9;
	Thu,  5 Nov 2026 02:11:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1310E2A9
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 02:11:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DEE3A43AF9;
 Thu,  5 Nov 2026 02:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A538A1F000C1;
 Thu,  5 Nov 2026 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793844686;
 bh=X2IMDpV7ZtPJVmccrBA3Rpr9y1GKoJCbo5U8bVH/900=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hAzpXxK4lyAxmaIGi+mEniOuG+vk8FhxogDk9TgnULA09yfn/lDEDh8QGtHVv7/07
 fl9U9qc6BVA6vfh09x0XgRBNfgHvvPz4yZTJujwCqyxaCbgEoyoDfFi96JZdILNZ2f
 I6V2DPuVbDCg42J4Cq8fNuv6cjKZwGiCz99i45tTlkzFbs++F5INulPaQjL8Bs/ves
 jJ27OhPiHRxs91JTETHXEULc3X/G27sAykvnvBYxTFxHkkwJwiIHsK+1IAn694N1RS
 RyR5WnkyVQzdimH73W5HEqkejZKRfwTDUwyHmYeutVuNaRVDhXnTKcB+erYJEHIFnf
 2Pz+sjpeAK9zQ==
Message-ID: <sashiko-outbox-198433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261105001559.3288915-16-umesh.nerlige.ramappa@intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
 <20261105001559.3288915-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 02:11:26 +0000
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
- [Critical] drm/xe/oa: active poll_check_timer freed in xe_oa_destroy_lock=
ed() when wedged
- [High] drm/xe/oa: broken batch cancellation and drain in xe_oa_stream_dra=
in()
- [High] drm/xe/oa: unpinning mapped OA BO in xe_oa_quiesce_oa_unit() cause=
s UAF
- [High] drm/xe/oa: stream_lock deadlock and missing unplug check in xe_oa_=
ioctl()
- [Medium] drm/xe/oa: NULL stream->oa->xe access before unplug check in xe_=
oa_mmap()
--

commit 6bc0367bf37beae85d632d239b653880aa00eb20
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit introduces xe_oa_quiesce() to disable active OA streams, stop
their poll timers, and release device-bound resources on driver unbind or
PCI slot reset while keeping the stream structure alive until the file
descriptor is closed. It also wraps OA ioctls, mmap, and release in
drm_dev_enter() sections to synchronize against device unplug.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 31fc1e7675de0..175e833520bad 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -895,6 +920,13 @@ static void xe_oa_stream_drain(struct xe_oa_stream *=
stream)
>  	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
>  		return;
> =20
> +	if (READ_ONCE(stream->dead)) {
> +		if (q->vm)
> +			xe_exec_queue_kill(q);
> +		else
> +			q->ops->kill(q);
> +	}
> +
>  	timeout =3D msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
>  	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
>  		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");

[Severity: High]
As reported by Sashiko on v3 [1], does killing the exec queue in
xe_oa_stream_drain() when stream->dead is set actually stop in-flight OA
batches on the hardware or cancel unstarted batches waiting on input
dependencies?

stream->dead is only set in xe_oa_quiesce_oa_unit(), which runs after
drm_dev_unplug() has marked xe->drm.unplugged =3D true. When
xe_oa_stream_drain() calls xe_exec_queue_kill(q) or q->ops->kill(q):

guc_exec_queue_kill()
  xe_guc_exec_queue_trigger_cleanup()
    xe_sched_tdr_queue_imm()
      guc_exec_queue_timedout_job()

For an OA batch already in flight on sched->base.pending_list,
guc_exec_queue_timedout_job() takes the early unplug exit without disabling
scheduling in GuC:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
	if (!drm_dev_enter(&xe->drm, &idx)) {
		xe_sched_job_set_error(job, -ENODEV);
		return DRM_GPU_SCHED_STAT_NO_HANG;
	}
}

xe_sched_job_set_error() signals job->fence and stream->last_fence in
software immediately while the batch is still executing on the GPU. As a
result, dma_fence_wait_timeout() returns right away, allowing the running G=
PU
batch to overwrite OA registers after xe_oa_stream_hw_teardown() and read
oa_bo->bb while xe_oa_stream_free_resources() -> xe_oa_free_configs() ->
xe_bb_free() frees the batchbuffer suballocation.

Conversely, if an OA config batch was submitted with an unsignaled input sy=
nc
dependency (via DRM_XE_OA_PROPERTY_SYNCS) and an output sync, the job is
still sitting in q->entity->job_queue rather than sched->base.pending_list.
Because guc_exec_queue_kill() only triggers TDR on pending_list and does not
tear down q->entity while the unscheduled job holds a reference on q, the j=
ob
is not canceled and dma_fence_wait_timeout() stalls for the full timeout.

> @@ -1697,6 +1730,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream =
*stream,
>  			       unsigned int cmd,
>  			       unsigned long arg)
>  {
> +	if (stream->dead)
> +		return -ENODEV;
> +
>  	switch (cmd) {
>  	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
>  		return xe_oa_enable_locked(stream);

[Severity: High]
Can stream fd ioctls in xe_oa_ioctl() race with device removal or wedge, or
deadlock xe_oa_quiesce_oa_unit() on stream->stream_lock?

Unlike the DRM device ioctl in xe_observation.c, the stream file descriptor=
's
unlocked_ioctl handler (xe_oa_ioctl() -> xe_oa_ioctl_locked() in xe_oa.c)
bypasses drm_ioctl() and does not enter a drm_dev_enter() section or check
xe_wedged(). During xe_device_remove(), drm_dev_unplug(),
xe_bo_pci_dev_remove_all(), xe_pm_fini(), and earlier devm actions such as
xe_device_sanitize() all run before the devm action xe_oa_fini() sets
stream->dead =3D true. Similarly, stream->dead is not set when the device
wedges or when prepare_device_for_reset() disables the PCI device before sl=
ot
reset. Couldn't userspace invoke DRM_XE_OBSERVATION_IOCTL_ENABLE, DISABLE, =
or
CONFIG on the stream fd during that window and access MMIO or submit batche=
s?

In addition, when DRM_XE_OBSERVATION_IOCTL_CONFIG is called without output
syncs (!num_signal), xe_oa_ioctl() holds stream->stream_lock while
xe_oa_emit_oa_config() waits uninterruptibly:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_emit_oa_config() {
	/* If nothing needs to be signaled we wait synchronously */
	if (!num_signal) {
		dma_fence_wait(&ofence->base, false);
		dma_fence_put(&ofence->base);
	}
}

If that config job is blocked in q->entity waiting on an unsignaled input
sync dependency (or queued on a wedged LR-VM exec_q with no reset where
guc_exec_queue_run_job() skips submission), dma_fence_wait() never completes
while holding stream->stream_lock. When xe_oa_fini() ->
xe_oa_quiesce_oa_unit() then tries to acquire mutex_lock(&stream->stream_lo=
ck)
before setting stream->dead or draining the queue, won't driver unbind or P=
CI
slot reset deadlock?

> @@ -1729,6 +1765,12 @@ static long xe_oa_ioctl(struct file *file,
> =20
>  static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>  {
> +	if (stream->dead) {
> +		mutex_destroy(&stream->stream_lock);
> +		kfree(stream);
> +		return;
> +	}
> +
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
>  	/* A wedged device may be unresponsive, skip HW access */
> @@ -1745,17 +1787,30 @@ static void xe_oa_destroy_locked(struct xe_oa_str=
eam *stream)
>  	kfree(stream);
>  }

[Severity: Critical]
If the device is wedged before unplug and userspace closes an enabled OA
stream that has DRM_XE_OA_PROPERTY_SAMPLE_OA set, doesn't
xe_oa_destroy_locked() free stream while stream->poll_check_timer is still
active?

In xe_oa_release(), if drm_dev_enter() succeeds while xe_wedged() is true, =
it
calls xe_oa_destroy_locked(stream) with stream->dead =3D=3D false:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_destroy_locked() {
	/* A wedged device may be unresponsive, skip HW access */
	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
		xe_oa_disable_locked(stream);

	xe_oa_stream_destroy(stream);
	...
	kfree(stream);
}

In the normal destroy path, hrtimer_cancel(&stream->poll_check_timer) is on=
ly
called inside xe_oa_disable_locked() -> xe_oa_stream_disable(). Unlike
xe_oa_quiesce_oa_unit(), which explicitly cancels stream->poll_check_timer
even when hw_accessible is false, skipping xe_oa_disable_locked() when wedg=
ed
leaves poll_check_timer armed while xe_oa_stream_destroy() frees
stream->oa_buffer.bo and xe_oa_destroy_locked() frees stream, causing
xe_oa_poll_check_timer_cb() to dereference freed memory in hardirq context.

[ ... ]

> @@ -1763,11 +1818,13 @@ static int xe_oa_release(struct inode *inode, str=
uct file *file)
>  static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>  	struct xe_oa_stream *stream =3D file->private_data;
> +	struct xe_device *xe =3D gt_to_xe(stream->gt);
>  	int ret =3D xe_observation_paranoid_check();
> -	struct xe_bo *bo =3D stream->oa_buffer.bo;
> +	struct xe_bo *bo;
> +	int idx;
> =20
>  	if (ret) {
> -		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer=
\n");
> +		drm_dbg(&xe->drm, "Insufficient privilege to map OA buffer\n");
>  		return ret;
>  	}
> =20
> @@ -1780,10 +1837,26 @@ static int xe_oa_mmap(struct file *file, struct v=
m_area_struct *vma)
>  		return -EINVAL;
>  	}
> =20
> +	/*
> +	 * xe_oa_quiesce() frees the OA buffer only after drm_dev_unplug(), whi=
ch waits for
> +	 * this section to finish. Can't use stream_lock here, it is held acros=
s user copies
> +	 * which fault on mmap_lock, held by the caller.
> +	 */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (READ_ONCE(stream->dead)) {
> +		ret =3D -ENODEV;
> +		goto exit;
> +	}

[Severity: Medium]
In xe_oa_mmap(), the vma->vm_pgoff check right before drm_dev_enter() still
uses stream->oa->xe:

	if (vma->vm_pgoff) {
		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
		return -EINVAL;
	}

After xe_oa_fini() sets oa->xe =3D NULL, calling mmap() with a non-zero off=
set
on a dead stream fd will evaluate &stream->oa->xe->drm with stream->oa->xe =
=3D=3D
NULL and return -EINVAL instead of -ENODEV. Should this use &xe->drm and
check drm_dev_enter() / stream->dead before validating the mmap arguments?

[ ... ]

> @@ -2625,6 +2702,95 @@ static void xe_oa_unregister(void *arg)
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
> +
> +	/*
> +	 * drm_dev_unplug() has already zapped the userspace mappings of the OA=
 buffer and
> +	 * refaults get a dummy page, so the OA buffer can go. Each vma holds a=
 reference on
> +	 * the BO, keeping the BO object itself alive until munmap. The BO is t=
hen no longer
> +	 * pinned when xe_bo_pinned_fini() DMA-unmaps the other kernel BOs, so =
drop its DMA
> +	 * mapping here, while it is still pinned.
> +	 */
> +	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
> +	xe_oa_stream_free_resources(stream);

[Severity: High]
When a userspace VMA still holds a GEM reference on stream->oa_buffer.bo
across driver unbind or PCI slot reset, can unpinning the BO in
xe_oa_quiesce_oa_unit() -> xe_oa_stream_free_resources() ->
xe_bo_unpin_map_no_vm() lead to a use-after-free on tile->mem.ggtt and
xe->mem.shrinker?

During xe_device_remove(), xe_bo_pci_dev_remove_all() runs while
stream->oa_buffer.bo is still pinned, so ttm_resource_manager_evict_all()
skips it. When the devm action xe_oa_fini() subsequently calls
xe_oa_stream_free_resources(), xe_bo_unpin_map_no_vm() unpins the BO while
the VMA still holds a GEM reference:

xe_oa_stream_free_resources()
  xe_oa_free_oa_buffer()
    xe_bo_unpin_map_no_vm()
      xe_bo_unpin()
        xe_bo_account_unpin()
          xe_ttm_tt_account_add()

Because the VMA keeps the BO alive past xe_bo_unpin_map_no_vm(), unpinning =
it
adds its pages to shrinker->shrinkable_pages and places the BO onto the TTM
LRU after xe_bo_pci_dev_remove_all() has already finished, with
bo->ggtt_node[id] and bo->ttm still allocated.

When the process later exits or unmaps the VMA and closes the stream fd:

1. ttm_bo_vm_close() drops the last GEM reference on the BO. When
   want_init_on_free() is enabled (for example CONFIG_INIT_ON_FREE_DEFAULT_=
ON)
   and bo->ttm is non-NULL, ttm_bo_release() queues ttm_bo_delayed_delete()
   on xe->ttm.wq instead of freeing the BO immediately.
2. Closing the stream fd in xe_oa_release() drops the last drm_device
   reference via drm_dev_put(&xe->drm), running drm_managed_release().
3. In drm_managed_release(), ggtt_fini_early() destroys ggtt->wq and calls
   drm_mm_takedown(&ggtt->mm) while bo->ggtt_node is still allocated, and
   drmm frees tile->mem.ggtt and runs xe_shrinker_fini() before the final
   drmm callback xe_device_destroy() calls ttm_device_fini(&xe->ttm) to dra=
in
   xe->ttm.wq.
4. When ttm_bo_delayed_delete() -> xe_ttm_bo_destroy() runs, it calls
   xe_ggtt_remove_bo(tile->mem.ggtt, bo) on the already-freed tile->mem.ggtt
   (and if the shrinker walked the unpinned BO after unbind,
   xe_shrinker_fini() hits the xe_assert() on shrinkable_pages/populated_tts
   and frees xe->mem.shrinker before xe_ttm_tt_unpopulate() subtracts the
   pages).

[1] https://lore.kernel.org/r/20261104005221.3230003-12-umesh.nerlige.ramap=
pa@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105001559.3288=
915-9-umesh.nerlige.ramappa@intel.com?part=3D7
