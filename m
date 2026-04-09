Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A659F364BE
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AA510E869;
	Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6LHLVwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A8810E052
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767041; x=1807303041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZ7Evr4BUzP7c4TMfgEjT+ar4pInR3ai33SarVUqVIY=;
 b=G6LHLVwe+miO25rAEZI1zONBI5n6fd337tzH+6TqScAsLHMRyADSWIZW
 zxbk/1SYi6ek+8LjyYzGw+VRVHPIGBbKW8FuYDhCpgtMiam98CLZ7PPEZ
 XPD60nhQ6215rDjs3EpHwDtb1OgWlW1BNxnXQHlE/RkcKVB+6QRTGVtwE
 uBNgEKdhF+Q8Cj8Yzzh+ZHc5seGHkEUXd5uu93DHDnjUZn1GVY9kphiAV
 6LIxaxtENX5HNRdNbNfnXXYtAqIDNMBE6MlGRjZjQbCoXlVNpTfVrE1kN
 tnAlPtKqqzP2s3nGGaYNadir1LFaKclzPsLnDMvwjwBokwrWp5KrRwvvA g==;
X-CSE-ConnectionGUID: RapoJcDKTci7gwQSby8ueA==
X-CSE-MsgGUID: T2bMxkfyRiGf5DS0XHbVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692622"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: 2gvzwx/2Q/iyw6l0xwQdKA==
X-CSE-MsgGUID: CgaVMwsCTr2Bz0UF56F1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881119"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Date: Thu,  9 Apr 2026 13:37:17 -0700
Message-ID: <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
restored allowing us to view the individual queue run times. Add helpers
to read this value from the LRC.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 44 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             |  1 +
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index b5eff383902c..4ab86fc369fd 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -34,6 +34,9 @@
 #define CTX_CS_INT_VEC_REG		0x5a
 #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
 
+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9d12a0d2f0b5..be1030c74e21 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -788,6 +788,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
 }
 
+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
+{
+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
+}
+
+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
+{
+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
+}
+
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
@@ -837,6 +847,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
 DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
 
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -885,6 +897,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
 	return (u64)udw << 32 | ldw;
 }
 
+/**
+ * xe_lrc_queue_timestamp() - Read queue timestamp value
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: queue timestamp value
+ */
+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+	u32 ldw, udw = 0;
+
+	if (!xe_lrc_is_multi_queue(lrc))
+		return 0;
+
+	map = __xe_lrc_queue_timestamp_map(lrc);
+	ldw = xe_map_read32(xe, &map);
+
+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
+	udw = xe_map_read32(xe, &map);
+
+	return (u64)udw << 32 | ldw;
+}
+
 /**
  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
  * @lrc: Pointer to the lrc.
@@ -1550,6 +1586,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
 
+	if (xe_lrc_is_multi_queue(lrc)) {
+		lrc->queue_timestamp = 0;
+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
+	}
+
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
@@ -2476,6 +2518,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
+	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2529,6 +2572,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tQueue Timestamp: 0x%08x\n", snapshot->queue_timestamp);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b544c8169967..178d9519b196 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
 	u32 start_seqno;
 	u32 seqno;
 	u32 ctx_timestamp;
+	u32 queue_timestamp;
 	u32 ctx_job_timestamp;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 93972536214a..4bca394ff024 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -64,6 +64,9 @@ struct xe_lrc {
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
 	u64 ctx_timestamp;
 
+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
+	u64 queue_timestamp;
+
 	/** @multi_queue: Multi queue LRC related information */
 	struct {
 		/** @multi_queue.primary: Primary queue corresponding to this LRC */
-- 
2.43.0

