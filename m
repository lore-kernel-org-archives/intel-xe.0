Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164F8C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 15:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382810E5F8;
	Tue, 23 Jul 2024 15:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbDsESif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B374710E5FE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721747650; x=1753283650;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UKjjb9aY8JbrD97nbEVnSwAFBoJBO6NLsm5aLZr+sGs=;
 b=YbDsESifWlQ8ZD6g5D5TlPib7rihljOq1V6dDLjos+Bl3q5gu0f9dkbh
 pRDP6/FA5lG2PfIc+CILrgG886qp4GrNvdfvVcKGit7kKTduogziQT3YZ
 2nTqbzAHLpKLk1PDFcgBua1keAbWaCO8NGn9HNiB84HMDzo/906goABRs
 krLsDcQNxU0UCm48+nEMy8g+gejnwsWi5S3HoVpKV65mcv+QYYMEMWKVB
 YqYHxcBfwop4/PICqzk/PXOiy2E1Xmo7dWbtTr6+g37shE9b36FuS5ecY
 Yk1IvfJ9GwBCV8ARDhtIyJyCpqNyz1xEq4MHIAEj/VdzoldDxhysDnSNg Q==;
X-CSE-ConnectionGUID: /nosWxMQTUeQJISUIWbBxw==
X-CSE-MsgGUID: mQCaXRCTTgKPeM0t60NVWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23248352"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="23248352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:14:09 -0700
X-CSE-ConnectionGUID: SUAPlKSrRku7YCeSKZjI0Q==
X-CSE-MsgGUID: Sap7h+NmSDWJoeugzRZS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="51981218"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:14:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Kill exec queues synchronously
Date: Tue, 23 Jul 2024 08:14:54 -0700
Message-Id: <20240723151454.1730498-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Upon kill of exec queue ensure said exec queue is not running on the GPU
for overall safety by waiting for kill to complete. This includes
possibly waiting for a GT reset to complete.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +++++-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1408b02eea53..147e9407ce9b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -152,7 +152,11 @@ struct xe_exec_queue {
 struct xe_exec_queue_ops {
 	/** @init: Initialize exec queue for submission backend */
 	int (*init)(struct xe_exec_queue *q);
-	/** @kill: Kill inflight submissions for backend */
+	/**
+	 * @kill: Kill inflight submissions for backend, wait synchronously for
+	 * kill. For safety, should never be called while holding any locks as a
+	 * device reset may be last resort for kill.
+	 */
 	void (*kill)(struct xe_exec_queue *q);
 	/** @fini: Fini exec queue for submission backend */
 	void (*fini)(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da2ead86b9ae..df03fdb83dbd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1496,10 +1496,23 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
 	__suspend_fence_signal(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 !exec_queue_pending_disable(q) ||
+				 guc_read_stopped(guc), HZ * 5);
+	if (!ret) {
+		drm_warn(&xe->drm, "Schedule disable failed to respond upon kill");
+		xe_gt_reset_async(q->gt);
+	}
+	xe_guc_submit_reset_wait(guc);
 }
 
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
-- 
2.34.1

