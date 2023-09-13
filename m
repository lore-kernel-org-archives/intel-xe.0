Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC6CEE0211
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C6C10E1F7;
	Wed, 13 Sep 2023 22:32:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2D910E1DD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644360; x=1726180360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8ZkaFPwPD2Xw2zTkdK0ZZOV5OhLBvdyfxF3PL1wnwg=;
 b=Rgcc9nkqYWKjM4hv/sDRLATWnxF7rm3j7OBq2ZLith8Ea+JyZoVJT10z
 IwBjjQ2X6FYoAc9m6dtHjal+M5tMvm1t7RuGvwF4wtnEcQJdFLskZt4b4
 8KkgQgOQl7ZZbZGUn14BYcq/noGrdyIgtRldCQ8oN/RXiytsePcVp0Dh8
 K8vX+iKohYndp3ZqblNKSf9EROV8EJBohI7krmfIZwgZBBy5ZQTCmihF1
 U+ZuST5yNqNZOwx7GhQ3tllH8pbU7+SkYF6BYRprYU3Gwjj3Pm1tu/YdJ
 R0saXnzM9mcRTVe0sELrjKawTkkgMyXdC8stjGurzCLR7uDR+f3N+a6HQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442829032"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442829032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868004498"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="868004498"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:39 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 15:32:27 -0700
Message-ID: <20230913223228.2788706-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
References: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe/uc: Fix uC status tracking
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

The current uC status tracking has a few issues:

1) the HuC is moved to "disabled" instead of "not supported"

2) the status is left uninitialized instead of "disabled" when the
   modparam is used to disable support

3) due to #1, a number of checks are done against "disabled" instead of
   the appropriate status.

Address all of those by making sure to follow the appropriate state
transition and checking against the required state.

v2: rebase on s/guc_submission_enabled/uc_enabled/

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c   |  3 +++
 drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
 drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
 drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5d32bcee28b6..b95f27a506d4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -241,6 +241,9 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	if (!xe_uc_fw_is_enabled(&guc->fw))
+		return 0;
+
 	ret = xe_guc_log_init(&guc->log);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 177cda14864e..35e2fdd07f69 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -42,22 +42,21 @@ int xe_huc_init(struct xe_huc *huc)
 	if (ret)
 		goto out;
 
+	if (!xe_uc_fw_is_enabled(&huc->fw))
+		return 0;
+
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	return 0;
 
 out:
-	if (xe_uc_fw_is_disabled(&huc->fw)) {
-		drm_info(&xe->drm, "HuC disabled\n");
-		return 0;
-	}
 	drm_err(&xe->drm, "HuC init failed with %d", ret);
 	return ret;
 }
 
 int xe_huc_upload(struct xe_huc *huc)
 {
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return 0;
 	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
 }
@@ -69,7 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
 	struct xe_guc *guc = huc_to_guc(huc);
 	int ret;
 
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return 0;
 
 	XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
@@ -106,7 +105,7 @@ int xe_huc_auth(struct xe_huc *huc)
 
 void xe_huc_sanitize(struct xe_huc *huc)
 {
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return;
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
 }
@@ -118,7 +117,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 
 	xe_uc_fw_print(&huc->fw, p);
 
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index f3c1f2adf148..bdbb720029b3 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+	/*
+	 * We call the GuC/HuC init functions even if GuC submission is off to
+	 * correctly move our tracking of the FW state to "disabled".
+	 */
 
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
@@ -43,6 +44,9 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return 0;
+
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2f42f1bc89a..015af1e20490 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -340,17 +340,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	XE_WARN_ON(uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
-	xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
 			       XE_UC_FIRMWARE_SELECTED :
-			       XE_UC_FIRMWARE_DISABLED :
 			       XE_UC_FIRMWARE_NOT_SUPPORTED);
 
-	/* Transform no huc in the list into firmware disabled */
-	if (uc_fw->type == XE_UC_FW_TYPE_HUC && !xe_uc_fw_is_supported(uc_fw)) {
+	if (!xe_uc_fw_is_supported(uc_fw))
+		return 0;
+
+	if (!xe_device_uc_enabled(xe)) {
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
-		err = -ENOPKG;
-		return err;
+		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
+		return 0;
 	}
+
 	err = request_firmware(&fw, uc_fw->path, dev);
 	if (err)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 9a85bcc18830..bf85d4fa56cc 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -139,8 +139,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 {
 	u32 base = wopcm->guc.base;
 	u32 size = wopcm->guc.size;
-	u32 huc_agent = xe_uc_fw_is_disabled(&gt->uc.huc.fw) ? 0 :
-		HUC_LOADING_AGENT_GUC;
+	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
 	u32 mask;
 	int err;
 
-- 
2.41.0

