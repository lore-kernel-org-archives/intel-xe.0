Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3432C19F4F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCCF10FF32;
	Wed, 24 Apr 2024 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBtESnFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4CB10FDA3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979464; x=1745515464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3MBRXI3Rut+UnGrx4byId27rUfzp0Usm2gpX23IF/E=;
 b=kBtESnFtL6DZEhILXvZZcQ0UcntEP0lfkP4NvA0idshWCHaJOHKUgbe8
 6gp6+otfXajwXC6NamOPKUjmrPPu3nQPE3BfCz+TxhvNe0vueb1kzDY/e
 8txkH4JmGgo1239DX+VCEeJezhc49vJ3ZB0y2wVK5kyEXWu199XiPzIsp
 6Rp7EUBpe0CLtlmZ/aYMo+7l8vBRF/fSKBt4ylc8PTWw/d42WJH+0t+Xl
 iK6fLGuHeXzXxwXFDPfBLERTK1FukziNbu7glbFz+1KwG1FfHSXbZrxuT
 Yw13dQ+QVCFjijUjiW2ehGKHW+9X62PWa9Cy9/HAPQlw55oKHrar88esa g==;
X-CSE-ConnectionGUID: irqGF/v5TpaMU3av7rjbWw==
X-CSE-MsgGUID: pj9wBOemT1mye27clTcZWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561479"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:23 -0700
X-CSE-ConnectionGUID: bAu2TtSCQn2MHXj9OOxizw==
X-CSE-MsgGUID: HAK2Lg49RsSEHo5BTTSnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825504"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 08/13] drm/xe: Add some members to xe_vma_ops
Date: Wed, 24 Apr 2024 10:23:47 -0700
Message-Id: <20240424172352.1704851-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
References: <20240424172352.1704851-1-matthew.brost@intel.com>
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
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 19 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 234b1baac39e..2e91067fc0ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -745,7 +745,9 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops);
-static void xe_vma_ops_init(struct xe_vma_ops *vops);
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -760,7 +762,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	    list_empty(&vm->rebind_list))
 		return 0;
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -806,7 +808,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
 	if (err)
@@ -2998,9 +3000,16 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
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
@@ -3167,7 +3176,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7ff92b263b79..144ee88c70a5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -353,6 +353,14 @@ struct xe_vma_op {
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

