Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFFC10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146111A0E9;
	Thu, 25 Apr 2024 04:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6XFutxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3794111A0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgxiLC0ANtMbSq5mKhIqqEED0bHXFk98Ht9NHodDSZA=;
 b=G6XFutxZgBy2ZFUWKmOIjG2sucZ3yuwrFx49OMzxxUUSoeXe5SvvqVxP
 jArHNOxi/8EvHk44c7uKUeYcTmD9TLX7S1i9eE4KPLxgFWHpZzWIaUo/a
 xkQGImdEo599SYsN4YuxtDaNbLGYhhlcXKxmA2S/YU/wxtwXGCZ8/nkN6
 ps7KZzKVULthcFEaZBAXBN7B6K2GMZUaLUsdoH456iqZ+TRfBGPWne0dS
 owC5Z+QReZ5H0SYDd/tnYI5Ere1vSfgft3dMOaC7svMzpjvS5M4F87ZV6
 ZYkLu672gg84KEVP1rbiTaJu8QeHbYu1WAEDcd1ZfXkPjCD7h7znr6V9t w==;
X-CSE-ConnectionGUID: 220vNVKwTOyajvR8TgY05g==
X-CSE-MsgGUID: 61omeRtwR7iKlWC7WLeXPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374878"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
X-CSE-ConnectionGUID: Y6Kiv7VuSmiZMOZ07Qrh9w==
X-CSE-MsgGUID: qSvYxDx7T0iIi98L0+k+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996498"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 08/13] drm/xe: Add some members to xe_vma_ops
Date: Wed, 24 Apr 2024 21:55:08 -0700
Message-Id: <20240425045513.1913039-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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
index 2c04e27aa79c..a422efd924a3 100644
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

