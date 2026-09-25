Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6694C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437B310FC6B;
	Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayBbUYcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0BE10FC46
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367333; x=1821903333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=259q6BBu0BFSaURgAivCBrv9DVEziuHrqs9nb2d68mY=;
 b=ayBbUYcgs99B8yf46CmXAuO5TXmW9Luy9lvgV7d5A2sa4UnMlkdaiHu6
 29uchMbaKYQmidH95d0H/st3mg2UGWfBujGuJsUE+ydg1UhYCdbHGPHs5
 +obzs+NkVtcBWxnfU6Og15ZuTD32EkjgrY48AF36jWCupaGz2ov5MLi9e
 eLCdlRC1AIiiV35a6bTdiDSageW99NSR8zjZiMoMpiqITD7QduXbUQ4uO
 PRf7p5+3cMNTaowCKtaKoYSO47IgERzkde132yvB/PK59HBqCRqxNKdqx
 bxCqQa7uoDiWKQRUV6+I/OTeo5mBx7McA3uP9FE87fPM5COhTsDJbUwtm g==;
X-CSE-ConnectionGUID: SJgFArd1QDOZYD5sXL6dyg==
X-CSE-MsgGUID: OYIux4xsS9OWHSKWPB0KLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377968"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: zclx1HLhQEuid234K08bpQ==
X-CSE-MsgGUID: 1Gk9y6bpTDCzXFqfxcHhqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509892"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 18/24] drm/xe: Add ULLS support to LRC
Date: Fri, 25 Sep 2026 13:15:20 -0700
Message-Id: <20260925201526.1355279-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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

Define memory layout for ULLS semaphores stored in LRC memory. Add
support functions to return GGTT address and set semaphore based on a
job's seqno.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 73 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h       |  4 ++
 drivers/gpu/drm/xe/xe_lrc_types.h |  4 ++
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f1cf1463f1b2..bf5c2351aed3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -706,6 +706,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
 #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
+#define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutually exclusive with parallel */
 
 #define LRC_SEQNO_OFFSET 0
 #define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
@@ -768,6 +769,12 @@ static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
 }
 
+static u32 __xe_lrc_ulls_offset(struct xe_lrc *lrc)
+{
+	/* The ulls is stored in the driver-defined portion of PPHWSP */
+	return xe_lrc_pphwsp_offset(lrc) + LRC_ULLS_PPHWSP_OFFSET;
+}
+
 static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 {
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
@@ -835,6 +842,7 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
+DECL_MAP_ADDR_HELPERS(ulls, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
 DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
 DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
@@ -1805,6 +1813,26 @@ void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
 		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
 }
 
+/**
+ * xe_lrc_ring_tail_ggtt_addr() - Saved ring tail GGTT address
+ * @lrc: Pointer to the lrc.
+ *
+ * GGTT address of the ring tail as saved for this context - in the indirect
+ * ring state on platforms which have it, otherwise in the context image.
+ * This is what a context restore loads the tail register from, so a ring
+ * which advances the tail register itself must keep this in sync.
+ *
+ * Returns: saved ring tail GGTT address
+ */
+u32 xe_lrc_ring_tail_ggtt_addr(struct xe_lrc *lrc)
+{
+	if (xe_lrc_has_indirect_ring_state(lrc))
+		return __xe_lrc_indirect_ring_ggtt_addr(lrc) +
+			INDIRECT_CTX_RING_TAIL * sizeof(u32);
+
+	return __xe_lrc_regs_ggtt_addr(lrc) + CTX_RING_TAIL * sizeof(u32);
+}
+
 u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
 {
 	if (xe_lrc_has_indirect_ring_state(lrc))
@@ -1984,6 +2012,51 @@ static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
 	return xe_map_read32(xe, &map);
 }
 
+#define semaphore_offset(seqno) \
+	(sizeof(u32) * ((seqno) % LRC_MIGRATION_ULLS_SEMAPHORE_COUNT))
+
+/**
+ * xe_lrc_ulls_semaphore_ggtt_addr() - ULLS semaphore GGTT address
+ * @lrc: Pointer to the lrc.
+ * @seqno: seqno of current job.
+ *
+ * Calculate ULLS semaphore GGTT address based on input seqno
+ *
+ * Returns: ULLS semaphore GGTT address
+ */
+u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno)
+{
+	xe_assert(lrc_to_xe(lrc), semaphore_offset(seqno) <
+		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
+
+	return __xe_lrc_ulls_ggtt_addr(lrc) + semaphore_offset(seqno);
+}
+
+/**
+ * xe_lrc_set_ulls_semaphore() - Set ULLS semaphore
+ * @lrc: Pointer to the lrc.
+ * @seqno: seqno of current job.
+ *
+ * Set ULLS semaphore based on input seqno
+ */
+void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map = __xe_lrc_ulls_map(lrc);
+
+	xe_assert(xe, semaphore_offset(seqno) <
+		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
+
+	/*
+	 * The ring contents this semaphore releases are ordered by the
+	 * xe_device_wmb() at the end of xe_lrc_write_ring().
+	 */
+	iosys_map_incr(&map, semaphore_offset(seqno));
+	xe_map_write32(xe, &map, LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL);
+
+	xe_device_wmb(xe);	/* Flush write to hardware */
+}
+
 static int instr_dw(u32 cmd_header)
 {
 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a8ff4e59a1f4..f2e829e62168 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -112,6 +112,7 @@ u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
 u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
+u32 xe_lrc_ring_tail_ggtt_addr(struct xe_lrc *lrc);
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
 u32 xe_lrc_ring_space(struct xe_lrc *lrc);
@@ -127,6 +128,9 @@ void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
 void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 					    u32 *regs);
 
+u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno);
+void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno);
+
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 53ef48feebfc..b18daf1092e6 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -12,6 +12,10 @@
 
 struct xe_bo;
 
+#define LRC_MIGRATION_ULLS_SEMAPHORE_COUNT	64	/* Must be pow2 */
+#define LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR	0
+#define LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL	1
+
 /**
  * struct xe_lrc - Logical ring context (LRC) and submission ring object
  */
-- 
2.34.1

