Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4560C7618D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 23:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0910E689;
	Mon, 20 Mar 2023 23:49:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5A410E683
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679356180; x=1710892180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RP6jATTM/CPmFJC+VRGSF68hsPOy+vSwoop9w1jXgGI=;
 b=b9zKzSCSPD0Hm/REdU7oPPbAmmUX9r4PcFAWteJhmS7GHYOFV1mB9n/u
 6ZSBolVvZfj3YsrcF7ZJjeYgc/2RkY0fd2259YQI2kfguGFPc0ZhNYE/m
 bwqgZ6gn8qk0tDL25zFnDw05EpT7Z5lHc+CCEsJ348ngtSYLwExHy9AbK
 PQHRyon9WXprCpkv2ytEyhc/3SKj2LptyzFaLgXWkZYZLGyIega+FHXAU
 G6FfUXUFhpK8QyFy0mJ1rapyVBDkgrhJfQ3wv3O4RT8kuzSIzwK9JrPVO
 0YIdgrZWwMUVMkPWWzNau1FWhOoz1JV6c8j7LwJb9QkDr5pz5Cnv9nj/W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319202858"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="319202858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 16:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750314466"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="750314466"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 16:49:39 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Mar 2023 16:52:54 -0700
Message-Id: <20230320235254.3288679-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow the new direction of firmware and add macro
support for loading unversioned HuC.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2e5f7fbe9db..3c522d970228 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
 
-#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
+#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
 	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
 	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
 
@@ -59,6 +59,10 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	__stringify(prefix_) "_" name_ "_" \
 	__stringify(major_) ".bin"
 
+#define __MAKE_UC_FW_BLANK_PATH(prefix_, name_) \
+        "i915/" \
+        __stringify(prefix_) "_" name_ ".bin"
+
 #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
         "i915/" \
        __stringify(prefix_) name_ \
@@ -72,12 +76,15 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 #define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
 	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
 
+#define MAKE_HUC_FW_BLANK_PATH(prefix_) \
+	__MAKE_UC_FW_BLANK_PATH(prefix_, "huc")
+
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FW(platform_, revid_, uc_) \
 	MODULE_FIRMWARE(uc_);
 
 XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
-XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH)
+XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_BLANK_PATH, MAKE_HUC_FW_PATH)
 
 /* The below structs and macros are used to iterate across the list of blobs */
 struct __packed uc_fw_blob {
@@ -93,6 +100,9 @@ struct __packed uc_fw_blob {
 	UC_FW_BLOB(major_, minor_, \
 		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
 
+#define HUC_FW_BLOB_BLANK(prefix_) \
+	UC_FW_BLOB(0, 0, MAKE_HUC_FW_BLANK_PATH(prefix_))
+
 #define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
 	UC_FW_BLOB(major_, minor_, \
 		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
@@ -122,7 +132,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
 	};
 	static const struct uc_fw_platform_requirement blobs_huc[] = {
-		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
+		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB_BLANK, HUC_FW_BLOB)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
-- 
2.25.1

