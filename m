Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC19C64EB4
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 21:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F5210E02F;
	Thu, 17 Aug 2023 21:30:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818E10E02F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692307833; x=1723843833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/6QK4w53FtJDuqyprsFZUp0Xfa76HgTWeZq2kt31HB0=;
 b=hyG35sf37AtLN6V4vWuNRZ43q3c0sD5CNZmvecjw4ykdETrv2GuvXwze
 gN6Ihf8qIeRHzWAjw9cAqXkdkPeNFKBRL+qZCmIub0HYOOdQN/LG5qzZ5
 AJeFWmoiCekYd3MrEISicwUoamozdEepWnYxqlJCL2o1L9cWwdq3SZvht
 fHEws7BJg1ZknrCAiLhjrNIdbSwMJqPsWWCYKdkSnMA3E8fI3J42fqieQ
 9nJUY0t71swo4iUOcMK1zqxnGOgT75h6kAM3t5CyBEhw0k/x/rziUxSJs
 +Srz0JbITaBl/KUIBDJGvCPlHaHrKPUrRdI1eVWFP5oivqFd4ThOlRzRM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459295688"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="459295688"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 14:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908583169"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="908583169"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 14:30:32 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 14:30:28 -0700
Message-Id: <20230817213028.838531-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware init
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

Add patch version info on GuC firmware init. This is required info for
GuC log decoder.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 13 +++++++------
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  2 ++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6c95a3e4c3f2..2111b3ef4975 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -403,11 +403,12 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 					   css->sw_version);
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
+	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
+					   css->sw_version);
 
-	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
-		 xe_uc_fw_type_repr(uc_fw->type),
-		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
-		 uc_fw->path);
+	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
+		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
+		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
 
 	err = uc_fw_check_version_requirements(uc_fw);
 	if (err)
@@ -540,9 +541,9 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 	drm_printf(p, "\tstatus: %s\n",
 		   xe_uc_fw_status_repr(uc_fw->status));
-	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
+	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u.%u\n",
 		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
-		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
+		   uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
 	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
 	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 837f49a2347e..444bff83cdbe 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -106,6 +106,8 @@ struct xe_uc_fw {
 	u16 major_ver_found;
 	/** @minor_ver_found: major version found in firmware blob */
 	u16 minor_ver_found;
+	/** @patch_ver_found: patch version found in firmware blob */
+	u16 patch_ver_found;
 
 	/** @rsa_size: RSA size */
 	u32 rsa_size;
-- 
2.34.1

