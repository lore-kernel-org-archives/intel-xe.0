Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5858C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B23710E79D;
	Wed,  9 Jul 2025 10:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VmYvxCGc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A310E79C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yXmkzZvqkCP1Hsu2UEcxOHalHXxz8dmqqWoN+h/0j5k=; b=VmYvxCGciJR4GpkctUqKMklSAR
 kn+UJU6d60sYs6rlJ5S9KJhSFg0mu2Z3upgzVYqwTM/tEci23G5IKGRKRkgvCclV6gWGe8jzuwcSb
 mCKAPM0y8Fu18FoAswYAa6cZQT4WSGxJfmeS5nxhQ34b1xXa+jGZkJnvh7nhazJ3omUjbTCQAYnur
 UG8QlFicRxa3rfUkmT3K8pPcl5mRplhp0fKI/gxfUgmLtCU14PuI6amVsm9A7NQqWVI8Tsqp+NPEY
 rCuWfL+CqWN7gBGdtYHetUP432kxlgTkHRzz4L7/fVk0MCZ48sZt+175wsD2l9Qbs8Th4ZslDMzSK
 kfwBcoKQ==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZSS6-00EQo5-W0; Wed, 09 Jul 2025 12:55:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v9 6/8] drm/xe: Add plumbing for indirect context workarounds
Date: Wed,  9 Jul 2025 11:54:53 +0100
Message-ID: <20250709105455.93902-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
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

Some upcoming workarounds need to be emitted from the indirect workaround
context so lets add some plumbing where they will be able to easily slot
in.

No functional changes for now since everything is still deactivated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  5 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 86 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
 3 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 994af591a2e8..e0437d0454e6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -12,6 +12,8 @@
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
 #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
 #define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
@@ -36,4 +38,7 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+#define CTX_INDIRECT_OFFSET_MASK	REG_GENMASK(15, 6)
+#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_OFFSET_MASK, 0xd)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 768cb9de48d6..508bf032e06e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -39,6 +39,8 @@
 #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
 #define LRC_PPHWSP_SIZE				SZ_4K
+#define LRC_INDIRECT_CTX_SIZE			(63 * 64) /* bspec 45954: 63 cachelines */
+#define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 #define LRC_WA_BB_SIZE				SZ_4K
 
@@ -48,6 +50,12 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
+static bool
+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
+{
+	return false;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -717,7 +725,18 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
 
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
-	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
+	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
+		     LRC_INDIRECT_RING_STATE_SIZE;
+
+	if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
+		offset -= LRC_INDIRECT_CTX_BO_SIZE;
+
+	return offset;
+}
+
+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
+{
+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_BO_SIZE;
 }
 
 static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
@@ -1077,6 +1096,59 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 }
 
+static int
+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	static struct bo_setup rcs_funcs[] = {
+	};
+	struct bo_setup_state state = {
+		.lrc = lrc,
+		.hwe = hwe,
+		.max_size = LRC_INDIRECT_CTX_SIZE,
+		.reserve_dw = 15,
+		.offset = __xe_lrc_indirect_ctx_offset(lrc),
+	};
+	int ret;
+
+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
+		return 0;
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
+	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
+		state.funcs = rcs_funcs;
+		state.num_funcs = ARRAY_SIZE(rcs_funcs);
+	}
+
+	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
+		return 0;
+
+	ret = setup_bo(&state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Align to 64B cacheline so there's no garbage at the end for CS to
+	 * execute: size for indirect ctx must be a multiple of 64.
+	 */
+	while (state.written & 0xf) {
+		*state.ptr++ = MI_NOOP;
+		state.written++;
+	}
+
+	finish_bo(&state);
+
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_CS_INDIRECT_CTX,
+			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
+			     /* Size in CLs. */
+			     (state.written * sizeof(u32) / 64));
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_CS_INDIRECT_CTX_OFFSET,
+			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
+
+	return 0;
+}
+
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
@@ -1086,7 +1158,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 {
 	struct xe_gt *gt = hwe->gt;
 	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
-	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
@@ -1101,6 +1173,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->flags = 0;
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+
+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
+		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
+	}
+
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -1225,6 +1303,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (err)
 		goto err_lrc_finish;
 
+	err = setup_indirect_ctx(lrc, hwe);
+	if (err)
+		goto err_lrc_finish;
+
 	return 0;
 
 err_lrc_finish:
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 2c7c81079801..e9883706e004 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -29,7 +29,8 @@ struct xe_lrc {
 	struct xe_gt *gt;
 
 	/** @flags: LRC flags */
-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
 	u32 flags;
 
 	/** @refcount: ref count of this lrc */
-- 
2.48.0

