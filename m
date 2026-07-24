Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD4C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7810F388;
	Fri, 24 Jul 2026 11:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNyS051c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A7D10F388
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893792; x=1816429792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l518zHhEWPlbYNTHcih6XNuOYZriLa58E79mImnZz20=;
 b=HNyS051cHsnEpzgG451q6pOvqhJKWppusB8OFdXK/3XDoucCpNbDBegR
 olY/CqtBlCE58Gaov4LvfDDMgGxPimk53lqNGpz+yuwXGTyLvCt3f5Awk
 xWV2gVr+U5WSYMFVDRoiyJMNLxM/n/habHPbT4wh4CwcZZ5R6/VW18PHJ
 v5sigA0sRJ3IO18PUs2Nkva37rm41t2a55fBDx6699d/mQrQGNM1Eb6PR
 RC/8agZIqkA0lgVj/nb4rOuglevulTEgL+Hz1Q+bAdA+Ec5kInDVl5Rnx
 SsDj7nFZB7UTf7cvu4nFy+y0IseJIf2SE4SX6i+YzC3BQDe5PshIV49LP Q==;
X-CSE-ConnectionGUID: v/D1KWQ7TvyxQ+dRTtKwLA==
X-CSE-MsgGUID: STp/JMnXTz62bHnkWPsFiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89385154"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89385154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:50 -0700
X-CSE-ConnectionGUID: 9U/sricYSlKLzYoz/Ggtgg==
X-CSE-MsgGUID: BQ7r3JCETY+LJOWNq9Q3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296909354"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2026 04:49:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/4] drm/xe/vf: split submission config query helpers
Date: Fri, 24 Jul 2026 11:49:37 +0000
Message-ID: <20260724114939.1560743-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

Split vf_get_submission_cfg() into per-resource helpers for CTXs and DBs
which keeps query/check paths independent and easier to test/read.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V2 -> V3:
- Added coverage for more error scenarios.

V1 - V2:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 60 +++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2ef260575c7c..07f749bad271 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -17,6 +17,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -572,11 +573,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	return size ? 0 : -ENODATA;
 }
 
-static int vf_get_submission_cfg(struct xe_gt *gt)
+static int vf_get_ctx_submission_cfg(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_guc *guc = &gt->uc.guc;
-	u32 num_ctxs, num_dbs;
+	u32 num_ctxs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -585,27 +586,64 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
-	if (unlikely(err))
-		return err;
-
-	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
+	if (num_ctxs > GUC_ID_MAX) {
+		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
+		return -EPROTO;
+	} else if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
 		return -EREMCHG;
 	}
-	if (config->num_dbs && config->num_dbs != num_dbs) {
+
+	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
+
+	config->num_ctxs = num_ctxs;
+
+	return config->num_ctxs ? 0 : -ENODATA;
+}
+
+static int vf_get_db_submission_cfg(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_guc *guc = &gt->uc.guc;
+	u32 num_dbs;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
+	if (unlikely(err))
+		return err;
+
+	if (num_dbs >= GUC_NUM_DOORBELLS) {
+		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
+		return -EPROTO;
+	} else if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
 		return -EREMCHG;
 	}
 
-	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
+	xe_gt_sriov_dbg_verbose(gt, "DBs %u\n", num_dbs);
 
-	config->num_ctxs = num_ctxs;
 	config->num_dbs = num_dbs;
 
-	return config->num_ctxs ? 0 : -ENODATA;
+	return config->num_dbs ? 0 : -ENODATA;
+}
+
+static int vf_get_submission_cfg(struct xe_gt *gt)
+{
+	int err;
+
+	err = vf_get_ctx_submission_cfg(gt);
+	if (unlikely(err))
+		return err;
+
+	err = vf_get_db_submission_cfg(gt);
+	if (unlikely(err))
+		return err;
+
+	return 0;
 }
 
 static void vf_cache_gmdid(struct xe_gt *gt)
-- 
2.43.0

