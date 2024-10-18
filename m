Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A25CD3E18A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 22:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF40C10E9DB;
	Fri, 18 Oct 2024 22:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmPNC0Wo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E5B10E9DB
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729291409; x=1760827409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnm0SkcyMsHonwFdFQvXOTqGy6oixWBL+bvW6lc3D0k=;
 b=LmPNC0WoRjKTIjLnT6Z4jq7Wzo2fPNBP7cjdkLHwhScNGU3yriq5bKZ0
 LipP9QM9s8vJ+LXvGR2nMEZUzZsqCb7ADN9zh2K4HLu/asBgf4Cp19v5Q
 HKFkts5/jl0N99jTcm3ehZR/kTzoZq8Q9YOJiftdJ7aAP6VPuiy+Umq9r
 +MA0jXFrAIOeM9PC7TosSKUzsr0jFAjomhjCktsvUeWEjCObxs3HpMDaI
 mHvfezMEtcI+ov27LWmQ8IGQgKqiqAg7PIePIo54CuFW64pAl2P+RRrm1
 71CwnJRCnHEHyoNLIYciBeFjDISELUPf6+isnTAE3dgV4gpepbUc/ls93 g==;
X-CSE-ConnectionGUID: iKgMVjQsSXqEuKiKSnOctQ==
X-CSE-MsgGUID: iluGHdtPSY6UNYS52g2f0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="31699179"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="31699179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 15:43:28 -0700
X-CSE-ConnectionGUID: NEtp5JcFQOKxkfnTjjtoyQ==
X-CSE-MsgGUID: 9oiGRyPQTaqkzXSZv8Va5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79407466"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 15:43:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 1/1] drm/xe/guc: Prevent GuC register capture running on VF
Date: Fri, 18 Oct 2024 15:43:25 -0700
Message-Id: <20241018224325.130754-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018224325.130754-1-zhanjun.dong@intel.com>
References: <20241018224325.130754-1-zhanjun.dong@intel.com>
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

GuC based register capture is not supported by VF, thus prevent it
running on VF.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..5c0d9efaaab4 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1590,6 +1590,9 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 	u16 guc_id = 0;
 	u32 lrca = 0;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	new = guc_capture_get_prealloc_node(guc);
 	if (!new)
 		return;
@@ -1756,7 +1759,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 	devcoredump = &xe->devcoredump;
 	devcore_snapshot = &devcoredump->snapshot;
 
-	if (!devcore_snapshot->matched_node)
+	if (IS_SRIOV_VF(xe) || !devcore_snapshot->matched_node)
 		return;
 
 	xe_gt_assert(gt, snapshot->source <= XE_ENGINE_CAPTURE_SOURCE_GUC);
@@ -1820,7 +1823,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe))
+	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
@@ -1876,6 +1879,9 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
 		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
@@ -1922,6 +1928,9 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	if (n) {
 		guc_capture_remove_stale_matches_from_list(guc->capture, n);
 		guc_capture_free_outlist_node(guc->capture, n);
-- 
2.34.1

