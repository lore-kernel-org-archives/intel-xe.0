Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A611C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FEF10E2A8;
	Wed,  3 Jan 2024 10:35:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AEC10E2A8
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704278148; x=1735814148;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D6WA94jeEAhQTCn1QbBBZqOr7Ob9r8pWPoDuqydN3us=;
 b=URNkt4YqzFgX+JCMF6tdMAob9gHbjEubJ1ASzLUdducP6xj1NsZ9M6cm
 n+wKiXdZr+3sJNwM4B8dqN8cYeoUG2CX6MxOCojSzMEcDklTljbEuntLN
 lbSce7rSJCAT6RnhGOwbnxgb/GOkJ+nAcgbN6A3GuHUbpqS+nKTjxw2P3
 NmLp9LTxKtqepgkCbWJZoXw4/W96pW6coqjg0Lw+GBlAg6GOFdnlouBdt
 jRFnSYMUytx2vRZckLyZ9UrVNWsz99kQJx4qMgF2WWrIEyvhh0MP1On+U
 kSUR7jPHKIWRExTjJF0eAmeOqFoh6KIRJEY5e+iO1gQZZLd+NzbXm7rT7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4337717"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4337717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="21747570"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orviesa002.jf.intel.com with ESMTP; 03 Jan 2024 02:35:45 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 janga.rahul.kumar@intel.com, oak.zeng@intel.com, brian.welty@intel.com,
 matthew.brost@intel.com, Zbigniew.Kempczynski@intel.com
Subject: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Date: Wed,  3 Jan 2024 15:59:59 +0530
Message-Id: <20240103102959.2385010-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Enhanced xe_bo_move trace to be more readable.
It will help to show the migration details.
Src and dst details.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c    | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_trace.h | 22 +++++++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..3fa7ca99e85b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -613,6 +613,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_resource *new_mem,
 		      struct ttm_place *hop)
 {
+	static const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
+		[XE_PL_SYSTEM] = "system",
+		[XE_PL_TT] = "gtt",
+		[XE_PL_VRAM0] = "vram0",
+		[XE_PL_VRAM1] = "vram1",
+		[4 ... 6] = NULL,
+		[XE_PL_STOLEN] = "stolen"
+	};
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_resource *old_mem = ttm_bo->resource;
@@ -713,8 +721,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
-
-	trace_xe_bo_move(bo);
+	trace_xe_bo_move(bo, mem_type_to_name[new_mem->mem_type],
+			 mem_type_to_name[old_mem_type]);
 	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..bfa7b2391378 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -100,9 +100,25 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
 	     TP_ARGS(bo)
 );
 
-DEFINE_EVENT(xe_bo, xe_bo_move,
-	     TP_PROTO(struct xe_bo *bo),
-	     TP_ARGS(bo)
+TRACE_EVENT(xe_bo_move,
+	    TP_PROTO(struct xe_bo *bo, const char *new_placement, const char *old_placement),
+	    TP_ARGS(bo, new_placement, old_placement),
+	    TP_STRUCT__entry(
+		     __field(struct xe_bo *, bo)
+		     __field(size_t, size)
+		     __array(char, new_placement, 16)
+		     __array(char, old_placement, 16)
+			),
+
+	    TP_fast_assign(
+		   __entry->bo      = bo;
+		   __entry->size = bo->size;
+		   strscpy(__entry->new_placement, new_placement, 16);
+		   strscpy(__entry->old_placement, old_placement, 16)
+		   ),
+	    TP_printk("migrate object %p [size %zu] from %s to %s",
+		      __entry->bo, __entry->size, __entry->old_placement,
+		      __entry->new_placement)
 );
 
 DECLARE_EVENT_CLASS(xe_exec_queue,
-- 
2.25.1

