Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40759606A337
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cERuwEPu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605F10EA82;
	Mon, 16 Nov 2026 23:10:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117F10EA82
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 23:10:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A9F543C73;
 Mon, 16 Nov 2026 23:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C711F000C4;
 Mon, 16 Nov 2026 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794870629;
 bh=YiLnnZn1U3aHwxW6h9FsxOgcyOlUNMBAYXJRB4jv18A=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=cERuwEPuAPAFdm37UxtgCoGkUBWwN9iUTOrRVVEcRD6OQZ4M+ZRmhjJ1IFXeFeoXx
 rUE46RFkU4C9X3JT0qTpLPcquwlgOUsxPaoRY0xxNTegOPwyexvQMzWifPhVlUwBzb
 w8uBrzo/qJGfbY0mMNR4jUnLuLiBQmo6dyV4Vloxi4avdWioPLqdfuL9v59eF5SaKt
 +eV9ockM/VyuLT/au5MFCdcbTruVBnvaSiO9iHrOBlMyyCTBLNn55OeKm4KZyC1piC
 7mqA71eoACohVCSM1laT1rTIguZ38qO/KrBvhR+EYtEjC8po724uZ/cfVF7ySs26Rv
 m0N8+rPs6oMQw==
Message-ID: <sashiko-outbox-217851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116222752.3677159-16-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
 <20261116222752.3677159-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:10:28 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] drm/xe/oa: xe_oa_ioctl() returns -ECANCELED instead of
  -ENODEV on dead stream
- [Medium] drm/xe/oa: race between xe_oa_release() and
  xe_bo_pinned_fini() on OA buffer
- [Medium] drm/xe/oa: xe_oa_emit_oa_config() returns 0 on wedged or
  unplugged device
- [Low] drm/xe/oa: inaccurate xe_oa_quiesce() comment and commit message
  after v5
--

commit a7a247bac1e078594e18d5ec17411108f9fc195e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

This commit quiesces active OA streams on driver unbind and PCI reset,
rejecting further operations on dead stream fds and deferring final
stream struct and OA buffer cleanup until the fd is released.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 1a37312de099c..551f5a0631630 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -1134,9 +1155,15 @@ static int xe_oa_emit_oa_config(struct xe_oa_strea=
m *stream, struct xe_oa_config
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
> +		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10))
> +			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm) ||
> +			    xe_wedged(gt_to_xe(stream->gt)))
> +				break;
>  		dma_fence_put(&ofence->base);
>  	}

[Severity: Medium]
Should xe_oa_emit_oa_config() return an error when it breaks out of the
wait loop because the device is unplugged or wedged?

Right now it still falls through and returns 0.  On the stream open path
(xe_oa_stream_open_ioctl_locked() -> xe_oa_stream_init() ->
xe_oa_enable_metric_set()), a 0 return lets open proceed to enable the OA
hardware, start poll_check_timer and install a live stream fd even though
the config batch never completed and the device is wedged or unplugged.

[ ... ]

> @@ -1710,6 +1737,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream =
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
> @@ -1731,17 +1761,34 @@ static long xe_oa_ioctl(struct file *file,
>  			unsigned long arg)
>  {
>  	struct xe_oa_stream *stream =3D file->private_data;
> +	struct xe_device *xe =3D gt_to_xe(stream->gt);
>  	long ret;
> +	int idx;
> +
> +	if (xe_wedged(xe))
> +		return -ECANCELED;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> =20
>  	mutex_lock(&stream->stream_lock);
>  	ret =3D xe_oa_ioctl_locked(stream, cmd, arg);
>  	mutex_unlock(&stream->stream_lock);
> =20
> +	drm_dev_exit(idx);
> +
>  	return ret;
>  }

[Severity: Medium]
Does checking xe_wedged(xe) before drm_dev_enter() and stream->dead cause
xe_oa_ioctl() to return -ECANCELED instead of -ENODEV on a dead stream?

During a PCI slot reset, prepare_device_for_reset() sets xe->wedged.flag
on the old xe_device before slot reset removes and reprobes the device:

drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset() {
	...
	if (!atomic_xchg(&xe->wedged.flag, 1))
		xe_pm_runtime_get_noresume(xe);
	...
}

Because xe_wedged(xe) stays true on the old xe_device (and when unbinding
an already wedged device), xe_oa_ioctl() returns -ECANCELED before
reaching drm_dev_enter() or the stream->dead check in
xe_oa_ioctl_locked().

>  static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>  {
> +	if (stream->dead) {
> +		xe_oa_free_oa_buffer(stream);
> +		mutex_destroy(&stream->stream_lock);
> +		kfree(stream);
> +		return;
> +	}
> +
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
>  	/* A wedged device may be unresponsive, skip HW access */
> @@ -1758,17 +1805,37 @@ static void xe_oa_destroy_locked(struct xe_oa_str=
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
Can xe_oa_release() race with xe_bo_pinned_fini() on stream->oa_buffer.bo
if userspace closes the stream fd during device teardown?

During remove, devres runs xe_oa_fini() -> xe_oa_quiesce() (which leaves
stream->oa_buffer.bo pinned and wakes poll_wq) and then runs
xe_bo_pinned_fini() -> xe_bo_apply_to_pinned() without holding
gt->oa.gt_lock:

CPU0 (devres remove)              CPU1 (close fd)
xe_oa_fini()
  xe_oa_quiesce()
    wake_up_all(&stream->poll_wq)
xe_bo_pinned_fini()
  xe_bo_apply_to_pinned()
    xe_bo_get(bo)
                                  xe_oa_release()
                                    xe_oa_destroy_locked()
                                      xe_oa_free_oa_buffer()
                                        xe_bo_unpin_map_no_vm(bo)
                                          xe_bo_unpin(bo)
                                          xe_bo_put(bo) (refcnt 2 -> 1)
                                    flush_workqueue(xe->ttm.wq)
                                    drm_dev_put(&xe->drm)
    xe_bo_dma_unmap_pinned(bo)
    xe_bo_put(bo) (refcnt 1 -> 0)
      queue_work(xe->ttm.wq, ...)
  ...
  drm_dev_put() (frees GGTT)
                                  ttm_bo_Delayed_delete()
                                    xe_ggtt_remove_bo() <-- use-after-free

Because CPU0 holds a transient BO reference in xe_bo_apply_to_pinned(),
xe_oa_free_oa_buffer() does not drop the final reference on the BO, so
flush_workqueue(xe->ttm.wq) in xe_oa_release() runs before the BO is
queued for delayed deletion.  In addition, xe_bo_unpin(bo) exposes the BO
to the shrinker while xe_bo_dma_unmap_pinned(bo) accesses xe_tt->sg
without holding the BO lock.

[ ... ]

> +/**
> + * xe_oa_quiesce - Disable all active OA streams on driver unbind or PCI=
 slot reset
> + * @xe: @xe_device
> + *
> + * Disables the OA unit and stops the poll timer of every active stream,=
 marks it dead
> + * and releases all device-bound resources (OA buffer, exec queues, conf=
igs, references).
> + * Unless the device is wedged, the HW state (whitelist, metric set, for=
cewake, preemption)
> + * is restored first. Any further read, poll, mmap or ioctl on the strea=
m fd is rejected
> + * (-ENODEV). Only the stream struct stays allocated until userspace clo=
ses the fd, at
> + * which point xe_oa_release() just frees it.
> + */

[Severity: Low]
This isn't a bug, but the comment above xe_oa_quiesce() and the commit
message still say that xe_oa_quiesce() releases the OA buffer, restores
preemption and leaves only the stream struct allocated until
xe_oa_release().  In the code, the OA buffer stays pinned and allocated
until xe_oa_destroy_locked() calls xe_oa_free_oa_buffer() on release, and
xe_oa_disable_locked() skips xe_oa_enable_preempt_timeslice() because
stream->dead is set before calling it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222752.3677=
159-9-umesh.nerlige.ramappa@intel.com?part=3D7
