Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F3BC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 06:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A2C10E034;
	Mon, 13 Nov 2023 06:18:55 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2E810E034
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 06:18:52 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699856089; bh=fkadsOLs9ZD5pKH3KxHfd3L2wABKjqGkjeFqehef9m0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkMdey8NA9X1/ta94mDxo4eAvqbePnOoYzAIqsylfaAweU4VwUhchqVADQWuA9laR
 4TzWX10fWXM1LMthE84ZtrPygdMCOw48DpjP+lAQh69HIQfvPvoffln9RMXz9tLjpN
 t7Lh7J+5IAu8sP8osKorQURZ/Gl/1Nv51F8N5Le4fbmlTkO/LarwkhFjEyLib8VwCh
 ptDHBpfQ/WIPRUb2brQuE9gatgBOolrE0qCmOZ6oBrel3oI/0hv+73pSg5sH65qCtP
 SRHKljFr6EuA91L4utlcMeXF1pN6JC42FA6iA2UGg+V8301iUrjgJuuxD/O9IEBDV1
 Njg1kOQkRNnJw==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 3AD6EhAT1493084; Mon, 13 Nov 2023 08:14:43 +0200
Date: Mon, 13 Nov 2023 08:14:43 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <435bgojzawzwtg6ihda5nmwkxqhc4xdia3hk7xpdqjvyvkjfi2@u7slcxuh4lh7>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
 <20231103153234.30407-12-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103153234.30407-12-thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [CI v8 12/18] drm/xe: Adjust to commit drm/gpuvm:
 reference count drm_gpuvm structures
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03.11.2023 16:32, Thomas Hellström wrote:
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c       | 30 ++++++++++++------------------
> drivers/gpu/drm/xe/xe_vm.h       |  5 ++---
> drivers/gpu/drm/xe/xe_vm_types.h |  2 --
> 3 files changed, 14 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 46a87a4e42d8..bb44e5ca224a 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1197,8 +1197,11 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
> 	return &op->base;
> }
>
>+static void xe_vm_free(struct drm_gpuvm *gpuvm);
>+
> static struct drm_gpuvm_ops gpuvm_ops = {
> 	.op_alloc = xe_vm_op_alloc,
>+	.vm_free = xe_vm_free,
> };
>
> static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
>@@ -1346,7 +1349,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 		return ERR_PTR(-ENOMEM);
>
> 	vm->xe = xe;
>-	kref_init(&vm->refcount);
>
> 	vm->size = 1ull << xe->info.va_bits;
>
>@@ -1498,7 +1500,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 	}
> 	dma_resv_unlock(xe_vm_resv(vm));
> err_put:
>-	drm_gpuvm_destroy(&vm->gpuvm);
>+	//	drm_gpuvm_destroy(&vm->gpuvm);

This should be somehow replaced with xe_vm_put

Dafna,

> err_no_resv:
> 	for_each_tile(tile, xe, id)
> 		xe_range_fence_tree_fini(&vm->rftree[id]);
>@@ -1586,6 +1588,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> 				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
> 					      NULL);
> 		}
>+		if (vm->pt_root[id]) {
>+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>+			vm->pt_root[id] = NULL;
>+		}
> 	}
> 	xe_vm_unlock(vm);
>
>@@ -1639,29 +1645,17 @@ static void vm_destroy_work_func(struct work_struct *w)
> 		}
> 	}
>
>-	/*
>-	 * XXX: We delay destroying the PT root until the VM if freed as PT root
>-	 * is needed for xe_vm_lock to work. If we remove that dependency this
>-	 * can be moved to xe_vm_close_and_put.
>-	 */
>-	xe_vm_lock(vm, false);
>-	for_each_tile(tile, xe, id) {
>-		if (vm->pt_root[id]) {
>-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>-			vm->pt_root[id] = NULL;
>-		}
>-	}
>-	xe_vm_unlock(vm);
>+	for_each_tile(tile, xe, id)
>+		XE_WARN_ON(vm->pt_root[id]);
>
> 	trace_xe_vm_free(vm);
> 	dma_fence_put(vm->rebind_fence);
>-	drm_gpuvm_destroy(&vm->gpuvm);
> 	kfree(vm);
> }
>
>-void xe_vm_free(struct kref *ref)
>+static void xe_vm_free(struct drm_gpuvm *gpuvm)
> {
>-	struct xe_vm *vm = container_of(ref, struct xe_vm, refcount);
>+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
>
> 	/* To destroy the VM we need to be able to sleep */
> 	queue_work(system_unbound_wq, &vm->destroy_work);
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index 88077214261f..a348dc56027c 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -24,20 +24,19 @@ struct xe_sync_entry;
> struct drm_exec;
>
> struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
>-void xe_vm_free(struct kref *ref);
>
> struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
> int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
>
> static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
> {
>-	kref_get(&vm->refcount);
>+	drm_gpuvm_get(&vm->gpuvm);
> 	return vm;
> }
>
> static inline void xe_vm_put(struct xe_vm *vm)
> {
>-	kref_put(&vm->refcount, xe_vm_free);
>+	drm_gpuvm_put(&vm->gpuvm);
> }
>
> int xe_vm_lock(struct xe_vm *vm, bool intr);
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index f11ac81cf010..d643dccf9e73 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -137,8 +137,6 @@ struct xe_vm {
>
> 	struct xe_device *xe;
>
>-	struct kref refcount;
>-
> 	/* exec queue used for (un)binding vma's */
> 	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
>
>-- 
>2.41.0
>
