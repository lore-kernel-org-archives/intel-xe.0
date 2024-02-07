Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9544C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 04:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A41130DE;
	Wed,  7 Feb 2024 04:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkz7Rrfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE371130DE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707279766; x=1738815766;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZXBS4MBMvbnAO81Z+vp+L/Dwe0lLvmHgXvz09XlxHY=;
 b=Dkz7Rrfajwp4hjq72/fNlNIVC4GaDDxd1bJ6P6Qe5Aw2zAEnj9X2vRfj
 hSjxO16Pwi/XW2yQT8WLFcrzMScEvufkHYRbVK6s+YK2ADTave8+6RQM5
 lrOegBQ/Hlim33eoHUtsW01oiN/E1jj7GwaT4ufNudcj+fpeWNaGd4BNN
 iCw9tIAszlYXIEA8QfbExbrZLwZGM/3VBXs3IaAXVJLFdpbaiJQH6/8+p
 nqect1EInQc+arUhrsKizlR4RAKkTk7ljxJhbRg7Y10SlerFiA1O8rIFm
 QMYT37bjBnbOP+XDoDIAwUC5FZUVYsY4CNzguha/E3z6Ebn6WZcPLonJx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4776419"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4776419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 20:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="32042210"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orviesa002.jf.intel.com with ESMTP; 06 Feb 2024 20:22:43 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Date: Wed,  7 Feb 2024 09:52:37 +0530
Message-Id: <20240207042237.146881-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Enhanced xe_bo_move trace to be more readable.
It will help to show the migration details.
Src and dst details.

v2: Modify trace_xe_bo_move(), it takes the integer mem_type
rather than a string.
Make mem_type_to_name() extern, it will be used by trace.(Thomas)

v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)

v4: Add device details to reduce ambiquity related to vram0/vram1. (Oak)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 11 +++++++++--
 drivers/gpu/drm/xe/xe_bo.h         |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c |  8 --------
 drivers/gpu/drm/xe/xe_trace.h      | 27 +++++++++++++++++++++++----
 4 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 686d716c5581..fd8d87a514eb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -28,6 +28,14 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 
+const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
+	[XE_PL_SYSTEM] = "system",
+	[XE_PL_TT] = "gtt",
+	[XE_PL_VRAM0] = "vram0",
+	[XE_PL_VRAM1] = "vram1",
+	[XE_PL_STOLEN] = "stolen"
+};
+
 static const struct ttm_place sys_placement_flags = {
 	.fpfn = 0,
 	.lpfn = 0,
@@ -727,8 +735,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
-
-	trace_xe_bo_move(bo);
+	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
 	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index db4b2db6b073..49f771bf04c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -244,6 +244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
 
 extern const struct ttm_device_funcs xe_ttm_funcs;
+extern const char *const mem_type_to_name[];
 
 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 82d1305e831f..1ac14c910491 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -131,14 +131,6 @@ static void bo_meminfo(struct xe_bo *bo,
 
 static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 {
-	static const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
-		[XE_PL_SYSTEM] = "system",
-		[XE_PL_TT] = "gtt",
-		[XE_PL_VRAM0] = "vram0",
-		[XE_PL_VRAM1] = "vram1",
-		[4 ... 6] = NULL,
-		[XE_PL_STOLEN] = "stolen"
-	};
 	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
 	struct xe_file *xef = file->driver_priv;
 	struct ttm_device *bdev = &xef->xe->ttm;
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e4e7262191ad..ec0c2bec494c 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
@@ -31,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (unsigned long)fence;
+			   __entry->fence = (u64)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
@@ -100,9 +101,27 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
 	     TP_ARGS(bo)
 );
 
-DEFINE_EVENT(xe_bo, xe_bo_move,
-	     TP_PROTO(struct xe_bo *bo),
-	     TP_ARGS(bo)
+TRACE_EVENT(xe_bo_move,
+	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement),
+	    TP_ARGS(bo, new_placement, old_placement),
+	    TP_STRUCT__entry(
+		     __field(struct xe_bo *, bo)
+		     __field(size_t, size)
+		     __field(u32, new_placement)
+		     __field(u32, old_placement)
+		     __array(char, device_id, 12)
+			),
+
+	    TP_fast_assign(
+		   __entry->bo      = bo;
+		   __entry->size = bo->size;
+		   __entry->new_placement = new_placement;
+		   __entry->old_placement = old_placement;
+		   strscpy(__entry->device_id, dev_name(ttm_to_xe_device(__entry->bo->ttm.bdev)->drm.dev), 12);
+		   ),
+	    TP_printk("migrate object %p [size %zu] from %s to %s device_id:%s",
+		      __entry->bo, __entry->size, mem_type_to_name[__entry->old_placement],
+		      mem_type_to_name[__entry->new_placement], __entry->device_id)
 );
 
 DECLARE_EVENT_CLASS(xe_exec_queue,
-- 
2.25.1

