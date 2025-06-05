Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5CDC5B552
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DF210E98A;
	Thu,  5 Jun 2025 15:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQiqFNie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7010E933
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lfFsQCS3hzSDV2j+RkEzSz6aaVTVGQcu52Icus2nKFc=;
 b=GQiqFNie1HMFc7yrIXIprHCYWidnF2rrc91aYNsdT1kZ5THqShfraWW7
 27h98G4IPfqWz6YLWOa453K9RuPXgPJBwje1zZr3GFbwE/POSjc0JF/jo
 75LOrLKx4oZVVehItbhx0eLwTl+wZxYZ1M//C8N+Y3aeNTe48uu4TUw70
 bAgjVvRxfGEXI1r2XunBlcNpESBapk4hjcHzvFuzUXJX6Hrog4pXOXFaJ
 DCbpetajfLC0Sjpl58Zn1nH271Dyib2gHowBpjF4RMKYD3USfcOTuONBg
 HYS2BoQkR5kUxnLVOPlkPtFpRb5BnoQd5ppmls59V7/5Ox7WQyRXu4/LR Q==;
X-CSE-ConnectionGUID: lFzPNTstRI6roBqom0ZKCg==
X-CSE-MsgGUID: 8tBG/wlvQ6Sy0o8MAJ7LyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529490"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529490"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: i2GPAcu6TLe617Bp7KKxRQ==
X-CSE-MsgGUID: LL5hkrJTQkaFOkT1vVGG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502810"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 07/15] drm/xe: Add ULLS support to LRC
Date: Thu,  5 Jun 2025 08:32:15 -0700
Message-Id: <20250605153223.2789122-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c       | 51 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h       |  3 ++
 drivers/gpu/drm/xe/xe_lrc_types.h |  2 ++
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..b93c3eabca06 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -78,5 +78,6 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 63d74e27f54c..75344b89fe4a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -654,8 +654,9 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_ENGINE_ID_PPHWSP_OFFSET 1984
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
-#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
+#define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutual exclusive with parallel */
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {
@@ -704,6 +705,12 @@ static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
 }
 
+static inline u32 __xe_lrc_ulls_offset(struct xe_lrc *lrc)
+{
+	/* The ulls is stored in the driver-defined portion of PPHWSP */
+	return xe_lrc_pphwsp_offset(lrc) + LRC_ULLS_PPHWSP_OFFSET;
+}
+
 static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 {
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
@@ -743,6 +750,7 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
 DECL_MAP_ADDR_HELPERS(parallel)
+DECL_MAP_ADDR_HELPERS(ulls)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
 DECL_MAP_ADDR_HELPERS(engine_id)
 
@@ -1361,6 +1369,47 @@ static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
 	return xe_map_read32(xe, &map);
 }
 
+#define semaphore_offset(seqno) \
+	(sizeof(u32) * ((seqno) % LRC_MIGRATION_ULLS_SEMAPORE_COUNT))
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
+	xe_map_write32(xe, &map, 1);
+}
+
 static int instr_dw(u32 cmd_header)
 {
 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eb6e8de8c939..1ded2de34eb2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,9 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 
+u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno);
+void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno);
+
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index ae24cf6f8dd9..96a0f545ba60 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -12,6 +12,8 @@
 
 struct xe_bo;
 
+#define LRC_MIGRATION_ULLS_SEMAPORE_COUNT	64	/* Must be pow2 */
+
 /**
  * struct xe_lrc - Logical ring context (LRC) and submission ring object
  */
-- 
2.34.1

