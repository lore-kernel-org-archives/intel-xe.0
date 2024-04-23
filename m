Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C30C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 07:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71AB10E15E;
	Tue, 23 Apr 2024 07:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsMBElSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D470410E15E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713858515; x=1745394515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IC9tlFoGlxqKHzuar4xOaD9wYXxnt0AjqiA9qyXbVC0=;
 b=GsMBElSpeqOOvhrUMdx13+yTYUytMhN9C5rRoelrd+gRvggz73Lv14IN
 31Xvn3SfJW569SZ23TyHael0+kQLLLGCcDo8HQeLlPjoN5FyJnSXUDM0L
 FrBTZ3Z96JwtCXAuDdJSd+FVjN8TMQFAn7c5h01kewHS/NIj6+9SSBBiu
 6sP88Zdwq/a7OQtuRMqxMT02TaZnYtDmZcJBrbtpirWzDqiGBxcPwMH+8
 ALeDdbCPfoD8ddJ8hj8xFMvaMm024dB6xfJ4eepuxC5cqaw+bYz6xELw9
 BS85JtLYJMIrfOjXUwDbMCkCbpHN3K9KQm7ScqXRJTqynxiZdjzQ2P0Hj A==;
X-CSE-ConnectionGUID: upMJnCmySOeWLecgVWh+RA==
X-CSE-MsgGUID: QwhQ0emcQX25pqrqeiqW+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9967004"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9967004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:48:34 -0700
X-CSE-ConnectionGUID: VwClb7hKROiIdBvKCaSq5w==
X-CSE-MsgGUID: o3adahN2QNitDydDrTThkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28955721"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.139])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:48:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] Revert "drm/xe/vm: drop vm->destroy_work"
Date: Tue, 23 Apr 2024 08:47:22 +0100
Message-ID: <20240423074721.119633-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

This reverts commit 5b259c0d1d3caa6efc66c2b856840e68993f814e.

Cleanup here is good, however we need to able to flush a worker during
vm destruction which might involve sleeping, so bring back the worker.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..2ba7c920a8af 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1178,6 +1178,8 @@ static const struct xe_pt_ops xelp_pt_ops = {
 	.pde_encode_bo = xelp_pde_encode_bo,
 };
 
+static void vm_destroy_work_func(struct work_struct *w);
+
 /**
  * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
  * given tile and vm.
@@ -1257,6 +1259,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
+
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
@@ -1494,9 +1498,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_put(vm);
 }
 
-static void xe_vm_free(struct drm_gpuvm *gpuvm)
+static void vm_destroy_work_func(struct work_struct *w)
 {
-	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
+	struct xe_vm *vm =
+		container_of(w, struct xe_vm, destroy_work);
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
 	u8 id;
@@ -1516,6 +1521,14 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void xe_vm_free(struct drm_gpuvm *gpuvm)
+{
+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
+
+	/* To destroy the VM we need to be able to sleep */
+	queue_work(system_unbound_wq, &vm->destroy_work);
+}
+
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 {
 	struct xe_vm *vm;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7570c2c6c463..badf3945083d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -177,6 +177,13 @@ struct xe_vm {
 	 */
 	struct list_head rebind_list;
 
+	/**
+	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
+	 * from an irq context can be last put and the destroy needs to be able
+	 * to sleep.
+	 */
+	struct work_struct destroy_work;
+
 	/**
 	 * @rftree: range fence tree to track updates to page table structure.
 	 * Used to implement conflict tracking between independent bind engines.
-- 
2.44.0

