Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1378DC53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E9310E85F;
	Tue, 28 Jul 2026 09:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZh41TDF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85310E85E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785232235; x=1816768235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eLPF0YRUX3RIyh9o21ijv4A4wLILUv+Fbxfxy43Xk+E=;
 b=JZh41TDFdX8A5CUoMcVUc1fd1OJ5hCdqZrLIwRAG3w3t5v/0NWmSqOVf
 YV2QatezGCvwfXWeC2BMX9j6gffOKyljE5J1QrNaWZJ6t2LqdR/uMp03P
 Z3zFpmgMtADd/wjwg2jej4Csvff441/PHG+NtmAHQdAKSt1yBTsnGd/Ds
 5VUlmv+pLdjPqap5mEmB9BLyN2kOwqTKZRtY6k5DGrfQOHlxOhnk4q/SL
 +150X6LWBRRS0i1IiFf5lVoxvkRyIsl3X9EbXJITV8dWGjentnLecd18t
 KB5AnOfmnh5ZaZYsjLETLg2aDoCVNCfbinDkvZrb7Pnzf7JSxCbJhVzds Q==;
X-CSE-ConnectionGUID: dcZNdFWVTyCitasOJWwSSA==
X-CSE-MsgGUID: ki7ruMPGT86nmBI1eGSAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111357400"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111357400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:50:35 -0700
X-CSE-ConnectionGUID: lx2nqCRwTUy886xiT5RxbA==
X-CSE-MsgGUID: 19pPn6mwSpyoEtrQ6fO57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258387253"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa010.jf.intel.com with ESMTP; 28 Jul 2026 02:50:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 2/4] drm/xe/vf: Split submission config query helpers
Date: Tue, 28 Jul 2026 09:50:28 +0000
Message-ID: <20260728095026.2197333-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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
index 37899fcf5b22..e96515766081 100644
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
+	return config->num_dbs ? 0 : -ENODATA;
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
2.43.0

