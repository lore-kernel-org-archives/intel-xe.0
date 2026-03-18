Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A61FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A3E10E2EB;
	Wed, 18 Mar 2026 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/1LPyng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C9910E2EB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817838; x=1805353838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NF9SIRAP2CdeyAtE6gIr8x3aIvUhq+ajuYsydhp769A=;
 b=J/1LPyngnSH+4Y/9YF7M/CojgpdDClzSKDyUaTJfyjIMo41z3Bf4OccD
 nq7SyO+KlDgSV0Qgn3cwauAEv3K5tS6dpmzEk4uiEH7BNcEBlQhaxYDuQ
 TCqlHdjuQn22TsIqBE1L8DiExb+eXHfz+/f7hxGldXEJ2Xnj7yPI/cSsH
 XaChKBPMHwtWf+SVtfPvF98O/FDbqRS6ceLZ9jT/UxriesqBBtgP/u+dD
 tTwzvzkFNeFgd9NiaohX1+VcKYuMdeeYk5MOAMUoMBuxC2XucYiTTJ2BO
 35FHMuNUNvbANMMsZBcfZAduUIAX0iBNo/dm7FFun9dS7nj9/Xk62dTQ+ w==;
X-CSE-ConnectionGUID: l3Zq9Gd/QoSvJkznKnx+aQ==
X-CSE-MsgGUID: 8dX3293eR8S3GUoja3ohUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764284"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:38 -0700
X-CSE-ConnectionGUID: +Tw779mCT8GGghG4jGnfOQ==
X-CSE-MsgGUID: W9MKWC1aR+GmMpltPIIPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424098"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 13/15] drm/xe/lrc: Pass exec_queue to xe_lrc_create for access
 counter params
Date: Wed, 18 Mar 2026 13:14:54 +0530
Message-Id: <20260318074456.2839499-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Update xe_lrc_create() and xe_lrc_init() to receive exec_queue pointer,
enabling access to q->acc.{trigger, notify, granularity} during LRC
initialization. Program CTX_ACC_CTR_THOLD and CTX_ASID registers with
access counter values.

Bspec: 59264, 59265
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 10 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c      |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c             | 35 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lrc.h             |  5 ++--
 5 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index b5eff383902c..35ee070059dd 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -40,4 +40,14 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+/* Fields for CTX_ACC_CTR_THOLD */
+#define ACC_TRIGGER_MASK		REG_GENMASK(15, 0)
+#define ACC_TRIGGER_VAL(x)		REG_FIELD_PREP(ACC_TRIGGER_MASK, x)
+#define ACC_NOTIFY_MASK			REG_GENMASK(31, 16)
+#define ACC_NOTIFY_VAL(x)		REG_FIELD_PREP(ACC_NOTIFY_MASK, x)
+
+/* Fields for CTX_ASID */
+#define ACC_GRANULARITY_MASK            REG_GENMASK(22, 20)
+#define ACC_GRANULARITY_VAL(x)          REG_FIELD_PREP(ACC_GRANULARITY_MASK, x)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 815e82011c6d..05c808b330b4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -379,7 +379,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+			lrc = xe_lrc_create(q, q->hwe, q->vm, q->replay_state,
 					    xe_lrc_ring_size(), q->msix_vec, flags);
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 7e8a3a7db741..05de991ae90a 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -268,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 35b365ac55e5..9cb91ce63d59 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1439,8 +1439,10 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
 }
 
-static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
-			   void *replay_state, u16 msix_vec, u32 init_flags)
+static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+			   struct xe_hw_engine *hwe, struct xe_vm *vm,
+			   void *replay_state,
+			   u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -1527,8 +1529,20 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
 
-	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
+	if (xe->info.has_asid && vm) {
+		u32 asid;
+
+		if (q)
+			asid = vm->usm.asid | ACC_GRANULARITY_VAL(q->acc.granularity);
+		else
+			asid = vm->usm.asid;
+		xe_lrc_write_ctx_reg(lrc, CTX_ASID, asid);
+	}
+
+	if (q && xe->info.has_access_counter && vm)
+		xe_lrc_write_ctx_reg(lrc, CTX_ACC_CTR_THOLD,
+				     ACC_NOTIFY_VAL(q->acc.notify) |
+				     ACC_TRIGGER_VAL(q->acc.trigger));
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
@@ -1570,7 +1584,8 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	return err;
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+		       struct xe_hw_engine *hwe, struct xe_vm *vm,
 		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1626,7 +1641,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+	err = xe_lrc_ctx_init(lrc, q, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
@@ -1642,6 +1657,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 
 /**
  * xe_lrc_create - Create a LRC
+ * @q: Exec queue (can be NULL for kernel queues)
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @replay_state: GPU hang replay state
@@ -1654,8 +1670,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
  * Return pointer to created LRC upon success and an error pointer
  * upon failure.
  */
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state, u32 ring_size,
+			     u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1664,7 +1681,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, q, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..b101aabe3d0d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -51,8 +51,9 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
 #define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
 
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state,
+			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.34.1

