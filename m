Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF7C5B554
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66DF10E6D1;
	Wed, 28 May 2025 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPDtVjvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFF810E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475764; x=1780011764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFk1u5Hhvf/JG4vF6rHPpFxdyD5uB8aavlSdd6DHo/I=;
 b=KPDtVjvzeKsCtcaikJDgWkiGr9BvICxlC39g+d7CRLAbKHQ/iGUZicZJ
 OlCSDylEOmXil76PTPLzBathGXWENS0YpIjL7v2FEiWNbMDSqrNCAAc3D
 Rf0VHLA7zaTFim/oX0JFPAkzUCQ5Nm/MbCeWqBKmHl/eRCUVwPf4EvGy4
 qbDPj//LZIWoagqNuybI/hMM/2FIxT8ezC3jdGKYabqlPajrLOm6lM0QG
 om6Ygr1gogYQ8jMZE5IKbJjIDT8TlNQTE35EtG4Cp0v3fpeUp9UALF7VL
 5z6oiXg25/Vmnuo7pEdwqtkWusXP3HyL01Mslpc+sbT+GB5myl4nOjEBG w==;
X-CSE-ConnectionGUID: HbvPKkHDQBOsMDfClWqy4Q==
X-CSE-MsgGUID: rt6bh7aYRwaBCPhfEDf7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50674863"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50674863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:44 -0700
X-CSE-ConnectionGUID: 2e4KhcGwTCyJTcfQv6PBvg==
X-CSE-MsgGUID: CNCyufxoSj6iTigcrtzcTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148245539"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2 3/4] drm/xe/vf: Use uc_fw_version to store the negotiated
 GuC ABI
Date: Wed, 28 May 2025 16:42:33 -0700
Message-ID: <20250528234229.4185039-9-daniele.ceraolospurio@intel.com>
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

Instead of using a VF-specific type, we can use the common uc_fw_version
structure. This also means that we can use the available macros to
compare ABI versions.

While at it, exit early from the bootstrap if this is not the first time
we're doing it and the version hasn't changed, so we don't end up
logging it multiple times.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 137 ++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  17 +--
 2 files changed, 78 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..8aed27904c58 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -82,17 +82,17 @@ int xe_gt_sriov_vf_reset(struct xe_gt *gt)
 }
 
 static int guc_action_match_version(struct xe_guc *guc,
-				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
-				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
+				    struct xe_uc_fw_version *wanted,
+				    struct xe_uc_fw_version *found)
 {
 	u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
 		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
 			   GUC_ACTION_VF2GUC_MATCH_VERSION),
-		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted_branch) |
-		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted_major) |
-		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted_minor),
+		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted->branch) |
+		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted->major) |
+		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted->minor),
 	};
 	u32 response[GUC_MAX_MMIO_MSG_LEN];
 	int ret;
@@ -106,120 +106,135 @@ static int guc_action_match_version(struct xe_guc *guc,
 	if (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, response[0])))
 		return -EPROTO;
 
-	*branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
-	*major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
-	*minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
-	*patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
+	memset(found, 0, sizeof(struct xe_uc_fw_version));
+	found->branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
+	found->major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
+	found->minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
+	found->patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
 
 	return 0;
 }
 
-static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
+static int guc_action_match_version_any(struct xe_guc *guc,
+					struct xe_uc_fw_version *found)
+{
+	struct xe_uc_fw_version wanted = {
+		.branch = GUC_VERSION_BRANCH_ANY,
+		.major = GUC_VERSION_MAJOR_ANY,
+		.minor = GUC_VERSION_MINOR_ANY,
+		.patch = 0
+	};
+
+	return guc_action_match_version(guc, &wanted, found);
+}
+
+static void vf_minimum_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
+	memset(ver, 0, sizeof(struct xe_uc_fw_version));
+
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE ... XE_PVC:
 		/* 1.1 this is current baseline for Xe driver */
-		*branch = 0;
-		*major = 1;
-		*minor = 1;
+		ver->branch = 0;
+		ver->major = 1;
+		ver->minor = 1;
 		break;
 	default:
 		/* 1.2 has support for the GMD_ID KLV */
-		*branch = 0;
-		*major = 1;
-		*minor = 2;
+		ver->branch = 0;
+		ver->major = 1;
+		ver->minor = 2;
 		break;
 	}
 }
 
-static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
+static void vf_wanted_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
 {
 	/* for now it's the same as minimum */
-	return vf_minimum_guc_version(gt, branch, major, minor);
+	return vf_minimum_guc_version(gt, ver);
 }
 
 static int vf_handshake_with_guc(struct xe_gt *gt)
 {
-	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version wanted = {0};
 	struct xe_guc *guc = &gt->uc.guc;
-	u32 wanted_branch, wanted_major, wanted_minor;
-	u32 branch, major, minor, patch;
+	bool old = false;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
 	/* select wanted version - prefer previous (if any) */
 	if (guc_version->major || guc_version->minor) {
-		wanted_branch = guc_version->branch;
-		wanted_major = guc_version->major;
-		wanted_minor = guc_version->minor;
+		wanted = *guc_version;
+		old = true;
 	} else {
-		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
-		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
+		vf_wanted_guc_version(gt, &wanted);
+		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
 	}
 
-	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
-				       &branch, &major, &minor, &patch);
+	err = guc_action_match_version(guc, &wanted, guc_version);
 	if (unlikely(err))
 		goto fail;
 
-	/* we don't support interface version change */
-	if ((guc_version->major || guc_version->minor) &&
-	    (guc_version->branch != branch || guc_version->major != major ||
-	     guc_version->minor != minor)) {
-		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
-				branch, major, minor, patch);
-		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
-				 guc_version->branch, guc_version->major,
-				 guc_version->minor, guc_version->patch);
-		err = -EREMCHG;
-		goto fail;
+	if (old) {
+		/* we don't support interface version change */
+		if (MAKE_GUC_VER_STRUCT(*guc_version) != MAKE_GUC_VER_STRUCT(wanted)) {
+			xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
+					guc_version->branch, guc_version->major,
+					guc_version->minor, guc_version->patch);
+			xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
+					 wanted.branch, wanted.major,
+					 wanted.minor, wanted.patch);
+			err = -EREMCHG;
+			goto fail;
+		} else {
+			/* version is unchanged, no need to re-verify it */
+			return 0;
+		}
 	}
 
 	/* illegal */
-	if (major > wanted_major) {
+	if (guc_version->major > wanted.major) {
 		err = -EPROTO;
 		goto unsupported;
 	}
 
 	/* there's no fallback on major version. */
-	if (major != wanted_major) {
+	if (guc_version->major != wanted.major) {
 		err = -ENOPKG;
 		goto unsupported;
 	}
 
 	/* check against minimum version supported by us */
-	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
-	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
-	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
+	vf_minimum_guc_version(gt, &wanted);
+	xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
+	if (MAKE_GUC_VER_STRUCT(*guc_version) < MAKE_GUC_VER_STRUCT(wanted)) {
 		err = -ENOKEY;
 		goto unsupported;
 	}
 
 	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
-			branch, major, minor, patch);
+			guc_version->branch, guc_version->major,
+			guc_version->minor, guc_version->patch);
 
-	guc_version->branch = branch;
-	guc_version->major = major;
-	guc_version->minor = minor;
-	guc_version->patch = patch;
 	return 0;
 
 unsupported:
 	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
-			branch, major, minor, patch, ERR_PTR(err));
+			guc_version->branch, guc_version->major,
+			guc_version->minor, guc_version->patch,
+			ERR_PTR(err));
 fail:
 	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
-			wanted_major, wanted_minor, ERR_PTR(err));
+			wanted.major, wanted.minor, ERR_PTR(err));
 
 	/* try again with *any* just to query which version is supported */
-	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
-				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
-				      &branch, &major, &minor, &patch))
+	if (!guc_action_match_version_any(guc, &wanted))
 		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
-				   branch, major, minor, patch);
+				   wanted.branch, wanted.major, wanted.minor, wanted.patch);
 	return err;
 }
 
@@ -1243,19 +1258,19 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
 	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
-	u32 branch, major, minor;
+	struct xe_uc_fw_version ver;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
 	drm_printf(p, "GuC ABI:\n");
 
-	vf_minimum_guc_version(gt, &branch, &major, &minor);
-	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
+	vf_minimum_guc_version(gt, &ver);
+	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
 
-	vf_wanted_guc_version(gt, &branch, &major, &minor);
-	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
+	vf_wanted_guc_version(gt, &ver);
+	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
 
 	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
 		   guc_version->branch, guc_version->major,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 5ccbdf8d08b6..d614acbe0b5f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -7,20 +7,7 @@
 #define _XE_GT_SRIOV_VF_TYPES_H_
 
 #include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
- */
-struct xe_gt_sriov_vf_guc_version {
-	/** @branch: branch version. */
-	u8 branch;
-	/** @major: major version. */
-	u8 major;
-	/** @minor: minor version. */
-	u8 minor;
-	/** @patch: patch version. */
-	u8 patch;
-};
+#include "xe_uc_fw_types.h"
 
 /**
  * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
@@ -74,7 +61,7 @@ struct xe_gt_sriov_vf_runtime {
  */
 struct xe_gt_sriov_vf {
 	/** @guc_version: negotiated GuC ABI version. */
-	struct xe_gt_sriov_vf_guc_version guc_version;
+	struct xe_uc_fw_version guc_version;
 	/** @self_config: resource configurations. */
 	struct xe_gt_sriov_vf_selfconfig self_config;
 	/** @pf_version: negotiated VF/PF ABI version. */
-- 
2.43.0

