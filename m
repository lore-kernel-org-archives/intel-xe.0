Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F7D29FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 23:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5D410E1D4;
	Wed,  6 Nov 2024 23:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DafoPatu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134710E1D4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 23:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730935675; x=1762471675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aewePGEd0C8neEtHiFOwp33MwaW7e3ZOjT7zLPRFQNA=;
 b=DafoPatuHg8ngEpFFRlshNqWik2LOGUjqAL+Uua5wUG5pFHKfky08Nk9
 bwqgDyR00C7TbngODiZmEEsklSvMARc1ujAoTji6UCcM5t0wwK1N/rwAc
 /4r1vfVz4VNZLVceINWdHWw9zcNV950nKb+ZrdyvSsInYsiDWVJuf3Pn2
 0V48bjJjgrbtAWUlGhqAEjq0FdEB5P1V4StWn8tgSycyMK6+aJFkRW5LK
 M59xuYxzfqoeXE4FE9OKAdHRu6nBExe0UT7ySeCpSw9cUuZOVjWL8wyym
 T2xG/L9S3wFqyOEYxKW177rcHEPs+RdjMeZNFcaUBsbVtJaPcUuxFifQd A==;
X-CSE-ConnectionGUID: FGMzyYPFR2yqRbSZJYoJYQ==
X-CSE-MsgGUID: LbU9VTatQF+GnHfoTBCHUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41313528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41313528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 15:27:55 -0800
X-CSE-ConnectionGUID: 8yA4AmALSZWL9bCHcSS2pQ==
X-CSE-MsgGUID: avhWYfX0TJybBt2C5yDsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84732724"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 15:27:54 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v1] drm/xe/guc: Remove duplicate source field
Date: Wed,  6 Nov 2024 15:27:52 -0800
Message-Id: <20241106232752.374240-1-zhanjun.dong@intel.com>
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
from. Because it should always equal to the source of the matched node,
this field is duplicate data, therefor could be optimized out.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
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

