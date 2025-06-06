Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860AC5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B710E3BB;
	Fri,  6 Jun 2025 00:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObuTX3ef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E96910E3BB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169110; x=1780705110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N2gBL+euoArzcWT64BAEvxDkMOFZhP5ZqjtBJIhrKDw=;
 b=ObuTX3efTmEfzZ9+0IeI3d79QhAjV2jJ/OlYRcAOAu3KDPv3lgm52y06
 M8i5SDC2ljuggNNLimqvxxVsnUuRL8MDsAJ/6eeQmJ9xtdCpRJ26bp9c1
 EnDVsWEqd/ofGCVV0CZhCTNPoM5QJxYOtp33W/3AuhPVuIaewd4NJckTZ
 03uF23Jgw4HEOdMnI/MGpza5FBbLHW7uSm6wAgyplQxmBeikHXtOGo+x3
 1f+w730hji5dDa65kyIFtuWF+wve8zvtgI6EddzuRfzHcQxQf8AUtsOFK
 WH0/ZZb+zHqdLQ8sS4AWBKTswbyYUHBiv/yaHc/MBcYI5wsYc0DkWtqf9 w==;
X-CSE-ConnectionGUID: iLAz7/FbSryAr9xT9Sljsg==
X-CSE-MsgGUID: N/DlFihqSdaC+VEnPKAvUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973473"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973473"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:30 -0700
X-CSE-ConnectionGUID: 6Sk/kjisT9eOX/c/FIPpGw==
X-CSE-MsgGUID: FtW8beUJSFehmGhIeF6FNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507870"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:28 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 2/8] drm/xe/vf: Finish RESFIX by reset if CTB not enabled
Date: Fri,  6 Jun 2025 02:18:17 +0200
Message-Id: <20250606001823.1010994-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606001823.1010994-1-tomasz.lis@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
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
Cc: Michal Winiarski <michal.winiarski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 792523cfa6e6..8fa210c0ef1a 100644
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
@@ -721,6 +722,16 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 
+	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
+		/*
+		 * If driver initialization is running in parallel to this handler,
+		 * ignore the migration which happened before the driver was loaded.
+		 * Force GuC to take the VF out of RESFIX state without any fixups.
+		 */
+		xe_sriov_vf_post_migration_reset_guc_state(xe);
+		return;
+	}
+
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
 	 * We need to be certain that if all flags were set, at least one
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 6526fe450e55..eff6c7b96f25 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -147,6 +147,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 		xe_sriov_info(xe, "migration not supported by this module version\n");
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

