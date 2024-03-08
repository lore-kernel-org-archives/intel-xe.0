Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7FAC54E61
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDDA112EC4;
	Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6JIicpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E3B10FCE3
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rgAm2HcxXQ9h0gcHyh/f5umyn6lH9wwpf13A0aOYNWQ=;
 b=c6JIicpX+De3WRX9PXWVOUBUUsmtvavD/aWCqlJLsf4At8mwJjaL9yBa
 unA+aZxeretZB7RIRfgUJYaBroI4J1X4v+ReK6sCZzUrdRbvT1eAnxj8o
 Y/GkuYyD9ilyuoDsk5AAaOjWYxepQ1chjz1eDF/XQzyMl/T4HVOEeLaW2
 VrTHJiqOUZYLfVfd/GFzEN8T+PMRtj4vE9c/Y6J9wqjbTzKJo6yt9QXuv
 Soin6G+/3oGEY6mvfI2ux/uTRNgXTDEN184Ku0MqrfdfSPPvG2R2kYYKn
 uyS40l8aM6xtMcwfQOD52VCrAZazT2xzhZp5F+kyVU9lOlZuIcyzQfN++ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761966"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761966"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403001"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
Date: Thu,  7 Mar 2024 21:07:48 -0800
Message-Id: <20240308050806.577176-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

Rather than checking for an unsignaled ufence ay unbind time, check for
this during the op_lock function. This will help with the transition to
job 1 per VM bind IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4432531f39fe..5767955529dd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1665,16 +1665,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	trace_xe_vma_unbind(vma);
 
-	if (vma->ufence) {
-		struct xe_user_fence * const f = vma->ufence;
-
-		if (!xe_sync_ufence_get_status(f))
-			return ERR_PTR(-EBUSY);
-
-		vma->ufence = NULL;
-		xe_sync_ufence_put(f);
-	}
-
 	if (number_tiles > 1) {
 		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
@@ -2721,6 +2711,21 @@ static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool validate)
 	return err;
 }
 
+static int check_ufence(struct xe_vma *vma)
+{
+	if (vma->ufence) {
+		struct xe_user_fence * const f = vma->ufence;
+
+		if (!xe_sync_ufence_get_status(f))
+			return -EBUSY;
+
+		vma->ufence = NULL;
+		xe_sync_ufence_put(f);
+	}
+
+	return 0;
+}
+
 static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 		   struct xe_vma_op *op)
 {
@@ -2731,6 +2736,10 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 		err = vma_lock(exec, op->map.vma, !xe_vm_in_fault_mode(vm));
 		break;
 	case DRM_GPUVA_OP_REMAP:
+		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
+		if (err)
+			break;
+
 		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap->va),
 			       false);
 		if (!err && op->remap.prev)
@@ -2739,6 +2748,10 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock(exec, op->remap.next, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
+		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
+		if (err)
+			break;
+
 		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-- 
2.34.1

