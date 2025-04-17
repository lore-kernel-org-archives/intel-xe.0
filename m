Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C03FC369CA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 18:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6255C10E39D;
	Thu, 17 Apr 2025 18:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9ovUjhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575A10E39D
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744913197; x=1776449197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IY23DfsscA7xY2nuoJzvuvPYKula45DHy1uWq0opXDI=;
 b=j9ovUjhLcmni+gCxDRApFJjaf+z45N7N68AMol0BpuV0Kph4NyaDdDFw
 xMk9CJPdBPp2jSIgmSVpgd9dTbLb6bsZocFKQUfcu+QW5+Y0+i/w/PqaE
 /ZPP2vDJh8YmI+P6RcMf+IasdHky295G0b2pgfIJmqWdxjMjoyLYsOMKF
 up/sirxCrAurWi+Uhk/hBz69L33ZIQTaQ7WiflXWnq0k/p7VEskKGjC4h
 j2vdqomR2zyRyib39watg6vmnZ6T8rqmIAhiDFZC/HPIUJogV00XgmfN1
 8940R/PXV9au3KUpvnpEtScs8UaAQ2GB6Lfg2WqbZaF8w5DhEKOQiCCQ+ Q==;
X-CSE-ConnectionGUID: wlfKYtDhSGa/o/KigswlMw==
X-CSE-MsgGUID: WRu/QwVYR/ecBDmxgvpcgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="56707792"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="56707792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:06:35 -0700
X-CSE-ConnectionGUID: 9TaWa2fbSWWnuKtTg6/Eag==
X-CSE-MsgGUID: HHDZqtf0Q0qlWWFgp/a2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="135851381"
Received: from dut136arlu.fm.intel.com ([10.105.23.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:06:34 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: stuart.summers@intel.com, niranjana.vishwanathapura@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Refactor exec queue deregister
Date: Thu, 17 Apr 2025 18:06:29 +0000
Message-Id: <20250417180629.16418-1-stuart.summers@intel.com>
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

No functional change here, just combine the two similar
routines we currently have for submitting the context
deregistration to GuC.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 62 ++++++++++++------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 813c3c0bb250..42c709729352 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -568,6 +568,30 @@ static void register_exec_queue(struct xe_exec_queue *q)
 	init_policies(guc, q);
 }
 
+static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_DEREGISTER_CONTEXT,
+		q->guc->id,
+	};
+
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+
+	trace_xe_exec_queue_deregister(q);
+
+	if (!exec_queue_destroyed(q)) {
+		set_exec_queue_destroyed(q);
+
+		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
+	} else {
+		xe_guc_ct_send_g2h_handler(&guc->ct, action,
+					   ARRAY_SIZE(action));
+	}
+}
+
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 {
 	return (WQ_SIZE - q->guc->wqi_tail);
@@ -1026,25 +1050,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
-static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
-		q->guc->id,
-	};
-
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
-
-	set_exec_queue_destroyed(q);
-	trace_xe_exec_queue_deregister(q);
-
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
-}
-
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -1213,7 +1218,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
 		set_exec_queue_extra_ref(q);
 		xe_exec_queue_get(q);
-		__deregister_exec_queue(guc, q);
+		deregister_exec_queue(guc, q);
 	}
 
 	/* Stop fence signaling */
@@ -1857,23 +1862,6 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	return q;
 }
 
-static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
-		q->guc->id,
-	};
-
-	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
-
-	trace_xe_exec_queue_deregister(q);
-
-	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
-}
-
 static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 			      u32 runnable_state)
 {
-- 
2.34.1

