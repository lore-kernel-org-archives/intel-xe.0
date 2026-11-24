Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2B606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cb8163gn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FBC10E57C;
	Tue, 24 Nov 2026 21:02:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7CE10E57C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 21:02:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 082684111C;
 Tue, 24 Nov 2026 21:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822821F000C6;
 Tue, 24 Nov 2026 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795554144;
 bh=2XQ4ZSaWzoyPqyCraBSn4Lk5uK491vMbf8xQaINH9uU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Cb8163gnUoG2ON4DtUOBHxlJCD4m139EREFQBDsNk8ao+M7MIK6AwwRN++U76DGM/
 AnsFeiOuLoiMUxcdEUSc54wrg/AGeTOc5tB5ZpdNfRKO2x8o/0hv3exREXGbYcOU+J
 /U/YQrOSa4qG49N62VvSpl4J25KVWK+K19ANDtIDaEogGicD8q70ik6EljTM8xDWcl
 o3lKnCsh999pfkyZEpq69RXjNhssWDByrzui20xHalfhVncRFz+Iwin2zy3G3l2QNe
 WJ/eub6ROAc+4fM4Bk3FQzqjFYmydCRKUG3DzzO3XEfyD42NskAiOhOSY4vZBQQJ3p
 JHLa1Po5y3+8w==
Message-ID: <sashiko-outbox-232014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124201150.405479-16-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
 <20261124201150.405479-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 21:02:24 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/oa: OA buffer BO refs in xe_oa_release() outlive
  ttm.wq flush
- [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
  skips ttm.wq flush
- [Medium] drm/xe/oa: async queue teardown in xe_oa_quiesce() after
  xe_destroy_wq_flush()
--

commit 060135101d7eb021924f5ed68180ceaa519804a1
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams in xe_oa_fini() on driver unbind or
PCI reset by marking them dead, tearing down hardware and device-bound
resources, and deferring freeing the stream struct and OA buffer until
xe_oa_release().

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d37724e280160..2b88f3fa210d9 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -1755,33 +1782,69 @@ static long xe_oa_ioctl(struct file *file,
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
> +	bool rpm;
> =20
> -	xe_pm_runtime_get(gt_to_xe(gt));
> +	/*
> +	 * gt_lock serializes against xe_oa_fini(), which destroys the stream o=
n device removal.
> +	 * Unless it did, the device stays bound while this holds gt_lock, so t=
ake a runtime PM
> +	 * reference only then, and don't wake a removed device. Free the OA bu=
ffer under gt_lock
> +	 * too, so that it is unpinned before xe_oa_fini() and xe_bo_pinned_fin=
i() can run.
> +	 */
>  	mutex_lock(&gt->oa.gt_lock);
> -	xe_oa_destroy_locked(stream);
> -	mutex_unlock(&gt->oa.gt_lock);
> +	rpm =3D !stream->dead;
> +	if (rpm) {
> +		xe_pm_runtime_get(gt_to_xe(gt));
> +		xe_oa_destroy_locked(stream);
> +	}
> =20
>  	xe_oa_free_oa_buffer(stream);
>  	mutex_destroy(&stream->stream_lock);
>  	kfree(stream);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> +	if (rpm)
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	mutex_unlock(&gt->oa.gt_lock);
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

[Severity: Medium]
Can a temporary reference on stream->oa_buffer.bo outlive xe_oa_release()
and defer BO destruction past flush_workqueue(xe->ttm.wq)?

xe_oa_quiesce_gt() calls xe_bo_dma_unmap_pinned(stream->oa_buffer.bo),
which clears xe_tt->sg but leaves bo->pinned_link on
xe->pinned.early.kernel_bo_present.  During devres teardown,
xe_bo_pinned_fini() -> xe_bo_apply_to_pinned() visits that list and takes
a temporary reference outside gt->oa.gt_lock and xe->pinned.lock:

drivers/gpu/drm/xe/xe_bo_evict.c:xe_bo_apply_to_pinned() {
	...
		xe_bo_get(bo);
		list_move_tail(&bo->pinned_link, &still_in_list);
		spin_unlock(&xe->pinned.lock);

		ret =3D pinned_fn(bo);
		if (ret && unpinned_fn) {
			spin_lock(&xe->pinned.lock);
			if (!list_empty(&bo->pinned_link))
				list_move(&bo->pinned_link, new_list);
			spin_unlock(&xe->pinned.lock);
		}
		xe_bo_put(bo);
	...
}

This allows the final BO put to happen after flush_workqueue(xe->ttm.wq):

CPU0 (devres teardown)            CPU1 (close OA fd)
xe_oa_fini()
  xe_oa_quiesce_gt()
    xe_bo_dma_unmap_pinned(bo)
    unlock(&gt->oa.gt_lock)
xe_bo_pinned_fini()
  xe_bo_apply_to_pinned()
    xe_bo_get(bo)
                                  xe_oa_release()
                                    xe_oa_free_oa_buffer()
                                      xe_bo_unpin_map_no_vm(bo)
                                        xe_bo_unpin(bo)
                                        xe_bo_put(bo)
                                    flush_workqueue(xe->ttm.wq)
    xe_bo_put(bo)
      ttm_bo_release()
        queue_work(ttm.wq,
                   &bo->delayed_delete)
                                    drm_dev_put()
                                      drm_managed_release()
                                        ggtt_fini_early()
                                          drm_mm_takedown(&ggtt->mm)
                                          /* frees tile->mem.ggtt */

kworker (xe->ttm.wq):
ttm_bo_delayed_delete()
  xe_ttm_bo_destroy()
    xe_ggtt_remove_bo(tile->mem.ggtt, bo)  <-- use-after-free

In addition, xe_bo_unpin_map_no_vm() unpins the populated OA buffer and
unlocks bo's dma_resv before calling xe_bo_put(bo).  Because
xe_bo_unpin() calls xe_bo_account_unpin() (re-adding the BO's pages to
shrinker->shrinkable_pages) and returns the BO to the TTM LRU, a
concurrent xe_shrinker_scan() can likewise acquire a temporary BO
reference before xe_bo_put(bo), or call xe_shrinker_runtime_pm_get() and
queue shrinker->pm_worker on the unplugged device.

> +
> +	/* Release the reference the OA stream kept on the driver */
> +	drm_dev_put(&gt_to_xe(gt)->drm);
> =20
>  	return 0;
>  }

[Severity: Medium]
Can drm_dev_is_unplugged() return false in xe_oa_release() when racing
with xe_device_remove(), skipping flush_workqueue(xe->ttm.wq) right before
the last drm_device reference is dropped?

drm_dev_is_unplugged() drops its SRCU read lock immediately, and
xe_device_remove() -> xe_bo_pci_dev_remove_all() does not flush
xe->ttm.wq for already-deleted BOs (ttm_bo_evict_first() only calls
ttm_bo_cleanup_memtype_use() when bo->deleted is true):

CPU0 (close OA fd)                CPU1 (driver unbind)
xe_oa_release()
  xe_oa_free_oa_buffer()
    xe_bo_put(bo)
      /* queues bo->delayed_delete
         on xe->ttm.wq */
  if (drm_dev_is_unplugged(...))
    /* false: flush skipped */
                                  xe_pci_remove()
                                    xe_device_remove()
                                      drm_dev_unplug()
                                      xe_bo_pci_dev_remove_all()
                                    ...
                                    devm_drm_dev_init_release()
                                      drm_dev_put()
  drm_dev_put()
    drm_managed_release()
      ggtt_fini_early()
        drm_mm_takedown(&ggtt->mm)

kworker (xe->ttm.wq):
ttm_bo_delayed_delete()
  xe_ttm_bo_destroy()
    xe_ggtt_remove_bo(tile->mem.ggtt, bo)  <-- use-after-free

Because ggtt_fini_early() is registered with drmm after
xe_device_destroy(), final drm_dev_put() runs ggtt_fini_early() and frees
tile->mem.ggtt before xe_device_destroy() calls ttm_device_fini(&xe->ttm)
to drain xe->ttm.wq.

[ ... ]

> @@ -2674,6 +2743,49 @@ static void xe_oa_unregister(void *arg)
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
> +	}
> +	mutex_unlock(&gt->oa.gt_lock);
> +}

[Severity: Medium]
Does dropping stream->k_exec_q and stream->exec_q in xe_oa_quiesce_gt()
queue asynchronous GuC exec queue destruction after xe_pci_remove() has
already called xe_destroy_wq_flush() and xe_pm_fini()?

In xe_pci_remove(), xe_destroy_wq_flush() and xe_pm_fini() run before
devres invokes xe_oa_fini() -> xe_oa_quiesce() -> xe_oa_quiesce_gt().
When xe_oa_destroy_locked() calls xe_exec_queue_put() on stream->k_exec_q
and stream->exec_q, guc_exec_queue_destroy() queues cleanup onto
gt->ordered_wq and then guc_exec_queue_do_destroy() onto xe_destroy_wq:

CPU0 (devres teardown)            kworker (xe_destroy_wq)
xe_oa_fini()
  xe_oa_quiesce_gt()
    xe_oa_destroy_locked()
      xe_exec_queue_put(k_exec_q)
        /* queues cleanup to
           gt->ordered_wq ->
           xe_destroy_wq */
xe_bo_pinned_fini()
  xe_bo_dma_unmap_pinned(lrc->bo)
                                  guc_exec_queue_do_destroy()
                                    xe_exec_queue_fini()
                                      xe_lrc_finish()
                                        xe_bo_unpin_map_no_vm(lrc->bo)
                                    drm_dev_put(drm)

Because xe_destroy_wq is not flushed again after xe_oa_quiesce(),
xe_lrc_finish() can unpin lrc->bo and lrc->seqno_bo while
xe_bo_pinned_fini() accesses xe_tt->sg without the BO lock.  Furthermore,
if xe_oa_release() finishes while guc_exec_queue_do_destroy() is still in
flight, guc_exec_queue_do_destroy() holds the last drm_device reference
and drops it in drm_dev_put(drm) without flushing xe->ttm.wq, allowing
ggtt_fini_early() to tear down tile->mem.ggtt before deferred LRC BO
destruction on xe->ttm.wq removes its GGTT nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124201150.4054=
79-9-umesh.nerlige.ramappa@intel.com?part=3D7
