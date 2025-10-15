Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A4CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95310E6C2;
	Wed, 15 Oct 2025 00:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEV5Ag8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F8310E13D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760488005; x=1792024005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AO5GVf8NhXzvdto/jVy31PoWCNH5vf1CsJr8nCE9UBI=;
 b=AEV5Ag8LpsoWDTM8IIt1LcZYNYJVwSqLPjJlaqDlyH5lVNPeoYHT05Oh
 prstwvQyvhMjdyiiDnRRH6RTsNLiBXis3th2zyzzKpFSPx9CvRxfm1Anc
 arvPEoH6li+i9oOvFT94xyYye1BUTJpSpgBKT26UtwJvudVqSZqy0IoaS
 LUDz409cT4A5nxoGN098Gu2993fkuXF9WACw/lqh6tX0czhNziuo19shq
 0H5ZhGeKqNPhbiddu/cGi9N08aD7g+wwedRc6wogNu2Y3xya5WscctDgR
 e6NVE3Sy42Jmf4T3OLJCB8aJQPKocjRBQEvDzGJbZIrvU8IHOk6Jty3M+ A==;
X-CSE-ConnectionGUID: jnRUvjFJSRSuFrSWR80w6A==
X-CSE-MsgGUID: 8m+Umy1gSWqEEFXu+oTJsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62551493"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62551493"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:26:44 -0700
X-CSE-ConnectionGUID: EGamES8PRQufOlzZIw1yAA==
X-CSE-MsgGUID: AgaC5RoxQ5+iU+hGmOh5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181239933"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 17:26:43 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/4] drm/xe/vf: Fix GuC FW check for VF migration support
Date: Wed, 15 Oct 2025 02:27:52 +0200
Message-Id: <20251015002755.720992-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015002755.720992-1-tomasz.lis@intel.com>
References: <20251015002755.720992-1-tomasz.lis@intel.com>
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

The check was done before GuC ABI version could be acquired.
Comparing only to zeros provides very stable results, though
not the ones expected.

This change dislodged part of the VF migration support check
and moved it to after GuC handshake.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 44 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c         |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
 4 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..95c10de0732f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -314,6 +314,50 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va  = &va_args;
+	xe_gt_sriov_notice(gt, "migration disabled: %pV\n", &vaf);
+	va_end(va_args);
+
+	xe->sriov.vf.migration.enabled = false;
+}
+
+#define NEEDS_SW_CCS_MIGRATION_WA(xe) \
+	((xe)->info.platform == XE_PANTHERLAKE)
+
+/**
+ * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
+ * @gt: the &xe_gt struct instance linked to target GuC
+ *
+ * Performs late disable of VF migration feature in case GuC FW cannot support it.
+ */
+void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe_sriov_vf_migration_supported(xe))
+		return;
+
+	if (NEEDS_SW_CCS_MIGRATION_WA(xe)) {
+		struct xe_uc_fw_version guc_version;
+
+		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
+			return vf_disable_migration(gt,
+				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+				guc_version.major, guc_version.minor);
+	}
+}
+
 /**
  * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
  * @gt: the &xe_gt struct instance linked to target GuC
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..60a3b9b05b20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
+void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc..3c4e64233b3a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	xe_gt_sriov_vf_guc_check_migration_support(gt);
+
 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..5fb042c05112 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
 					    GRAPHICS_VER(xe));
 
-	if (!IS_DGFX(xe)) {
-		struct xe_uc_fw_version guc_version;
-
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
-		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
-			return vf_disable_migration(xe,
-						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
-						    guc_version.major, guc_version.minor);
-	}
-
 	xe->sriov.vf.migration.enabled = true;
 	xe_sriov_dbg(xe, "migration support enabled\n");
 }
-- 
2.25.1

