Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E226D606A329
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaa7w1kC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF710E02A;
	Sun, 15 Nov 2026 09:36:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A910E02A
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 09:36:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0A8D64385F;
 Sun, 15 Nov 2026 09:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82B01F000C4;
 Sun, 15 Nov 2026 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794735372;
 bh=lZZjZAvkZG7tNmKm8MB9nbnbugHeLA6L1eLy2v7p5+k=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jaa7w1kCFBIpIdauHn3P2w7j5l00Immm0RI2OubSo9yyK70yilqyLeq3A/ufEc1r4
 ML1n8O3C9ug2re2VWfePDteeTp1a7zPlUBvOOl7rZUXq+HLQGzKoJsNvZwYULfRTtM
 ouDgJABzTxghO/6YpXx6FB8LYYsLSMZpmnkUriBr1ppVfWUgp68GeTauqzMkb+UX92
 xFxMdUBAdLCsce5C8Gn+LF1Crg66wKjvC3IWnQAYTdrDQp0i9Dg+Vz33VIbrIMJwGI
 3IfT42zRwbyhdxa12AWit6Ls5PuBKixcEazDl34tSiZspDt/F0DZlgC8P0wG6lfaUe
 JAGZXXZ/MsNxg==
Message-ID: <sashiko-outbox-215367@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] CI-ONLY:Defer VM teardown until exec queue cleanup
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261115085518.1135138-4-arvind.yadav@intel.com>
References: <20261115085518.1135138-1-arvind.yadav@intel.com>
 <20261115085518.1135138-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:36:12 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe: deferred VM teardown from xe_file_close() outlives
  xe_pci_remove()
- [Medium] drm/xe: skipping xe_exec_queue_kill() in
  xe_exec_queue_destroy_ioctl() stalls ufence waiters
--

commit a757927452b3070c5b807d334d20880cf0550808
Author: Arvind Yadav <arvind.yadav@intel.com>

CI-ONLY:Defer VM teardown until exec queue cleanup

This commit tracks user exec queues and user-created bind queues on the
VM until final queue destruction, deferring VM teardown if tracked queues
remain when the VM is destroyed or the DRM file is closed.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1ef9e276bbcad..f632398f59c94 100644
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
> +	 * The scheduling-disable wait above remains synchronous. Defer VM
> +	 * close if tracked queues still await final destruction.
> +	 */
>  	xa_for_each(&xef->vm.xa, idx, vm)
> -		xe_vm_close_and_put(vm);
> +		close_deferred |=3D xe_vm_close_and_put_deferred(vm);

[Severity: High]
Can deferring VM close in xe_file_close() allow VM teardown to outlive
xe_pci_remove()?

xe_exec_queue_kill() and xe_exec_queue_put() do not wait synchronously in
xe_file_close(); they queue TDR and cleanup work onto gt->ordered_wq,
which then queues q->guc->destroy_async onto xe_destroy_wq.  Only when
__xe_exec_queue_free() runs there does xe_vm_remove_close_queue() queue
vm->close.work onto xe_destroy_wq, and vm_close_work_func() then kills
vm->q, starting another round of gt->ordered_wq and xe_destroy_wq work
before vm->destroy_work is finally queued.

If the PCI device is unbound or hot-unplugged after the DRM file is
closed, xe_pci_remove() runs xe_bo_pci_dev_remove_all() while the deferred
VM is still open, and xe_destroy_wq_flush() only calls flush_workqueue()
once without draining gt->ordered_wq or the chained work items.
xe_pci_remove() then finishes xe_pm_fini() and devres_release_all()
unmaps tile->mem.vram->mapping while the VM still has pinned page-table
BOs and active DMA mappings, allowing MMU invalidation notifiers to write
to unmapped VRAM BARs in xe_pt_zap_ptes_entry() and later worker stages to
call runtime PM helpers after xe_pm_fini().

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 7ade915c59a85..c9b3909b6327c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
[ ... ]
> @@ -1657,7 +1670,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device =
*dev, void *data,
>  	if (q->vm && q->hwe->hw_engine_group)
>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> =20
> -	xe_exec_queue_kill(q);
> +	/*
> +	 * Let bind jobs drain. Killing their queue can turn pending PT binds
> +	 * into PTE clears while hardware queues still use the VM.
> +	 */
> +	if (!(q->flags & EXEC_QUEUE_FLAG_VM))
> +		xe_exec_queue_kill(q);
> =20
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);

[Severity: Medium]
Can skipping xe_exec_queue_kill() here stall a thread waiting in
xe_wait_user_fence_ioctl() on a user-created bind queue?

When a thread waits on an unsignaled user fence with args->exec_queue_id
set to a DRM_XE_ENGINE_CLASS_VM_BIND queue, xe_wait_user_fence_ioctl()
holds a lookup reference on q and sleeps on xe->ufence_wq until the fence
signals or q->ops->reset_status(q) becomes non-zero.  Because user bind
queues have EXEC_QUEUE_FLAG_VM set, skipping xe_exec_queue_kill() when
another thread calls xe_exec_queue_destroy_ioctl() leaves the queue
unkilled (so reset_status() stays 0) and skips waking xe->ufence_wq, while
the waiter's reference on q prevents xe_exec_queue_put() from freeing the
queue.

As a result, the waiter does not abort with -EIO and keeps q pinned, which
also leaves xef->exec_queue.pending_removal non-zero (hanging fdinfo
readers in wait_var_event() in show_run_ticks()) and blocks deferred VM
teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115085518.1135=
138-1-arvind.yadav@intel.com?part=3D3
