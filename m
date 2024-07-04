Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F61EC3DA41
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2DF10E97A;
	Thu,  4 Jul 2024 04:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpUh5tJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D610E8AB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720066574; x=1751602574;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cMStp+aD1COpwAgspp8CEG3zPdC7h/xxv/EgoJ1jKFY=;
 b=XpUh5tJSQdv9FCvZ4fr80Fr82HkKpBnM2CU3eHw8rl9esMKaiqf4wewf
 Du7dUc47msuoV7nOXyByTM4a4tfwVeqDdStIXqlxHAz89rjqZz8z/FOeu
 Sm2otV/LDPoeTnsf4JI0pB+D3+GuAz/OriwK4HcXsgHT9qKefeH+0MkIe
 Q5iPPZJFTmDXONm3RssjPDrLklF05TcQtAfdiIlfkp/W5Q8tj+4lbdCqO
 L/xOxy1taaHIyHQJIfQfSsJsw9bKjjxxR2AoeE5dvgk7kEGFA4/WThepZ
 xmbAqMKLL6wMITu+1Us7ECRT7eTzuRQSqDkU0X5FhsjL4nQpKTYDmRjsg A==;
X-CSE-ConnectionGUID: VhpTROIqTjaz23+GD/bnVQ==
X-CSE-MsgGUID: LfN3d3SmTlOo0l37YIXpDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20228414"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="20228414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:13 -0700
X-CSE-ConnectionGUID: dC0kvocDQXavSUMsRog0Yw==
X-CSE-MsgGUID: Op5dtDH/Q1Gl19r4W42NYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="47217278"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 5/7] drm/xe: Update VM trace events
Date: Wed,  3 Jul 2024 21:16:50 -0700
Message-Id: <20240704041652.272920-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704041652.272920-1-matthew.brost@intel.com>
References: <20240704041652.272920-1-matthew.brost@intel.com>
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

The trace events have changed moving to a single job per VM bind IOCTL,
update the trace events align with old behavior as much as possible.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 10 ++++----
 drivers/gpu/drm/xe/xe_vm.c       | 42 ++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index f39f09ed3495..9b1a1d4304ae 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -117,11 +117,6 @@ DEFINE_EVENT(xe_vma, xe_vma_acc,
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
@@ -237,6 +232,11 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 #endif
 
 /* This part must be outside protection */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 73cc6b0efcef..5232856cc3fb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2481,6 +2481,38 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
@@ -2524,8 +2556,10 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
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
@@ -2539,6 +2573,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		}
 	}
 
+	trace_xe_vm_ops_execute(vops);
+
 	for_each_tile(tile, vm->xe, id) {
 		if (!vops->pt_update_ops[id].num_ops)
 			continue;
@@ -2585,6 +2621,8 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	kfree(fences);
 	kfree(cf);
 
+err_trace:
+	trace_xe_vm_ops_fail(vm);
 	return fence;
 }
 
-- 
2.34.1

