Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD321C3ABB6
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 22:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D7110E5A3;
	Mon,  5 May 2025 22:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXYV2jor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BAE10E5A0
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746485931; x=1778021931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=866HCUHrGdSoLO5qDzX58yoK+ISpGVv/i7UjEJa7eMw=;
 b=HXYV2jorQyy79tk6ZKMliaEqiX6NZW+VJbd1dpWlnvhaDXN9MkknJxKO
 bvUYBR+RKEYz+t/REDQ65C7DrSXUK46V2Xwah608FcUF+4MFcO8vVuwWa
 +cGu++TOIDWXktEXEMG4a9W1K6JEPI6orXwbpoX1LyIcGqJvOW3o1W8RK
 oRVvWpCCaSarKWojTyGI00bkZ5JXw2j/5rXYSJUsNVvwmBwqV72bdNBvL
 PupyH4yAJqXY/qmVVnz0zxqmwfWq8mj1gon+ZXiv5a6df3sPiFQyvT2Or
 YKu18oH06gboJaSjMio9lxY8RgXDUoXcLzmv1Tn7ucV2UhaJHawdbyV6G w==;
X-CSE-ConnectionGUID: faIVdpWOTEGx2xbvrXSxng==
X-CSE-MsgGUID: tTS4WGfZRLq8jy75As2ftw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35740156"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="35740156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:51 -0700
X-CSE-ConnectionGUID: cleARA/rRG+PRcatHwLPhA==
X-CSE-MsgGUID: lGx9rtbtTJOVG477htqRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="166467824"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH v3 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Date: Mon,  5 May 2025 15:58:55 -0700
Message-ID: <20250505225852.1994431-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
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

Where available, add support for 64-bit CTX timestamp when calculating
job run time.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++---
 drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
 6 files changed, 84 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index da713634d6a0..52f4c96c01dc 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -154,6 +154,7 @@
 #define   STOP_RING				REG_BIT(8)
 
 #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
+#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
 #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
 
 #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 57944f90bbf6..8619244b7c7b 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -12,6 +12,7 @@
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
 #define CTX_TIMESTAMP			(0x22 + 1)
+#define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 813c3c0bb250..fb07bbe00e94 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 
 static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
-	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
-	u32 ctx_timestamp, ctx_job_timestamp;
-	u32 timeout_ms = q->sched_props.job_timeout_ms;
-	u32 diff;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	u64 ctx_timestamp, ctx_job_timestamp;
+	u64 timeout_ms = q->sched_props.job_timeout_ms;
+	u64 diff, max = U32_MAX;
 	u64 running_time_ms;
 
 	if (!xe_sched_job_started(job)) {
@@ -952,6 +954,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 
 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
+	if (GRAPHICS_VER(xe) >= 20)
+		max = U64_MAX;
 
 	/*
 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
@@ -960,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
 
 	if (ctx_timestamp < ctx_job_timestamp)
-		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
+		diff = ctx_timestamp + max - ctx_job_timestamp;
 	else
 		diff = ctx_timestamp - ctx_job_timestamp;
 
@@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
 
 	xe_gt_dbg(gt,
-		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
+		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 		  q->guc->id, running_time_ms, timeout_ms, diff);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9d9be9383207..ae6926dc900e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
@@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
 }
 
+static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
+{
+	/* This is stored in the driver-defined portion of PPHWSP */
+	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
+}
+
 static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 {
 	/* The parallel is stored in the driver-defined portion of PPHWSP */
@@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
 }
 
+static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
+{
+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
+}
+
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
 	/* Indirect ring state page is at the very end of LRC */
@@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
 DECL_MAP_ADDR_HELPERS(regs)
 DECL_MAP_ADDR_HELPERS(start_seqno)
 DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
+DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
 DECL_MAP_ADDR_HELPERS(parallel)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
 
@@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 }
 
+/**
+ * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp udw GGTT address
+ */
+u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
+}
+
 /**
  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
  * @lrc: Pointer to the lrc.
  *
  * Returns: ctx timestamp value
  */
-u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
+u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	struct iosys_map map;
+	u32 ldw, udw = 0;
 
 	map = __xe_lrc_ctx_timestamp_map(lrc);
-	return xe_map_read32(xe, &map);
+	ldw = xe_map_read32(xe, &map);
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
+		udw = xe_map_read32(xe, &map);
+	}
+
+	return (u64)udw << 32 | ldw;
 }
 
 /**
@@ -771,19 +804,38 @@ u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
 	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 }
 
+/**
+ * xe_lrc_ctx_job_timestamp_udw_ggtt_addr() - Get ctx job timestamp udw GGTT address
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp job udw GGTT address
+ */
+u32 xe_lrc_ctx_job_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_job_timestamp_udw_ggtt_addr(lrc);
+}
+
 /**
  * xe_lrc_ctx_job_timestamp() - Read ctx job timestamp value
  * @lrc: Pointer to the lrc.
  *
  * Returns: ctx timestamp job value
  */
-u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
+u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	struct iosys_map map;
+	u32 ldw, udw = 0;
 
 	map = __xe_lrc_ctx_job_timestamp_map(lrc);
-	return xe_map_read32(xe, &map);
+	ldw = xe_map_read32(xe, &map);
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		map = __xe_lrc_ctx_job_timestamp_udw_map(lrc);
+		udw = xe_map_read32(xe, &map);
+	}
+
+	return (u64)udw << 32 | ldw;
 }
 
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
@@ -1749,8 +1801,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
-	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
-	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
+	drm_printf(p, "\tTimestamp: 0x%llx\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tJob Timestamp: 0x%llx\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 0b40f349ab95..513093c2b5d6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -35,8 +35,8 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
-	u32 ctx_timestamp;
-	u32 ctx_job_timestamp;
+	u64 ctx_timestamp;
+	u64 ctx_job_timestamp;
 };
 
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
@@ -120,9 +120,11 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
 u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
-u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
+u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
-u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_job_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
+u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
 
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc1689db4cd7..f2381cdee30e 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -239,6 +239,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
 
+	if (GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) {
+		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
+			  MI_SRM_ADD_CS_OFFSET;
+		dw[i++] = RING_CTX_TIMESTAMP_UDW(0).addr;
+		dw[i++] = xe_lrc_ctx_job_timestamp_udw_ggtt_addr(lrc);
+		dw[i++] = 0;
+	}
+
 	return i;
 }
 
-- 
2.43.0

