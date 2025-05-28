Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B536AC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E519510E6D5;
	Wed, 28 May 2025 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvHRQLsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952310E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475765; x=1780011765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2FjPf1b+Yg5ivWj1D+tffEOpnTCERqwSBPOmM8VbhI=;
 b=FvHRQLsGGeDYwEphUuM3BefJF/4xAhveO7UqbErEmbNgsg5QG/MRbUAf
 j++96FHV3fW3ZIx1V8iv2KMt2GscdpKBy0Cl2Y3HvXlp3faAB1PVwMV1l
 hgDi7EQFzCLzmlFeWBPSjoGk4WtQ2wA7OgsrUyR1HjgcArvOGHiGrtTr5
 VIj3iqSjwjY5v6qBxIaT+RkbcHN/hsmsYq+0cYb12TfuJ+t/xbFcVgCNd
 04JbbwGLxaznJ61Et7l/JIBgnN7nvC1SW1Lsw+TKoqP1Qces0evpIpK7W
 okyXhaUg/eoMUTAMxQaRQGhZVLBZGXals1rQVLzer3ElGJUnk1rX2we9t g==;
X-CSE-ConnectionGUID: EjB+oToxQtiZ1na0AJ29Cw==
X-CSE-MsgGUID: BxM4OaFjQRGgC2XRdJlmkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50674868"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50674868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:45 -0700
X-CSE-ConnectionGUID: FW7365RsQrqBXTiYb6ochA==
X-CSE-MsgGUID: e1XRkLQZT36LAisew7/9zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148245551"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2 4/4] drm/xe/vf: Store the GuC FW info in guc->fw
Date: Wed, 28 May 2025 16:42:34 -0700
Message-ID: <20250528234229.4185039-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
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

v2: several code cleanups and style changes (Michal), rebase on
bootstrap changes.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 32 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  4 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c             | 37 ++++++++++++++++++-----
 4 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8aed27904c58..148076435a12 100644
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
@@ -265,6 +268,30 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_guc_versions - Minimum required and found GuC ABI versions
+ * @gt: the &xe_gt
+ * @min: pointer to the xe_uc_fw_version to be filled with the min version
+ * @found: pointer to the xe_uc_fw_version to be filled with the found version
+ *
+ * This function is for VF use only.
+ */
+void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
+				 struct xe_uc_fw_version *min,
+				 struct xe_uc_fw_version *found)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+
+	if (min)
+		*min =  gt->sriov.vf.wanted_guc_version;
+
+	if (found)
+		*found = gt->sriov.vf.guc_version;
+
+	return;
+}
+
 static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
@@ -1259,6 +1286,7 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
 	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
 	struct xe_uc_fw_version ver;
 
@@ -1269,8 +1297,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 	vf_minimum_guc_version(gt, &ver);
 	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
 
-	vf_wanted_guc_version(gt, &ver);
-	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
+	drm_printf(p, "\twanted:\t%u.%u.%u.*\n",
+		   wanted->branch, wanted->major, wanted->minor);
 
 	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
 		   guc_version->branch, guc_version->major,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a..a35576d1e5c6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -11,9 +11,13 @@
 struct drm_printer;
 struct xe_gt;
 struct xe_reg;
+struct xe_uc_fw_version;
 
 int xe_gt_sriov_vf_reset(struct xe_gt *gt);
 int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
+void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
+				 struct xe_uc_fw_version *min,
+				 struct xe_uc_fw_version *found);
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index d614acbe0b5f..ef041679e9d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -60,6 +60,8 @@ struct xe_gt_sriov_vf_runtime {
  * struct xe_gt_sriov_vf - GT level VF virtualization data.
  */
 struct xe_gt_sriov_vf {
+	/** @wanted_guc_version: minimum wanted GuC ABI version. */
+	struct xe_uc_fw_version wanted_guc_version;
 	/** @guc_version: negotiated GuC ABI version. */
 	struct xe_uc_fw_version guc_version;
 	/** @self_config: resource configurations. */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7b2d01d39b86..074e29057495 100644
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
@@ -665,6 +666,33 @@ do { \
 			  ver_->major, ver_->minor, ver_->patch); \
 } while (0)
 
+static void uc_fw_vf_override(struct xe_uc_fw *uc_fw)
+{
+	struct xe_uc_fw_version *compat = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
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
+		return;
+
+	/* PF is doing the loading, so we don't need a path on the VF */
+	uc_fw->path = "Loaded by PF";
+
+	/* The GuC versions are set up during the VF bootstrap */
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
+		uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+		xe_gt_sriov_vf_guc_versions(uc_fw_to_gt(uc_fw), wanted, compat);
+	}
+}
+
 static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
@@ -684,14 +712,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	uc_fw_auto_select(xe, uc_fw);
 
 	if (IS_SRIOV_VF(xe)) {
-		/* Only GuC/HuC are supported */
-		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
-		    uc_fw->type != XE_UC_FW_TYPE_HUC)
-			uc_fw->path = NULL;
-		/* VF will support only firmwares that driver can autoselect */
-		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
-				       XE_UC_FIRMWARE_PRELOADED :
-				       XE_UC_FIRMWARE_NOT_SUPPORTED);
+		uc_fw_vf_override(uc_fw);
 		return 0;
 	}
 
-- 
2.43.0

