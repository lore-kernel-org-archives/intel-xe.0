Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA2C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E02910EFDB;
	Wed, 29 May 2024 18:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ied+oNzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5CC10E2D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717007480; x=1748543480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6D4HvNmV62S1bPnqU07p+wkyMTl7aQJfFVngcrqpj3A=;
 b=Ied+oNznKJnAqfatgrn1NBMp+bvNT5lSxTDyUYU3nRt81x3N+IAJ0cdW
 nsAk/LLW+oYKrrHYUWDddsPb4nuwnLj4E2elyiTHx3QEgJU8x3KW2sQfw
 7OXsFbBTskD8thEZOYB9WK4tFjMPqqPauZYEJp7NqvwueFBigA3ujcxBa
 DQsPl4Ib6K4gTgEzoBpqG77+fywDyuPKEfDDKQqDaN+zdCrl+4IDCuF27
 HjA4Fm+3r6qhaHqncaTtlS9nc+1ZYIjOY6yWFYtF2YQee7vd46qfHn59t
 4ksbiaEsd6IbLlWSNbcI61UQcWQ+ApuNmJstiSCKh6B8NyzXgtsS6azHb w==;
X-CSE-ConnectionGUID: fFrxBG7HR9G0AjbBzI5M6w==
X-CSE-MsgGUID: 2bPYQ0UdSAOLBNE5gRTOHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13280740"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13280740"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:19 -0700
X-CSE-ConnectionGUID: 3JvVn+t0QNme9qLGzPrOFg==
X-CSE-MsgGUID: bQ8yFjT+SEyIvrWKaExiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40388047"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3 4/5] drm/xe: Update VM trace events
Date: Wed, 29 May 2024 11:31:47 -0700
Message-Id: <20240529183148.1713695-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529183148.1713695-1-matthew.brost@intel.com>
References: <20240529183148.1713695-1-matthew.brost@intel.com>
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

The trace events have changed moving to a single job per VM bind IOCTL,
update the trace events align with old behavior as much as possible.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 10 ++++-----
 drivers/gpu/drm/xe/xe_vm.c    | 42 +++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 450f407c66e8..0f5b9df889b9 100644
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
index 551048bff9ce..a205a72f411b 100644
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
2.34.1

