Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0288CD342F
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DF510E571;
	Sat,  2 May 2026 00:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGYyJcA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707BD10E245
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCVdNU9xOQKNV2nThVjzldrAtu3Vn96XG36Re45G/Dc=;
 b=PGYyJcA4xoCZkdmHV7nWPSGj64rwER1Usmz8Rtloao2g0hAAmPxq+8rq
 2JYx/VS4FHpQSPCQTyvfqhvKO7QAtRK/KAReBO+2zuxSarWJVp0twjDoI
 LcvCSaQqNBvOgkWh2koWrnQMz1L4eK7aUNIKZmS10xrg0UkcoCU2HK84T
 R934J4HhqysvtZyiAzXsxQP42TNU3XYGa3qUazCFt0qMM9rBv1fVbqqwO
 41rzXZw3ePc/scm1uMOLgHYd4JpA0DHS59AvRVv8ot/ftRbu7Gd7vDSCL
 8LrpDcSYP8vUT8dbzyjwHUrnwCqGEHPkPi2Y+m96mLDOExKdFyMimZ/as w==;
X-CSE-ConnectionGUID: fRJuSq9lT5CPtbe9sWdvCg==
X-CSE-MsgGUID: +zcXNOQ4QZ2kiExWihjStg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841559"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: gob51/W4QaWwxERUc04TGg==
X-CSE-MsgGUID: jwRqVMg8TnCHftD+QFQeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510947"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 4/9] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Date: Fri,  1 May 2026 17:53:37 -0700
Message-ID: <20260502005332.3135977-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

BSpec: 73988

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: (Matt)
- Add BSpec reference
- Make queue_timestamp snapshot 64 bit
- Add a snapshot of queue timestamp in ms
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 47 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
 4 files changed, 55 insertions(+)

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
index d85c712d106b..2ee52efb9219 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -789,6 +789,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
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
@@ -838,6 +848,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
 DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
 
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -886,6 +898,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
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
@@ -1551,6 +1587,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
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
 
@@ -2479,6 +2521,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_timestamp_ms =
 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
+	snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
+	snapshot->queue_timestamp_ms =
+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_queue_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2533,6 +2578,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 3d0bf4a7bfa0..12d08808ac75 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -38,8 +38,10 @@ struct xe_lrc_snapshot {
 	u32 start_seqno;
 	u32 seqno;
 	u64 ctx_timestamp;
+	u64 queue_timestamp;
 	u32 ctx_job_timestamp;
 	u64 ctx_timestamp_ms;
+	u64 queue_timestamp_ms;
 };
 
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 0a5c13ec2ad7..53ef48feebfc 100644
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
 		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
-- 
2.43.0

