Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52802C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF4C10EA5F;
	Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEBA10EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445787; x=1729981787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lc+sMJHy/naIl8BJQkRtMb2Ss9dNKWL1PZfV+w+8lLY=;
 b=ijzBO59iRhZmgY7LbvsxzbFosWBmRNbWeSfXtkHHBVNaSYH2j1I7qiGf
 i7v4JPhptoctSOdOiIdPVjdBQb3+Cov7WA8kVunEuWp7SNkMmRSK1sgfL
 tsg8rXQbEdmAB3VIBp61KAGg++ig8W2tLv4LOG5DSOBxzbh1KYNZvA4rX
 RMcTinPEWza+36YANXwoKvJ40J7J3rKSmoE6KwK44dQAtPB0vzP4agct/
 /tuURpyRK9UHBGA8kX+UC1JbJfOCOrcx8j/wHOAJw8svkWqwiEJui6Eli
 YHm+zEepfUNjyHDigzw2Cf+H4OvA6XQuhKiIS9S+pSXEyRY3qSUN2ZmMH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397794"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397794"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360388"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360388"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:26 -0700
Message-ID: <20231027222928.1981633-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/12] drm/xe/gsc: Define GSC FW for MTL
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

We track GSC FW based on its compatibility version, which is what
determines the interface it supports.
Also add a modparam override like the ones for GuC and HuC.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  5 +++++
 drivers/gpu/drm/xe/xe_module.h |  1 +
 drivers/gpu/drm/xe/xe_uc_fw.c  | 20 ++++++++++++--------
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7194595e7f31..8df7aea64ad5 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -41,6 +41,11 @@ module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(huc_firmware_path,
 		 "HuC firmware path to use instead of the default one - empty string disables");
 
+char *xe_gsc_firmware_path;
+module_param_named_unsafe(gsc_firmware_path, xe_gsc_firmware_path, charp, 0400);
+MODULE_PARM_DESC(huc_firmware_path,
+		 "GSC firmware path to use instead of the default one - empty string disables");
+
 char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
 module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index e1da1e9ca5cb..7f49f95630d5 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,4 +12,5 @@ extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
 extern char *xe_guc_firmware_path;
 extern char *xe_huc_firmware_path;
+extern char *xe_gsc_firmware_path;
 extern char *xe_param_force_probe;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f57476f57de9..c9360d918b96 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -121,6 +121,10 @@ struct fw_blobs_by_type {
 	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
 	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
 
+/* for the GSC FW we match the compatibility version and not the release one */
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0))
+
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
 
@@ -155,6 +159,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -196,23 +201,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 				     uc_fw_entry_mmp_ver,
 				     uc_fw_entry_no_ver)
 	};
+	static const struct uc_fw_entry entries_gsc[] = {
+		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
+	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
 		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
+		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
 	};
 	static const struct uc_fw_entry *entries;
 	enum xe_platform p = xe->info.platform;
 	u32 count;
 	int i;
 
-	/*
-	 * GSC FW support is still not fully in place, so we're not defining
-	 * the FW blob yet because we don't want the driver to attempt to load
-	 * it until we're ready for it.
-	 */
-	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
-		return;
-
 	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
@@ -248,6 +249,9 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
 	case XE_UC_FW_TYPE_HUC:
 		path_override = xe_huc_firmware_path;
 		break;
+	case XE_UC_FW_TYPE_GSC:
+		path_override = xe_gsc_firmware_path;
+		break;
 	default:
 		break;
 	}
-- 
2.41.0

