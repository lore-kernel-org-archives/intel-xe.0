Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFE0C2BA12
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A593C10E761;
	Wed, 12 Jun 2024 02:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfmznMYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8EA10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ttAaH1NzIy9PUZzvPBk/BBXIzeX/mBS1GEO9lj0fVdQ=;
 b=VfmznMYB/+BiHz2gscFlxQn7bM1lb6QWwOuB/pUtqTPhrcrsYoqXGuRx
 hQl83hX8q4dh1byzwH9+pxX3gE0f44UhwaWOvTtu0NicAWjZN5ENdQNCi
 xqwhog3Xb7p6rzQWbbeNJ4/ZyrwGj9z9E+Q9lJNiyWs8nONZt4ljAz4/g
 sF/xhCUAQdFifCEWCmhDzo/yqYjNDQj4r+/kJMfR9ca4xybGjA4xdDBYz
 IDgEZZ9uB3zqYr3EIOLcfEVH6HUa2s5YYqvLko28XbKj6FHupdVQv88aO
 gnxfD6hZl4Poyi0C/ulA0bx0mTQX0GpvQM8ugzHpykzYDa5746ZOhc9GR w==;
X-CSE-ConnectionGUID: EduPrEYmR6qZUj7wMMByIg==
X-CSE-MsgGUID: 3IjbHkn+Tt+ezMPphIiCuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427808"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: 52X+2frTQN61Ob3Vj1SdcQ==
X-CSE-MsgGUID: SakyW0rzSQWDFth/TNoIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763635"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 19/43] drm/xe: Update VM trace events
Date: Tue, 11 Jun 2024 22:25:41 -0400
Message-Id: <20240612022605.385062-19-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Matthew Brost <matthew.brost@intel.com>

The trace events have changed moving to a single job per VM bind IOCTL,
update the trace events align with old behavior as much as possible.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 10 ++++-----
 drivers/gpu/drm/xe/xe_vm.c    | 42 +++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e4cba64474e6..3d7949d26de3 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -426,11 +426,6 @@ DEFINE_EVENT(xe_vma, xe_vma_acc,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_fail,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_bind,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
@@ -544,6 +539,11 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 /* GuC */
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ba7df582dc0b..b4fc8cf3f6a8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2476,6 +2476,38 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	return 0;
 }
 
+static void op_trace(struct xe_vma_op *op)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		trace_xe_vma_bind(op->map.vma);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.remap.unmap->va));
+		if (op->remap.prev)
+			trace_xe_vma_bind(op->remap.prev);
+		if (op->remap.next)
+			trace_xe_vma_bind(op->remap.next);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.unmap.va));
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		trace_xe_vma_bind(gpuva_to_vma(op->base.prefetch.va));
+		break;
+	default:
+		XE_WARN_ON("NOT POSSIBLE");
+	}
+}
+
+static void trace_xe_vm_ops_execute(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	list_for_each_entry(op, &vops->list, link)
+		op_trace(op);
+}
+
 static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
 	struct xe_exec_queue *q = vops->q;
@@ -2519,8 +2551,10 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	if (number_tiles > 1) {
 		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
-		if (!fences)
-			return ERR_PTR(-ENOMEM);
+		if (!fences) {
+			fence = ERR_PTR(-ENOMEM);
+			goto err_trace;
+		}
 	}
 
 	for_each_tile(tile, vm->xe, id) {
@@ -2534,6 +2568,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		}
 	}
 
+	trace_xe_vm_ops_execute(vops);
+
 	for_each_tile(tile, vm->xe, id) {
 		if (!vops->pt_update_ops[id].num_ops)
 			continue;
@@ -2580,6 +2616,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	kfree(fences);
 	kfree(cf);
 
+err_trace:
+	trace_xe_vm_ops_fail(vm);
 	return fence;
 }
 
-- 
2.26.3

