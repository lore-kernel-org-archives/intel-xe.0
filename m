Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E60CD129A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836911317B;
	Wed, 10 Apr 2024 05:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ5D3nrr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57063113177
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAP1v1sJCNuZwv4ZUue38wyYsjO0+MlC0p3P259TKec=;
 b=MJ5D3nrrxC6ZogZq+JB2INN0XffLmX6tba9GW4s161huQRURDHHRuyNR
 j247u8vobN+pf2mIDP+vJ316qFjeWecMBDy2iJCAFyddP5TGzDo1SEUmz
 xt6OmWFuUfPMSh311rSpuX9qgdM+ZE8u5xD/lWYGIZhCZ1E4zFSdWzZd1
 8QaaRlnlnTdt4m2fCtTS9+QA2Y7YcPhE8JBQJeEPazszwIQPERUhcK46C
 IRbint9rVYSuDm9bP2P4QP9FzRlUS+Eq7n4WhiACCkfFRp+NVm9Sn/jdr
 wVIK4yr9U28ArSm0i/WD/IQ9tsqxgVxpLEplxfdJ4yKwe253fPKkSVFd/ Q==;
X-CSE-ConnectionGUID: uPGqjsCETAmzXEhR4LBL6Q==
X-CSE-MsgGUID: 4kCsTE5JQKe00VAV7J9m6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680007"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
X-CSE-ConnectionGUID: GOkoay3DRz+lIe5NRRe6NA==
X-CSE-MsgGUID: qeUg/xd1TuuJJko8h/Z7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536842"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH 08/13] drm/xe: Add some members to xe_vma_ops
Date: Tue,  9 Apr 2024 22:40:51 -0700
Message-Id: <20240410054056.478023-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410054056.478023-1-matthew.brost@intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will help with moving to single jobs for many bind operations.

v2:
 - Rebase

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 19 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 54a69fbfbb00..09871538484b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -844,7 +844,9 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops);
-static void xe_vma_ops_init(struct xe_vma_ops *vops);
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -859,7 +861,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	    list_empty(&vm->rebind_list))
 		return 0;
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -905,7 +907,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
 	if (err)
@@ -3115,9 +3117,16 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
 }
 
-static void xe_vma_ops_init(struct xe_vma_ops *vops)
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs)
 {
+	memset(vops, 0, sizeof(*vops));
 	INIT_LIST_HEAD(&vops->list);
+	vops->vm = vm;
+	vops->q = q;
+	vops->syncs = syncs;
+	vops->num_syncs = num_syncs;
 }
 
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -3284,7 +3293,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index e9cd6da6263a..ce1a63a5e3e7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -360,6 +360,14 @@ struct xe_vma_op {
 struct xe_vma_ops {
 	/** @list: list of VMA operations */
 	struct list_head list;
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @q: exec queue these operations */
+	struct xe_exec_queue *q;
+	/** @syncs: syncs these operation */
+	struct xe_sync_entry *syncs;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
 };
 
 #endif
-- 
2.34.1

