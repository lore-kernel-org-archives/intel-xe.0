Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986A9C04A94
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 21:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A26C10E155;
	Wed,  2 Aug 2023 21:26:57 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F9210E155
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 21:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691011615; x=1722547615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b+RRWPtFyecgf+rYIk7WurRVDZMWUtkId1qNKUl/AVw=;
 b=IH9mfbcEcIy4fn0UjWU+Teo75S90/UgiYkXdm/i4ckFGh1+l2/O8Tavp
 5+jauCseJAhxa2flrkEdLiZgFYnUpv5Axr0iJfygXz78ElZaZsmSeCW2n
 re2lPcS532F0w+89yolvs6ySRS4dcybhxJBP4JqRuDHVskcoQpcA3pi+C
 U9/HbInVtMJmzHmhrqkC9fnNjg8Efz8kTRp35Na+oHeDPJkd8fl8AjTyS
 A693AcZJH1x9rFTKi2qENDrjaDbe6xNWChzohfJGifuICRboxd3JPJ3NL
 g99MUWC9p4MOGCCw27NtUK+/G8PfoQkhUGpGcns5rJ7gpNjBA0jNqWv8L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="359746642"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="359746642"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 14:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799268039"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="799268039"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 14:26:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  2 Aug 2023 14:26:45 -0700
Message-ID: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
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
index 2493c5859948..7cef5dcf571e 100644
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
index 2e70dd4880f6..fd53ef9e5c99 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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

