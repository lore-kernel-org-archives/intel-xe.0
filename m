Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4AD2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C182710E225;
	Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6MpdYU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07EC10E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bU6cbHeFzYawkmeHPgJhHamiX9vCw3SBKZhg7vy5IRo=;
 b=O6MpdYU48/D3P5NqEVSU8RJKGErMosx4Vsjpk8qsX+vsC4Q5ZnDBxPCO
 m40OuMr259O3BwO4QP+PIQMHSmq358S9UJxljFvcHpuqkn1MJ7kGnFS5q
 zeXm/gKbArlzd6emWLhhZ81hZmwDnX6iKZxvSkJcFQFNnsqa6qxFUgXHU
 Tt7TYaICqaNwnLdpGoe0RhQrqUSa8luqsaiZFrMqdPpg8IlSlkiVZjSgf
 ir/BfiK+MObIUd6PIpMVJeVeneD/ZAsjJ7z+Z5+XpZgo1YqEhtnfcBUJ4
 ANhVS0p+Qk4tiRw3YMsng6/SFomitESbzhLmFjICnjLd1iF9TUrCCrU6P Q==;
X-CSE-ConnectionGUID: +1U8wf2lTRKn63NtvhH9xw==
X-CSE-MsgGUID: kSGOOnWtTDmwjPcer1KdEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574655"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:24 -0800
X-CSE-ConnectionGUID: w2AxorJzRLmrqan7sSyvTw==
X-CSE-MsgGUID: WIhRtfuTSL2ioMwgUBDQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373495"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 2/6] drm/xe: Forcefully tear down exec queues in GuC submit
 fini
Date: Tue, 20 Jan 2026 15:16:17 -0500
Message-Id: <20260120201621.2442803-3-zhanjun.dong@intel.com>
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

In GuC submit fini, forcefully tear down any exec queues by disabling
CTs, stopping the scheduler (which cleans up lost G2H), killing all
remaining queues, and resuming scheduling to allow any remaining cleanup
actions to complete and signal any remaining fences.

v2:
 - Fix VF failure (CI)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d61bd0094e0b..088d05e502ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -239,6 +239,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 		 EXEC_QUEUE_STATE_BANNED));
 }
 
+static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
+
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -246,6 +248,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
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

