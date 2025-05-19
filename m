Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF46C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1D10E3DE;
	Mon, 19 May 2025 23:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRpFJy4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4C510E047
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747696774; x=1779232774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Io9OpDzo0JqLqM7B5YRh+pKwW7IoRWsB25UE0kddIqE=;
 b=lRpFJy4XfvV8sr0OvMEABH6qVDxM54TtCJG4FdmTikLuPG8FqddqkXXz
 ZICtcErVAYG5TYkkqGmQX05zZz+UqyTJQn1KnzjCyXJcuoYfxy05lK7GR
 aiYb9bedajyXarbGedrfjUYd379AtAeIkRtJ3a+pSczwnxa/+/V1l4bO+
 meGziPeYGNJormrgx6tTLkT5D0CRup6cIDw7qpxKuxd2hqAqO3ZquiuQw
 +p4dNn3TyUdFNqaGwi+5oebENXVwmLGAxO1BWPk3qKtjkdG2uaHKvQ3s9
 dZv7+8yCxMQSo1jugy6MG/Nxhzq5fzMOZwFN9/68zBiwOXHdxOiNlHDLj g==;
X-CSE-ConnectionGUID: udVHDQvjRMOsp3MwErdz5A==
X-CSE-MsgGUID: TUSyqYP4QeKfC1Kzh5A71A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49677818"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49677818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:19:34 -0700
X-CSE-ConnectionGUID: 22B9gRmhT6GsSUgLwgouOg==
X-CSE-MsgGUID: Lel4Smi/TyqOOY1e2i9+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140414086"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 May 2025 16:19:33 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not enabled
Date: Tue, 20 May 2025 01:19:20 +0200
Message-Id: <20250519231925.3196154-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519231925.3196154-1-tomasz.lis@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
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

