Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF2CD128A
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 12:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087EC1126CC;
	Fri, 29 Mar 2024 12:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h437WrM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153C11126CD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711716269; x=1743252269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vefXiKimxlh67+i3aOHZ23/TP3J+B2IJEmRVkdfU2Yg=;
 b=h437WrM5a9hZVl5YV6cljAjdVewJ4Esgixi3NW8kLw+xh5o2JX2nFg2B
 OoD8D6CibmNEfwc+T5943yTj4H33wgkqKT947TK3byCafoj9uU6FvBLUr
 0uEiM5RRsRRyGLQ6KpRO9HsA+b0CRsS0wmrxqszmlLnlqHzHjSlb317oI
 l5jBRNMNFGmhqKAX2gCDl8nVc19rONzANDBqjgnTDbc6IPdtzb1YDbPL5
 eVnSHjNng+lsV+Kd2MclF8RcNRBTkmqcBQqPRCbfJbKpVkvEhmJWvha1I
 gaWiVUi1AJooikPF4eJ7LW9b9oLuGMFd5dlZANjEItOW6Ys8SIeNLHxdX g==;
X-CSE-ConnectionGUID: Y+m/wTWcSLiQoE7gK/RSLw==
X-CSE-MsgGUID: ETO0g6LCT3iD98tk/KEGiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24355473"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="24355473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 05:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="21435816"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO 105fbaf372e6.intel.com)
 ([10.252.40.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 05:44:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Date: Fri, 29 Mar 2024 12:44:03 +0000
Message-Id: <20240329124403.7-1-francois.dugast@intel.com>
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
cleanup. Some flags now needed by the compute runtime are brought back in
this commit:
- DRM_XE_VM_BIND_FLAG_READONLY is used to write protect kernel ISA thus
preventing accidental overwrites.
- DRM_XE_VM_BIND_FLAG_IMMEDIATE is used to trigger mapping at the time of
binding in order to prevent faulting at execution time.

The changes in the compute runtime are ready and approved, see link below.

v2: Include a link to the PR in the commit message (Matthew Brost)

v3: Update kernel doc and improve commit message (Lucas De Marchi)

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://github.com/intel/compute-runtime/pull/717
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
 include/uapi/drm/xe_drm.h        |  8 ++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

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
index 95a8ecca21f4..1446c3bae515 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -871,6 +871,12 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
+ *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
+ *    to ensure write protection
+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
+ *    MAP operation immediately rather than deferring the MAP to the page
+ *    fault handler. This is implied on a non-faulting VM as there is no
+ *    fault handler to defer to.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -963,6 +969,8 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
-- 
2.34.1

