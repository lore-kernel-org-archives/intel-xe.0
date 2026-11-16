Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09205606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENNCGNVD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FAE10E989;
	Mon, 16 Nov 2026 07:47:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8892910E98C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794815221; x=1826351221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pk3iUNa4jO0UBn0vm61v83lxh98qCASvmL8XfY8Msf0=;
 b=ENNCGNVDs5Co6W6lRS4lruQnFUSOuk9Huv0zqqoZBcwJmUYb9KRpxq2V
 frxtOHlPklXjxYnUWUsU5SShlPT9ggAEv/lINB/2GiX67BJprBYTiT41y
 Z1NsGk5zZDJdFEmsk1SrjUsjcw6Og57yVkDMAThlgr+Pp3xwodlrHML1q
 /YJLPQ8t2wyxJcx9SN77GHiCL3/GJENMAc/+QSQaUlkUp2U/acmnYEVlC
 0wkLz+RT6/oCSpMo1xUH7zBFp4aCQcL/UoCy2O8GB74UU1zXttDA+Goxf
 ena6cyrj0R3QDFAPa8MLIHCDIR4qUEHbaY3ATSZmBPpWVH7lbLi4jpIIJ g==;
X-CSE-ConnectionGUID: IL6anpnFSw+f5B5rHluLEQ==
X-CSE-MsgGUID: EEIe5e4dRxi1Pa2Ll0rE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3460353"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3460353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 23:47:00 -0800
X-CSE-ConnectionGUID: +lxT5SpER1mXC3BrQanCTQ==
X-CSE-MsgGUID: zCZrAvzzREyoJkcAXr/U5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9320026"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 23:46:58 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
 recordings
Date: Mon, 16 Nov 2026 13:57:17 +0530
Message-ID: <20261116082716.2636317-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_gt_record_default_lrcs() records one engine at a time and drops its
q and nop_q once the default LRC image has been captured. However, the
associated contexts are torn down asynchronously. The LRCs and their
GGTT ranges are freed only after GuC acknowledges the deregistration and
the destroy worker completes cleanup.

This allows cleanup from one engine to overlap recording of the next
engine. In that window, the next engine's nop_q can reuse GGTT ranges
previously used by a recorded engine while that engine still has the old
nop_q loaded as its current context.

On CRI with ctx_restore_mid_bb enabled for compute, bcs1 is recorded
immediately before ccs0. If ccs0's nop_q reuses GGTT ranges previously
used by bcs1's nop_q, the q -> nop_q switch can fail, GuC reports a
Memory CAT error, emit_nop_job() times out, and probe fails.

Wait for both queue GuC IDs to be released and flush the destroy worker
before recording the next engine. This guarantees complete context
teardown before any new context allocation or execution.

Assisted-by: LLM
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fe71cb011d3a..65f91b8e1ff7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -395,6 +395,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 	for_each_hw_engine(hwe, gt, id) {
 		struct xe_exec_queue *q, *nop_q;
+		u32 q_id, nop_id = 0;
 		void *default_lrc;
 
 		if (gt->default_lrc[hwe->class])
@@ -416,6 +417,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 				  hwe->name, q);
 			return err;
 		}
+		q_id = q->guc->id;
 
 		/* Prime golden LRC with known good state */
 		err = emit_wa_job(gt, q);
@@ -433,6 +435,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 				  hwe->name, nop_q);
 			goto put_exec_queue;
 		}
+		nop_id = nop_q->guc->id;
 
 		/* Switch to different LRC */
 		err = emit_nop_job(gt, nop_q);
@@ -454,6 +457,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		xe_exec_queue_put(q);
 		if (err)
 			break;
+
+		/* No LRC GGTT range may be freed while the next engine is recorded */
+		err = xe_guc_submit_wait_id_released(&gt->uc.guc, q_id);
+		if (!err)
+			err = xe_guc_submit_wait_id_released(&gt->uc.guc, nop_id);
+		if (err) {
+			xe_gt_err(gt, "hwe %s: context teardown timed out (%pe)\n",
+				  hwe->name, ERR_PTR(err));
+			break;
+		}
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d76f125f9c3a..254e19630c5b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -10,6 +10,7 @@
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
@@ -1908,6 +1909,32 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 	xe_destroy_wq_queue(&q->guc->destroy_async);
 }
 
+/**
+ * xe_guc_submit_wait_id_released() - Wait for an exec queue's teardown
+ * @guc: the GuC
+ * @guc_id: GuC ID of an exec queue whose last reference was dropped
+ *
+ * Wait for @guc_id to be released, which happens only after GuC acknowledges
+ * the deregistration, then flush the destroy worker so the queue's LRCs are
+ * freed on return.
+ *
+ * Return: 0 on success, -ETIMEDOUT on timeout.
+ */
+int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id)
+{
+	void *entry;
+	int ret;
+
+	ret = read_poll_timeout(xa_load, entry, !entry, 100, USEC_PER_SEC, false,
+				&guc->submission_state.exec_queue_lookup, guc_id);
+	if (ret)
+		return ret;
+
+	xe_destroy_wq_flush();
+
+	return 0;
+}
+
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg,
 						 bool bound)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 7a81d0aa19bb..8397c5bb6bfd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -52,6 +52,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id);
 void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
-- 
2.50.1

