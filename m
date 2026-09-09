Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FFDC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB7F10F127;
	Wed,  9 Sep 2026 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFSppbrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AA210F11A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957733; x=1820493733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aa3NKxw0cdliOhRPcd8ggCTJ9cVIVSdTNtwKNHGU1yM=;
 b=IFSppbrfJuTrhp05Wzes0QK6Oga5gpogtETLZMG4zPErOEK9oY5/M4td
 W6cTP3cTUTqhmClVd5OJk8dLx623nwnMudBD1T9sOsWZ95FDdxEZwv3H2
 Ishxu22FiZytiOpmCzn2mt2Uv/+7LAD3YCa2FHbCiSrlcIQWCy83GgiY9
 k4RlHvPvXNJmeJunRFFSMsCWx+0XCmG2aJ73kETfeFV/59haYMlUDZVUF
 foWQeTfkBskpYvPSdUdiuqz2BhGqvZ1gZ9gEuvc1E4nw/WGoGnHHmLZwd
 cQl2e0vepvoulsGGz1nAPKkJY6lJjXztJlIdkP2ENnDgwGKTDmu/MuF6F Q==;
X-CSE-ConnectionGUID: jhItdo+bTt6S5NgwFUiM8A==
X-CSE-MsgGUID: h7EVKI1SQrCKLrlRPm/Czg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715569"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:13 -0700
X-CSE-ConnectionGUID: ygXWLlhOSqusmiXJkIXgSQ==
X-CSE-MsgGUID: nIy9Tid/RrC6SUAnXyNJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246654"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 15/21] drm/xe/lrc: Pass exec_queue to xe_lrc_create for
 access counter params
Date: Wed,  9 Sep 2026 18:15:09 +0530
Message-ID: <20260909124457.1610890-38-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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
index 6f7abc0181b5..c32e47e87f88 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -45,4 +45,14 @@
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
index 9773b27ad2a0..390288e09b40 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -436,7 +436,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+			lrc = xe_lrc_create(q, q->hwe, q->vm, q->replay_state,
 					    xe_lrc_ring_size(), q->msix_vec, flags);
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a36db39dcda8..14d5f90e234d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -259,7 +259,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 25fe9dbc9141..ec85e88dcbe1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1516,8 +1516,10 @@ static void xe_lrc_set_gpgpu_preemption_level(struct xe_lrc *lrc, struct xe_gt *
 	xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
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
@@ -1616,8 +1618,20 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
 	}
 
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
 
 	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER)
 		xe_lrc_set_gpgpu_preemption_level(lrc, gt);
@@ -1662,7 +1676,8 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	return err;
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+		       struct xe_hw_engine *hwe, struct xe_vm *vm,
 		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1718,7 +1733,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+	err = xe_lrc_ctx_init(lrc, q, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
@@ -1734,6 +1749,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 
 /**
  * xe_lrc_create - Create a LRC
+ * @q: Exec queue (can be NULL for kernel queues)
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @replay_state: GPU hang replay state
@@ -1746,8 +1762,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
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
@@ -1756,7 +1773,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, q, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 7be5e3da8bc8..ca1943f1c1ba 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -61,8 +61,9 @@ struct xe_lrc_snapshot {
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
2.43.0

