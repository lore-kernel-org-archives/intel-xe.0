Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E414FCD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 20:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40AE10E0C6;
	Thu, 28 Mar 2024 20:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V85j/LrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F93110E0C6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 20:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711656229; x=1743192229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gOLqa7+jTjA5wDoY7ZFz9+1tODWcTFHW80AYrOe7ciQ=;
 b=V85j/LrN5GSR8gdzF1A03I/MS3t7zWIxlGBUGrWxHiMtFm7F5Tgs3tig
 T4YEpgYgVY3nhe1ZRzBJ1sGqYfPZfUvpYL4UnkavilnRDQZuOXmOSgohh
 nFbE2S1Cn4rRvzFXXpsm6Z+QIt5ELxDwmHtSj4KFeyxrk3JDgJ9EKnqpK
 JInKoFdRyy3BHIU5B/qfPxwxqvZtMITvnBJNqUXk2I/p3c0KtoSIBAH6v
 rSR0EZh3eUIcqg38BsQTrWxLvbuFHC9G5m7sLTSkzTgmOPGQHxBfQT8oj
 sh9IM1xzfffuuGX5Ypx8bYJO1uslLPd5Kq/jXKxS8X/wqLhHNRWNiZRZJ w==;
X-CSE-ConnectionGUID: p1hM71rrTN2DK7ADhsJ4Xg==
X-CSE-MsgGUID: CgmgQTXySceTIcPh4QE/oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7436293"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7436293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 13:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47719189"
Received: from jattlan-mobl1.ger.corp.intel.com (HELO a3ae00a07f6c.intel.com)
 ([10.252.56.46])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 13:03:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Date: Thu, 28 Mar 2024 20:03:32 +0000
Message-Id: <20240328200332.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
reverted. At the time, flags not used by user space were removed during
some cleanup. There is now a need for flags DRM_XE_VM_BIND_FLAG_READONLY
and DRM_XE_VM_BIND_FLAG_IMMEDIATE by the compute runtime, so they are
brought back.

v2: Include a link to the PR in the commit message (Matthew Brost)

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://github.com/intel/compute-runtime/pull/717
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
 include/uapi/drm/xe_drm.h        |  6 ++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8b32aa5003df..6e56b9a3985b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2212,6 +2212,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
+			op->map.immediate =
+				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
+			op->map.read_only =
+				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
@@ -2406,6 +2410,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			flags |= op->map.read_only ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
@@ -2550,7 +2556,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				 op->syncs, op->num_syncs,
-				 !xe_vm_in_fault_mode(vm),
+				 op->map.immediate || !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2825,7 +2831,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
-#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
+#define SUPPORTED_FLAGS	\
+	(DRM_XE_VM_BIND_FLAG_READONLY | \
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
+	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..0447c79c40a2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -276,6 +276,10 @@ struct xe_vm {
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 808ad1c308ec..94e1f3cfe705 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -871,6 +871,10 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
+ *  - %DRM_XE_VM_BIND_FLAG_READONLY
+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
+ *    MAP operation immediately rather than deferring the MAP to the page
+ *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -963,6 +967,8 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
-- 
2.34.1

