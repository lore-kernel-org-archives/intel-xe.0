Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49428CFC28C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 16:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6210E2C1;
	Fri, 21 Nov 2025 16:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpXeAN+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9608E10E155
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763741836; x=1795277836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X+/INuONkByLr0SmQHiJv8q3YHsOT3CrMFkL7sTFwWc=;
 b=GpXeAN+tbAEP68IUvImeEE/TLTAwxfvvXfkMBc0yncu5T7i7LDB9lOQP
 gi2BtyHLrVbKNJ5moMgUCmqu7zPkcNWesmJXDT60ueBDHyqVhvOyBo4YW
 9IYmZ0L/4Cwd0N3S48jsfpAETCDO+JqCty3O3IF56u7t/SGK59cEA/eIG
 ZdstsvQEbhSfci842gRePkRLbSkdDsYkzWe0MgUU9oMzS0tq+qGxMZ8pW
 jq3K0ap9JIpXxaQkCmvxkV1MYDK5OvWBa1L1U1O0wlo9TeqIeciP0XT7H
 7WRobYVMiakHMGJULaKpi70fncdGk9UQDGq9eqnqS9/pfSkYG8lqnRRD2 Q==;
X-CSE-ConnectionGUID: YbKgTsSSTeWuMvMS7qXWww==
X-CSE-MsgGUID: f6hTmliPT+eZgoafypuzyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65535876"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65535876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:17:16 -0800
X-CSE-ConnectionGUID: Tzd0lNQ7RRGuBc7fMEVu1A==
X-CSE-MsgGUID: kmCvgmykSA6g8/rC5zNKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191839471"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:17:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe: Enhance CT_DEAD for production builds
Date: Fri, 21 Nov 2025 08:17:11 -0800
Message-Id: <20251121161711.298421-1-matthew.brost@intel.com>
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

If the CT fails on production builds, log its state to dmesg for quick
analysis. Also, log the CT state if a G2H fence times out.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2697d711adb2..b206d7ff38d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -41,8 +41,8 @@ static void safe_mode_worker_func(struct work_struct *w);
 static void ct_exit_safe_mode(struct xe_guc_ct *ct);
 static void guc_ct_change_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state);
+static void xe_guc_ct_print_err_state(struct xe_guc_ct *ct, int reason);
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
 	CT_DEAD_STATE_REARM,			/* 0x0001 */
@@ -63,18 +63,21 @@ enum {
 	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
 	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
 	CT_DEAD_CRASH,				/* 0x8000 */
+	CT_DEAD_G2H_TIMEOUT,			/* 0x10000 */
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 static void ct_dead_worker_func(struct work_struct *w);
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
 
 #define CT_DEAD(ct, ctb, reason_code)		ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
 #else
-#define CT_DEAD(ct, ctb, reason)			\
-	do {						\
-		struct guc_ctb *_ctb = (ctb);		\
-		if (_ctb)				\
-			_ctb->info.broken = true;	\
+#define CT_DEAD(ct, ctb, reason_code)					\
+	do {								\
+		struct guc_ctb *_ctb = (ctb);				\
+		xe_guc_ct_print_err_state(ct, CT_DEAD_##reason_code);	\
+		if (_ctb)						\
+			_ctb->info.broken = true;			\
 	} while (0)
 #endif
 
@@ -2016,6 +2019,26 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
+static void xe_guc_ct_print_err_state(struct xe_guc_ct *ct, int reason)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
+	struct guc_ctb *h2g = &ct->ctbs.h2g;
+	struct guc_ctb *g2h = &ct->ctbs.g2h;
+
+	/* Don't spam dmesg, only print first failure */
+	if (h2g->info.broken || g2h->info.broken)
+		return;
+
+	xe_gt_err(gt, "CT_DEAD: reason=%d\n", reason);
+	xe_gt_err(gt, "H2G.head=%d, H2G.tail=%d, H2G.status=%d\n",
+		  desc_read(xe, h2g, head), desc_read(xe, h2g, tail),
+		  desc_read(xe, h2g, status));
+	xe_gt_err(gt, "G2H.head=%d, G2H.tail=%d, G2H.status=%d\n",
+		  desc_read(xe, g2h, head), desc_read(xe, g2h, tail),
+		  desc_read(xe, g2h, status));
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 
 #ifdef CONFIG_FUNCTION_ERROR_INJECTION
-- 
2.34.1

