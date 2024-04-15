Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2406DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73B10EF71;
	Mon, 15 Apr 2024 22:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WX+YY27x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6430610EF71
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713218747; x=1744754747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6KGWbR9RXokZh1C3r+sI1n0fIp7S1j19vnva0PG2qgw=;
 b=WX+YY27xk9IcfaSoQ3j32MGBbvN4JVgU9SJ+zFSoYM1ev5jW35hMIwUI
 J8F05LoUv3p97hkxlTmGgB32mP8XEXHFVUEAy2wYZKh5W1iCrFF1U1hhv
 i05YRD/bE+teNxzC4xEIj01Kng1YwfXtP/OOKUveSKuQWyDM6DxMyu5VY
 0PJmP5dB3PWvV1P5xI+e9pWRrsjjCHABOv0ae+nfhLo6J8+kp5Voc7wQj
 6hZESTx3xIs7bmiiCALa4mlEATdc40bB8gk+mTmFEwhvZqD+ypzpRCC6F
 CYNeaxv7tx/lcILnDCqT5ZRHeEJiI5smfOQUurnoagz19xB06SP2cgOck g==;
X-CSE-ConnectionGUID: HoqfMFTyTO6ePO9iyll9Hw==
X-CSE-MsgGUID: pg5L//ZkSVeCAvxrHUAgGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12478140"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="12478140"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:05:40 -0700
X-CSE-ConnectionGUID: ClE8AzcEQhSrNOWmcMP5dg==
X-CSE-MsgGUID: 38NfLcmsQ9qOYT9tWVOmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22117572"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:05:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v6 1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
Date: Mon, 15 Apr 2024 14:50:09 -0700
Message-Id: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add defintions for the functions xe_lrc_set_ring_tail and
xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head and
xe_lrc_ring_head, respectively, except tarting the lrc tail.

These new declarations can be put to immediate use in various places,
such as when initializing the lrc, creating snapshots, and submitting
exec queues.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Brian Welty <brian.welty@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
---

v2: Use new functions in various places.

 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c        | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c0..e46519ad683c6 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -62,7 +62,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 		xe_mmio_write32(hwe->gt, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
-	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
+	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 	lrc->ring.old_tail = lrc->ring.tail;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb469..ecd1085619b30 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -658,7 +658,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_parallel(q))
 		wq_item_append(q);
 	else
-		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
+		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac62..7b8997cff74eb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -787,8 +787,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	}
 
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
-	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
-	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
+	xe_lrc_set_ring_head(lrc, 0);
+	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	if (xe->info.has_asid && vm)
@@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_bo_put(lrc->bo);
 }
 
+void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
+{
+	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
+}
+
+u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
+{
+	return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
+}
+
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
 {
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
@@ -847,7 +857,7 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc)
 u32 xe_lrc_ring_space(struct xe_lrc *lrc)
 {
 	const u32 head = xe_lrc_ring_head(lrc);
-	const u32 tail = lrc->ring.tail;
+	const u32 tail = xe_lrc_ring_tail(lrc);
 	const u32 size = lrc->ring.size;
 
 	return ((head - tail - 1) & (size - 1)) + 1;
@@ -1357,7 +1367,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->context_desc = lower_32_bits(xe_lrc_ggtt_addr(lrc));
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
-	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
 	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
 	snapshot->seqno = xe_lrc_seqno(lrc);
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d32fa31faa2cf..f355b0eeb5658 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
 size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 
+void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
+u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
 u32 xe_lrc_ring_space(struct xe_lrc *lrc);
-- 
2.25.1

