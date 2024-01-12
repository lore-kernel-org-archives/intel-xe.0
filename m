Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E163C47422
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 12:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAF110EAD9;
	Fri, 12 Jan 2024 12:41:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4310210EAF8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 12:41:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Date: Fri, 12 Jan 2024 13:41:45 +0100
Message-Id: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

Add the flag XE_VM_BIND_FLAG_DUMPABLE to notify devcoredump that this
mapping should be dumped.

This is not hooked up, but the uapi should be ready before merging.

It's likely easier to dump the contents of the bo's at devcoredump
readout time, so it's better if the bos will stay unmodified after
a hang. The NEEDS_CPU_MAPPING flag is removed as requirement.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++-----
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a7e7a0b24099..0a3b9c0ad772 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2687,12 +2687,13 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
-	 0xffff)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
@@ -2919,9 +2920,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u16 pat_index = bind_ops[i].pat_index;
 		u16 coh_mode;
 
-		if (!obj)
-			continue;
-
 		gem_obj = drm_gem_object_lookup(file, obj);
 		if (XE_IOCTL_DBG(xe, !gem_obj)) {
 			err = -ENOENT;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..0f975f57f3e5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -930,6 +930,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.40.1

