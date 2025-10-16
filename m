Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56233CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10D10E9C7;
	Thu, 16 Oct 2025 12:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6AFMJbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD5B10E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760616240; x=1792152240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ej+xh71eV8aKmaeX13dbbX/qwPdx6CoPYqMVBCMwjfM=;
 b=k6AFMJbFTQnz+azT/XhIJk2KaxSdxKP+iifXXgRqSqDbLxTPa1NR348t
 4QcjqEIvRJZsMwyBSX2I2Qi7X1zmseZnfI9MWFGyzsEDs0mWANx3bwPiZ
 qTYNGXdwm+ICIBV8JkY9GI7PKOWsKPLaN1lQL54+/8O6dqduhCvv63NjY
 j3i26hwLqj2qfqwqyw7CoOYX/k0FWrADUVNPvVPWiRGiZbXUPlvF1nFCT
 lD43Kscu8DuV8dk5mkUQnxFSeeBeLJq+oSp6G04Zc5qELI9yOxaSkcs6B
 Kzp/BnLd5VF1BmmtpxFFNeRSWjsvXje4qvkDj+gwL7qK9XCCFI9R+L3/c g==;
X-CSE-ConnectionGUID: WrG/WkKNRoCNbTHch5NWSw==
X-CSE-MsgGUID: njJ6AbRaRb6Q0UMt+HuFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62899713"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62899713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:04:00 -0700
X-CSE-ConnectionGUID: +WrsF7Y9Tlm7aDX8Qg1j1g==
X-CSE-MsgGUID: u5aiO8ceTKeP+1z46xPzyQ==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 05:03:58 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 2/5] drm/xe/vf: Fix GuC FW check for VF migration support
Date: Thu, 16 Oct 2025 14:05:08 +0200
Message-Id: <20251016120511.856792-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016120511.856792-1-tomasz.lis@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
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

v2: Use xe_sriov_vf_ccs_migration_bb_needed()

Tested-by: Matthew Brost <matthew.brost@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 41 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c         |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..34c68de6e2f3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -314,6 +314,47 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
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
+	if (xe_sriov_vf_ccs_migration_bb_needed(xe)) {
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

