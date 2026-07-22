Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE9C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31E10E45B;
	Wed, 22 Jul 2026 12:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCpWvIbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEE310E446
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784723632; x=1816259632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uzRhoHvixM1R/rVB9WxCsafoO0QynnvadiAcusH3jMQ=;
 b=SCpWvIbkRN1h2UN4P5v/nTuV1/V2DX2rLZcXuHvkQFBumln81Jn1IQLd
 62X/ln77xzIdHVCYA7FyoI5E0TO/s30hfBEhPdRkyWp21D+4nJA+ZysyA
 WOEnKCrJONqME6LaSII11vA+oKDpyjayiZUb5ESwFJD5QLanLbszKnQuT
 dCLzQ+rad7v7vf2NQFSFp6ER4B+nwS9eguKRrVOrBZ3/eWCpkIqdg0FfN
 DOa7SZQccpQ4A69nt/zXPxYosgc8sR9escdo0W6RaQKUT8vccPef/cKvy
 HFkSGpXx1VZE58lTqh3u0PKllgirxXhwwuj/vFwUr7l/OibojsTwi9oPb g==;
X-CSE-ConnectionGUID: Sc03QAGYR2GgElO7cgMJdA==
X-CSE-MsgGUID: dE+ZFw0wQEaAVQPNMMmILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96872760"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96872760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:33:51 -0700
X-CSE-ConnectionGUID: J75Txa6CTHSBk8BXOimulQ==
X-CSE-MsgGUID: pMaQZC0TQX2vEFppWkHWqg==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2026 05:33:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/3] drm/xe/vf: split submission config query helpers
Date: Wed, 22 Jul 2026 12:33:43 +0000
Message-ID: <20260722123342.339623-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
References: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
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
V1 -> V2:
- New change.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 49 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index df45cade937d..027c5a5f0748 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -571,11 +571,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
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
@@ -584,27 +584,58 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
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

