Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4ED606A32D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W86W73sc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA6D10E144;
	Tue, 10 Nov 2026 19:39:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140B10E144
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:38:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 80B8E417D1;
 Tue, 10 Nov 2026 19:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B641F0089F;
 Tue, 10 Nov 2026 19:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794339534;
 bh=H59o8/eSDl3JHTKo8KNdexG7zrS3lwFScPf/8lxMImA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=W86W73scQz6b3eEI992SV1DlcyUneK9cBC0VNx1apo5rFYdy/gtSXckeZhYit+dZI
 eebzNcQ7IiKfMEgJMdf094AKHKg2Js+BEoze0IyrTdPL+POxAmbwg7KGprcmI7Yj+D
 zUOIrHVImz+B6whZSVcI4XIfJu/atMagpBy1X5xuo4XTq+V6rnlDXYQO2VVbAcrqH8
 jLCpg/A0j/7sXc7PPKtQ4uuRTkt3Rrzjfn8ayvhEW0tuJ/FDqzcf9zT54d6e43Az2R
 PEFX+05n/1Zqj42m6gD2AeqBeKHU+5fWBb5ILQ3TzC1w7yYX6ly3n8uyVQbnGWK418
 GF4NveWNUT6Hg==
Message-ID: <sashiko-outbox-207672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110190052.3514226-16-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:38:53 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/oa: UAF of tile->mem.ggtt when delayed OA BO destroy
  races drmm teardown
- [High] drm/xe/oa: missing unplug and wedged checks in stream fd
  xe_oa_ioctl()
--

commit f8f815614fe832cefe5f75c565cf766346592125
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams during driver teardown and fences OA
operations against device unplug so open stream file descriptors can safely
outlive the device.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d2bd9622109af..6808ccc442b56 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
[ ... ]
> @@ -1124,9 +1149,15 @@ static int xe_oa_emit_oa_config(struct xe_oa_strea=
m *stream, struct xe_oa_config
>  	if (err =3D=3D -ENOENT)
>  		xe_oa_config_cb(fence, &ofence->cb);
> =20
> -	/* If nothing needs to be signaled we wait synchronously */
> +	/*
> +	 * If nothing needs to be signaled we wait synchronously. Stop waiting =
once the device
> +	 * is unplugged, since this holds stream_lock or gt_lock, which the OA =
quiesce needs,
> +	 * and may run in a drm_dev_enter() section, which drm_dev_unplug() wai=
ts for.
> +	 */
>  	if (!num_signal) {
> -		dma_fence_wait(&ofence->base, false);
> +		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10))
> +			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm))
> +				break;
>  		dma_fence_put(&ofence->base);
>  	}
> =20
[ ... ]
> @@ -1700,6 +1732,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream =
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
Does the stream file descriptor's unlocked_ioctl callback (xe_oa_ioctl() in
drivers/gpu/drm/xe/xe_oa.c) also need a drm_dev_enter() section and a
xe_device_wedged() check?

Unlike the observation ioctl on the DRM device fd, the stream fd is an
anonymous inode that bypasses drm_ioctl() and xe_drm_ioctl().  During
xe_pci_remove(), drm_dev_unplug(), xe_bo_pci_dev_remove_all(), xe_pm_fini()
and later-registered devm actions such as xe_device_sanitize() all run
before xe_oa_fini() calls xe_oa_quiesce() to set stream->dead.  Without
drm_dev_enter() in the stream fd's xe_oa_ioctl(), drm_dev_unplug() does not
wait for in-flight stream ioctls, and new calls to xe_oa_enable_locked(),
xe_oa_disable_locked(), or xe_oa_config_locked() can still access MMIO,
GuC, and BO state during teardown.

Similarly, stream->dead is only set in xe_oa_quiesce_oa_unit() and is not
set when the device is declared wedged (including in
prepare_device_for_reset(), which also calls pci_disable_device() before
xe_pci_error_slot_reset() runs).  Without checking xe_device_wedged() in
the stream fd's xe_oa_ioctl() and in the uninterruptible wait loop in
xe_oa_emit_oa_config(), userspace can still issue hardware-touching stream
ioctls on a wedged or PCI-disabled device, and xe_oa_emit_oa_config() can
hang uninterruptibly under stream_lock or gt_lock if the device wedges
while waiting on a fence.

> @@ -1732,6 +1767,14 @@ static long xe_oa_ioctl(struct file *file,
> =20
>  static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>  {
> +	if (stream->dead) {
> +		/* All OA buffer mmaps are gone by now, see xe_oa_quiesce_oa_unit() */
> +		xe_oa_free_oa_buffer(stream);
> +		mutex_destroy(&stream->stream_lock);
> +		kfree(stream);
> +		return;
> +	}
> +
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
>  	/* A wedged device may be unresponsive, skip HW access */
> @@ -1748,17 +1791,30 @@ static void xe_oa_destroy_locked(struct xe_oa_str=
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
> +		/* drm_dev_unplug() waits for this, so xe_oa_fini() can't run under us=
 */
> +		xe_oa_destroy_locked(stream);
> +		drm_dev_exit(idx);
> +	} else {
> +		/* The device is going away, quiesce the stream like xe_oa_fini() does=
 */
> +		if (!stream->dead)
> +			xe_oa_quiesce_oa_unit(stream->oa_unit, !xe_wedged(xe));
> +		xe_oa_destroy_locked(stream);
> +	}
>  	mutex_unlock(&gt->oa.gt_lock);
> =20
>  	/* Release the reference the OA stream kept on the driver */
> -	drm_dev_put(&gt_to_xe(gt)->drm);
> +	drm_dev_put(&xe->drm);
> =20
>  	return 0;
>  }

[Severity: High]
Can freeing stream->oa_buffer.bo in xe_oa_destroy_locked() race with drmm
teardown and cause a use-after-free on tile->mem.ggtt?

Because xe_oa_quiesce_oa_unit() keeps stream->oa_buffer.bo pinned across
xe_device_remove(), xe_bo_pci_dev_remove_all() skips it and
xe_bo_pinned_fini() only DMA-unmaps it, leaving bo->ttm.ttm and
bo->ggtt_node[] populated.  When the stream fd is later closed and holds
the last reference on xe->drm, xe_oa_free_oa_buffer() calls
xe_bo_unpin_map_no_vm() -> ttm_bo_put() -> ttm_bo_release().  Whenever
want_init_on_free() is true (or dma_resv_trylock() fails), ttm_bo_release()
queues bo->delayed_delete onto xe->ttm.wq instead of calling
xe_ttm_bo_destroy() synchronously:

drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_release() {
    ...
		if (!dma_resv_test_signaled(&bo->base._resv,
					    DMA_RESV_USAGE_BOOKKEEP) ||
		    (want_init_on_free() && (bo->ttm !=3D NULL)) ||
		    bo->type =3D=3D ttm_bo_type_sg ||
		    !dma_resv_trylock(bo->base.resv)) {
			/* The BO is not idle, resurrect it for delayed destroy */
			ttm_bo_flush_all_fences(bo);
			bo->deleted =3D true;
    ...
			schedule_work(&bo->delayed_delete);
}

Immediately afterwards, xe_oa_release() drops the final drm_device
reference, and drm_managed_release() runs ggtt_fini_early() and frees
tile->mem.ggtt before xe_device_destroy() calls ttm_device_fini() to drain
xe->ttm.wq:

CPU0                                  kworker (xe->ttm.wq)
xe_oa_release()
  xe_oa_destroy_locked()
    xe_oa_free_oa_buffer()
      xe_bo_unpin_map_no_vm(bo)
        ttm_bo_release()
          schedule_work(&bo->delayed_delete)
  drm_dev_put(&xe->drm)
    drm_managed_release()
      ggtt_fini_early()
      kfree(tile->mem.ggtt)
                                      ttm_bo_delayed_delete()
                                        xe_ttm_bo_destroy()
                                          xe_ggtt_remove_bo(tile->mem.ggtt,=
 bo)
                                            <-- use-after-free
      xe_device_destroy()
        ttm_device_fini(&xe->ttm)

When xe_ttm_bo_destroy() runs on the workqueue, it dereferences the
already-freed tile->mem.ggtt (and triggers a warning in drm_mm_takedown()
when ggtt_fini_early() sees the live GGTT node).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110190052.3514=
226-9-umesh.nerlige.ramappa@intel.com?part=3D7
