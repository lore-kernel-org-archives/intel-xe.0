Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0398606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7M0fu7D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799B310E0F5;
	Fri, 13 Nov 2026 08:32:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB810E0F5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 08:32:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DC5DA625E9;
 Fri, 13 Nov 2026 08:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744021F000C4;
 Fri, 13 Nov 2026 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794558730;
 bh=bJ9p5J6M7MjXdgaOdxbhOR9YDrcu4c7YogeBjLmDMhg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Z7M0fu7DNfVg/8oiVHDleUW0FqGcxYYU0l/Itz3Cl7hbomI0mD/6Let16aJmU3myd
 w1VGPwjYQtOgUwugGv1RAfKOpdJB9FMwV7oEdQjjctx3Vxgu+YqtuLPGpb91cTXjOv
 91uayB85HihvqQXLD1Vd1U6kl/GCGcaxtfBoTbtUbyUe3LGWs8u8TgQmgnapnkujBm
 +O6s+FkqySCTsR43V+1cDkUuaZVK8fZfRJtg9yTQ1EeRMPI8dakkC/LGlRdqWZu1is
 tYC1WQ9YHVbtbnT8MwRTEwiimvqWRuZCGuE3VM/rzQ1HLch/HVpCct9nAEElipuILc
 bvkih3CTAnA9w==
Message-ID: <sashiko-outbox-212412@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] CI-ONLY:Defer VM teardown until exec queue cleanup
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113073549.352746-4-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
 <20261113073549.352746-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:32:10 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: premature kill of vm->q clears PTEs of in-flight binds
- [High] drm/xe: deferred VM teardown outlives xe_pci_remove() workqueue
  flush
- [Low] drm/xe: contradictory commit message and dead waitqueue in
  xe_vm_close_and_put_deferred()
--

commit c496c9217a8a101f1f9d443912a6732a3a1def2a
Author: Arvind Yadav <arvind.yadav@intel.com>

CI-ONLY:Defer VM teardown until exec queue cleanup

This commit tracks the exec queues using a VM and defers tearing down VM
mappings on file close and VM destroy until asynchronous exec queue
cleanup completes.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e6e53912448f2..f5228c3c3ef64 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -2093,6 +2086,140 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_vm_put(vm);
>  }
> =20
> +static void vm_close_work_func(struct work_struct *w)
> +{
> +	struct xe_vm *vm =3D container_of(w, struct xe_vm, close.work);
> +	struct xe_device *xe =3D vm->xe;
> +	int idx;
> +
> +	/* Keep the VM and device alive until the PM and unplug guards unwind. =
*/
> +	xe_vm_get(vm);
> +
> +	if (drm_dev_enter(&xe->drm, &idx)) {
> +		xe_pm_runtime_get(xe);
> +		xe_vm_close_and_put(vm);
> +		xe_pm_runtime_put(xe);
> +		drm_dev_exit(idx);
> +	} else {
> +		/*
> +		 * The device is gone. Drop the VM without a runtime PM reference.
> +		 * xe_vm_close() guards its own register access.
> +		 */
> +		xe_vm_close_and_put(vm);
> +	}
> +
> +	xe_vm_put(vm);
> +}
> +
> +/**
> + * xe_vm_kill_bind_queues() - Kill and release the VM bind queue
> + * @vm: The VM whose bind queue should be stopped
> + *
> + * Callers must serialize teardown of @vm. Later calls are harmless beca=
use
> + * the first call clears the VM bind queue pointer.
> + */
> +void xe_vm_kill_bind_queues(struct xe_vm *vm)
> +{
> +	struct xe_exec_queue *q;
> +	int i;
> +
> +	if (!vm->q)
> +		return;
> +
> +	down_write(&vm->lock);
> +	q =3D vm->q;
> +	vm->q =3D NULL;
> +	xe_exec_queue_last_fence_put(q, vm);
> +	for_each_tlb_inval(q, i)
> +		xe_exec_queue_tlb_inval_last_fence_put(q, vm, i);
> +	up_write(&vm->lock);
> +
> +	xe_exec_queue_kill(q);
> +	xe_exec_queue_put(q);
> +}

[Severity: High]
Does killing vm->q before xe_vm_close() waits for pending BOOKKEEP fences
cause in-flight page-table binds on vm->q to clear PTEs instead of
populating them?

Previously, xe_vm_close_and_put() called xe_vm_close() first, which waited
on DMA_RESV_USAGE_BOOKKEEP before killing vm->q.  Now xe_vm_destroy_ioctl()
and xe_file_close() call xe_vm_kill_bind_queues() while default-queue bind
jobs (queued via xe_cpu_bind_update_pgtables_job() waiting on an in-sync or
BO kernel fence) and user exec queues are still active.  When a queued PT
bind job's dependencies later signal on the killed vm->q,
guc_exec_queue_run_job() passes killed_or_banned_or_wedged_or_error =3D true
to run_pt_job() -> xe_cpu_bind_update_pgtables_execute():

drivers/gpu/drm/xe/xe_cpu_bind.c:xe_cpu_bind_update_pgtables_execute() {
    ...
			if (pt_op->bind && !force_clear)
				ops->populate(tile, &update->pt_bo->vmap,
					      update);
			else
				ops->clear(vm, tile, &update->pt_bo->vmap,
					   update);
    ...
}

The bind job clears the page table entries and signals its completion
fence, leaving active user exec queues on the VM executing against cleared
mappings.

> +
> +/**
> + * xe_vm_add_close_queue() - Track an exec queue using the VM
> + * @vm: The VM used by the exec queue
> + *
> + * The queue is tracked until its asynchronous destruction completes.
> + */
> +void xe_vm_add_close_queue(struct xe_vm *vm)
> +{
> +	atomic_inc(&vm->close.num_exec_queues);
> +}
> +
> +/**
> + * xe_vm_remove_close_queue() - Stop tracking an exec queue
> + * @vm: The VM used by the exec queue
> + *
> + * If this is the last tracked queue and VM close was deferred, schedule
> + * the deferred VM close.
> + */
> +void xe_vm_remove_close_queue(struct xe_vm *vm)
> +{
> +	bool queue_close =3D false;
> +
> +	if (!atomic_dec_and_test(&vm->close.num_exec_queues))
> +		return;
> +
> +	wake_up_all(&vm->close.wq);
> +
> +	spin_lock(&vm->close.lock);
> +	if (vm->close.deferred) {
> +		vm->close.deferred =3D false;
> +		queue_close =3D true;
> +	}
> +	spin_unlock(&vm->close.lock);
> +
> +	if (queue_close)
> +		xe_destroy_wq_queue(&vm->close.work);
> +}

[Severity: High]
Can deferred VM close and destruction outlive xe_pci_remove() when
xe_file_close() defers teardown onto xe_destroy_wq?

Because xe_file_close() passes a zero timeout to
xe_vm_close_and_put_deferred(), closing a DRM file returns while VMs remain
open with pinned page-table BOs and active userptr/SVM DMA mappings.  When
the last exec queue is freed from a worker on xe_destroy_wq,
xe_vm_remove_close_queue() queues vm->close.work onto xe_destroy_wq, and
vm_close_work_func() -> xe_vm_put() -> xe_vm_free() then queues
vm->destroy_work onto xe_destroy_wq.

During PCI removal, xe_pci_remove() runs xe_bo_pci_dev_remove_all() inside
xe_device_remove() before flushing xe_destroy_wq, and then calls
xe_destroy_wq_flush() (a single flush_workqueue() call, which only waits
for work already queued at the start of the flush, not chain-queued work
items).  As a result, vm_close_work_func() and vm_destroy_work_func() can
run after xe_bo_pci_dev_remove_all(), xe_pm_fini(), pci_dma_cleanup() and
devres teardown have already completed.

> +
> +/**
> + * xe_vm_close_and_put_deferred() - Close a VM immediately or defer the =
close
> + * @vm: The VM reference to consume
> + * @timeout: Maximum time to wait for VM queues, in jiffies
> + *
> + * The VM must already be marked closing, and callers must serialize tea=
rdown.
> + * Release the VM-owned bind queues before waiting for queue cleanup. Ca=
llers
> + * may release them earlier to start cleanup for several VMs before wait=
ing.
> + *
> + * If queues remain after @timeout, keep the mappings and finish VM close
> + * after the last tracked queue is freed. This consumes the caller's VM
> + * reference on both the immediate and deferred paths.
> + *
> + * Return: %true if VM close was deferred, or %false if it completed now.
> + */
> +bool xe_vm_close_and_put_deferred(struct xe_vm *vm, unsigned long timeou=
t)
> +{
> +	bool queue_close =3D false;
> +
> +	/* Drop VM-owned queue references before waiting for their final free. =
*/
> +	xe_vm_kill_bind_queues(vm);
> +
> +	if (!atomic_read(&vm->close.num_exec_queues) ||
> +	    wait_event_timeout(vm->close.wq,
> +			       !atomic_read(&vm->close.num_exec_queues),
> +			       timeout)) {
> +		xe_vm_close_and_put(vm);
> +		return false;
> +	}

[Severity: Low]
This isn't a runtime bug, but both callers of
xe_vm_close_and_put_deferred() (xe_file_close() and xe_vm_destroy_ioctl())
pass timeout =3D 0, so wait_event_timeout() never waits and vm->close.wq and
the timeout parameter are unused.  Also, the fourth paragraph of the commit
message still states that file close uses a five-second wait budget across
all VMs while holding the runtime-PM reference, contradicting the later
paragraphs and the v3 code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073549.3527=
46-1-arvind.yadav@intel.com?part=3D3
