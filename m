Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2599DC44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 05:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0810E127;
	Wed, 15 Jul 2026 05:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Utzn9DlH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7510E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784093923; x=1815629923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMriOtn6V225A2qbjOPtJpFRsr3ya+aowO7PqVTwC9M=;
 b=Utzn9DlHLOAZQlRi9Cgl8KoQVP5UhQllcP71QMlJ60HzDzffCWpQaWOO
 YIAmAceLQgp+Evrn+w9oUjs11iAZtOLqVaFOfOL5X8N25ppE+bdHY6zF8
 lgxh2Yko/92Lmd05Cn4RDVG6aGQ6UWa5q79eQPFLJmm0YKM6T6oay93tn
 OarBU04XGcZfbb4VppBA6rip6Kfixun44ESguEKFzt9HzOTVCKnFfHJPj
 /FTifKRkhr9xWV1ycEcWlOojho5Pr7kCo5XPq3rf1Y1x2P3llJShZ0x4F
 W9AUb6ZcnkGC+r/0gQbXIm/6kYpgqy5fyxcd0bZbkbgx8hGF7OQ5ntkN8 A==;
X-CSE-ConnectionGUID: Xw1f3jqNSKu9E13wQyGABQ==
X-CSE-MsgGUID: FdjO64ndTSCDY6G2rhuIVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88622379"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88622379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:38:41 -0700
X-CSE-ConnectionGUID: 3h6PU10CRJKFJuQuUWMx0A==
X-CSE-MsgGUID: QiFxISeGS/+o+heOmxEuLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="252676595"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:38:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v4 4/4] drm/xe: Fix up BO TTM priority for late VM binds
Date: Tue, 14 Jul 2026 22:38:36 -0700
Message-Id: <20260715053836.3719601-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715053836.3719601-1-matthew.brost@intel.com>
References: <20260715053836.3719601-1-matthew.brost@intel.com>
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
index f74db350abf1..890e2bf5e177 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3585,6 +3585,38 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
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
@@ -3597,6 +3629,8 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (ufence)
 			op_add_ufence(vm, op, ufence);
 
+		op_update_bo_priority(vm, op);
+
 		if (op->base.op == DRM_GPUVA_OP_UNMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
 		else if (op->base.op == DRM_GPUVA_OP_REMAP)
-- 
2.34.1

