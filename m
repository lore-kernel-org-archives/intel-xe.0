Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE6C07CB1
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2284110E2B1;
	Mon, 27 Nov 2023 14:04:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0010E2AA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701093867; x=1732629867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LJ+XheJLgsGlOXd1JHKtNA9SBlbUCJmkm/K7YqvMBOo=;
 b=bjWPxKt/8Mswdo1sde9OE8Txt3ZKe2YG0QfwQyxxR0PSklKv7xVy8eQj
 X39MTH7Hq0dsLlbPHqhfBJvhN8hVRLP4SGGU55W5KEPQnHtjcRIE3aOGa
 b8So3RiFOD6fzfX4Jurm5ChMWtsfkDLt/3RkIsteH1dqEMnnYhgqS0t1Y
 gEvgqOH3oyXQA4q7heSuNgXHV/6lrlFEMywd8zAlBaGHI7E92xNcP10SR
 L50Py+nlGLn0zcLMFNsdraZw8aJYBiZ7e/pLGuiOas7br55GpSjfSN2FB
 n6Kiy8c7HCxFT3ABVDrRlrmpztL4NGsKSVqvXMM3pt7BC9h4vhxpMlJFx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="457039812"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457039812"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761604459"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761604459"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:17 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 19:41:20 +0530
Message-Id: <20231127141125.2913415-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/8] RFC drm/xe/guc: Expose engine busyness only
 for supported GuC version
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

Engine busyness is supported only on GuC versions >= 70.11.1.
Allow enabling/reading engine busyness only on supported
GuC versions. Warn once if not supported.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 92b37e55fa08..611bafd14d1a 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -22,6 +22,23 @@
  * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
  */
 
+static bool guc_engine_busyness_supported(struct xe_guc *guc)
+{
+	struct xe_uc_fw *uc_fw = &guc->fw;
+
+	/* Must not call this before the submit version is determined! */
+	XE_WARN_ON(guc->submission_state.version.major == 0);
+
+	if (uc_fw->major_ver_found >= 70 && uc_fw->minor_ver_found >= 11 &&
+	    uc_fw->patch_ver_found >= 1)
+		return true;
+
+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
+			 "Engine busyness not supported in this GuC version\n");
+
+	return false;
+}
+
 static void guc_engine_busyness_usage_map(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
 					  struct iosys_map *engine_map)
@@ -79,6 +96,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return;
+
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
@@ -103,6 +124,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
 
 	return ticks_engine;
@@ -126,6 +151,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
 	u32 size;
 	int err;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return 0;
+
 	/* Initialization already done */
 	if (guc->busy.bo)
 		return 0;
-- 
2.40.0

