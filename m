Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D3EC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 14:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6A10E741;
	Tue, 13 Feb 2024 14:52:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A6210E6C4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 14:52:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 1/4] drm/xe: Add uapi for dumpable bos
Date: Tue, 13 Feb 2024 15:52:36 +0100
Message-ID: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda8..488e751a4ea05 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2716,7 +2716,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 #define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9c..0f975f57f3e59 100644
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
2.43.0

