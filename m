Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D454CC7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 09:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7958210E00F;
	Wed, 25 Jun 2025 09:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNruYhlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568FD10E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750844043; x=1782380043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q4r7mQtqiLMzRFTclYRBuvZUzqSA2d38MFfWmBx4vu0=;
 b=kNruYhlA/DJPT9zqHIgHcM+jjheu7Loywl8ai3S8htNDE8uXPA8XPqfY
 vrzdci6OL0GjY1Gfvotr1gosX/KumJzIvdmhxYDahI5TPwQVivRmAPscv
 QQ8Ov1QhJm+E7mZikPINOdWtn2cTfe4yGQwI7N5L3XRKYOX40vePVY6fe
 52NVoIgeISqypIqe7nvPU54j54lnDbtL4mdm0GXQ1JukOr93Ay/Pw9L/4
 BiHllKDzgrku5odpTP8AFSXtqJpw/uraI4/vA3tyqtI45hv+wkJP9fGN3
 3ON7fq/hm5Lw3YyhhOobDczXws3Nw5UI7jen9tldwNuR7SkQPfJRNK4Zf w==;
X-CSE-ConnectionGUID: 7EwBY4WZQhmaf2doDFqdDA==
X-CSE-MsgGUID: uscmlgwpT7e5iIE1a6m/cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40726296"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="40726296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:33:55 -0700
X-CSE-ConnectionGUID: H+GWO1sXS4Ga1uwVgbEuyQ==
X-CSE-MsgGUID: wnKbag9NSY6mM6T9dblDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151583324"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by orviesa010.jf.intel.com with ESMTP; 25 Jun 2025 02:33:50 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com,
	tejas.upadhyay@intel.com
Cc: intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, himal.prasad.ghimiray@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH] drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Date: Wed, 25 Jun 2025 15:28:05 +0530
Message-Id: <20250625095805.1390907-1-nitin.r.gote@intel.com>
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
DIS_NULL_QUERY bit of RT_CTRL register for Xe2.

v2:
   - Use xe_rtp_match_first_render_or_compute() api to check
     render_or_compute. (Tejas)
   - Validate args->flags (Tejas/Matthew)
   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_query.c      |  3 ++-
 include/uapi/drm/xe_drm.h          | 12 ++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..ef8b49d2242a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -26,6 +26,9 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_rtp.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
+	if (XE_IOCTL_DBG(xe, args->flags &
+	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
+	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
+	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
+		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
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
index 8e8bbdec8c5c..7c30e707346c 100644
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
@@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
+	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
+	 *	Flag is set if the device has low latency hint support
+	 */
 #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+
+	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
+	 *	flag is use to disable null query check for Anyhit shader
+	 */
+#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
+
 	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
-- 
2.25.1

