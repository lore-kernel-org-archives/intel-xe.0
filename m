Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99550D5D68A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 21:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F3310E8F4;
	Thu,  7 Nov 2024 21:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhcdTAj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73FC10E8F4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731015523; x=1762551523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jleXRd965a8KsqF2KVhK1Qn89VuTKGPppsvcNP2qlK4=;
 b=lhcdTAj8kv968bSxzEtKBuTGenEA1rPZ5py9It4vRAHt3guhZwIzlyg7
 BdO0rqA1BpAng78unl5PeP04JvR5O2XQxrOxWxsgXMFB1pYoPFR9CUzIN
 M1T0Xo3DWO4+ZCA1sVqiJhfaiCC2TUQNQe3lvctHmkBFUgOiZQtIQLXr8
 DFOL4E264+zyxbaDSXVgZXOpKO0/LN9enLnFnZvgEtA3g23oAxaH/OrDS
 U2ZRebTKtVeNf+/Sl6NBx93FsSmzLCAZ0Nm/cX4PvIy2iXbqtAH78UuD2
 Sepb1AO7z085KTrs7fS2N2qX9olEIEdqr37XeMngCDa5zmTSZf81foQYG Q==;
X-CSE-ConnectionGUID: 8aeOMpIjQ3qYR7Isa5VxOw==
X-CSE-MsgGUID: StIGZNHdQCmBvLmJHt3u+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30841308"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30841308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 13:38:43 -0800
X-CSE-ConnectionGUID: CuUrkIJ4TzOJgP85g4AhnQ==
X-CSE-MsgGUID: Kx16N8KySj+7U2RJJE/FIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="89195605"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 13:38:42 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v2] drm/xe/guc: Remove duplicate source field
Date: Thu,  7 Nov 2024 13:38:41 -0800
Message-Id: <20241107213841.436384-1-zhanjun.dong@intel.com>
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

xe_hw_engine_snapshot.source save the information of where data copied
from. Because the 'source' field is already populated inside
'matched_node' ptr hanging off xe_devcoredump_snapshot, which happenned
either in guc_capture_extract_reglists or xe_engine_manual_capture, we
can remove this redundant copy of 'source' from xe_hw_engine_snapshot.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
 v2:- Update commit message
---
 drivers/gpu/drm/xe/xe_guc_capture.c     | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c       | 2 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index cc72446a5de1..e15cf4600c7d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1759,7 +1759,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 	if (!devcore_snapshot->matched_node)
 		return;
 
-	xe_gt_assert(gt, snapshot->source <= XE_ENGINE_CAPTURE_SOURCE_GUC);
 	xe_gt_assert(gt, snapshot->hwe);
 
 	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
@@ -1768,7 +1767,8 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		   snapshot->name ? snapshot->name : "",
 		   snapshot->logical_instance);
 	drm_printf(p, "\tCapture_source: %s\n",
-		   snapshot->source == XE_ENGINE_CAPTURE_SOURCE_GUC ? "GuC" : "Manual");
+		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
+		   "GuC" : "Manual");
 	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..8bff624f78d2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -872,7 +872,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
 			struct xe_devcoredump *coredump = &xe->devcoredump;
 
 			coredump->snapshot.matched_node = node;
-			snapshot->source = XE_ENGINE_CAPTURE_SOURCE_GUC;
 			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
 			return snapshot;
 		}
@@ -880,7 +879,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
 
 	/* otherwise, do manual capture */
 	xe_engine_manual_capture(hwe, snapshot);
-	snapshot->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
 	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
 
 	return snapshot;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 719f27ef00a5..e14bee95e364 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -165,8 +165,6 @@ enum xe_hw_engine_snapshot_source_id {
 struct xe_hw_engine_snapshot {
 	/** @name: name of the hw engine */
 	char *name;
-	/** @source: Data source, either manual or GuC */
-	enum xe_hw_engine_snapshot_source_id source;
 	/** @hwe: hw engine */
 	struct xe_hw_engine *hwe;
 	/** @logical_instance: logical instance of this hw engine */
-- 
2.34.1

