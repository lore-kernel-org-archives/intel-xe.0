Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE0606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foUujuqq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5B110E662;
	Wed,  4 Nov 2026 01:35:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76210E662
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 01:35:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3AECD60D83;
 Wed,  4 Nov 2026 01:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5941F00A18;
 Wed,  4 Nov 2026 01:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793756116;
 bh=ux44AZPcWPmmoeHy9rQzaQCKkU5FUTWpVizKNG8m3EY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=foUujuqqw+oZbkYGW9mB7WPXMigSlaH/kKNdG1mMHJOj3x5lSJ9UHqI2CwfJ1Yy8h
 nfBz0mSL8JBJ85F7LBKWclSW//mESkO+aAPJcab76b1OtlGgD6cagd9tniv6/HuiJc
 1Zu6d8CD4DQerlAQpG4+BMH49SUvbCajqc6B3xhvgs6hICKdHp6zaRU9HhH6RQhRea
 iVpC0ogeRFT4LFjqGQSTIe3dTYTqDWBD1yHPsvBpDJ8g4SbuynovAKJx22mwXPAtAT
 k9Til1VdRqVE751wOk2Jgo0gDLsY18EWDHaN+vndUoQba8oupqquS3tuZWNORS8MzM
 x/UMa5bFkDvaw==
Message-ID: <sashiko-outbox-196362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104005221.3230003-12-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
 <20261104005221.3230003-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:35:16 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe/oa: incomplete teardown when xe_oa_release() precedes xe_oa=
_quiesce()
- [High] drm/xe/oa: missing wait on stream->last_fence in xe_oa_quiesce_oa_=
unit()
- [Medium] drm/xe/oa: incomplete LRI batch drain on user exec_q in xe_oa_lo=
ad_with_lri()
--

commit 3662190fcd57d2e4b3bb172dd837ebb9aa4e7e39
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit introduces xe_oa_quiesce() called from xe_oa_fini() to clean up
active OA streams during driver unbind or PCI reset while keeping the
stream structure alive until the file descriptor is closed. It also wraps
OA mmap and observation ioctls in drm_dev_enter() sections.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 7a151f338ae25..b4ba8874f17eb 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -752,6 +775,20 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *=
stream, struct xe_oa_reg *re
>  		goto free_bb;
>  	}
>  	xe_bb_free(bb, fence);
> +
> +	/*
> +	 * When quiescing the stream, GuC submission and the fence irqs are tor=
n down right
> +	 * after, so wait for the batch. It may be queued behind other jobs of =
the exec queue,
> +	 * which complete or get reset within the job timeout.
> +	 */
> +	if (READ_ONCE(stream->dead)) {
> +		struct xe_exec_queue *q =3D stream->exec_q ?: stream->k_exec_q;
> +		long timeout =3D msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
> +
> +		if (!dma_fence_wait_timeout(fence, false, timeout))
> +			drm_err(&stream->oa->xe->drm,
> +				"Timed out waiting for OA LRI batch on quiesce\n");
> +	}
>  	dma_fence_put(fence);
> =20
>  	return 0;

[Severity: Medium]
As reported by Sashiko on v3 [1], when a stream is attached to a user
stream->exec_q in drivers/gpu/drm/xe/xe_oa.c:xe_oa_load_with_lri(), is
waiting for q->sched_props.job_timeout_ms + HZ sufficient to guarantee the
LRI teardown batch completes before GuC submission and fence IRQs are torn
down?

When xe_device_remove() -> xe_oa_fini() -> xe_oa_quiesce() ->
xe_oa_quiesce_oa_unit() -> xe_oa_stream_hw_teardown() ->
xe_oa_disable_metric_set() -> xe_oa_configure_oa_context() ->
xe_oa_load_with_lri() submits to a user stream->exec_q, it looks like
dma_fence_wait_timeout() can time out in three situations:

1. If stream->exec_q belongs to a preempt-fence (LR mode) VM,
xe_bo_pci_dev_remove_all() evicts the VM's BOs after drm_dev_unplug() and
suspends stream->exec_q via __guc_exec_queue_process_msg_suspend(). If the
queue was idle when preempt_rebind_work_func() ran,
vm->preempt.rebind_deactivated is set and xe_oa_submit_bb() does not call
xe_vm_reactivate_rebind(), so submit_exec_queue() returns early on
exec_queue_suspended(q) without submitting the LRI batch to GuC while the
scheduler timeout is MAX_SCHEDULE_TIMEOUT.

2. If an earlier user job on stream->exec_q->entity is blocked on an
unsignaled input dependency in drm_sched_entity_pop_job(), the LRI job
queued behind it never enters sched->pending_list or starts its timeout
timer.

3. If a prior user job on stream->exec_q times out after drm_dev_unplug(),
guc_exec_queue_timedout_job() takes the !drm_dev_enter() path:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
	if (!drm_dev_enter(&xe->drm, &idx)) {
		xe_sched_job_set_error(job, -ENODEV);
		return DRM_GPU_SCHED_STAT_NO_HANG;
	}
}

Because that only errors the single head job without disabling scheduling or
canceling subsequent jobs, the OA LRI job behind it requires another full
job_timeout_ms cycle.

When dma_fence_wait_timeout() times out here, won't the LRI batch's
xe_hw_fence remain on gt->fence_irq[i].pending and trigger
XE_WARN_ON(!list_empty(&irq->pending)) in xe_hw_fence_irq_finish() during
xe_gt_fini()?

[ ... ]

> @@ -1691,6 +1731,12 @@ static long xe_oa_ioctl(struct file *file,
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
>  	if (stream->enabled)

[Severity: High]
What happens if userspace closes the OA stream file descriptor (or the
process exits) after xe_device_remove() or xe_wedge_declare() has started,
but before the devm callback xe_oa_fini() -> xe_oa_quiesce_gt() acquires
gt->oa.gt_lock?

In that window, xe_oa_release() -> xe_oa_destroy_locked() in
drivers/gpu/drm/xe/xe_oa.c sees stream->dead =3D=3D false and runs the norm=
al
teardown path:

1. In xe_oa_destroy_locked() -> xe_oa_stream_destroy() ->
xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
xe_oa_configure_oa_context() -> xe_oa_load_with_lri(), READ_ONCE(stream->de=
ad)
is false, so xe_oa_load_with_lri() does not wait for the submitted LRI
batch fence. Because xe_oa_stream_destroy() also clears u->exclusive_stream
to NULL, xe_oa_quiesce_oa_unit() sees !stream and returns immediately,
allowing guc_submit_fini() and xe_gt_fini() -> xe_hw_fence_irq_finish() to
run while the LRI batch fence is still pending on gt->fence_irq[i].pending.

2. If the device is wedged (including after prepare_device_for_reset() has
called pci_disable_device()), xe_oa_destroy_locked() does not check
xe_wedged(xe) and still calls xe_oa_disable_locked() and
xe_oa_stream_hw_teardown(), performing MMIO accesses and LRI batch
submissions against a wedged or disabled device.

3. If xe_oa_destroy_locked() runs after xe_bo_pci_dev_remove_all(),
xe_oa_free_oa_buffer() calls xe_bo_unpin_map_no_vm(stream->oa_buffer.bo)
without calling xe_bo_dma_unmap_pinned(). Since xe_bo_unpin() removes the
BO from xe->pinned.early.kernel_bo_present, if an mmap VMA still holds a BO
reference or ttm_bo_release() defers cleanup to bdev->wq,
xe_bo_pinned_fini() will not unmap its DMA mapping before devres release
completes.

Should xe_oa_destroy_locked() also handle the unplugged and wedged cases
(unmapping the pinned OA BO DMA, skipping HW access when wedged, and
waiting for any in-flight LRI fences when unplugged)?

[ ... ]

> @@ -2575,6 +2643,92 @@ static void xe_oa_unregister(void *arg)
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
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +
> +	if (stream->sample)
> +		hrtimer_cancel(&stream->poll_check_timer);
> +
> +	wake_up_all(&stream->poll_wq);
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
> +	if (stream->exec_q) {
> +		xe_exec_queue_put(stream->exec_q);
> +		stream->exec_q =3D NULL;
> +	}
> +	drm_syncobj_put(stream->ufence_syncobj);
> +
> +	WRITE_ONCE(u->exclusive_stream, NULL);
> +	mutex_unlock(&stream->stream_lock);
> +}

[Severity: High]
Does xe_oa_quiesce_oa_unit() in drivers/gpu/drm/xe/xe_oa.c also need to
wait for or cancel stream->last_fence before tearing down hardware state
and freeing stream resources?

When userspace opens an OA stream (DRM_XE_OBSERVATION_OP_STREAM_OPEN) or
reconfigures it (DRM_XE_OBSERVATION_IOCTL_CONFIG) with output syncs
(num_signal > 0), xe_oa_emit_oa_config() submits oa_bo->bb via
xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb), records the job
fence in stream->last_fence via xe_oa_update_last_fence(), and returns
without waiting:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_emit_oa_config() {
	/* Update last fence too before adding callback */
	xe_oa_update_last_fence(stream, fence);
	...
	/* If nothing needs to be signaled we wait synchronously */
	if (!num_signal) {
		dma_fence_wait(&ofence->base, false);
		dma_fence_put(&ofence->base);
	}
}

If xe_oa_fini() -> xe_oa_quiesce() -> xe_oa_quiesce_oa_unit() runs while
stream->last_fence is still unsignaled:

1. For streams without stream->exec_q (where batches run on
stream->k_exec_q), streams on video engines where
xe_oa_configure_oa_context() is a no-op, or when hw_accessible is false,
xe_oa_load_with_lri() is never called. Neither xe_oa_quiesce_oa_unit() nor
xe_oa_free_configs() waits for stream->last_fence.

2. The in-flight oa_bo->bb LRI batch on stream->k_exec_q can execute on the
GPU during or after xe_oa_stream_hw_teardown(), overwriting OA/NOA
registers after xe_oa_disable_metric_set() has cleared them and after
xe_force_wake_put() has dropped stream->fw_ref.

3. When devres subsequently runs guc_submit_fini() and xe_gt_fini() ->
xe_hw_fence_irq_finish(), an in-flight config batch job on
sched->pending_list still has its xe_hw_fence on gt->fence_irq[i].pending,
triggering XE_WARN_ON(!list_empty(&irq->pending)). Moreover, if that config
batch job is still queued in q->entity waiting on an unsignaled input sync
dependency from stream->syncs, the job holds a reference on the queue (so
xe_exec_queue_put() in xe_oa_stream_free_resources() does not run
xe_exec_queue_destroy() / drm_sched_entity_fini()), while
sched->pending_list is empty so xe_guc_submit_pause_abort() does not run
TDR, leaking the scheduler job, suballocation, xe_exec_queue, and
drm_device reference.

[1] https://lore.kernel.org/r/20261030233839.2284694-8-umesh.nerlige.ramapp=
a@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104005221.3230=
003-7-umesh.nerlige.ramappa@intel.com?part=3D5
