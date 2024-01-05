Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779B3C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 05:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2553110E0E8;
	Fri,  5 Jan 2024 05:30:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635210E0FA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704432612; x=1735968612;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xpk6hWdRkdgrcpaIw4U4FpwxDR9+i30Qd96TxsbXpZc=;
 b=Cu1F2mSb88qma1v8INMUqtg5kiAfSGsT8dyxlj+IQBSAKoNU4PAbzUk4
 yHPpMWI7SBGh9zTBr4SXHhCEnW9YTeJlkW56dguchNiBXPCn+kInKJWL7
 lmNGSCMV5oMcgiFr1NK4kCNQgbH/ScmB6lp4ba05JvnixgqTvIs5sOelR
 3wH/prpRIK/7As+g7Q/+wIOFXfECucS1D+xT9c17Exd47JfgvsX0Ql5NI
 kti3uvPaK1PnIOc5QqR628WbK1dZKx4lHbHUYDXXI5NwN0qxAhJ0qIwc8
 XHZQ/wnbuHzConUzXoljN/BOknFJAlrSpeiwrqQHzrHZspjPT0WdHRyOv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="377588363"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="377588363"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 21:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784113750"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784113750"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2024 21:30:08 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, zbigniew.kempczynski@intel.com,
 oak.zeng@intel.com, brian.welty@intel.com, matthew.brost@intel.com
Subject: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Date: Fri,  5 Jan 2024 10:54:20 +0530
Message-Id: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 11 +++++++++--
 drivers/gpu/drm/xe/xe_bo.h         |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c |  8 --------
 drivers/gpu/drm/xe/xe_trace.h      | 24 +++++++++++++++++++++---
 4 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..1154d8f7b3b1 100644
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
@@ -713,8 +721,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
-
-	trace_xe_bo_move(bo);
+	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
 	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 97b32528c600..bf77bf17e519 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -244,6 +244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
 
 extern struct ttm_device_funcs xe_ttm_funcs;
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
index 95163c303f3e..c66a91df7d8b 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
@@ -100,9 +101,26 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
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
+			),
+
+	    TP_fast_assign(
+		   __entry->bo      = bo;
+		   __entry->size = bo->size;
+		   __entry->new_placement = new_placement;
+		   __entry->old_placement = old_placement;
+
+		   ),
+	    TP_printk("migrate object %p [size %zu] from %s to %s",
+		      __entry->bo, __entry->size, mem_type_to_name[__entry->old_placement],
+		      mem_type_to_name[__entry->new_placement])
 );
 
 DECLARE_EVENT_CLASS(xe_exec_queue,
-- 
2.25.1

