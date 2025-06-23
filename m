Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA341C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9185710E176;
	Mon, 23 Jun 2025 06:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ap1yGKZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508A210E176
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750659384; x=1782195384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QURENEeTu+i7wED/N7ktXfVDUnNG478laaP1jE1ChBc=;
 b=Ap1yGKZto6ONGTlX4WiXI6MmeuBbGiAavhfv4+WQb8ubK49+rcrIe+a3
 He5JE0QoksYiw1BaAPRGNmSzQNfnXxW6aDfahcpu785OQM6AzjIg/Hn3h
 Q1E94KmXhhM/vsAkh17wLA0i6EPR49zVmSj0Oa5TvNA4U75+iL30B1rYo
 QVPcg8JSidw+JBn3ny0ys80tKSjhNO6CXJyXp57gJEEnGYE590vbxl9hO
 tO4RMqWH3npPxkDPUeHu/pcL1dkdgQuHJPkS041hUk+38XZgAsJbwumKG
 FQdJj4K4w0AZd8lZWTPoSWOTgLAJQk4kKtSo1RCT7RAXuSwA5CRfjpPif g==;
X-CSE-ConnectionGUID: BE/TUQyUSuOu9UP171mJvA==
X-CSE-MsgGUID: iZAighqOT0u0u03+TETAfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70419991"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70419991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:16:23 -0700
X-CSE-ConnectionGUID: DYQWr3KvSUadrxw0eIWjJQ==
X-CSE-MsgGUID: sq44Rt3lThWsnFivruwWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="156041397"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 22 Jun 2025 23:16:21 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, tejas.upadhyay@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH] drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Date: Mon, 23 Jun 2025 12:10:36 +0530
Message-Id: <20250623064036.785908-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device query flag
which indicates whether a device supports DIS_NULL_QUERY (Disable null
anyhit shader query mechanism). The intent is for UMDs
to use this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag
to disable null query mechanism for anyhit shader by setting
DIS_NULL_QUERY bit of RT_CTRL register for Xe2 IP.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_query.c      | 3 ++-
 include/uapi/drm/xe_drm.h          | 8 ++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..519f36db7cd0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -26,6 +26,8 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -693,6 +695,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
+	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
+	    (eci[0].engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+	    eci[0].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)) {
+		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
+	}
+
 	q->xef = xe_file_get(xef);
 
 	/* user id alloc must always be last in ioctl to prevent UAF */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..c5002b8c9ac0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
-			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
+			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8e8bbdec8c5c..a5bfba121360 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
  *      has low latency hint support
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
  *      device has CPU address mirroring support
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if the
+ *      device has null query support for anyhit shader.
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -415,6 +417,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 << 3)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1271,6 +1274,11 @@ struct drm_xe_exec_queue_create {
 	__u32 vm_id;
 
 #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+	/*
+	 * DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag is
+	 * use to disable null query check for Anyhit shader
+	 */
+#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
 	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
-- 
2.25.1

