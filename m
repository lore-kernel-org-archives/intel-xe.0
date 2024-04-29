Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA56DC41513
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274F710F486;
	Mon, 29 Apr 2024 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M11nHwZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD92910F409
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714409203; x=1745945203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p90riRJXKHMFnf7braWQTzlsJel+dzDO9OUXYUPjNkY=;
 b=M11nHwZ1cwj37IJe8QVPb+X/+DBTxFO+1huVlBN4+a5mU/aU+89NU5zc
 FmWiebd7va0LB8lBOiD4G7kixNCWvr52bzErUyxGU4odGxiSjYqS4CA4M
 Uq9ThN+0R66Se70h4tmSFqnLqxyo7KnvbXjKx0Oa0CLITMYvzPS/Si9OD
 K1KF4Z/WjB6W+CutnYklgMMK0ui8dwUzPJiB5N3hB+P058H/kSpVJZZ3I
 9jdV1vAOZSeeko5wlXA4wbsdamfrfpPYX/cOw61VjdHLvWfCgRIpyEIdi
 scTfoAlXUfI7ktcNbhU3bmzmJ4h2GxGwsdC8K617pK3z9K+VN6bj3MZ8B w==;
X-CSE-ConnectionGUID: XDyXKTwlRiysgCKuksZvcA==
X-CSE-MsgGUID: RNWkTJkOQRq3d8J1nYrxXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21486081"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="21486081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:46:42 -0700
X-CSE-ConnectionGUID: kdWnOs1UQaGgeq4wZ4zWKw==
X-CSE-MsgGUID: 3y4yJlpcQ1iy5DUWqgWZgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="63647311"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:46:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/5] drm/xe: Update VM trace events
Date: Mon, 29 Apr 2024 09:47:12 -0700
Message-Id: <20240429164713.2249950-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429164713.2249950-1-matthew.brost@intel.com>
References: <20240429164713.2249950-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_trace.h | 10 ++++-----
 drivers/gpu/drm/xe/xe_vm.c    | 42 +++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2d56cfc09e42..f18ae1c63031 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -423,11 +423,6 @@ DEFINE_EVENT(xe_vma, xe_vma_acc,
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
@@ -541,6 +536,11 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
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
index aef0ed5f9571..bb9712586002 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2470,6 +2470,38 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
@@ -2513,8 +2545,10 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
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
@@ -2528,6 +2562,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		}
 	}
 
+	trace_xe_vm_ops_execute(vops);
+
 	for_each_tile(tile, vm->xe, id) {
 		if (!vops->pt_update_ops[id].num_ops)
 			continue;
@@ -2574,6 +2610,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	kfree(fences);
 	kfree(cf);
 
+err_trace:
+	trace_xe_vm_ops_fail(vm);
 	return fence;
 }
 
-- 
2.34.1

