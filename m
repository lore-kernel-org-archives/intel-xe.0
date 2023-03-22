Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF52C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 23:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F910E41D;
	Wed, 22 Mar 2023 23:24:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FBF10E41D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679527493; x=1711063493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rYVFUYPy0NQfoxuWZGePsdyr3XPavGokbfm7mX04vqc=;
 b=Q4GOWd7MMPLHOz9yHeHHfsOoNfkslbZYAbX7u/RFLy6shs3P0bE+OMd2
 y4ZaAEyg1iZrAcCpualihBvhSFG0NDX2hMX6Op9EuyW90aQ6swOTuDvM1
 pu0e27tSeeCaVfB6jJvvThe2KU8eTZQJH5LQ9Fs0hZO2CQJYKuZLHf1D6
 IAifgcG6CFSkK8qpVd4hGoKZI5dDoei9C9yWF543bbKPXkTmpTyThdwe5
 Kz9tfDDpi2a7m3xwr+Dtbzzulm/1c9tg+5pYAq479S49b7s6QzA/mYSMU
 AQL3u56Ad34FVHQDWP7WKIB2zbNNXuonL2RPDzSuc+ud2uJ7o9d7jtATS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401922723"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="401922723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632149517"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="632149517"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:53 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:28:10 -0700
Message-Id: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow the new direction of firmware and add macro
support for loading unversioned HuC. Keep HuC
versioned loading support as well for platforms
that fall under force_probe support

Add check to ensure driver does not do any version check
for HuC if going through unversioned load.

v2: unversioned firmware to be the default for platforms
not under force_probe. Maintain versioned firmware macro support
for platforms under force-probe protection.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 43 +++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 00408f1b73e1..4ade5b1b6d31 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -50,15 +50,19 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
 
-#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
-	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
-	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
+#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
+	fw_def(DG1,          0, huc_def(dg1)) \
+	fw_def(TIGERLAKE,    0, huc_def(tgl))
 
 #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
 	"i915/" \
 	__stringify(prefix_) "_" name_ "_" \
 	__stringify(major_) ".bin"
 
+#define __MAKE_HUC_FW_PATH(prefix_, name_) \
+        "i915/" \
+        __stringify(prefix_) "_" name_ ".bin"
+
 #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
         "i915/" \
        __stringify(prefix_) name_ \
@@ -69,15 +73,19 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 #define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
 	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
 
-#define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
-	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
+#define MAKE_HUC_FW_PATH(prefix_) \
+	__MAKE_HUC_FW_PATH(prefix_, "huc")
+
+#define MAKE_HUC_FW_VERSION_PATH(prefix_, major_, minor_, patch_) \
+	__MAKE_UC_FW_PATH(prefix_, "huc", major_, minor_, patch_)
+
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FW(platform_, revid_, uc_) \
 	MODULE_FIRMWARE(uc_);
 
 XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
-XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH)
+XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH, MAKE_HUC_FW_VERSION_PATH)
 
 /* The below structs and macros are used to iterate across the list of blobs */
 struct __packed uc_fw_blob {
@@ -93,9 +101,12 @@ struct __packed uc_fw_blob {
 	UC_FW_BLOB(major_, minor_, \
 		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
 
-#define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
+#define HUC_FW_BLOB(prefix_) \
+	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
+
+#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
 	UC_FW_BLOB(major_, minor_, \
-		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
+		   MAKE_HUC_FW_VERSION_PATH(prefix_, major_, minor_, bld_num_))
 
 struct __packed uc_fw_platform_requirement {
 	enum xe_platform p;
@@ -122,7 +133,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
 	};
 	static const struct uc_fw_platform_requirement blobs_huc[] = {
-		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
+		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_VERSION_BLOB)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
@@ -299,15 +310,17 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
 
-	if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
-	    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
-		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
-			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
+	if (uc_fw->major_ver_wanted) {
+		if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
+		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
+			drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
+				   uc_fw->major_ver_found, uc_fw->minor_ver_found,
+				   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
 		if (!xe_uc_fw_is_overridden(uc_fw)) {
 			err = -ENOEXEC;
 			goto fail;
+			}
 		}
 	}
 
-- 
2.25.1

