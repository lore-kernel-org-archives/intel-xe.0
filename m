Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BDAC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 18:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76EE88697;
	Mon, 31 Jul 2023 18:56:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C5E88697
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690829798; x=1722365798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VFgn+EY8dIxDTuk3sjSNBRa+XhkdQWAY+1RlyXRkifA=;
 b=MeenHSGLqkuACPtc4erX5HdpzILwLFIlnROnwFqszcpaknl1WTdVc5is
 QXBNXQVwLrIpR5Kd2HWUxPCxzkrkMzQO06qxiNr6xc1T2vY7hlKU3CXXb
 KS2/BDEUFyyLVc6JZlVi568K3obJ6AtyybT3AVbzj10wnusLJhRd71xKc
 h+JJwe5d+5GsfBFBesHzMkFVVnJajVTh80lyZBZbqGUZSsPkWDGrvZjmz
 Zi+c2vYnQBaIJsgdEvdWON5SF1MAz/xVzo7M3N5B0dx2oGNPaAKCePGFK
 gs3NYpTTZqJXfWGA7zjE5eZ42ESK2lXHh0nGzZbmhMYpcrduYxTcPOJ9x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359138453"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="359138453"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722181876"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="722181876"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:56:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 11:56:30 -0700
Message-ID: <20230731185631.667472-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/uc: Fix uC status tracking
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c   |  3 +++
 drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
 drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
 drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8ae026838702..9a92d4bd331e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -228,6 +228,9 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	if (!xe_uc_fw_is_enabled(&guc->fw))
+		return 0;
+
 	ret = xe_guc_log_init(&guc->log);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 373a65c77946..b2f202fab4f4 100644
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
 
 	XE_BUG_ON(xe_uc_fw_is_running(&huc->fw));
@@ -107,7 +106,7 @@ int xe_huc_auth(struct xe_huc *huc)
 
 void xe_huc_sanitize(struct xe_huc *huc)
 {
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return;
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
 }
@@ -119,7 +118,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 
 	xe_uc_fw_print(&huc->fw, p);
 
-	if (xe_uc_fw_is_disabled(&huc->fw))
+	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..368e4feb57db 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
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
 
+	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+		return 0;
+
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index def19e64f2c1..729c7ed7d80d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	XE_BUG_ON(uc_fw->path);
 
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
+	if (!xe_device_guc_submission_enabled(xe)) {
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
index d9acf8783b83..23f274a00f50 100644
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

