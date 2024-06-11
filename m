Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1481AC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239E10E683;
	Tue, 11 Jun 2024 14:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVPh/P2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2E10E680
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116832; x=1749652832;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Uz+kjsydmglCfgI6Xp9VQCTG2umBgTdJOmtuQootG54=;
 b=XVPh/P2OJj5O8YAm+KuoNUSL4FUF8l/OhJDkIA7Ibv2RZmvGRRyd9cZs
 QIMk0l3DuuuGdrmLyW7CLXUPXM4CSBMUnhSPXuqO9SaBtCEKLvbC3KPju
 46QcTAOChtQ6uPd1jChg1+c5eJhZifbL90upLKA8h0tDMurwhKOdpN2Gb
 yfFHNtrBZCGLLaM44R35YJNWMWqFk4iq5r7usHWBPYRxgHq0nWbZRk7Qi
 okNRsSUydao7GHvIG371PEedZInQBe2SquT5n7A0YTFUnQ6SEBfypgKTz
 QnxomMFb+VpjoYMR4/IAka6A1zPpTn5hdGRvH8ALyVKKBbHSvvME8RbQd w==;
X-CSE-ConnectionGUID: M6CCdYMbTF+XbDILoXXDgA==
X-CSE-MsgGUID: IyCl/UIkStOLuIvkjP5ZOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784559"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784559"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
X-CSE-ConnectionGUID: o2lKZlfCRJmFsVO91C7NEg==
X-CSE-MsgGUID: wVBowVLNS5CQ+KR444ax6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590313"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 01/11] drm/xe: Add LRC ctx timestamp support functions
Date: Tue, 11 Jun 2024 07:40:43 -0700
Message-Id: <20240611144053.2805091-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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

LRC ctx timestamp support functions are used to determine how long a job
has run on the hardware.

v2:
 - Don't use static inlines (Jani)
 - Kernel doc
 - s/ctx_timestamp_job/ctx_job_timestamp
v6:
 - Add kernel doc for xe_lrc_update_timestamp (Lucas)
 - Call xe_lrc_ctx_timestamp() in xe_lrc_update_timestamp (Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 78 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h |  5 +++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c1bb85d2e243..2ad645f49ec9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_PPHWSP_SIZE SZ_4K
 
@@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
 }
 
+static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
+{
+	/* The start seqno is stored in the driver-defined portion of PPHWSP */
+	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
+}
+
 static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 {
 	/* The parallel is stored in the driver-defined portion of PPHWSP */
@@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
 }
 
+static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
+{
+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
+}
+
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
 	/* Indirect ring state page is at the very end of LRC */
@@ -716,11 +728,65 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
 DECL_MAP_ADDR_HELPERS(seqno)
 DECL_MAP_ADDR_HELPERS(regs)
 DECL_MAP_ADDR_HELPERS(start_seqno)
+DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(parallel)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
 
 #undef DECL_MAP_ADDR_HELPERS
 
+/**
+ * xe_lrc_ctx_timestamp_ggtt_addr() - Get ctx timestamp GGTT address
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp GGTT address
+ */
+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+}
+
+/**
+ * xe_lrc_ctx_timestamp() - Read ctx timestamp value
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp value
+ */
+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+
+	map = __xe_lrc_ctx_timestamp_map(lrc);
+	return xe_map_read32(xe, &map);
+}
+
+/**
+ * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp job GGTT address
+ */
+u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
+}
+
+/**
+ * xe_lrc_ctx_job_timestamp() - Read ctx job timestamp value
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: ctx timestamp job value
+ */
+u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+
+	map = __xe_lrc_ctx_job_timestamp_map(lrc);
+	return xe_map_read32(xe, &map);
+}
+
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
 {
 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
@@ -1659,11 +1725,21 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
+/**
+ * xe_lrc_update_timestamp() - Update ctx timestamp
+ * @lrc: Pointer to the lrc.
+ * @old_ts: Old timestamp value
+ *
+ * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
+ * update saved value.
+ *
+ * Returns: New ctx timestamp value
+ */
 u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
 {
 	*old_ts = lrc->ctx_timestamp;
 
-	lrc->ctx_timestamp = xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP);
+	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 
 	return lrc->ctx_timestamp;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 882c3437ba5c..001af6c79454 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
  * @lrc: logical ring context for this exec queue
-- 
2.34.1

