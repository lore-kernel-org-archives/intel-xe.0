Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEDEC3DA6D
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176510E978;
	Thu, 15 May 2025 22:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j42qVFhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5510E976
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747347516; x=1778883516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Io9OpDzo0JqLqM7B5YRh+pKwW7IoRWsB25UE0kddIqE=;
 b=j42qVFhNNDcFkTtVXAP5hfZCgb36mUN7cc30YGr7oEHs2dSDaCTsCZd+
 2aKzq7qQLUSwAHI3Pb3/F25hOY49xG17XfSp7zvDMQffYhhZgdwDfq9jj
 bKZO4EIndN6FcR71TbcD7uCgjokZ8eRr9UqCzvmPoYTZLHMgTiWKFNBKb
 9uXSLiLtX8hV+WZEzgl/smxoE5/KQKqzUN5bSIxt9scks+/4hcxc0ewSK
 CYJKkVcV4avPXt4GSyOrPWEbuhVuZMIxAZkixIoYv9z9v8ET1KZvWr8y6
 /dlV2UkJIYOCbCW6Ne7t1Fcsz5Y7sSVCZsD7aOaKs7DqzowyyJszbtn6W g==;
X-CSE-ConnectionGUID: oirTNWbTTSCqPQNKXgq6KQ==
X-CSE-MsgGUID: vX+pGZzhR5CN1xp+HUW0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49237271"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49237271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:18:34 -0700
X-CSE-ConnectionGUID: en4VHVk2QuCtya9u6Xc8nw==
X-CSE-MsgGUID: prP4893MQzCRqP7REKBTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138242848"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 15 May 2025 15:18:32 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not enabled
Date: Fri, 16 May 2025 00:18:22 +0200
Message-Id: <20250515221827.1493032-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515221827.1493032-1-tomasz.lis@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

The RESFIX state should be achievable only when CTB communication is
enabled. If CTB was disabled and we still got it, then either we're
dealing with unclean initial state, or the driver is not currently
functional. In these cases, exit the RESFIX state by reset.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..b9af112ca771 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
 #include "xe_mmio.h"
@@ -932,6 +933,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 
+	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
+		/*
+		 * If at driver init, ignore migration which happened
+		 * before the driver was loaded.
+		 */
+		xe_sriov_vf_post_migration_reset_guc_state(xe);
+		return;
+	}
+
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
 	 * We need to be certain that if all flags were set, at least one
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2674fa948fda..099a395fbf59 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -134,6 +134,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
+/**
+ * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
+ * @xe: the &xe_device struct instance
+ *
+ * This function sends VF state reset to GuC, as a way of exiting RESFIX
+ * state if a proper post-migration recovery procedure has failed.
+ */
+void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_gt_reset_async(gt);
+}
+
 /**
  * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
  * @xe: the &xe_device struct instance
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 7b8622cff2b7..ba846af34a13 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -10,5 +10,6 @@ struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
+void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
 
 #endif
-- 
2.25.1

