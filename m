Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6FBC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D410E5DA;
	Wed, 29 Nov 2023 01:17:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CF210E5E4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220650; x=1732756650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpYNuT77WUI/ZQojXy8DTPSgrozVTNGe/198FCWrVww=;
 b=Z5iQg0vRgAF9awZqUKwq/DT89Cj1mLxi8d5Lv6NJiDNrCn6ip8wSSOiq
 ovHjBJEjHWDcVsIhGekw9MCCPhY45p32kNhjxB8d3+MG18bb86+LZ0gOA
 IUOaeYUMINUOiQ9bxPXIS57y8J6XpDwjPw+3J1j6WmCkeMNE1WHrhvaA4
 1gUwm9k7VlQLpb9wizJsmwO6HFeOeGSJvEooe4+roOO1VkoyeHazCN0wz
 PQOjLTcmMhXUvLnooH0yy2lin6btz+3UDhEQu9WnPs2bT25xI7KzJXrIe
 BG+JLzVbEKuSdWbF0XvvUrC/gpenKDb4NhNLVIA3CxwMys5HsaPiumeJL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6329497"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6329497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100322348"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100322348"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:29 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:17:18 -0800
Message-ID: <20231129011721.2793482-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
References: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/huc: Prepare for 2-step HuC
 authentication
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

Starting on MTL, the HuC is authenticated twice, once via GuC (same as
with older integrated platforms) and once via GSC; the first
authentication allows the HuC to be used for clear-media workloads,
while the second one unlocks support for protected content.
Ahead of adding the authentication flow via GSC, this patch adds support
for differentiating the 2 auth steps and checking if they're complete.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_huc.c           | 47 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_huc.h           |  8 ++++-
 drivers/gpu/drm/xe/xe_uc.c            |  2 +-
 4 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 9a84b55d66ee..9886ec9cb08e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -32,6 +32,8 @@
 #define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
 #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
 #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
+#define HECI_FWSTS5(base)				XE_REG((base) + 0xc68)
+#define   HECI1_FWSTS5_HUC_AUTH_DONE			REG_BIT(19)
 
 #define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 2f176badab26..9845165a819c 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -5,6 +5,7 @@
 
 #include "xe_huc.h"
 
+#include "regs/xe_gsc_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -71,7 +72,25 @@ int xe_huc_upload(struct xe_huc *huc)
 	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
 }
 
-int xe_huc_auth(struct xe_huc *huc)
+static const struct {
+	const char *name;
+	struct xe_reg reg;
+	u32 val;
+} huc_auth_modes[XE_HUC_AUTH_TYPES_COUNT] = {
+	[XE_HUC_AUTH_VIA_GUC] = { "GuC",
+				  HUC_KERNEL_LOAD_INFO,
+				  HUC_LOAD_SUCCESSFUL },
+	[XE_HUC_AUTH_VIA_GSC] = { "GSC",
+				  HECI_FWSTS5(MTL_GSC_HECI1_BASE),
+				  HECI1_FWSTS5_HUC_AUTH_DONE },
+};
+
+static bool huc_is_authenticated(struct xe_gt *gt, enum xe_huc_auth_types type)
+{
+	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
+}
+
+int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
 	struct xe_device *xe = huc_to_xe(huc);
 	struct xe_gt *gt = huc_to_gt(huc);
@@ -84,7 +103,7 @@ int xe_huc_auth(struct xe_huc *huc)
 	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
 
 	/* On newer platforms the HuC survives reset, so no need to re-auth */
-	if (xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO) & HUC_LOAD_SUCCESSFUL) {
+	if (huc_is_authenticated(gt, type)) {
 		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
 		return 0;
 	}
@@ -92,28 +111,36 @@ int xe_huc_auth(struct xe_huc *huc)
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
-	ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
-			      xe_uc_fw_rsa_offset(&huc->fw));
+	switch (type) {
+	case XE_HUC_AUTH_VIA_GUC:
+		ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
+				      xe_uc_fw_rsa_offset(&huc->fw));
+		break;
+	default:
+		XE_WARN_ON(type);
+		return -EINVAL;
+	}
 	if (ret) {
-		drm_err(&xe->drm, "HuC: GuC did not ack Auth request %d\n",
-			ret);
+		drm_err(&xe->drm, "Failed to trigger HuC auth via %s: %d\n",
+			huc_auth_modes[type].name, ret);
 		goto fail;
 	}
 
-	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
-			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
+	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
+			     huc_auth_modes[type].val, 100000, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
 		goto fail;
 	}
 
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
-	drm_dbg(&xe->drm, "HuC authenticated\n");
+	drm_dbg(&xe->drm, "HuC authenticated via %s\n", huc_auth_modes[type].name);
 
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "HuC authentication failed %d\n", ret);
+	drm_err(&xe->drm, "HuC: Auth via %s failed: %d\n",
+		huc_auth_modes[type].name, ret);
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index 5802c43b6ce2..b8c387f14b8e 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -10,9 +10,15 @@
 
 struct drm_printer;
 
+enum xe_huc_auth_types {
+	XE_HUC_AUTH_VIA_GUC = 0,
+	XE_HUC_AUTH_VIA_GSC,
+	XE_HUC_AUTH_TYPES_COUNT
+};
+
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
-int xe_huc_auth(struct xe_huc *huc);
+int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
 void xe_huc_sanitize(struct xe_huc *huc);
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 15dcd1f91e9c..68199ffa52b0 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -176,7 +176,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 		return ret;
 
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
-	ret = xe_huc_auth(&uc->huc);
+	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
 	xe_gt_assert(uc_to_gt(uc), !ret);
 
 	/* GSC load is async */
-- 
2.41.0

