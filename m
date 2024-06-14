Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284E0C2BA18
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE7E10EE7B;
	Fri, 14 Jun 2024 21:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ8iUneN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CB10E2C5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401657; x=1749937657;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TBy79V+LSg+DBatRRQHZEDgHbgmGbpt98PBLMiY/JW0=;
 b=MJ8iUneNAkj39fRZZgwg3pSsK+bbcBNmF3ZJLuMfJbcPO4WodOT9ZkMt
 J/sZyFGewvOL+NMdpN9g3tJ9GPCFmmGQgW82RY4FudbQGtxTq7z/Jp59L
 TMhd0RKaHdHJa8Ljce8YUfG9X2FYecg33iXH/bk46+sKj8GP0alqlNXLJ
 AX3rUwu+3uYiOK6kQPVZ7G9MejYvDf+0KyXoxXPZk8aJyKc4qHE0KAaBL
 kqDv3gtfl2sRtXsM9v0bL/yI6ev4GD6maO61lrL+XLqWldiKzH1/57bpv
 92m/ERNTW4DYQRjjZhQbZXg5uRS+tAxdzDJ9KO6QVef90Fb6wmx9rsxZ2 g==;
X-CSE-ConnectionGUID: jz6tW73sQPKwHepoE5dJvg==
X-CSE-MsgGUID: tsYmC9T0SdSsSvcupm4PuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886591"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: UhOFnbG8TQq0NIL2aZ2Vnw==
X-CSE-MsgGUID: LyIhzm61ThmLAKr7ffb5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572424"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 30/44] drm/xe/uapi: Add DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM flag
Date: Fri, 14 Jun 2024 17:58:03 -0400
Message-Id: <20240614215817.1097633-30-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

When a xe_vm is created with DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM,
xe_vm shares the same process address space with the CPU process who
create this xe_vm.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Suggested-by: Christian Konig <Christian.koenig@amd.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 2 ++
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 include/uapi/drm/xe_drm.h        | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 147a5d76a0ee..4aa5a596475e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1832,6 +1832,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM)
+		flags |= XE_VM_FLAG_PARTICIPATE_SVM;
 
 	vm = xe_vm_create(xe, flags);
 	if (IS_ERR(vm))
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4d9707c19031..165c2ca258de 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -143,6 +143,7 @@ struct xe_vm {
 #define XE_VM_FLAG_BANNED		BIT(5)
 #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
 #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
+#define XE_VM_FLAG_PARTICIPATE_SVM		BIT(8)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index af8ee6f929d4..ee09ed1ea3c2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -830,6 +830,9 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM - This vm participates
+ *    SVM (shared virtual memory), which means this vm share one process
+ *    address space with CPU process who create this xe_vm.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -838,6 +841,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.26.3

