Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDCC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 12:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC505113350;
	Tue, 23 Apr 2024 12:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfNscEit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03A6113351
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713874294; x=1745410294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiP/29eXQyQUWE9cYLzr3VQkNtpwXyfOgvFkvNq0nVo=;
 b=JfNscEitReEng4eOc+6C+2F/maq4j+iYvR9LsfAe5beZxGol1Dtkl0Ti
 f6CVlGQ2HbqR0ljxqlDzH1nAQSFvTsoKeyFLC233WNNE1dd1FPFA3JHxT
 p/mcvWILmXGv+5BAX4zyNAXKjoe8TDpBz6OYqyA6br2Cu0zykny0h4dJg
 QQSP1lJiICjj4Ehwq3wbNUNWkzvRQokpsmQSVYcnjhgflvYqP0GJ6M98+
 uuF6QS7g46RcycIPX26zzkAsmfjGpCeSuAI7LFXVWSVOb26kLapMfkkZB
 M8OEQ1+h4WlqYPqWr65E2D2lAI4hrf0ir45eBdy243JP5havZi1ZQ3QZw g==;
X-CSE-ConnectionGUID: fZKp2ZHKSHuuaJ9tomQ6rA==
X-CSE-MsgGUID: 8OVCrT+2T2WO5siokG3dEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13287818"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13287818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:11:33 -0700
X-CSE-ConnectionGUID: 2GvwICZKQmC7jnyYp1oWxg==
X-CSE-MsgGUID: SkzFRNeJTyiEk64fSouclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24408871"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.240])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:11:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Fix unexpected backmerge results
Date: Tue, 23 Apr 2024 14:11:14 +0200
Message-ID: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

The recent backmerge from drm-next to drm-xe-next brought with it
some silent unexpected results. One code snippet was added twice
and a partial revert was partially reverted. Fix that up to
reinstate the code as it was before the backmerge.

Fixes: 79790b6818e9 ("Merge drm/drm-next into drm-xe-next")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++------
 drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..7ae2b0300db6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -863,11 +863,6 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		vma->ufence = NULL;
 	}
 
-	if (vma->ufence) {
-		xe_sync_ufence_put(vma->ufence);
-		vma->ufence = NULL;
-	}
-
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 		struct xe_userptr *userptr = &uvma->userptr;
@@ -2100,6 +2095,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
+			op->map.immediate =
+				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
+			op->map.read_only =
+				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
@@ -2294,6 +2293,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			flags |= op->map.read_only ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
@@ -2438,7 +2439,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				 op->syncs, op->num_syncs,
-				 !xe_vm_in_fault_mode(vm),
+				 op->map.immediate || !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7570c2c6c463..72a100671e5d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -269,6 +269,10 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	/** @immediate: Immediate bind */
+	bool immediate;
+	/** @read_only: Read only */
+	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
-- 
2.44.0

