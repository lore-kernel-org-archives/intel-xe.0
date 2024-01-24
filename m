Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97095C48260
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 17:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AC510F783;
	Wed, 24 Jan 2024 17:00:29 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7110F7A4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 17:00:28 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Add uapi for dumpable bos, v2.
Date: Wed, 24 Jan 2024 17:52:42 +0100
Message-ID: <20240124165245.2660-1-maarten.lankhorst@linux.intel.com>
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

Changes since v1:
- Remove unrelated and erroneous chunk.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
There was a discussion on whether to include a flag to query support,
I think attempting to bind once with DUMPABLE and checking for -EINVAL
is enough to find out, adding a flag would be way too much effort.

 drivers/gpu/drm/xe/xe_vm.c | 5 +++--
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d096a8c00bd4..66b7d6124a37 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2692,12 +2692,13 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
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
2.43.0

