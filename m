Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3157C41513
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 22:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10410E1BC;
	Fri,  7 Jun 2024 22:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLNDCP4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CD810E0AD
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717797763; x=1749333763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=POhe0PbFTrCP9srwVdI/U+2UvWZkmIFUFUW6vKAhbOI=;
 b=kLNDCP4JiWC9eKDKIVmGABn1LymZzEnfAqVnr+Hj/dodHAMLnsf4MPks
 M20ngr7QtahOVSm52crS0rEM6EPUF275+8pCpA8jJB3R4qrMIA+Sguf7+
 6/8n8o0Z7l7+n1x4TlOgYuGr0X56Ux1MZy+xd2yroLd1h2ev1wIH8wErn
 HoZbGIXv5aahwpG5qY0zV/xMthDRRIVMa52qDCByRifShKD9oSrs7hXP5
 FnW7H29Z33Kxqf+nkQbZJRFwEINP+e35Xxh9qBi70a/4Qc3WwDjLw0qP9
 a6eBMYcqLSnJxfktdaQE48jOxj9q9TNtvauN9IGftQs/F/WIB0ePQ67Wa g==;
X-CSE-ConnectionGUID: vE0XqNZUQiS1XWTds2G+Kg==
X-CSE-MsgGUID: FeK3xjeuTlq/cadKXXFBCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14657035"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14657035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:42 -0700
X-CSE-ConnectionGUID: SlnK1fXgRK2IigFSkSkZMA==
X-CSE-MsgGUID: JlnNjJxlQ6usnR/mpKnqmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38307941"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/xe: Add LRC ctx timestamp support functions
Date: Fri,  7 Jun 2024 15:03:09 -0700
Message-Id: <20240607220314.2318154-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607220314.2318154-1-matthew.brost@intel.com>
References: <20240607220314.2318154-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 66 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  5 +++
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c1bb85d2e243..0fef354c6489 100644
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
+ * xe_lrc_ctx_timestamp_addr() - Read ctx timestamp value
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
+ * xe_lrc_ctx_job_timestamp_addr() - Read ctx job timestamp value
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

