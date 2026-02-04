Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65546E9D3FF
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 15:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57310E36E;
	Wed,  4 Feb 2026 15:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sspy+rfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D0E10E697
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770219220; x=1801755220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdZCNsn1Pt1WHYNodCnXZ2PADqBl0YHC4Qah+hqKNx4=;
 b=Sspy+rfK1XHQgX3sgUl9oay3/MtauX4s7jt4WBP1GVIznSz7XYCg3Zgd
 UJ7gfABul1Wh+IApPX8Fzcf9SFGfOLI3OTG/bnEqfKk9WlFhUUjiGZ2dH
 Ot9iLahFN8k0tPW3mxiL4xj8gfELNEDWsKXsBQ2PUnoeVogiuUV1n/jbS
 uZ9xaZ9IW7mr5oqY0hl2UbWYXmgxuvK9MzKP06E2lJ/9O+3QsKSik/YEk
 VYAjZcc3p86epHLUTMUF8Q/uXvdd8Cm8/QpCGSFb1kcfFlfDjAECXHsza
 rxIhLCHj7PtaX8Lc/+p76xki6Oq4ZfaxmDildaOKr+a2TOJDFYtk/Yb3x A==;
X-CSE-ConnectionGUID: ZxgXTLNuRMyTf8mvXAVvqg==
X-CSE-MsgGUID: m2RO3SWeQS6v8Dw7EVmOWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71573259"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71573259"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:33:40 -0800
X-CSE-ConnectionGUID: qDhUqELQR+C9ru+Wqs9Tqw==
X-CSE-MsgGUID: 95OJR47WTrqTMfrw+iTtFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209299033"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.210])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:33:38 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/uapi: Introduce a flag to disallow vm overcommit in
 fault mode
Date: Wed,  4 Feb 2026 16:33:20 +0100
Message-ID: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Some compute applications may try to allocate device memory to probe
how much device memory is actually available, assuming that the
application will be the only one running on the particular GPU.

That strategy fails in fault mode since it allows VM overcommit.

While this could be resolved in user-space it's further complicated
by cgroups potentially restricting the amount of memory available
to the application.

Introduce a vm create flag, DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT, that
allows fault mode to mimic the behaviour of !fault mode WRT this. It
blocks evicting same vm bos during VM_BIND processing. However,
it does *not* block evicting same-vm bos during pagefault
processing, preferring eviction rather than VM banning in
OOM situations.

Cc: John Falkowski <john.falkowski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 11 +++++++++--
 drivers/gpu/drm/xe/xe_vm.h       |  7 +++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 include/uapi/drm/xe_drm.h        |  6 ++++++
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fe54a998385..cf92b6e13a16 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1938,7 +1938,8 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
-				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
+				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
+				    DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file)
@@ -1977,12 +1978,18 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
+			 args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT))
+		return -EINVAL;
+
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
 		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
+		flags |= XE_VM_FLAG_NO_VM_OVERCOMMIT;
 
 	vm = xe_vm_create(xe, flags, xef);
 	if (IS_ERR(vm))
@@ -2903,7 +2910,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
 			err = xe_bo_validate(bo, vm,
-					     !xe_vm_in_preempt_fence_mode(vm) &&
+					     xe_vm_allow_vm_eviction(vm) &&
 					     res_evict, exec);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 288115c7844a..f849e369432b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -220,6 +220,13 @@ static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
 	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
 }
 
+static inline bool xe_vm_allow_vm_eviction(struct xe_vm *vm)
+{
+	return !xe_vm_in_lr_mode(vm) ||
+		(xe_vm_in_fault_mode(vm) &&
+		 !(vm->flags & XE_VM_FLAG_NO_VM_OVERCOMMIT));
+}
+
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 43203e90ee3e..1f6f7e30e751 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -232,6 +232,7 @@ struct xe_vm {
 #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
 #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
 #define XE_VM_FLAG_GSC			BIT(8)
+#define XE_VM_FLAG_NO_VM_OVERCOMMIT     BIT(9)
 	unsigned long flags;
 
 	/**
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..e54f8e12acd9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -975,6 +975,11 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
+ *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM overcommit
+ *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
+ *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful for
+ *    user-space naively probing the amount of available memory.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -983,6 +988,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.52.0

