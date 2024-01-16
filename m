Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DCFC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 13:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027F10E513;
	Tue, 16 Jan 2024 13:07:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6103F10E513
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410430; x=1736946430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mbdnnN4pCEGEAc+rY6qIIuR+m8TXtR8zRna0+FmHmMM=;
 b=mwHrqSQx9eYB/YYxIRoqEr8nNH3/CHdY6Lz7koAvnbd4qAXMCE3JLyVR
 G5su3b/Ko1LDQ4fvWXduy8cIuEz66v003pRl3LbAMuihhoFTHIdVdCPSK
 CAS7h0pOwE9Ulgbx17J2aLGllClNLD2DrPd0+hotJKGE6T7nNDk1r6a5a
 99JUGxnsxoyYeuAMoA8nwf+MtyAv/7Fl7VB6cHouDMgS0DxAkqQNFgMv7
 JCwOUqw3aD61OtsbLQkqh89YpPXtIUd44M59mLac3+ymTVIyTK6GuTtCe
 VuaANckHxhxlhMrJesDMUWcTtDiTIusUhchf+PABjwqaH46+aS6reWexK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="431020937"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="431020937"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="784120577"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="784120577"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:01 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Enable WA 14018913170
Date: Tue, 16 Jan 2024 18:44:45 +0530
Message-Id: <20240116131445.2376726-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GuC handles the WA, the KMD just needs to set the flag to enable
it on the appropriate platforms.

v2:
  - Fixed CI checkpatch warning, alignment should match open parenthesis.
  - Fixed GUC FW version check to use XE_UC_FW_VER_RELEASE which points to
    current GUC FW version instead of XE_UC_FW_VER_COMPATIBILITY which
    holds GUC FW I/F version (Badal).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 235d27b17ff9..635411e45194 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 	return flags;
 }
 
+#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+
 static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_uc_fw *uc_fw = &guc->fw;
+	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+
 	u32 flags = 0;
 
 	if (XE_WA(gt, 22012773006))
@@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 1509372804))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
+	if (XE_WA(gt, 14018913170)) {
+		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
+			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
+		else
+			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %us %us %us\n",
+				 version->major, version->minor, version->patch);
+	}
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dd5a88a7826..c281fdbfd2d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_WA_POLLCS			BIT(18)
 #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
+#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e73b84e01ea1..b138cbd51bdb 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -17,3 +17,8 @@
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
 14015076503	MEDIA_VERSION(1300)
 16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
+14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
+		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
+		GRAPHICS_VERSION_RANGE(1270, 1274)
+		MEDIA_VERSION(1300)
+		PLATFORM(DG2)
-- 
2.25.1

