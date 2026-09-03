Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B9C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625DD10E2CC;
	Thu,  3 Sep 2026 16:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkLZtHEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0845410E2CC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452177; x=1819988177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t6KbU0Uzkpcc3SVdBP1DRtukjnukdnJqoekFizJ7FXs=;
 b=AkLZtHEAzjJSAEfWKKNv1DBikG8XpUyc6k/o1+Gd59PguYZ353DxftE5
 3H3DABR3XEh21FB5ase3Wkj9t3vq3P2INYTCP6Kqffya8HRu4QrSzGBow
 wmFTTmkYLeOIqIcWU39tXj0TOVKSSd6yDiQD9hmr1jmMDsxRbzE3kESn1
 jEWb8ID8uWwWXpMaHCTJM3PmVQVNfsBFbm1XafChTOLNFmFYRlut7FdJJ
 +Y2YAxtoom8q1i1bxrf4FpHR2YhONA+iP7qjV3S5r9zc2anGOIXxJndH5
 vLR9Z1GQGi1eFjDk7ViitPohZ23KmpgEMJuRBaUOP40sJa2H2qOSlWwf/ Q==;
X-CSE-ConnectionGUID: 9P7lHDihRDGiKXgIirrcSw==
X-CSE-MsgGUID: qxeURE6nRD60H+lyOMqzUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114486991"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114486991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:16 -0700
X-CSE-ConnectionGUID: 21u6sXqFT3a2S1kNUm2ATQ==
X-CSE-MsgGUID: kJ9MvriDR5SEzlreyZoJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461443"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 GitHub Copilot <copilot@github.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V21 02/15] drm/xe: Link LRC BO and its execution queue with
 safe lifetime rules
Date: Thu,  3 Sep 2026 21:45:55 +0530
Message-ID: <20260903161553.528932-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

Introduce an execution queue back-pointer (`q`) within `struct xe_bo`, primarily
for Logical Ring Context (LRC) Buffer Objects. This back-pointer allows the
driver to identify and execute targeted corrective actions on a specific queue
if its associated LRC BO encounters errors like memory corruption or eviction.

Because this back-pointer takes no reference on its target execution queue, strict
lifetime and serialization rules are implemented to prevent concurrent readers
from encountering use-after-free or dangling pointer bugs:

- Encapsulate tracking logic inside xe_exec_queue_set_lrc_bo_backpointer() and
  xe_exec_queue_clear_lrc_bo_backpointer().

- Explicitly wrap all back-pointer writes and clears under the BO's dma_resv lock
  via xe_bo_lock(). Readers must hold this same lock across both the pointer read
  and its subsequent xe_exec_queue_get_unless_zero() call to guarantee serialization
  against teardown.

- Defer publishing the back-pointer until the very end of xe_exec_queue_create().
  This ensures that early initialization failure paths (which bypass the kref
  mechanism and immediately free the queue structure) never leak a transient pointer
  to concurrent readers.

- Clear the back-pointer at the absolute top of __xe_exec_queue_fini(). This strips
  the pointer before q->ops->fini() destroys the hardware backend, ensuring that
  any reader holding the BO lock either observes a fully functional queue or NULL.

For multi-queue engines, secondary LRC BOs safely point to the primary queue, which
is guaranteed to outlive the teardown pass due to active references held by its
secondaries.

V4 (MattB):
  - Add LRC BO's execution queue safe lifetime rules
V3 (Sashiko):
  - Use 8-byte placeholder structure compatibility for non-LRC BO cases.
  - Wrap assignments and clears securely under dma_resv locks.
V2 (Matt B):
  - Add native support handling multi-queue configuration tracking.

Co-authored-by: GitHub Copilot <copilot@github.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h   |  8 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c | 64 ++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e45f24301050..0eb93052c1d5 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -20,6 +20,7 @@
 struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
+struct xe_exec_queue;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -42,6 +43,13 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/**
+	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise.
+	 * Protected by the BO dma_resv: readers must hold it across both the
+	 * read and xe_exec_queue_get_unless_zero(). The BO holds no reference
+	 * on the queue.
+	 */
+	struct xe_exec_queue *q;
 	/** @tile: Tile this BO is attached to (kernel BO only) */
 	struct xe_tile *tile;
 	/** @placements: valid placements for this BO */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c4213bb9c137..f3ea4807ac33 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -322,10 +322,66 @@ struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
 	return q->lrc[0];
 }
 
+/*
+ * Publish the queue back-pointer in the LRC BOs.
+ *
+ * The BO holds no reference on the queue; the queue owns the LRCs, and
+ * therefore the BOs, instead. The back-pointer is made safe by two rules:
+ *
+ *  - It is published only once the queue is fully constructed and can no
+ *    longer be destroyed by an error path that bypasses the kref (see
+ *    xe_exec_queue_create()), so a reader that successfully takes a
+ *    reference can never be handed a queue that is freed without going
+ *    through xe_exec_queue_destroy().
+ *
+ *  - It is written and cleared under the BO dma_resv. Readers must hold
+ *    the same lock across both the read and
+ *    xe_exec_queue_get_unless_zero(), which serializes them against
+ *    xe_exec_queue_clear_lrc_bo_backpointer() below.
+ *
+ * For a multi-queue group the LRC BOs point at the primary queue, which is
+ * kept alive by the reference every secondary holds on it.
+ */
+static void xe_exec_queue_set_lrc_bo_backpointer(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	int i;
+
+	for (i = 0; i < q->width; ++i) {
+		struct xe_bo *bo = q->lrc[i]->bo;
+
+		xe_bo_lock(bo, false);
+		bo->q = primary;
+		xe_bo_unlock(bo);
+	}
+}
+
+/*
+ * Drop the queue back-pointer before anything belonging to the queue is
+ * torn down. This must happen before q->ops->fini(), otherwise a reader
+ * could take a reference and then operate on an already destroyed backend.
+ */
+static void xe_exec_queue_clear_lrc_bo_backpointer(struct xe_exec_queue *q)
+{
+	int i;
+
+	for (i = 0; i < q->width; ++i) {
+		struct xe_bo *bo = q->lrc[i] ? q->lrc[i]->bo : NULL;
+
+		if (!bo)
+			continue;
+
+		xe_bo_lock(bo, false);
+		bo->q = NULL;
+		xe_bo_unlock(bo);
+	}
+}
+
 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	xe_exec_queue_clear_lrc_bo_backpointer(q);
 	q->ops->fini(q);
 
 	for (i = 0; i < q->width; ++i)
@@ -450,6 +506,14 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 			goto err_post_init;
 	}
 
+	/*
+	 * Publish the LRC BO back-pointers last: past this point the queue can
+	 * only be destroyed through xe_exec_queue_destroy(), so a concurrent
+	 * reader that takes a reference via bo->q cannot race with the
+	 * kref-bypassing error paths below.
+	 */
+	xe_exec_queue_set_lrc_bo_backpointer(q);
+
 	return q;
 
 err_post_init:
-- 
2.52.0

