Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0764AD2629C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C3F10E233;
	Tue, 20 Jan 2026 20:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQdM9bv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61C10E220
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=is2mTxcPa0ny+SCcI11ksXMU3M2/KulOqM7jyjKoWbo=;
 b=WQdM9bv0LoNIvYCFaKGQ/0H7lxyMms0vIPJ8Rp1KK5jAos3Y97ecYo56
 EbZRr/YEoo+Cm6PoVcs3qjYQFe2DHYaQFtewNSaZx3jyWxa3+J1d9HfBY
 uxcetDzAubqTcIg/gvNVQcAmUyaZuiC/bnGlalHbkzE7H3/wye8HGgZZe
 7v8Xl2JkTzNWQGu/FrzGwzroIYRFGlUQQhmFmEWU7MFg4wBBYVc0N6wMN
 jrD0bV9pORJWg7RxcoMfkKu90fM1LubsgBVkcMm+JgYQVabsu62KHw/nU
 PukLPe9mSe7iee2SG7g+pn3B8p2w45I0oEP/kXDO7xjDVPO0/LJXjlJQx A==;
X-CSE-ConnectionGUID: ++omzS7GRLS4z0Qy1yZzAQ==
X-CSE-MsgGUID: ol2Y6HsTQQy6HWfyPaQe+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574657"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574657"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:24 -0800
X-CSE-ConnectionGUID: 3Q+9uZunRKuiZK6belF3TA==
X-CSE-MsgGUID: 9StJyxI2TGe4N1n2wDTNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373498"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 3/6] drm/xe: Trigger queue cleanup if not in wedged mode 2
Date: Tue, 20 Jan 2026 15:16:18 -0500
Message-Id: <20260120201621.2442803-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

The intent of wedging a device is to allow queues to continue running
only in wedged mode 2. In other modes, queues should initiate cleanup
and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
clean up queues when wedge mode != 2.

Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 34 ++++++++++++++++++------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 088d05e502ae..c848615d6057 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1326,6 +1326,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
  */
 void xe_guc_submit_wedge(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -1340,20 +1341,27 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
-				       guc_submit_wedged_fini, guc);
-	if (err) {
-		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
-			  "Although device is wedged.\n",
-			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
-		return;
-	}
+	if (xe->wedged.mode == 2) {
+		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
+					       guc_submit_wedged_fini, guc);
+		if (err) {
+			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
+				  "Although device is wedged.\n");
+			return;
+		}
 
-	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		if (xe_exec_queue_get_unless_zero(q))
-			set_exec_queue_wedged(q);
-	mutex_unlock(&guc->submission_state.lock);
+		mutex_lock(&guc->submission_state.lock);
+		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+			if (xe_exec_queue_get_unless_zero(q))
+				set_exec_queue_wedged(q);
+		mutex_unlock(&guc->submission_state.lock);
+	} else {
+		/* Forcefully kill any remaining exec queues, signal fences */
+		xe_guc_ct_stop(&guc->ct);
+		__xe_guc_submit_reset_prepare(guc);
+		xe_guc_submit_stop(guc);
+		xe_guc_submit_pause_abort(guc);
+	}
 }
 
 static bool guc_submit_hint_wedged(struct xe_guc *guc)
-- 
2.34.1

