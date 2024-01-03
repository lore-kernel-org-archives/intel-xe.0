Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BA9C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 12:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362D710E28D;
	Wed,  3 Jan 2024 12:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB6410E28D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704285856; x=1735821856;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+s2ctdUOfL8c07zZ1CZa7xd46qP3DwQPgvM9scGxIxc=;
 b=DjeIurz6ZQEZcF3m9i8RGq9tcbjQ3QB+Oc1NRkcuenZZPEYO3nbWY7je
 ItSI9Ckw6CNwy70jiiQrRfdJPwJ+zmpcNvG1SVpaRkRNEYBkOzEusACdP
 RlsKXVToFRm+wp5dVt5NmIyZHQT8iHsNDEuj5Ask5kxWXwkPo1edtWY31
 KXra+zgjYKIPZqQ45o09GbvlhiqrsCDwlHV++yXuUT8dPMOPxQ9gF4TFQ
 NyuymqVcm7YUAyhamrfUmuHR+oFevV4AuguxB4dJ8x1uGtk/GIZ+SQinU
 BiaQBxqAsXzLegJKsmuor3gQkS8ZpLhg/QUwfnxASu08mWv1yfO8l05LR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="399775185"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="399775185"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 04:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="845864755"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="845864755"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2024 04:44:11 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, zbigniew.kempczynski@intel.com,
 oak.zeng@intel.com, brian.welty@intel.com
Subject: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Date: Wed,  3 Jan 2024 18:08:26 +0530
Message-Id: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  3 +--
 drivers/gpu/drm/xe/xe_drm_client.c | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_drm_client.h |  2 ++
 drivers/gpu/drm/xe/xe_trace.h      | 24 +++++++++++++++++++++---
 4 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..f7075fd86547 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -713,8 +713,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
-
-	trace_xe_bo_move(bo);
+	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
 	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 82d1305e831f..e845b7f22e38 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -15,6 +15,14 @@
 #include "xe_drm_client.h"
 #include "xe_trace.h"
 
+const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
+	[XE_PL_SYSTEM] = "system",
+	[XE_PL_TT] = "gtt",
+	[XE_PL_VRAM0] = "vram0",
+	[XE_PL_VRAM1] = "vram1",
+	[XE_PL_STOLEN] = "stolen"
+};
+
 /**
  * xe_drm_client_alloc() - Allocate drm client
  * @void: No arg
@@ -131,14 +139,6 @@ static void bo_meminfo(struct xe_bo *bo,
 
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
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index a9649aa36011..4e33d0981b6a 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -13,6 +13,8 @@
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 
+extern const char *const mem_type_to_name[];
+
 struct drm_file;
 struct drm_printer;
 struct xe_bo;
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..196d277795a0 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 
 #include "xe_bo_types.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
 #include "xe_gt_tlb_invalidation_types.h"
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

