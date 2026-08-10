Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7182CC5AD7B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E069210E7A2;
	Mon, 10 Aug 2026 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjkNasNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784210E7A4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356761; x=1817892761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aKUqkAJMNS026NyZc71HLST+zmsFFxXC7owl2MhNnOs=;
 b=SjkNasNgAmxFdHsl07BQ4a0hIB2S//0JIUT3XeQnhNygEOhfk8hR7k4c
 /JimWz/jFEfV+H8GIdjHwCN00gi9zNwuz/z/JfcYR5ydacxECTgmO9MVB
 wNVWRI/mImKJntXQh5TaXF+mlK/9cTmJ5BuB4Jmyp29bEXZDsiTrP3L0H
 FljhswpmMsSYDWw9b3Zq8XG0u+MuffFGaPXy+Yw9XOfSlXOchVr3qxd/J
 r38o7XKKuP6m/RJvzky1gBUCO5GJxWYXHYlqsoyVA52Rfu7HKy9Oe3UFx
 g4rCi3SIFcP0a5uLeGVwNWb/pnwfssKj+/ATNHglkTukoVSsYtkGv3cSc w==;
X-CSE-ConnectionGUID: DCesZmLwQTOmGuqiKp9YlQ==
X-CSE-MsgGUID: PFTYl4pfTkGwf8AYC7td9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893651"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:41 -0700
X-CSE-ConnectionGUID: c2xdbi7OSXqKVixiUWQvhA==
X-CSE-MsgGUID: HqV1+JESSPGkSCTOeCHewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227547"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:39 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 2/6] drm/xe/vf: Split submission config query helpers
Date: Mon, 10 Aug 2026 15:44:29 +0530
Message-ID: <20260810101428.1009573-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

Refactor vf_get_submission_cfg() into separate vf_get_ctxs_cfg()
and vf_get_dbs_cfg() functions which allows independent error
handling and validation for each resource, and improves testability.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- Allow zero DBs are valid configuration (Michal W).

V3 -> V4:
- Removed coverage for more error scenarios. (Michal W).
- Updated fucntion names. (Michal W)
- Added error scenarios in new commit.
- Updated commit message.

V2 -> V3:
- Added coverage for more error scenarios.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 49 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..339ea0d3344c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -568,11 +568,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	return size ? 0 : -ENODATA;
 }
 
-static int vf_get_submission_cfg(struct xe_gt *gt)
+static int vf_get_ctxs_cfg(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_guc *guc = &gt->uc.guc;
-	u32 num_ctxs, num_dbs;
+	u32 num_ctxs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -581,27 +581,58 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
-	if (unlikely(err))
-		return err;
-
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
 		return -EREMCHG;
 	}
+
+	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
+
+	config->num_ctxs = num_ctxs;
+
+	return config->num_ctxs ? 0 : -ENODATA;
+}
+
+static int vf_get_dbs_cfg(struct xe_gt *gt)
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
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
 		return -EREMCHG;
 	}
 
-	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
+	xe_gt_sriov_dbg_verbose(gt, "DBs %u\n", num_dbs);
 
-	config->num_ctxs = num_ctxs;
 	config->num_dbs = num_dbs;
 
-	return config->num_ctxs ? 0 : -ENODATA;
+	return 0;
+}
+
+static int vf_get_submission_cfg(struct xe_gt *gt)
+{
+	int err;
+
+	err = vf_get_ctxs_cfg(gt);
+	if (unlikely(err))
+		return err;
+
+	err = vf_get_dbs_cfg(gt);
+	if (unlikely(err))
+		return err;
+
+	return 0;
 }
 
 static void vf_cache_gmdid(struct xe_gt *gt)
-- 
2.53.0

