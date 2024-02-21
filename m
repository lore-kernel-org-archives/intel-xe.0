Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AA5C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 10:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948110E6A4;
	Wed, 21 Feb 2024 10:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bN1o7wGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D3810E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708510867; x=1740046867;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uzq6TKfkIuvtOdq58BI4ocyx4y5vIIudJq7bASMxevU=;
 b=bN1o7wGsgzJScZulaZ+UDqCC/ADiXgOWEect39AGT9uWptDfbcD6iV2D
 uznKsH7WAq/TvCuOqJcc4U5G6hAtGFT5Tug7QYS+ttAehPfBnXkR882Zk
 kve3eip2YxvbLezE0Y2a6HojCWKY0KaEIcWAELUm2oj4T95oiCdkSto6Z
 jOPvu3pUuvgkl9/DqX4XiUAKCDsIdaTrfZmwMH8u8NQeNCaVo1aiTewLQ
 a+ol7Vhjl3bX+BisGreSTurp8PAcglkViS4fuS52rPTzYDgocTJgBCOs/
 IBkVRO+ZQJemtG2q5KkU4Oec6jpqXlu4qJsTnaM1fT5RGyhQwSRxtql1o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2534529"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2534529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="28238271"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2024 02:20:28 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move
 trace
Date: Wed, 21 Feb 2024 15:49:50 +0530
Message-Id: <20240221101950.1019312-1-priyanka.dandamudi@intel.com>
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

Add move_lacks_source detail to xe_bo_move trace to make it readable
that is to check if it is migrate clear or migrate copy.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c    |  2 +-
 drivers/gpu/drm/xe/xe_trace.h | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 76dfaf1cd200..6603a0ea79c5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -736,7 +736,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
-	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
+	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
 	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 0cce98a6b14b..485d1ecacc36 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -102,14 +102,16 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
 );
 
 TRACE_EVENT(xe_bo_move,
-	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement),
-	    TP_ARGS(bo, new_placement, old_placement),
+	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
+		     bool move_lacks_source),
+	    TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
 	    TP_STRUCT__entry(
 		     __field(struct xe_bo *, bo)
 		     __field(size_t, size)
 		     __field(u32, new_placement)
 		     __field(u32, old_placement)
 		     __array(char, device_id, 12)
+		     __field(bool, move_lacks_source)
 			),
 
 	    TP_fast_assign(
@@ -118,9 +120,11 @@ TRACE_EVENT(xe_bo_move,
 		   __entry->new_placement = new_placement;
 		   __entry->old_placement = old_placement;
 		   strscpy(__entry->device_id, dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
+		   __entry->move_lacks_source = move_lacks_source;
 		   ),
-	    TP_printk("migrate object %p [size %zu] from %s to %s device_id:%s",
-		      __entry->bo, __entry->size, xe_mem_type_to_name[__entry->old_placement],
+	    TP_printk("move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s",
+		      __entry->move_lacks_source ? "yes" : "no", __entry->bo, __entry->size,
+		      xe_mem_type_to_name[__entry->old_placement],
 		      xe_mem_type_to_name[__entry->new_placement], __entry->device_id)
 );
 
-- 
2.25.1

