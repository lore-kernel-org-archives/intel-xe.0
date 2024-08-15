Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5CEC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 17:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0F510E14E;
	Thu, 15 Aug 2024 17:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZuNK3CZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950810E14E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723741766; x=1755277766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z8cYD8JaZIAaS0N5qjxzEwGcwmMFlauQxGsQqvw8zts=;
 b=XZuNK3CZeMDm+SUPg8WDczy2bPmrvrnGSCkNHmeiTQzU5Qk5sHcpt5FD
 xMYxgZiPVKAHhxoH2IUdFLloLDGYazWNj9UblUeOI3zT2Sq+eeIG8dP4F
 ftCq8X5pElSIN55ArHHHR//rlfgfDbG8z/w9UeGQ1rxcqZ7IfY5q/ek15
 1kXC7fMHGT6vDYGG2uq3QAby421oYGC90LHY/xw1fLGfxbGaTfZBoPPJH
 sapGiOUBZ1MUW9leRmLW8paPRj/SbNRVePwxEDFczZKlMgZ7KXB5r9EUx
 yigwcsYEbj7jOSZZTnODAtWeDXiIsFhRm46cjBsAd2TXlPllUZXQQhF9k Q==;
X-CSE-ConnectionGUID: Seu+YLvUTBiCrDvxmYICPA==
X-CSE-MsgGUID: LD4xt4u9Tp6+yeiXAbZFuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22160495"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22160495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:09:25 -0700
X-CSE-ConnectionGUID: ggB8ZGhNRgGfhgWUStp93Q==
X-CSE-MsgGUID: PBp3taSHQmG0ajihJ6ZL1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59568779"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:09:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Use resevered copy engine for user binds on faulting
 devices
Date: Thu, 15 Aug 2024 10:10:18 -0700
Message-Id: <20240815171018.1783-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

User binds map to engines with can fault, faults depend on user binds
completion, thus we can deadlock. Avoid this by using resevered copy
engine for user binds on faulting devices.

While we are here, normalize bind queue creation with a helper.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 114 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_exec_queue.h |   3 +
 drivers/gpu/drm/xe/xe_vm.c         |   8 +-
 3 files changed, 61 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 971e1234b8ea..8f266569be91 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -189,6 +189,51 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
 }
 
+/**
+ * xe_exec_queue_create_bind() - Create bind exec queue.
+ * @xe: Xe device.
+ * @tile: tile which bind exec queue belongs to.
+ * @flags: exec queue creation flags
+ *
+ * Normalize bind exec queue creation. Bind exec queue is tied to migration VM
+ * for access to physical memory required for page table programming. On a
+ * faulting devices the reserved copy engine instance must be used to avoid
+ * deadlocking (user binds cannot get stuck behind faults as kernel binds which
+ * resolve faults depend on user binds). On non-faulting devices any copy engine
+ * can be used.
+ *
+ * Returns exec queue on success, ERR_PTR on failure
+ */
+struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
+						struct xe_tile *tile,
+						u32 flags)
+{
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_exec_queue *q;
+	struct xe_vm *migrate_vm;
+
+	migrate_vm = xe_migrate_get_vm(tile->migrate);
+	if (xe->info.has_usm) {
+		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
+							   XE_ENGINE_CLASS_COPY,
+							   gt->usm.reserved_bcs_instance,
+							   false);
+		u32 logical_mask = BIT(hwe->logical_instance);
+
+		if (!hwe || !logical_mask)
+			return ERR_PTR(-EINVAL);
+
+		q = xe_exec_queue_create(xe, migrate_vm, logical_mask, 1, hwe,
+					 flags, 0);
+	} else {
+		q = xe_exec_queue_create_class(xe, gt, migrate_vm,
+					       XE_ENGINE_CLASS_COPY, flags);
+	}
+	xe_vm_put(migrate_vm);
+
+	return q;
+}
+
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
@@ -418,34 +463,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
-static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-					struct drm_xe_engine_class_instance *eci,
-					u16 width, u16 num_placements)
-{
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 logical_mask = 0;
-
-	if (XE_IOCTL_DBG(xe, width != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, num_placements != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
-		return 0;
-
-	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
-
-	for_each_hw_engine(hwe, gt, id) {
-		if (xe_hw_engine_is_reserved(hwe))
-			continue;
-
-		if (hwe->class == XE_ENGINE_CLASS_COPY)
-			logical_mask |= BIT(hwe->logical_instance);
-	}
-
-	return logical_mask;
-}
-
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -507,8 +524,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
-	struct xe_vm *vm, *migrate_vm;
+	struct xe_vm *vm;
 	struct xe_gt *gt;
+	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
 	u32 id;
@@ -533,37 +551,19 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-		for_each_gt(gt, xe, id) {
-			struct xe_exec_queue *new;
-			u32 flags;
-
-			if (xe_gt_is_media_type(gt))
-				continue;
-
-			eci[0].gt_id = gt->info.id;
-			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
-								    args->width,
-								    args->num_placements);
-			if (XE_IOCTL_DBG(xe, !logical_mask))
-				return -EINVAL;
-
-			hwe = xe_hw_engine_lookup(xe, eci[0]);
-			if (XE_IOCTL_DBG(xe, !hwe))
-				return -EINVAL;
-
-			/* The migration vm doesn't hold rpm ref */
-			xe_pm_runtime_get_noresume(xe);
-
-			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
+		if (XE_IOCTL_DBG(xe, args->width != 1) ||
+		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
+		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
+			return -EINVAL;
 
-			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
-			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe, flags,
-						   args->extensions);
+		for_each_tile(tile, xe, id) {
+			struct xe_exec_queue *new;
+			u32 flags = EXEC_QUEUE_FLAG_VM;
 
-			xe_pm_runtime_put(xe); /* now held by engine */
+			if (id)
+				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
-			xe_vm_put(migrate_vm);
+			new = xe_exec_queue_create_bind(xe, tile, flags);
 			if (IS_ERR(new)) {
 				err = PTR_ERR(new);
 				if (q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ded77b0f3b90..a6bd25efa8f6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -21,6 +21,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
 						 struct xe_vm *vm,
 						 enum xe_engine_class class, u32 flags);
+struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
+						struct xe_tile *tile,
+						u32 flags);
 
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22add5167564..0cc38e9f653b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1478,19 +1478,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = tile->primary_gt;
-			struct xe_vm *migrate_vm;
 			struct xe_exec_queue *q;
 			u32 create_flags = EXEC_QUEUE_FLAG_VM;
 
 			if (!vm->pt_root[id])
 				continue;
 
-			migrate_vm = xe_migrate_get_vm(tile->migrate);
-			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
-						       XE_ENGINE_CLASS_COPY,
-						       create_flags);
-			xe_vm_put(migrate_vm);
+			q = xe_exec_queue_create_bind(xe, tile, create_flags);
 			if (IS_ERR(q)) {
 				err = PTR_ERR(q);
 				goto err_close;
-- 
2.34.1

