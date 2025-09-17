Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B35CAC59F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE2E10E63D;
	Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0kKnQ3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26B810E409
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080781; x=1789616781;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GNyMJ3tPDGVat9cNEZ/e8LMaWo77dnHJ8MU5SS51ykg=;
 b=c0kKnQ3y+nzIhCIFfg0qdYVGUxiSHMEuyOxc6XlB9+KXw7u+XKAIxgSb
 mf6ykiEzyKJHGSTdMj3jjGuSw9SLqKFenKEbyXAifEzno6lkVGtkbBFa2
 Pkk7Q5PjD1Kuzsaz8DPZYVq2qHPZmhghcp9CS3vuyCs45kG+8v9CUJ8MO
 X+n02gIiwfrLlgKzf5QQWgKago5v4VkmHl+bvZzWJDagO/Eji2F5BfG5U
 hvQtJ2MDLPnzrw5p1gGWIAD8ExHZwPjJcykhPcv9+8HQS5azQhAj9MWcC
 mmaWBC8vPgO5XfcObO04+hkWBMr3+RH0et+JgMNZUYMosAsu4I3pD0aa1 A==;
X-CSE-ConnectionGUID: fY/TAsQfQIqgpJgIwf7W8g==
X-CSE-MsgGUID: ptbGBL2KSrCKIp51VB6trw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060782"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060782"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:21 -0700
X-CSE-ConnectionGUID: 2DTHDHL2T16Ez0G54gVeKw==
X-CSE-MsgGUID: KXnK35BLTkKkP7C6xjacwQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/28] drm/xe/vf: Lock querying GGTT config during driver init
Date: Tue, 16 Sep 2025 20:45:48 -0700
Message-Id: <20250917034615.3977603-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

From: Tomasz Lis <tomasz.lis@intel.com>

Protect access to GGTT config as this is non-static information.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
 3 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0461d5513487..016c867e5e2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&config->lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->ggtt_size && config->ggtt_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
 				size / SZ_1K, config->ggtt_size / SZ_1K);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
@@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	config->ggtt_shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
+	err = config->ggtt_size ? 0 : -ENODATA;
 
-	return config->ggtt_size ? 0 : -ENODATA;
+out:
+	up_write(&config->lock);
+	return err;
 }
 
 static int vf_get_lmem_info(struct xe_gt *gt)
@@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&config->lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->lmem_size && config->lmem_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
 				size / SZ_1M, config->lmem_size / SZ_1M);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
 
 	config->lmem_size = size;
+	err = config->lmem_size ? 0 : -ENODATA;
 
-	return config->lmem_size ? 0 : -ENODATA;
+out:
+	up_write(&config->lock);
+	return err;
 }
 
 static int vf_get_submission_cfg(struct xe_gt *gt)
@@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&config->lock);
+
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
@@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	config->num_ctxs = num_ctxs;
 	config->num_dbs = num_dbs;
 
-	return config->num_ctxs ? 0 : -ENODATA;
+	err = config->num_ctxs ? 0 : -ENODATA;
+
+out:
+	up_write(&config->lock);
+	return err;
 }
 
 static void vf_cache_gmdid(struct xe_gt *gt)
@@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
  */
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	u16 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
 
-	return gt->sriov.vf.self_config.num_ctxs;
+	down_read(&config->lock);
+	xe_gt_assert(gt, config->num_ctxs);
+	val = config->num_ctxs;
+	up_read(&config->lock);
+
+	return val;
 }
 
 /**
@@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
 
-	return gt->sriov.vf.self_config.lmem_size;
+	down_read(&config->lock);
+	xe_gt_assert(gt, config->lmem_size);
+	val = config->lmem_size;
+	up_read(&config->lock);
+
+	return val;
 }
 
 /**
@@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
 
-	return gt->sriov.vf.self_config.ggtt_size;
+	down_read(&config->lock);
+	val = config->ggtt_size;
+	up_read(&config->lock);
+
+	return val;
 }
 
 /**
@@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
 
-	return gt->sriov.vf.self_config.ggtt_base;
+	down_read(&config->lock);
+	xe_gt_assert(gt, config->ggtt_size);
+	val = config->ggtt_base;
+	up_read(&config->lock);
+
+	return val;
 }
 
 /**
@@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
 s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	s64 val;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	return config->ggtt_shift;
+	down_read(&config->lock);
+	val = config->ggtt_shift;
+	up_read(&config->lock);
+
+	return val;
 }
 
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
@@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_read(&config->lock);
 	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
 		   config->ggtt_base,
 		   config->ggtt_base + config->ggtt_size - 1);
@@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
 	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
+	up_read(&config->lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 298dedf4b009..d95857bd789b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_SRIOV_VF_TYPES_H_
 #define _XE_GT_SRIOV_VF_TYPES_H_
 
+#include <linux/rwsem.h>
 #include <linux/types.h>
 #include "xe_uc_fw_types.h"
 
@@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u16 num_ctxs;
 	/** @num_dbs: assigned number of GuC doorbells IDs. */
 	u16 num_dbs;
+	/** @lock: lock for protecting access to all selfconfig fields. */
+	struct rw_semaphore lock;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..d6e2ed9b9bbc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
  */
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		init_rwsem(&gt->sriov.vf.self_config.lock);
+
 	vf_migration_init_early(xe);
 }
 
-- 
2.34.1

