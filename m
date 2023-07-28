Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41849C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 02:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3310E1E7;
	Fri, 28 Jul 2023 02:05:11 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2CC10E1E7
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690509909; x=1722045909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMAwGAtZdzMDLPYQBD7gDTSBsA1ic/pbWK/39Uq7NWk=;
 b=Oh/MTxuDy0axrYWLe7wZmNd7nXVG8jGL5mvbco2l5wUmP7aJGQcCzCc/
 Vf2QUJzEm/lAyK1XSLyjtHT/blGAMjP6GfWi/MEwa8To3l6UdTza23QgZ
 B/aw+t+kK4r+MpmB4SyKbNNQAtKkABm3QVdH80RPTGv5KGvKoC+9o/jDv
 OLGMVvni9qIbeZEkyj/LzQVtLIPNQBVd6geNfVI05wTmgMxH0xcGFkJKX
 99Osb/EUQdGSdleTcDHt2EWqQJrBaFDRP52uRhQRXNgZcR4bUhcsZAYzh
 EogWDJ9+VIHPVK/NLygaS04+zg1yxKUfWfDuV+Z/JVg7VJz1v3sEaimVT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434770139"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="434770139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817304235"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="817304235"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:05:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 19:05:03 -0700
Message-Id: <20230728020503.7320-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove XE_GUC_CT_SELFTEST
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

XE_GUC_CT_SELFTEST enabled a debugfs entry to which ran a very simple
selftest ensuring the GuC CT code worked. This was added before the
kunit framework was available and before submissions were working too.
This test isn't worth porting over to the kunit frame as if the GuC CT
didn't work, literally almost nothing would work so just remove this.

Suggested-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 65 ----------------------------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  9 ----
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ---
 drivers/gpu/drm/xe/xe_guc_debugfs.c  | 18 --------
 4 files changed, 98 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f58902b6be3..2925c3999168 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1307,68 +1307,3 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
 	xe_guc_ct_snapshot_print(snapshot, p);
 	xe_guc_ct_snapshot_free(snapshot);
 }
-
-#ifdef XE_GUC_CT_SELFTEST
-/*
- * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
- * control if enough sent, 8k sends is enough. Verify forward process, verify
- * credits expected values on exit.
- */
-void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
-{
-	struct guc_ctb *g2h = &ct->ctbs.g2h;
-	u32 action[] = { XE_GUC_ACTION_SCHED_ENGINE_MODE_SET, 0, 0, 1, };
-	u32 bad_action[] = { XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET, 0, 0, };
-	int ret;
-	int i;
-
-	ct->suppress_irq_handler = true;
-	drm_puts(p, "Starting GuC CT selftest\n");
-
-	for (i = 0; i < 8192; ++i) {
-		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
-		if (ret) {
-			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
-			xe_guc_ct_print(ct, p, true);
-			break;
-		}
-	}
-
-	ct->suppress_irq_handler = false;
-	if (!ret) {
-		xe_guc_ct_irq_handler(ct);
-		msleep(200);
-		if (g2h->info.space !=
-		    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
-			drm_printf(p, "Mismatch on space %d, %d\n",
-				   g2h->info.space,
-				   CIRC_SPACE(0, 0, g2h->info.size) -
-				   g2h->info.resv_space);
-			ret = -EIO;
-		}
-		if (ct->g2h_outstanding) {
-			drm_printf(p, "Outstanding G2H, %d\n",
-				   ct->g2h_outstanding);
-			ret = -EIO;
-		}
-	}
-
-	/* Check failure path for blocking CTs too */
-	xe_guc_ct_send_block(ct, bad_action, ARRAY_SIZE(bad_action));
-	if (g2h->info.space !=
-	    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
-		drm_printf(p, "Mismatch on space %d, %d\n",
-			   g2h->info.space,
-			   CIRC_SPACE(0, 0, g2h->info.size) -
-			   g2h->info.resv_space);
-		ret = -EIO;
-	}
-	if (ct->g2h_outstanding) {
-		drm_printf(p, "Outstanding G2H, %d\n",
-			   ct->g2h_outstanding);
-		ret = -EIO;
-	}
-
-	drm_printf(p, "GuC CT selftest done - %s\n", ret ? "FAIL" : "PASS");
-}
-#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 3e04ee64652c..f15f8a4857e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -25,13 +25,8 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
-#ifdef XE_GUC_CT_SELFTEST
-	if (!ct->suppress_irq_handler && ct->enabled)
-		queue_work(system_unbound_wq, &ct->g2h_worker);
-#else
 	if (ct->enabled)
 		queue_work(system_unbound_wq, &ct->g2h_worker);
-#endif
 	xe_guc_ct_fast_path(ct);
 }
 
@@ -61,8 +56,4 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
 }
 
-#ifdef XE_GUC_CT_SELFTEST
-void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 93046d95b009..dedbd686428b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -14,8 +14,6 @@
 
 #include "abi/guc_communication_ctb_abi.h"
 
-#define XE_GUC_CT_SELFTEST
-
 struct xe_bo;
 
 /**
@@ -110,10 +108,6 @@ struct xe_guc_ct {
 	wait_queue_head_t wq;
 	/** @g2h_fence_wq: wait queue used for G2H fencing */
 	wait_queue_head_t g2h_fence_wq;
-#ifdef XE_GUC_CT_SELFTEST
-	/** @suppress_irq_handler: force flow control to sender */
-	bool suppress_irq_handler;
-#endif
 	/** @msg: Message buffer */
 	u32 msg[GUC_CTB_MSG_MAX_LEN];
 	/** @fast_msg: Message buffer */
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index b43c70de7e37..167eb5593e03 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -58,27 +58,9 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
-#ifdef XE_GUC_CT_SELFTEST
-static int guc_ct_selftest(struct seq_file *m, void *data)
-{
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_device_mem_access_get(xe);
-	xe_guc_ct_selftest(&guc->ct, &p);
-	xe_device_mem_access_put(xe);
-
-	return 0;
-}
-#endif
-
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
-#ifdef XE_GUC_CT_SELFTEST
-	{"guc_ct_selftest", guc_ct_selftest, 0},
-#endif
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
-- 
2.34.1

