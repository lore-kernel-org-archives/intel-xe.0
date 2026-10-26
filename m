Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE1606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 23:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4F87VPF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6043D10F1DA;
	Mon, 26 Oct 2026 23:56:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AE610F1DC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 23:56:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D54BC600DA;
 Mon, 26 Oct 2026 23:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEA51F01825;
 Mon, 26 Oct 2026 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793059002;
 bh=+A9DIKTu5nHH85YZDB54QYr+4s44BYeVU1qJJR1P4qY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=G4F87VPFuGFjc/g5/fbGitJjLZ8STtPdXWOkYaUcHfNvZSqXbMZADu+mRXMmgGTOz
 kJQ0rcO44Hho9P67kOM+fjJfVAJZZ6q8Fx1iNyQ+Clk7GeMTZ6envrisuv5CJmssGx
 I9CyB9UbUSnkiDUGwGqHUzW5CC2k26rjDsRkaBD0qWVUB8tMT1CJI9Mhb6ueeeNeXG
 qPYZTVtjF3Nf+DcBtXTQF20h8CEH3jpMvy1gIA2CBR3ky56x15/dUpvl73A1DObn94
 iRA0BUU9AndxoUP1MwTyIgGGvHmXXz7BT4wO2SscY8fCm/prvK0aDW9QRuD+MinZKr
 7v+ngKiZFvvnQ==
Message-ID: <sashiko-outbox-185872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/oa: Quiesce OA streams on device remove and PCI
 reset
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261026232611.1587501-2-umesh.nerlige.ramappa@intel.com>
References: <20261026232611.1587501-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 23:56:41 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] drm/xe/oa: wrong mapping unmapped and fault race in xe_oa_quie=
sce()
- [High] drm/xe/oa: xe_oa_quiesce_oa_unit() skips xe_oa_stream_hw_teardown()
- [High] drm/xe/oa: xe_oa_quiesce() races with xe_oa_stream_open_ioctl()
- [High] drm/xe/oa: mmap_lock and stream_lock inversion in xe_oa_mmap()
- [Medium] drm/xe/oa: xe_oa_mmap() accesses stream->oa->xe before checking =
stream->dead
--

commit 440a695c755d9d017fa9ed509ae8a3e7b729a4c4
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Quiesce OA streams on device remove and PCI reset

This commit adds xe_oa_quiesce() to disable active OA streams, stop their
poll hrtimers, unmap OA buffers, and release device-bound resources during
device removal and PCI slot resets. Once marked dead, operations on the OA
stream fd return -ENODEV or EPOLLERR | EPOLLHUP, and xe_oa_release() frees
the remaining stream struct when the fd is closed.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index dc3f46a044c83..62693c7b843ce 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1106,6 +1106,8 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  void xe_device_remove(struct xe_device *xe)
>  {
> +	xe_oa_quiesce(xe);
> +
>  	xe_display_unregister(xe);
> =20
>  	drm_dev_unplug(&xe->drm);

[Severity: High]
Can xe_oa_quiesce() race with a concurrent DRM_XE_OBSERVATION_OP_STREAM_OPEN
ioctl here?

In xe_device_remove(), xe_oa_quiesce() runs before xe_display_unregister()
and drm_dev_unplug(). In xe_oa_quiesce_oa_unit(), u->exclusive_stream is
cleared to NULL and gt->oa.gt_lock is released without recording that OA
has been quiesced, while xe->oa.xe remains non-NULL until devm cleanup runs
xe_oa_fini().

In drivers/gpu/drm/xe/xe_oa.c, xe_oa_stream_open_ioctl_locked() only checks
param->oa_unit->exclusive_stream under gt->oa.gt_lock:

	if (param->oa_unit->exclusive_stream) {
		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
		ret =3D -EBUSY;
		goto exit;
	}

If userspace invokes xe_oa_stream_open_ioctl() while xe_display_unregister()
is still running (or after passing drm_ioctl()'s unplugged check while
waiting on gt->oa.gt_lock), won't it see exclusive_stream =3D=3D NULL and c=
reate
and enable a new stream with stream->dead =3D=3D false after xe_oa_quiesce(=
) has
already finished?

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 838802482adaf..db9f7d66e5fd0 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -1711,16 +1752,14 @@ static int xe_oa_release(struct inode *inode, str=
uct file *file)
>  	return 0;
>  }
> =20
> -static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> +static int xe_oa_mmap_locked(struct xe_oa_stream *stream, struct file *f=
ile,
> +			     struct vm_area_struct *vma)
>  {
> -	struct xe_oa_stream *stream =3D file->private_data;
> -	int ret =3D xe_observation_paranoid_check();
>  	struct xe_bo *bo =3D stream->oa_buffer.bo;
> +	int ret;
> =20
> -	if (ret) {
> -		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer=
\n");
> -		return ret;
> -	}
> +	if (stream->dead)
> +		return -ENODEV;
> =20
>  	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps=
) */
>  	if (vma->vm_end - vma->vm_start !=3D xe_bo_size(bo)) {
> @@ -1739,7 +1778,29 @@ static int xe_oa_mmap(struct file *file, struct vm=
_area_struct *vma)
>  	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
>  		     VM_MAYWRITE | VM_MAYEXEC);
> =20
> -	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +	ret =3D drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +	if (!ret)
> +		stream->mapping =3D file->f_mapping;
> +
> +	return ret;
> +}
> +
> +static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct xe_oa_stream *stream =3D file->private_data;
> +	int ret =3D xe_observation_paranoid_check();
> +
> +	if (ret) {
> +		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer=
\n");
> +		return ret;
> +	}

[Severity: Medium]
What happens if userspace calls mmap() on a dead OA stream fd after
xe_oa_fini() has already set stream->oa->xe =3D NULL, and
xe_observation_paranoid_check() fails?

Because xe_oa_mmap() runs xe_observation_paranoid_check() before acquiring
stream->stream_lock and checking stream->dead in xe_oa_mmap_locked(), the
failure path evaluates &stream->oa->xe->drm when stream->oa->xe is NULL
(triggering a UBSAN null-pointer check and passing a NULL pointer to
drm_dbg()) and returns -EACCES instead of -ENODEV.

> +
> +	/* Serialize against xe_oa_quiesce() freeing the OA buffer */
> +	mutex_lock(&stream->stream_lock);
> +	ret =3D xe_oa_mmap_locked(stream, file, vma);
> +	mutex_unlock(&stream->stream_lock);
> +
> +	return ret;
>  }

[Severity: High]
Does taking stream->stream_lock inside xe_oa_mmap() introduce a lock
inversion with mm->mmap_lock?

During mmap(), the MM layer calls xe_oa_mmap() with mm->mmap_lock held in
write mode, establishing:

  mm->mmap_lock -> stream->stream_lock

However, xe_oa_read() and xe_oa_ioctl() hold stream->stream_lock while
calling into user copy helpers:

  xe_oa_read()
    mutex_lock(&stream->stream_lock)
    __xe_oa_read()
      xe_oa_append_reports()
        xe_oa_append_report()
          xe_oa_copy_to_user()
            copy_to_user()

and:

  xe_oa_ioctl()
    mutex_lock(&stream->stream_lock)
    xe_oa_ioctl_locked()
      xe_oa_config_locked() / xe_oa_status_locked() / xe_oa_info_locked()
        copy_from_user() / copy_to_user()

When copy_to_user() or copy_from_user() faults on userspace memory, the page
fault handler takes mm->mmap_lock, establishing:

  stream->stream_lock -> mm->mmap_lock

Won't concurrent mmap() and read() or ioctl() calls on the OA stream fd
deadlock?

> @@ -2549,6 +2610,76 @@ static void xe_oa_unregister(void *arg)
>  	oa->metrics_kobj =3D NULL;
>  }
> =20
> +static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u)
> +{
> +	struct xe_oa_stream *stream =3D u->exclusive_stream;
> +	unsigned long flags;
> +
> +	if (!stream)
> +		return;
> +
> +	mutex_lock(&stream->stream_lock);
> +	if (stream->enabled)
> +		xe_oa_disable(stream);
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
> +	if (stream->mapping)
> +		unmap_mapping_range(stream->mapping, 0,
> +				    xe_bo_size(stream->oa_buffer.bo), 1);

[Severity: Critical]
Can userspace retain live PTEs to freed OA buffer pages after
xe_oa_quiesce_oa_unit() runs, and does unmap_mapping_range() target the
wrong address_space here?

First, the OA stream fd is created with anon_inode_getfd() in
xe_oa_stream_open_ioctl_locked(), so file->f_mapping is the kernel-wide
singleton anon_inode_inode->i_mapping shared by all anon_inode_getfd() users
rather than xe->drm.anon_inode->i_mapping. Calling unmap_mapping_range() on
stream->mapping zaps PTEs across unrelated anon_inode mappings system-wide.
Also, if an in-flight mmap() has just dropped stream->stream_lock in
xe_oa_mmap() but __mmap_new_vma() has not yet called vma_link_file() to
insert the VMA into file->f_mapping->i_mmap, unmap_mapping_range() will miss
that VMA.

Second, drm_gem_mmap_obj() takes a GEM object reference in
vma->vm_private_data and sets vma->vm_ops =3D &xe_gem_vm_ops (.fault =3D
xe_bo_cpu_fault). When xe_oa_stream_free_resources() calls
xe_bo_unpin_map_no_vm(stream->oa_buffer.bo), it unpins the BO and drops one
reference, but the VMA still holds its GEM reference.

Because xe_oa_quiesce() runs in xe_device_remove() before drm_dev_unplug():

  xe_device_remove()
    xe_oa_quiesce(xe)
    xe_display_unregister(xe)
    drm_dev_unplug(&xe->drm)
    xe_bo_pci_dev_remove_all(xe)

a userspace page fault on the VMA before drm_dev_unplug() enters
xe_bo_cpu_fault():

	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);

On normal device unbind (where the device is not wedged and not yet
unplugged), xe_bo_cpu_fault() succeeds and re-populates PTEs to
stream->oa_buffer.bo's pages.

When drm_dev_unplug() then runs, it unmaps dev->anon_inode->i_mapping (which
does not cover the OA VMA on anon_inode_inode->i_mapping), and
xe_bo_pci_dev_remove_all() evicts the now-unpinned BO via
ttm_bo_pipeline_gutting(), freeing its backing pages back to the page
allocator while userspace still has live PTEs mapped to them.

> +
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
Does xe_oa_quiesce_oa_unit() leak stream->fw_ref and skip
xe_oa_stream_hw_teardown()?

When the stream was initialized in xe_oa_stream_init(), it acquired
stream->fw_ref via xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL),
enabled the metric set via xe_oa_enable_metric_set(), and (if stream->sample
was set) whitelisted OA registers via xe_reg_whitelist_oa_regs(). If
stream->no_preempt was set, xe_oa_enable_locked() also disabled preemption
and timeslicing on stream->exec_q.

In this patch, xe_oa_stream_destroy() is split into
xe_oa_stream_hw_teardown() and xe_oa_stream_free_resources():

static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
{
	if (stream->sample)
		xe_reg_dewhitelist_oa_regs(stream->gt);

	xe_oa_disable_metric_set(stream);
	xe_force_wake_put(gt_to_fw(stream->hwe->gt), stream->fw_ref);
}

However, xe_oa_quiesce_oa_unit() only calls xe_oa_disable() and
xe_oa_stream_free_resources(), and when the fd is later closed,
xe_oa_destroy_locked() returns early because stream->dead is true:

	if (stream->dead) {
		mutex_destroy(&stream->stream_lock);
		kfree(stream);
		return;
	}

As a result, xe_oa_stream_hw_teardown() is never called for a quiesced
stream, leaking stream->fw_ref across all forcewake domains on the GT (while
xe_oa_stream_free_resources() drops the runtime PM reference) and leaving
gt->oa.whitelist_count, the metric set registers, and exec_q preemption
settings un-restored on unbind. Conversely, during xe_pci_error_slot_reset()
after a slot reset, xe_oa_quiesce_oa_unit() still calls xe_oa_disable()
unconditionally, performing MMIO writes and waits against reset hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026232611.1587=
501-2-umesh.nerlige.ramappa@intel.com?part=3D1
