Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD633CD3442
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650B510EC62;
	Tue,  5 May 2026 23:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUZthFgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3AD10E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ycpxe+pir3kk2IHp0tLnLvR94N5d4/2pAX2mOkJra0Q=;
 b=LUZthFgDkCHX9btuZsHt90h5UPmjfj8Atq2ZFVIPsrYMAW3kRWy8Ln1W
 2406Wv2fAUzn3AIkxCgWSUdRlj5C+T1U3i2gsdnhoCELOIAEmgNrSD6K+
 qk7Zk3PgqrLMtNntrs8XhjKhYK/202lvLGyv8mKHcsFtqMJtAXCZsT5it
 Pa1YUxEQf4214YDAwWT2+2PCBaxymmX8ID+fgb5yJlWe1fqw3hD3Yuy1P
 lzaI9cnt67w0X+8lPldRx+cx8TS/KeeGcJ/JhR13eBvwhdLN5pSjzysAb
 HiIXzBiDFsIr6vXxuJIaZq0H4dMFMAiTCVACVvJ1HzFkGbUJ22d8Wfi+I w==;
X-CSE-ConnectionGUID: TJMUVAfRSWOQnScvYFaZqg==
X-CSE-MsgGUID: gM2+wS/xTpiGd5R679MJvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771097"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
X-CSE-ConnectionGUID: vEOuk9q7TACSHqKKpx3XVQ==
X-CSE-MsgGUID: vnE06DrwQgmj1O8yqvMoQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569047"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 06/11] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Date: Tue,  5 May 2026 16:44:15 -0700
Message-ID: <20260505234408.3552147-19-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

v3:
- Replace xe_lrc_is_multi_queue check in lrc init (Niranajana)
- Use assert instead of check in xe_lrc_queue_timestamp
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
 4 files changed, 54 insertions(+)

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
index 3b6990d68a5a..127a2ebc3679 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -777,6 +777,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
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
@@ -826,6 +836,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
 DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
 
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -874,6 +886,29 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
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
+	xe_assert(xe, xe_lrc_is_multi_queue(lrc));
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
@@ -1538,6 +1573,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
 
+	if (xe_gt_hwe_class_supports_multi_queue(gt, hwe->class)) {
+		lrc->queue_timestamp = 0;
+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
+	}
+
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
@@ -2466,6 +2507,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_timestamp_ms =
 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
+	snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
+	snapshot->queue_timestamp_ms =
+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_queue_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2520,6 +2564,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 557dce004d48..0a3a611391ee 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -39,6 +39,8 @@ struct xe_lrc_snapshot {
 	u32 seqno;
 	u64 ctx_timestamp;
 	u64 ctx_timestamp_ms;
+	u64 queue_timestamp;
+	u64 queue_timestamp_ms;
 	u32 ctx_job_timestamp;
 };
 
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
2.51.0

