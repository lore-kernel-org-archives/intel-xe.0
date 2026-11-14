Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6E606A329
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSUDAyZy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510B10E680;
	Sat, 14 Nov 2026 09:21:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B53810E680
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 09:21:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 12081417EE;
 Sat, 14 Nov 2026 09:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D2E1F000C5;
 Sat, 14 Nov 2026 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794648095;
 bh=GcLmbkFNcw6F8VCZkEA4oYtAZzop8BlUwjywTSBt2Fo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=iSUDAyZyDfFgBjVC/MGtdilBpjMqPSrQsqjDVH7eKn0PRg8FxvXMyMZ5vvg5kuLOI
 rT1g9kf0sGM2+AqmA5kNidFtN6lFCSPMXH99gBl73iGDjZ4RTipN2NNyCno4Nqx8Uh
 BiNcEqW70K4yilL72VVd32hSTO+DJTxkCc4cZ68AsEcA5/fh/8ZOOLtWBS/Mb2/3cr
 VEVdgkFu/X3fng3CzJfSMcU1EvivmFkOKdNgfmDoXGoySvZTVRAEvKZnxBCJIkmx1W
 RTsrjE4xKGzrfgIkHOJjHfIyfG3CHX7mb0szaUPYdUdwp2RbqZlKU4DZ5oaQBoIWKC
 SG1Dvxw29HlOA==
Message-ID: <sashiko-outbox-214326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] CI-ONLY:Defer VM teardown until exec queue cleanup
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261114083859.1007095-4-arvind.yadav@intel.com>
References: <20261114083859.1007095-1-arvind.yadav@intel.com>
 <20261114083859.1007095-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 09:21:35 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/xe: deferred VM teardown outlives xe_pci_remove() workqueue
  flush
- [Medium] drm/xe: race between user bind queue tracking and VM teardown
  in xe_exec_queue_create_ioctl()
- [Medium] drm/xe: xe_exec_queue_destroy_ioctl() kills user bind queues
  and clears PTEs
- [Low] drm/xe: stale bind queue and wait comments in
  xe_vm_close_and_put_deferred()
--

commit 6c819ef5878fac66d046d56156bffc5871d7f007
Author: Arvind Yadav <arvind.yadav@intel.com>

CI-ONLY:Defer VM teardown until exec queue cleanup

This commit tracks the number of active exec queues using each VM and
defers VM teardown during VM destroy and file close onto xe_destroy_wq
until asynchronous exec queue cleanup completes.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1ef9e276bbcad..609fdae907cae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -177,6 +177,7 @@ static void xe_file_close(struct drm_device *dev, str=
uct drm_file *file)
>  	struct xe_file *xef =3D file->driver_priv;
>  	struct xe_vm *vm;
>  	struct xe_exec_queue *q;
> +	bool close_deferred =3D false;
>  	unsigned long idx;
> =20
>  	guard(xe_pm_runtime)(xe);
> @@ -194,11 +195,26 @@ static void xe_file_close(struct drm_device *dev, s=
truct drm_file *file)
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> -		xe_exec_queue_kill(q);
> +		/*
> +		 * Killing a bind queue can force pending PT jobs to clear
> +		 * mappings while hardware exec queues are still running.
> +		 * Let bind jobs drain before their queue is destroyed.
> +		 */
> +		if (!(q->flags & EXEC_QUEUE_FLAG_VM))
> +			xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}

[Severity: Medium]
Should xe_exec_queue_destroy_ioctl() also avoid calling
xe_exec_queue_kill(q) on EXEC_QUEUE_FLAG_VM queues?

drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_destroy_ioctl() {
	...
	xe_exec_queue_kill(q);

	trace_xe_exec_queue_close(q);
	xe_exec_queue_put(q);
	...
}

When userspace destroys a user bind queue via
DRM_IOCTL_XE_EXEC_QUEUE_DESTROY while PT jobs are still pending on its
scheduler entity, xe_exec_queue_kill(q) sets EXEC_QUEUE_STATE_KILLED.
guc_exec_queue_run_job() then passes force_clear =3D true to run_pt_job(),
which clears PTEs instead of populating them while hardware exec queues on
the VM are still running or completing asynchronous GuC cleanup.

> +
> +	/*
> +	 * Do not wait in file close. Keep mappings alive until the remaining
> +	 * exec queues have completed their asynchronous cleanup.
> +	 */
>  	xa_for_each(&xef->vm.xa, idx, vm)
> -		xe_vm_close_and_put(vm);
> +		close_deferred |=3D xe_vm_close_and_put_deferred(vm);

[Severity: High]
Can deferred VM teardown outlive xe_pci_remove() when xe_file_close()
returns without waiting?

When a file with active exec queues is closed, xe_vm_close_and_put_deferred=
()
returns while the VM remains open (vm->size !=3D 0) with its page-table BOs
pinned and userptr/SVM DMA mappings active. Teardown then proceeds through
multiple chained work items:

1. The last user queue's destroy work on xe_destroy_wq calls
   __xe_exec_queue_free() -> xe_vm_remove_close_queue(), which queues
   vm->close.work onto xe_destroy_wq.
2. vm_close_work_func() calls xe_vm_close_and_put() ->
   xe_vm_kill_bind_queues(), which starts asynchronous cleanup of vm->q
   (via gt->ordered_wq and then xe_destroy_wq) while vm->q->user_vm still
   holds a reference to vm.
3. When __xe_exec_queue_free(vm->q) runs on xe_destroy_wq and drops
   vm->q->user_vm, xe_vm_free() queues vm->destroy_work onto
   xe_destroy_wq.

During PCI removal, xe_pci_remove() runs:

drivers/gpu/drm/xe/xe_pci.c:xe_pci_remove() {
	...
	xe_device_remove(xe);

	/*
	 * Preserve remove-time flush after moving destroy work to module
	 * lifetime.
	 */
	xe_destroy_wq_flush();
	xe_pm_fini(xe);
}

xe_device_remove() calls xe_bo_pci_dev_remove_all(xe) before
xe_destroy_wq_flush() while deferred VMs are still open, and
xe_destroy_wq_flush() only calls flush_workqueue(xe_destroy_wq) once,
which only waits for work items already queued at entry and does not drain
the chained stages above. As a result, vm_close_work_func(), vm->q
teardown, and vm_destroy_work_func() can run after xe_pm_fini(),
pci_dma_cleanup(), and devres release (including VRAM BAR unmapping),
allowing runtime PM calls after xe_pm_fini() and MMU notifier PTE zaps to
write to unmapped VRAM BARs.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 7ade915c59a85..da2d437fffb6b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
[ ... ]
> @@ -1466,6 +1473,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *=
dev, void *data,
>  	}
> =20
>  	q->xef =3D xe_file_get(xef);
> +	/*
> +	 * Track user bind queues until their final free. VM-owned bind
> +	 * queues have no xef and must remain alive until xe_vm_close()
> +	 * has waited for pending bind fences.
> +	 */
> +	if (q->user_vm)
> +		xe_vm_add_close_queue(q->user_vm);

[Severity: Medium]
Can xe_vm_destroy_ioctl() race with user bind queue creation before
xe_vm_add_close_queue(q->user_vm) is called?

For normal exec queues, __xe_exec_queue_alloc() calls
xe_vm_add_close_queue(vm) while xe_exec_queue_create_ioctl() still holds
vm->lock. For DRM_XE_ENGINE_CLASS_VM_BIND queues, __xe_exec_queue_alloc()
receives migrate_vm (where migrate_vm->xef is NULL), and
xe_exec_queue_create_ioctl() drops vm->lock right after
xe_exec_queue_create_bind() before incrementing q->user_vm's counter here:

CPU0                                  CPU1
xe_exec_queue_create_ioctl()
  down_read_interruptible(&vm->lock)
  xe_exec_queue_create_bind(..., vm)
    q->user_vm =3D xe_vm_get(vm)
  up_read(&vm->lock)
                                      xe_vm_destroy_ioctl()
                                        xe_vm_close_start(vm)
                                        xe_vm_close_and_put_deferred(vm)
                                          !atomic_read(&num_exec_queues)
                                          xe_vm_close_and_put(vm)  <-- tear=
s down VM
  xe_vm_add_close_queue(q->user_vm)
  xa_alloc(&xef->exec_queue.xa, ..., q)

Calling xe_vm_add_close_queue(q->user_vm) before up_read(&vm->lock) is
released (and pairing it with xe_vm_remove_close_queue(q->user_vm) in
__xe_exec_queue_free() unconditionally whenever q->user_vm is set, or
setting q->xef before releasing vm->lock) would close this window.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e6e53912448f2..51ec754f36a18 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> +/**
> + * xe_vm_close_and_put_deferred() - Close a VM immediately or defer the =
close
> + * @vm: The VM reference to consume
> + *
> + * The VM must already be marked closing, and callers must serialize tea=
rdown.
> + * Release the VM-owned bind queues before checking for remaining queues.
> + * Callers may release them earlier to start cleanup for several VMs.
> + *
> + * This function does not wait for queue cleanup. If queues remain, defe=
r VM
> + * close until the last tracked queue is freed. The caller's VM reference
> + * is consumed on both the immediate and deferred paths.
> + *
> + * Return: %true if VM close was deferred, or %false if it completed now.
> + */
> +bool xe_vm_close_and_put_deferred(struct xe_vm *vm)
> +{
> +	bool queue_close =3D false;
> +
> +	/*
> +	 * Keep the VM-owned bind queue alive. xe_vm_close_and_put() waits
> +	 * for pending binds in xe_vm_close() before killing that queue.
> +	 */
> +	if (!atomic_read(&vm->close.num_exec_queues)) {
[ ... ]
> @@ -2289,7 +2410,14 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, vo=
id *data,
> =20
>  	if (!err) {
>  		xe_vm_close_start(vm);
> -		xe_vm_close_and_put(vm);
> +
> +		/*
> +		 * Internal bind queue cleanup is asynchronous, and user exec
> +		 * queues can outlive the VM handle. Retain the mappings until
> +		 * all tracked queues finish cleanup without waiting here.
> +		 * The helper consumes the caller's VM reference.
> +		 */
> +		xe_vm_close_and_put_deferred(vm);
>  	}
> =20
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c90c9dc1351c7..19eb8dfc914e8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -221,6 +221,11 @@ int xe_vm_get_property_ioctl(struct drm_device *dev,=
 void *data,
> =20
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  void xe_vm_close_start(struct xe_vm *vm);
> +bool xe_vm_close_and_put_deferred(struct xe_vm *vm);
> +void xe_vm_kill_bind_queues(struct xe_vm *vm);
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 6ca9ef9d0c0b8..953180e99e518 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -14,6 +14,7 @@
>  #include <linux/kref.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/scatterlist.h>
> +#include <linux/wait.h>

[Severity: Low]
This isn't a bug, but several comments and declarations appear to be left
over from an earlier version of the patch:

- The kernel-doc for xe_vm_close_and_put_deferred() says "Release the
  VM-owned bind queues before checking for remaining queues. Callers may
  release them earlier to start cleanup for several VMs", which
  contradicts the inline comment right below it stating that the VM-owned
  bind queue must be kept alive until xe_vm_close_and_put().
- The comment in xe_vm_destroy_ioctl() and paragraphs 3 and 8 of the
  commit message say that internal VM-owned bind queues are counted in
  vm->close.num_exec_queues and can defer VM destroy even when no user
  exec queues remain, whereas VM-owned bind queues have no xef and are
  not tracked in num_exec_queues.
- Paragraph 4 of the commit message still describes a five-second wait
  budget during file close, contradicting paragraph 7 and xe_file_close().
- xe_vm_kill_bind_queues() is only called within xe_vm.c, so it can be
  static rather than declared in xe_vm.h, and <linux/wait.h> in
  xe_vm_types.h is unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114083859.1007=
095-1-arvind.yadav@intel.com?part=3D3
