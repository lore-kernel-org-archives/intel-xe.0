Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5789CD3C934
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1095D89A88;
	Wed, 10 Dec 2025 17:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Prt7n1LP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316CF89A88
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765388654; x=1796924654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=syPkOR2NzXp71ofGSE3j3Xj5xkKdm7hH9IrR+2yzYSk=;
 b=Prt7n1LPGNSr5tUUPx0WY2pPjtiTmU6tqW5oASt9+8xzuU6qV9wbusCH
 k+OHL/xe140sqcs26fO30YtX6CGP1q11D0H4CneW9Y3ugWACRItgnsx4I
 2MZpc13SYSQxVpELTzb7pDGUUoU+XK1w5NHNjiVvyMMiqFVJVE/xgoY0e
 k1jLbKN6p9EarevBbMBBjXSqBd1aEnl/Z0IG5Umn6bCef0gzh1S0Hlr91
 oRcOQv1frJb0q6mOpySfPrGL9NQneWytaXAioyzcbchsF0NGZuXXBZAr8
 04JsZQTUK7iBVFz05r9LwjwV+tMtaUYnDFDb+3+Y3JVZ6aRE7155pdYC+ w==;
X-CSE-ConnectionGUID: c56eHmYyQLaGvfNSDINHcQ==
X-CSE-MsgGUID: 4pWkOCwLToGNhVPWN/bGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442833"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67442833"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:44:14 -0800
X-CSE-ConnectionGUID: 8VfpwL40TGeQxg6FdtQGrw==
X-CSE-MsgGUID: uHYCebKfQ12thOeoZrNUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="201058099"
Received: from dut4086lnl.fm.intel.com ([10.105.10.38])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:44:13 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 Michal.Wajdeczko@intel.com, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write optimization
 breaks
Date: Wed, 10 Dec 2025 17:44:13 +0000
Message-ID: <20251210174412.71084-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
g2h_fence->done values to prevent the compiler from ignoring these
necessary operations.

v2: (Matt Brost)
- Add Fixes tags
- Add comments

Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 648f0f523abb..4ee628fe34b9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
 	g2h_fence->fail = true;
-	g2h_fence->done = true;
+
+	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
+	WRITE_ONCE(g2h_fence->done, true);
 }
 
 static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
@@ -527,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
-	ct->state = state;
+
+	/*
+	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
+	 * xe_guc_ct_enabled.
+	 */
+	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
 		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
@@ -1496,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
-	g2h_fence->done = true;
+	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
+	WRITE_ONCE(g2h_fence->done, true);
 	smp_mb();
 
 	wake_up_all(&ct->g2h_fence_wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5599939f8fe1..8d318b094f33 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
-	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
+	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
-	return ct->state == XE_GUC_CT_STATE_ENABLED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
+	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
-- 
2.43.0

