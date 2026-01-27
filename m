Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8721D2FEC3
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 17:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F310E5A4;
	Tue, 27 Jan 2026 17:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efD5Huzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44A010E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769533498; x=1801069498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fb6pI9aTPHVF85IUn8Z0Bx0gwKHL+eX8zeovOXPfiD8=;
 b=efD5Huzrt6mid8MxKGoeK7hpv3XRicUlOicr2eHUm6/J8FUORFFkYYZp
 Lqng8mpwjm3cJptmMHb2I9aV05hTZsKSRcAOyMWo2ZQIvU8GeaMwUdadz
 5sab+M2J9mPqdSC9PuVZxyU42deHFYci82kLXUsQRqtSDmoaehxqrMQmt
 bP5J1k6dCtWRrEhHmOFrQ9O4kJvlZL3ZA+EoQ6UGSt3OO+zL+uH6EsDio
 itUaEzb20NFtW9xFL7HX7tJEyEZJRbefcXgZVee/2KA/Ahka5Vg4uY1rX
 XhCzvgMkKaLX2WCrklxfcemSRnfxDDGi3SeLTNnu4SXWQhHXAHeE3UFXn A==;
X-CSE-ConnectionGUID: 8JXbKgQ2Qp2NZIf5EwiLeA==
X-CSE-MsgGUID: KjVvPamxSVKOzdfnbXeR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93393525"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93393525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:04:57 -0800
X-CSE-ConnectionGUID: 1E0zqbAnQyiVtZhmZ4Q/QA==
X-CSE-MsgGUID: n11JefjYQVOhLLs46R9vJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208039392"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 09:04:57 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 2/5] drm/xe: Forcefully tear down exec queues in GuC submit
 fini
Date: Tue, 27 Jan 2026 12:04:52 -0500
Message-Id: <20260127170455.618616-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127170455.618616-1-zhanjun.dong@intel.com>
References: <20260127170455.618616-1-zhanjun.dong@intel.com>
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

In GuC submit fini, forcefully tear down any exec queues by disabling
CTs, stopping the scheduler (which cleans up lost G2H), killing all
remaining queues, and resuming scheduling to allow any remaining cleanup
actions to complete and signal any remaining fences.

guc_submit_fini requires access to device hardware. Using a device-managed
action guarantees the correct ordering of cleanup.

v3:
 - Add page fault fix
v2:
 - Fix VF failure (CI)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d61bd0094e0b..92ea32423838 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -239,13 +239,21 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 		 EXEC_QUEUE_STATE_BANNED));
 }
 
-static void guc_submit_fini(struct drm_device *drm, void *arg)
+static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
+
+static void guc_submit_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	/* Forcefully kill any remaining exec queues */
+	xe_guc_ct_stop(&guc->ct);
+	__xe_guc_submit_reset_prepare(guc);
+	xe_guc_submit_stop(guc);
+	xe_guc_submit_pause_abort(guc);
+
 	ret = wait_event_timeout(guc->submission_state.fini_wq,
 				 xa_empty(&guc->submission_state.exec_queue_lookup),
 				 HZ * 5);
@@ -326,7 +334,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	guc->submission_state.initialized = true;
 
-	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
+	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
 }
 
 /*
@@ -2354,16 +2362,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
-int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
-	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
-		return 0;
-
-	if (!guc->submission_state.initialized)
-		return 0;
-
 	/*
 	 * Using an atomic here rather than submission_state.lock as this
 	 * function can be called while holding the CT lock (engine reset
@@ -2378,6 +2380,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	return ret;
 }
 
+int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+{
+	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
+		return 0;
+
+	if (!guc->submission_state.initialized)
+		return 0;
+
+	return __xe_guc_submit_reset_prepare(guc);
+}
+
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
 	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
-- 
2.34.1

