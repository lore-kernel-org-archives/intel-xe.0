Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C8606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 05:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjZJjh7d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824E10E929;
	Mon, 26 Oct 2026 05:08:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077BD10E929
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 05:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792991317; x=1824527317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DCGZrHS/XZyTF5tFkAugp3iuQtpXKlJuYVVWLCpjcVI=;
 b=jjZJjh7dLGimkKtSWa/HmYK1r5O12yqxltZi6sjalJUeO/e0rztgqiBq
 pBfIEXENXBPH08ihLmV1lAbozuAiuQFCMmVneCDr1dxjnZEA+WPIuVm1r
 witDdE14CUbIWNsKNUJ3NnadZ6QndA5bxVaZH21qizXBbFo5UKgE2MO8Y
 iNcqIvrwXtEP0ocaopSlo6tBFaQbMsVaN9HLZPWKvW433OIqvMJhwU0oG
 7kj+mUcO9PoZ9a1C4WLENI4397wA1um6Y4H4dlLYDD3ua9sHw1o7FjBS5
 h8tpVZFccPqFy3qvz3w8H+8Nti6g9D1svGGOIZhJml+kn3q0di+fbiut0 w==;
X-CSE-ConnectionGUID: PnmT0tveQciQEhY32QDJzg==
X-CSE-MsgGUID: A6e+7DSsQBWdEfcyRRxslQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1522424"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1522424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 22:08:37 -0700
X-CSE-ConnectionGUID: qiAXQpF1QTq+4edlD344oQ==
X-CSE-MsgGUID: mLQ9fxZWSViWBaOQRTWDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4289490"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2026 22:08:33 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 05/10] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Mon, 26 Oct 2026 10:36:55 +0530
Message-ID: <20261026050735.566613-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050735.566613-1-raag.jadav@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation of usecases which require re-initializing exec queue
after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
queue LCRs already exist but the context is lost on PCIe FLR and needs
re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
v6: Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
v9: Add negative asserts for GSC and PXP (Daniele)
    Provide xe_lrc_ctx_init() as regular function (Daniele)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 47 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 15 ++++++++--
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9a8efa2bf2bf..f929e8ea8af5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -28,6 +28,7 @@
 #include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
+#include "xe_uc_fw.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
 
@@ -390,9 +391,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 		xe_lrc_put(q->lrc[i]);
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
-	int i, err;
 	u32 flags = 0;
 
 	/*
@@ -415,6 +415,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
 		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
 
+	return flags;
+}
+
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+{
+	int i, err;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -438,8 +445,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
+			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
 				goto err_lrc;
@@ -461,6 +468,38 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return err;
 }
 
+/**
+ * xe_exec_queue_reinit() - Re-initialize exec queue
+ * @q: exec queue to re-initialize
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_exec_queue_reinit(struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = q->gt;
+	int i, err;
+
+	/* TODO: Re-initialize GSC and PXP queues */
+	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
+	xe_gt_assert(gt, !xe_uc_fw_is_loadable(&gt->uc.gsc.fw));
+	xe_gt_assert(gt, !xe_pxp_is_enabled(gt_to_xe(gt)->pxp));
+
+	/* Re-initialization only allowed for kernel queues */
+	xe_gt_assert(gt, q->flags & EXEC_QUEUE_FLAG_KERNEL);
+
+	/* Re-initialize submission backend */
+	q->ops->reinit_kernel(q);
+
+	for (i = 0; i < q->width; i++) {
+		err = xe_lrc_ctx_init(q->lrc[i], q->hwe, q->vm, q->replay_state,
+				      q->msix_vec, xe_lrc_init_flags(q, q->flags));
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /**
  * xe_exec_queue_create() - Create an exec queue
  * @xe: Xe device
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index e8963f85cabd..d48775ef6baf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
+int xe_exec_queue_reinit(struct xe_exec_queue *q);
 
 static inline struct xe_exec_queue *
 xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 040a52f9320e..8e4f767d7f59 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1536,8 +1536,19 @@ static void xe_lrc_set_gpgpu_preemption_level(struct xe_lrc *lrc, struct xe_gt *
 	xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
 }
 
-static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
-			   void *replay_state, u16 msix_vec, u32 init_flags)
+/**
+ * xe_lrc_ctx_init() - Initialize LRC with context details
+ * @lrc: Pointer to the LRC
+ * @hwe: Hardware Engine
+ * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
+ * @msix_vec: MSI-X interrupt vector (for platforms that support it)
+ * @init_flags: LRC initialization flags
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		    void *replay_state, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index f2e829e62168..840f303db97e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -63,6 +63,8 @@ struct xe_lrc_snapshot {
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		    void *replay_state, u16 msix_vec, u32 init_flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.0

