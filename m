Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A2CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F42A10EABD;
	Thu,  4 Sep 2025 19:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9d0UMz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C084510EABD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014170; x=1788550170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbnOkO7Fqvj7aVy3z6bbDJWwOnZRREEWxn/kTwe6xCg=;
 b=E9d0UMz27rVJjXcY/vfrsS7x5/+90xrdzhxH6XKJROzP6ZSdwCRpKGq1
 tGfxjQGkrhMFdIYP9pWje1Vfr19xl/w6WHEiCGd3+6EoIOkVHpcb0WIK3
 Vm6Rati7N3zjDjQi3VKe7ajPtJGIGZ5GmJMUCnD3sScJAGC9m5LUMfcvd
 r/OOqLiqV5Pej5LZaJSuGZ1EJGR3xBgiMa2HZKiXNA0ZniQQEqZXz4qX1
 j0RdvNKz9Br4F2mcD5/HqLmCwsi0lBcdv7o3S81sFSvYQlDEUdfECgS5D
 +J5gw5Oy6wukAURg5aiE8S7wp25x5BwKumH5npR157ByJEuVU7A5M3/xV Q==;
X-CSE-ConnectionGUID: AePhrpCuRXKKDe7hHuA1tQ==
X-CSE-MsgGUID: Po95dzXxSk+QWSGKNNG0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70793962"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70793962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:29 -0700
X-CSE-ConnectionGUID: l/bjJ7s2TLSeu5/qjwt2Qw==
X-CSE-MsgGUID: MIwRzIiLR7qituLHAx4/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209153126"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/5] drm/xe/guc: Rename xe_guc_register_exec_queue
Date: Thu,  4 Sep 2025 21:29:13 +0200
Message-ID: <20250904192918.7346-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904192918.7346-1-michal.wajdeczko@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
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

This function is dedicated for use by the VFs, we shouldn't use
name that might suggests it's general purpose. While there, update
asserts to better reflect intended usage.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c   | 14 ++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h   |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  5 ++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..f2920b047b2c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2528,7 +2528,7 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 }
 
 /**
- * xe_guc_register_exec_queue - Register exec queue for a given context type.
+ * xe_guc_register_vf_exec_queue - Register exec queue for a given context type.
  * @q: Execution queue
  * @ctx_type: Type of the context
  *
@@ -2539,15 +2539,17 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
  *
  * Returns - None.
  */
-void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
+void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 
-	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, !IS_DGFX(xe));
-	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
-		       ctx_type < GUC_CONTEXT_COUNT));
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	xe_gt_assert(gt, !IS_DGFX(xe));
+	xe_gt_assert(gt, ctx_type == GUC_CONTEXT_COMPRESSION_SAVE ||
+		     ctx_type == GUC_CONTEXT_COMPRESSION_RESTORE);
+	xe_gt_assert(gt, GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 23, 0));
 
 	register_exec_queue(q, ctx_type);
 	enable_scheduling(q);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 6b5df5d0956b..9e6f19b03e65 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -46,7 +46,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
-void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
+void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 908590fa79d4..19786f64a7da 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -186,7 +186,6 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
 
 static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
 {
-	int err = -EINVAL;
 	int ctx_type;
 
 	switch (ctx->ctx_id) {
@@ -197,10 +196,10 @@ static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
 		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
 		break;
 	default:
-		return err;
+		return -EINVAL;
 	}
 
-	xe_guc_register_exec_queue(ctx->mig_q, ctx_type);
+	xe_guc_register_vf_exec_queue(ctx->mig_q, ctx_type);
 	return 0;
 }
 
-- 
2.47.1

