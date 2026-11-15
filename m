Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057B1606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBTdb7ty
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3410E067;
	Sun, 15 Nov 2026 10:49:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB7910E067
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 10:49:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 67F7241A29;
 Sun, 15 Nov 2026 10:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4761F000C4;
 Sun, 15 Nov 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794739773;
 bh=zF3fpWdS4dnNUMV7bSnWB9S8T/kF+os6pFlcGq0mvZg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CBTdb7tyAD2dvoq26lxP+dI8/4a1eIifxr7DRtcHtufZVUU3JVslmBCMcFChFinHl
 dH+A5DaNLNu/vXPbWe822bLqcnNmLUF2nzHOLHKzsWgK+Y1wFDD0Xn8dRWrRuOkZdT
 vDKsTEMHRzD9nZFEDX0vmzq3PkW+hILQL1T4MnxRzEkn5/MuLgky0fABi2zE8FXrLY
 qd93omthJBltOHtMmn86vuexin3yuz2hluytKDDq1jx/Pi3UN+9zNtGU+xUGd5xKnf
 CHpXXTacYLMgFka+DllfJZ+eEeipKUAAMlsvjtebsByXk0oH1xypldiIZAsuDzMFoc
 W7ltRxs1Ey50Q==
Message-ID: <sashiko-outbox-215412@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] CI-ONLY:Defer VM teardown until exec queue cleanup
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261115101933.1163260-4-arvind.yadav@intel.com>
References: <20261115101933.1163260-1-arvind.yadav@intel.com>
 <20261115101933.1163260-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:49:32 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: deferred VM teardown from xe_file_close() outlives
  xe_pci_remove()
--

commit 4fe47c5c24ce78241a708ea647a388784ed800ab
Author: Arvind Yadav <arvind.yadav@intel.com>

CI-ONLY:Defer VM teardown until exec queue cleanup

This commit tracks user exec queues and user-created bind queues on their
VM and defers VM teardown onto xe_destroy_wq until all tracked queues have
completed final destruction.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1ef9e276bbcad..f380186798357 100644
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
> +
> +	/*
> +	 * Queue cleanup is asynchronous. Retain VM mappings until tracked
> +	 * queues complete final destruction.
> +	 */
>  	xa_for_each(&xef->vm.xa, idx, vm)
> -		xe_vm_close_and_put(vm);
> +		close_deferred |=3D xe_vm_close_and_put_deferred(vm);

[Severity: High]
Can deferred VM teardown from xe_file_close() outlive xe_pci_remove()?

In xe_file_close(), xe_exec_queue_kill() and xe_exec_queue_put() only
initiate asynchronous GuC cleanup on gt->ordered_wq, so
xe_vm_close_and_put_deferred() returns while the VM is still open with
pinned page-table BOs, userptr/SVM DMA mappings, and vm->q alive.
Teardown then chains across multiple work items:

1. gt->ordered_wq queues q->guc->destroy_async onto xe_destroy_wq, where
   __xe_exec_queue_free() -> xe_vm_remove_close_queue() queues
   vm->close.work onto xe_destroy_wq.
2. vm_close_work_func() runs xe_vm_close_and_put() ->
   xe_vm_kill_bind_queues(), which starts asynchronous cleanup of vm->q on
   gt->ordered_wq while vm->q->user_vm holds a VM reference.
3. When __xe_exec_queue_free(vm->q) later runs on xe_destroy_wq and drops
   vm->q->user_vm, xe_vm_free() queues vm->destroy_work onto
   xe_destroy_wq.

If the PCI device is unbound or hot-unplugged after the DRM file closes,
xe_pci_remove() runs xe_bo_pci_dev_remove_all() inside xe_device_remove()
before vm->close.work has run, and then flushes xe_destroy_wq only once:

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

A single flush_workqueue(xe_destroy_wq) does not drain work still pending
on gt->ordered_wq or subsequently chain-queued onto xe_destroy_wq.
xe_pci_remove() therefore finishes xe_pm_fini() and returns to the PCI
core while the VM is still open, leaving page-table BOs pinned and DMA
mappings active across pci_dma_cleanup(), allowing MMU invalidation
notifiers on the unclosed VM to write to unmapped VRAM BARs in
xe_pt_zap_ptes_entry() after devres release unmaps tile->mem.vram->mapping,
and running runtime PM calls in guc_exec_queue_do_destroy() and
vm_destroy_work_func() after xe_pm_fini().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115101933.1163=
260-1-arvind.yadav@intel.com?part=3D3
