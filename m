Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A7BC54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4637210E178;
	Mon, 20 Nov 2023 21:28:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF40910E1B3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515681; x=1732051681;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GnknqieJTpekBubNGI/GBnfprImlwW6aE96b1ZX8K8U=;
 b=K3iB70wPrCIHusm+XcamS0zhQAywREw6pnV6qlk+nde/n1DvO9j2+uLW
 Zwo99hajhw8NGKo4trCAqoIFbaEv4qe/SgDefHYF58LLsL9CsowOD9HaL
 dM4m6/1dSaKMLo2tXahrUbwtfkFQC0d13h7gC4XqPwIJx0qpef/EDi2ko
 jHh4/X/VfuyXata6wlnXUrxdxm1iKr+62TJcCkA9VXOCu8Vnw+gcGHAvH
 o6dqcNmqum8rbmedOTJQJlq3nJpQ59p+KoalI/fj9huRT68zukQwBAGR+
 3BtrXZJy6zTRpTVMaf9y0ikl3ml1ECPE28xcAH8yziXSKV775v3Ad0l54 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13256895"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13256895"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883984480"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883984480"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:58 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:27:39 -0800
Message-ID: <20231120212741.2634679-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
References: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 10/10] drm/xe/gsc: Define GSC FW for MTL
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

v2: fix module param description (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  5 +++++
 drivers/gpu/drm/xe/xe_module.h |  1 +
 drivers/gpu/drm/xe/xe_uc_fw.c  | 20 ++++++++++++--------
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7194595e7f31..93b6bb23d4a6 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -41,6 +41,11 @@ module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(huc_firmware_path,
 		 "HuC firmware path to use instead of the default one - empty string disables");
 
+char *xe_gsc_firmware_path;
+module_param_named_unsafe(gsc_firmware_path, xe_gsc_firmware_path, charp, 0400);
+MODULE_PARM_DESC(gsc_firmware_path,
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
index 062fc1eb591c..36bf902ac459 100644
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

