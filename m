Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC57C4450A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 04:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FB18910E;
	Wed, 15 Jul 2026 04:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UURL6ZK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6651810EE9F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 04:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784090357; x=1815626357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1CPV18pGJL1cQtmFPZis+NZTsMLvJwkAIefFx1nZ6g=;
 b=UURL6ZK2hlVAoBJxuSEbQ3QB87/if9AugCp7hFecWTn3FlL57bxREytL
 JO9NjT3J3Xy0KUenovXEWTk8X5JeN7V84pumSqYx5QIeDdkoa9csD65C9
 fBhljB287tWyGP+Nd1lFh7sLdOmAScXqYjyJS0+WF3S2Eum4C81gEs50/
 rLFng5aIBmFXGASXYE0uhQqdSmbAr4AKfYLibUFBt8ag3hqbiDgd4RcbD
 MLtvXqNzcS2+WQH3htHAx8VMK0aH3aCQZLFRORBXNNf8a/eX3g3K2cxf9
 0EjSkcSs1M11kp0h1I7rhrlCQhAevwG/BcsTo5mMTxDCHdAi+umJXs+Rg A==;
X-CSE-ConnectionGUID: YZytV8CEQkW+RNL7aHzswA==
X-CSE-MsgGUID: AKUWs9RiTOqbI4xRlWBzCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87261764"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="87261764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:39:17 -0700
X-CSE-ConnectionGUID: sCcqm+zJSwCH+fStaMQAOA==
X-CSE-MsgGUID: fAbLIdMRRuiIstiu5Ic0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="252084834"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:39:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v3 3/4] drm/xe: Fix up BO TTM priority for late VM binds
Date: Tue, 14 Jul 2026 21:39:10 -0700
Message-Id: <20260715043911.3626426-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715043911.3626426-1-matthew.brost@intel.com>
References: <20260715043911.3626426-1-matthew.brost@intel.com>
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

A BO's TTM priority is only ever set once, at creation time, based on
the priority band of exec queues attached to its VM at that moment
(xe_vm_bo_priority()), or XE_BO_PRIORITY_HIGHEST for an extobj not
tied to any single VM. This misses the common flow of VM create -> BO
create -> exec queue create -> VM bind: the BO is created before any
exec queue exists on the VM (so it gets XE_BO_PRIORITY_HIGH, the "no
exec queues yet" default), the exec queue is added afterwards
(xe_vm_add_exec_queue() only re-prioritizes BOs already bound to the
VM at that time), and only then is the BO bound into the VM via
VM_BIND, leaving it stuck at a stale priority that no longer reflects
the VM's exec queues.

It also misses a second flow specific to extobjs: create BO with no
vm_id (bo->vm == NULL) -> bind -> unbind -> rebind. The unbind can
lower the BO's priority to XE_BO_PRIORITY_LOW once it has no VMA
mappings left anywhere (see xe_vma_destroy()), but on rebind nothing
brought it back up, leaving a still-useful, freshly rebound extobj
stuck at the lowest priority, an easy target for eviction/shrinking.

Add op_update_bo_priority(), called from vm_bind_ioctl_ops_fini() for
each DRM_GPUVA_OP_MAP operation. For a BO private to the VM being
bound (bo->vm == vm), recompute the current priority band via
xe_vm_bo_priority() and, if it differs, update bo->ttm.priority and
move the BO to the tail of its new priority's LRU list. For an extobj
(bo->vm == NULL, potentially shared with other VMs), instead restore
it directly to XE_BO_PRIORITY_HIGHEST, since it is now in active use
again and extobjs aren't tied to any single VM's exec queue priority
band. This runs under the VM's dma-resv lock, already held via
drm_exec in vm_bind_ioctl_ops_execute() since private BOs share the
VM's reservation object, and extobjs are locked as part of the same
bind operation.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 74ab6f255c70..7f8f257eada9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3569,6 +3569,38 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 	}
 }
 
+/*
+ * A BO's TTM priority is set when it is created, based on the priority band
+ * of @vm's exec queues at that time (for a private BO), or to the highest
+ * level (for an extobj, bo->vm == NULL). If a BO is (re)mapped into @vm
+ * afterwards, its priority may be stale: a private BO's VM may have gained
+ * or lost exec queues since, and an extobj may have been lowered to
+ * XE_BO_PRIORITY_LOW by xe_vma_destroy() after losing all of its VMA
+ * mappings. Bring it in line with the current priority band here.
+ */
+static void op_update_bo_priority(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	struct xe_bo *bo;
+	int priority;
+
+	if (op->base.op != DRM_GPUVA_OP_MAP)
+		return;
+
+	bo = xe_vma_bo(op->map.vma);
+	if (!bo)
+		return;
+
+	/* Private BOs are only ever bound to the VM they were created for. */
+	xe_assert(vm->xe, !bo->vm || bo->vm == vm);
+
+	priority = bo->vm ? xe_vm_bo_priority(vm) : XE_BO_PRIORITY_HIGHEST;
+	if (bo->ttm.priority == priority)
+		return;
+
+	xe_vm_assert_held(vm);
+	xe_bo_update_ttm_priority(bo, priority);
+}
+
 static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
@@ -3581,6 +3613,8 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (ufence)
 			op_add_ufence(vm, op, ufence);
 
+		op_update_bo_priority(vm, op);
+
 		if (op->base.op == DRM_GPUVA_OP_UNMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
 		else if (op->base.op == DRM_GPUVA_OP_REMAP)
-- 
2.34.1

