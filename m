Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E652C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 16:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A38B10EA0C;
	Mon,  4 Mar 2024 16:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6y3pnkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36E10EA0C
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709569588; x=1741105588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q3mEAxEDg6L1SoFQxG1tR0DfNukSQxxvKkVGk2k7H98=;
 b=I6y3pnkZL+V25XU5JVqlpS535e7KdpgYSvcqPJHXu6/gKqoG8osZDwRX
 /LZTMz7B3k2YjP/U+OFMB5TsYQfVxgRlX79YEdfTQHCVRcZ+h/06XPpsh
 ayz8Zr7T7ICF0mZ+GA+MyC8DCpMbdWuO1MfJ52Iq4Z6hGZCfJnp2MzuTl
 miu7TQI0TZrAK1zYPEN3PS+0m/p4Sg4DgV2wxjFLVYD//kuDjZibF6xuj
 3XdTVyJ4KvEkAI7Ypd05cjh+JIjMuYDQmjEIa1Lav/aiGyplWQniJyvI3
 X5wYl7cCmAgbxCSgA6yx0O0uJhSv5UKrY65mcqfxovwszdIIi0CP43Fbb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3934727"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3934727"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13547242"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:26:27 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/guc: Don't support older GuC 70.x releases
Date: Mon,  4 Mar 2024 08:26:16 -0800
Message-ID: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Supporting older GuC versions comes with baggage, both on the coding
side (due to interfaces only being available from a certain version
onwards) and on the testing side (due to having to make sure the driver
works as expected with older GuCs).
Since all of our Xe platform are still under force probe, we haven't
committed to support any specific GuC version and we therefore don't
need to support the older once, which means that we can force a bottom
limit to what GuC we accept. This allows us to remove any conditional
statements based on older GuC versions and also to approach newer
additions knowing that we'll never attempt to load something older
than our minimum requirement.

As an initial value, the minimum expected version is set to 70.19,
which is the version currently in the firmware table, but the
expectation is that this will be bumbed every time we update the
table, until we remove the force probe.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
 drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0d2a2dd13f11..ba2ca6895917 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -133,15 +133,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 	return flags;
 }
 
-#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
-
 static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_uc_fw *uc_fw = &guc->fw;
-	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
-
 	u32 flags = 0;
 
 	if (XE_WA(gt, 22012773006))
@@ -171,13 +166,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 1509372804))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
-	if (XE_WA(gt, 14018913170)) {
-		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
-			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
-		else
-			drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version expected >= 70.7.0, found %u.%u.%u\n",
-				version->major, version->minor, version->patch);
-	}
+	if (XE_WA(gt, 14018913170))
+		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
 	return flags;
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7751d6ba6ce0..fa06b57d2af5 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -297,36 +297,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
 }
 
-static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
+static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 {
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
 	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
 
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
-	xe_gt_assert(gt, release->major >= 70);
-
-	if (release->major > 70 || release->minor >= 6) {
-		/* v70.6.0 adds CSS header support */
-		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-						 css->submission_version);
-		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-						 css->submission_version);
-		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
-						 css->submission_version);
-	} else if (release->minor >= 3) {
-		/* v70.3.0 introduced v1.1.0 */
-		compatibility->major = 1;
-		compatibility->minor = 1;
-		compatibility->patch = 0;
-	} else {
-		/* v70.0.0 introduced v1.0.0 */
-		compatibility->major = 1;
-		compatibility->minor = 0;
-		compatibility->patch = 0;
+
+	/* We don't support GuC releases older than 70.19 */
+	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
+		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
+			  release->major, release->minor);
+		return -EINVAL;
 	}
 
+	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
+	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
+	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
+
 	uc_fw->private_data_size = css->private_data_size;
+
+	return 0;
 }
 
 int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
@@ -425,7 +417,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
 
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
-		guc_read_css_info(uc_fw, css);
+		return guc_read_css_info(uc_fw, css);
 
 	return 0;
 }
-- 
2.43.0

