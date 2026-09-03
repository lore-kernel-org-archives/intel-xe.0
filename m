Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B413C79F86
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60B010F7FE;
	Thu,  3 Sep 2026 23:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fml54I25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E7D10ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zbarbtk0MHe4vPs/1Ts3Zgn9KUe9thz5/jPFZ/L31dw=;
 b=Fml54I25k9R9AIpxwwyeI6TCJ32KQsSoQ4LdVWpG+o/QW0GqJOwX72VY
 Bk8KIz0v6AXRmibw8haSaHmNUPcIWFXNURaUr7mFexLz2cxSnwIMud9vz
 clU/8+RapO+wJsOG5XR2zw4HQZa0lkcFS7+VJkEs56FHMhn94iaxwWt4b
 iU6xGYdMQzIgpTLlTus+6OFe+eqDjJJr4bocUGfMkXj4QgMYvBsJGY8Vc
 foVD66hg7TI/UIbvB+E2n0hWNQuEv63Lymm34s6NMt+wR29IuyyzA67cC
 7UUi07i62WlqAjtyVMo6iZaZDztL78lI858n1dPr6Ud6AOJsgevy+u3RJ g==;
X-CSE-ConnectionGUID: /fRYUDSPRSWmHVW46lvNxQ==
X-CSE-MsgGUID: VqtrYOQfQrat9xaOnjz+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637818"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: We4yoGPJTLm90f8gJfDJUg==
X-CSE-MsgGUID: 6BkLUvwRSQq24RUXRRPuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029061"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 19/25] drm/xe: Add ULLS support to LRC
Date: Thu,  3 Sep 2026 16:58:36 -0700
Message-Id: <20260903235842.3401722-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-20-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 51 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h       |  3 ++
 drivers/gpu/drm/xe/xe_lrc_types.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 25fe9dbc9141..a1a256a3932f 100644
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
@@ -1984,6 +1992,49 @@ static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
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
+	xe_device_wmb(xe);	/* Ensure everything before in code is ordered */
+
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
index 7be5e3da8bc8..c13e03807c2d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -127,6 +127,9 @@ void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
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

