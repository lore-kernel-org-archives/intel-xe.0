Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F8CDB483
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 15:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDAD10E191;
	Fri, 13 Oct 2023 15:21:49 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836B710E191
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 15:21:47 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:21:39 +0200
Message-Id: <20231013152142.52869-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Add uapi for dumpable bos
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

Add XE_GEM_CREATE_FLAG_DUMPABLE for use with VM_BIND.

After this, we can use the flag XE_VM_BIND_FLAG_DUMPABLE to notify
devcoredump that this mapping should be dumped.

This is not hooked up, but the uapi should be ready before merging.

It's likely easier to dump the contents of the bo's at devcoredump
readout time, so it's better if the bos will stay unmodified after
a hang. The NEEDS_CPU_MAPPING flag is removed as requirement.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c |  4 ++++
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++++++++++---
 include/uapi/drm/xe_drm.h  | 25 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..1df606fe97a7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1776,6 +1776,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
 			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+			   XE_GEM_CREATE_FLAG_DUMPABLE |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1810,6 +1811,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	if (args->flags & XE_GEM_CREATE_FLAG_DUMPABLE)
+		bo_flags |= XE_BO_DUMPABLE;
+
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 78da28f4ea13..9714b53715b1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -35,6 +35,7 @@
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
+#define XE_BO_DUMPABLE			BIT(14)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d25dfa402267..6eab1a478ed5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3189,11 +3189,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
 	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
-	 XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_NULL | XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
-	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
+	 XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 
@@ -3430,8 +3431,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
 
-		if (!obj)
+		if (!obj) {
+			if (XE_IOCTL_DBG(xe, bind_ops[i].op & XE_VM_BIND_FLAG_DUMPABLE)) {
+				err = -EINVAL;
+				goto put_obj;
+			}
 			continue;
+		}
 
 		gem_obj = drm_gem_object_lookup(file, obj);
 		if (XE_IOCTL_DBG(xe, !gem_obj)) {
@@ -3456,6 +3462,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				goto put_obj;
 			}
 		}
+		if (bind_ops[i].op & XE_VM_BIND_FLAG_DUMPABLE &&
+		    XE_IOCTL_DBG(xe, !(bos[i]->flags & XE_BO_DUMPABLE))) {
+			err = -EINVAL;
+			goto put_obj;
+		}
 	}
 
 	if (args->num_syncs) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..dc96f7297edb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -433,6 +433,20 @@ struct drm_xe_gem_create {
  * objects, otherwise an error is thrown on small-bar systems.
  */
 #define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
+
+/*
+ * This bo is mapped into a vm with dumpable flag set, and as such needs to
+ * be specially marked as dumpable so the kernel can map it as required.
+ *
+ * For bo's that reside in VRAM, you need XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.
+ *
+ * NOTE: devcoredump is not creating a copy of each bo currently, and there is
+ * no guarantee that future devcoredump support won't simply take a ref on the
+ * bo as it makes lifetime tracking easier.
+ * It's advised after an engine is banned to create a new copy of each BO that
+ * is created with the dumpable flag.
+ */
+#define XE_GEM_CREATE_FLAG_DUMPABLE		(0x1 << 27)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
@@ -626,6 +640,17 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+
+	/*
+	 * This flag is used to notify that the VM binding should be dumped
+	 * when a devcoredump is created.
+	 *
+	 * The BO should be mappable, so the BO needs to be created with
+	 * XE_GEM_CREATE_FLAG_DUMPABLE, and possibly with
+	 * XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.
+	 * See the NOTE there for more informations.
+	 */
+#define XE_VM_BIND_FLAG_DUMPABLE	(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
-- 
2.40.1

