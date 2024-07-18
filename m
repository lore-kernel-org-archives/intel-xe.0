Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D874C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3330610EACA;
	Thu, 18 Jul 2024 18:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsULbEvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BD410EAC2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328897; x=1752864897;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0Enl82tbHilg9GbGBhxxzNgO/ioIYIHeINLVvDvIE7U=;
 b=SsULbEvO6sc3r1ylfIsdT//CNXy/00KH7NGlWHzlCpXjuRKgaFvMlRHQ
 785OjzIv9u/+hzpx+qij7bUclAiQUCT9LTenQGA14AXZ6mHbkxd4jBmlP
 cBGkDhqOr+RlgQZoeCTerWFDLq3IidI0P+KWOr9pEwkiCnz3R5dhE2osj
 6PPEr/qvXdEFqbIHm8OciQoqYcxJQ+zJI4r0iP0FEi2wRPRoPxY1Pfw4M
 Q84d0UVdy38Nsz3Bbk78peTJTG9tMMbtx6KJKq+nmKTnKyiDQ6uTbSGQr
 GFoN3MJP2KOhVrUK/7WT8RXbVbX9tUWrKxYfnG3CKkJaXJSYLyIBw47H7 A==;
X-CSE-ConnectionGUID: OlGHWIAbSNah3ys85h68jg==
X-CSE-MsgGUID: tsOqQdtuT2+yGkRvv0tyew==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21816223"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="21816223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
X-CSE-ConnectionGUID: Sp/A5QCERbGpqkpZsOMnyw==
X-CSE-MsgGUID: agkDV8keSASFrpJ9xoongA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51152680"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/xe: Build PM into GuC CT layer
Date: Thu, 18 Jul 2024 11:55:31 -0700
Message-Id: <20240718185531.1500815-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718185531.1500815-1-matthew.brost@intel.com>
References: <20240718185531.1500815-1-matthew.brost@intel.com>
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

Take PM ref when any G2H are outstanding, drop when none are
outstanding.

To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
to be held when scheduler messages are pending too.

v2:
 - Add outer PM protections to xe_file_close (CI)
v3:
 - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
v4:
 - Add assert to G2H increment function

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c     | 10 +++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 06cebaffb451..b68ab474e1a0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -101,6 +101,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
+	xe_pm_runtime_get(xe);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
@@ -126,6 +128,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	xe_drm_client_put(xef->client);
 	kfree(xef);
+
+	xe_pm_runtime_put(xe);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..64afc90ad2c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
 	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
 		     state == XE_GUC_CT_STATE_STOPPED);
 
+	if (ct->g2h_outstanding)
+		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
 	ct->state = state;
 
@@ -495,10 +497,15 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
 	xe_gt_assert(ct_to_gt(ct), g2h_len <= ct->ctbs.g2h.info.space);
+	xe_gt_assert(ct_to_gt(ct), (!g2h_len && !num_g2h) ||
+		     (g2h_len && num_g2h));
 
 	if (g2h_len) {
 		lockdep_assert_held(&ct->fast_lock);
 
+		if (!ct->g2h_outstanding)
+			xe_pm_runtime_get_noresume(ct_to_xe(ct));
+
 		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
 	}
@@ -511,7 +518,8 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
 	ct->ctbs.g2h.info.space += g2h_len;
-	--ct->g2h_outstanding;
+	if (!--ct->g2h_outstanding)
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 860405527115..993d0344dc88 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1402,6 +1402,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
+
+	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
@@ -1492,6 +1494,8 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
+	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
+
 	INIT_LIST_HEAD(&msg->link);
 	msg->opcode = opcode;
 	msg->private_data = q;
-- 
2.34.1

