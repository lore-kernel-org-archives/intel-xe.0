Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91DC369A6
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 21:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5385D10E764;
	Tue,  8 Apr 2025 21:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWR98CkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94B810E760
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744147918; x=1775683918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LqQA6ije93d74UyuSJ/oLquDVTTXJedAYAP0MMWJc9o=;
 b=WWR98CkQ0twYWE5XKzHTHEjeProiHWSbwgpppB2IMF39i+dIu4qIsLd6
 pth5JHvejuAL03r3wJJHOc0CJONcVA32TgzjAcIUvCdkSSZYjuh8D3N8l
 rS6tW68Y7tGHk2xmBNASw16agfY0Cnbimw1PxDQHEcpjeQbxyOiBN8gy5
 vc9vAGQDduDXqhD7Z+l0ZK8QVH5FHMgQ8WRy7RNQwfb/Vxx5uC4+OF6mb
 gIuTwroEMSgDMRAPKYdBKev0fdk78NZl8pyT8lxBoWmPUce+a7unw/7Pw
 D0t9JQnIQf3TzY8tBKu5R5J8x+3bwzmBBFAlSM59mPUQmgdJT5HqKgAIa A==;
X-CSE-ConnectionGUID: /3I389X7TfS9RP9eCw0B7w==
X-CSE-MsgGUID: tHvRhuO1QZCgmmSoDsa0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44851478"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44851478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:58 -0700
X-CSE-ConnectionGUID: JMCuIvffQZm9ILQSLM1zNQ==
X-CSE-MsgGUID: XenVs/ZrRSKfYYd0ikUxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128923604"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 2/3] drm/xe/vf: Store the GuC FW info in guc->fw
Date: Tue,  8 Apr 2025 14:31:45 -0700
Message-ID: <20250408213146.793855-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
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

The GuC compatibility version that we read from the CSS header in
native/PF and the GuC VF version that we get when a VF handshakes with
the GuC are the same version number, so we should store it into the same
structure. This makes all the checks based on the compatibility version
automatically work for VFs without having to copy the value over.

For completion, also copy the wanted version and set the path to a known
string to indicate that the FW is PF-loaded. This way all the info will
be coherent when dumped from debugfs.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 42 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  4 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
 drivers/gpu/drm/xe/xe_uc_fw.c             | 46 +++++++++++++++++------
 4 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 68714e607b10..a1c025d7e6a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -173,6 +173,9 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
 	} else {
 		vf_wanted_guc_version(gt, &wanted);
 		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
+
+		/* First time we handshake, so record the minimum wanted */
+		gt->sriov.vf.wanted_guc_version = wanted;
 	}
 
 	err = guc_action_match_version(guc, &wanted, guc_version);
@@ -558,6 +561,40 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
+/**
+ * xe_gt_sriov_vf_guc_versions - Minimum required and found GuC ABI versions
+ * @gt: the &xe_gt
+ * @min: pointer to the xe_uc_fw_version to be filled with the min version
+ * @guc_version: pointer to the xe_uc_fw_version to be filled with the found version
+ *
+ * This function is for VF use only.
+ *
+ * Return: 0 if the versions are available, an errno value if the bootstrap
+ * failed
+ */
+int xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
+				struct xe_uc_fw_version *min,
+				struct xe_uc_fw_version *guc_version)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	int err;
+
+	if (!gt->sriov.vf.guc_version.major) {
+		xe_guc_comm_init_early(&gt->uc.guc);
+		err = xe_gt_sriov_vf_bootstrap(gt);
+		if (err)
+			return err;
+	}
+
+	if (min)
+		*min =  gt->sriov.vf.wanted_guc_version;
+
+	if (guc_version)
+		*guc_version = gt->sriov.vf.guc_version;
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_vf_lmem - VF LMEM configuration.
  * @gt: the &xe_gt
@@ -1095,6 +1132,7 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
 	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
 	struct xe_uc_fw_version ver;
 
@@ -1105,8 +1143,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 	vf_minimum_guc_version(gt, &ver);
 	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
 
-	vf_wanted_guc_version(gt, &ver);
-	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
+	drm_printf(p, "\twanted:\t%u.%u.%u.*\n",
+		   wanted->branch, wanted->major, wanted->minor);
 
 	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
 		   guc_version->branch, guc_version->major,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ba6c5d74e326..32ac8fa0d5fb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -11,6 +11,7 @@
 struct drm_printer;
 struct xe_gt;
 struct xe_reg;
+struct xe_uc_fw_version;
 
 int xe_gt_sriov_vf_reset(struct xe_gt *gt);
 int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
@@ -23,6 +24,9 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
+int xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
+				struct xe_uc_fw_version *min,
+				struct xe_uc_fw_version *actual);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index f1b5e523ddf0..da97e3351a13 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_runtime {
  * struct xe_gt_sriov_vf - GT level VF virtualization data.
  */
 struct xe_gt_sriov_vf {
+	/** @wanted_guc_version: minimum wanted GuC ABI version. */
+	struct xe_uc_fw_version wanted_guc_version;
 	/** @guc_version: negotiated GuC ABI version. */
 	struct xe_uc_fw_version guc_version;
 	/** @self_config: resource configurations. */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70d7b542f665..d913440fabf1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -16,6 +16,7 @@
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -665,6 +666,38 @@ do { \
 			  ver_->major, ver_->minor, ver_->patch); \
 } while (0)
 
+static int uc_fw_vf_override(struct xe_uc_fw *uc_fw)
+{
+	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
+	struct xe_uc_fw_version *compat = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	int err;
+
+	/* Only GuC/HuC are supported */
+	if (uc_fw->type != XE_UC_FW_TYPE_GUC && uc_fw->type != XE_UC_FW_TYPE_HUC)
+		uc_fw->path = NULL;
+
+	/* VF will support only firmwares that driver can autoselect */
+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
+			       XE_UC_FIRMWARE_PRELOADED :
+			       XE_UC_FIRMWARE_NOT_SUPPORTED);
+
+	if (!xe_uc_fw_is_supported(uc_fw))
+		return 0;
+
+	/* PF is doing the loading, so we don't need a path on the VF */
+	uc_fw->path = "Loaded by PF";
+
+	/* The GuC versions are set up during the VF bootstrap */
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
+		uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+		err = xe_gt_sriov_vf_guc_versions(uc_fw_to_gt(uc_fw), wanted, compat);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
@@ -683,17 +716,8 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 
 	uc_fw_auto_select(xe, uc_fw);
 
-	if (IS_SRIOV_VF(xe)) {
-		/* Only GuC/HuC are supported */
-		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
-		    uc_fw->type != XE_UC_FW_TYPE_HUC)
-			uc_fw->path = NULL;
-		/* VF will support only firmwares that driver can autoselect */
-		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
-				       XE_UC_FIRMWARE_PRELOADED :
-				       XE_UC_FIRMWARE_NOT_SUPPORTED);
-		return 0;
-	}
+	if (IS_SRIOV_VF(xe))
+		return uc_fw_vf_override(uc_fw);
 
 	uc_fw_override(uc_fw);
 
-- 
2.43.0

