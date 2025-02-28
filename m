Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEE5C282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6D10ED3D;
	Fri, 28 Feb 2025 20:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bABjvCy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637B10ED2E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740772977; x=1772308977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxhxsvCcFJ6bv+IPzIkY9QJ546qV5zQJ1g8NCeeUjfU=;
 b=bABjvCy5o7iaV7l8CHN6o5dwXSZ8i0raUNC24wFs+8PRO3TMfzP5/rja
 R3RoxcJFs9asz1oX66/2TKsIO3JaUcKnzVevlm3QdtR/yXmxK2yvb78GU
 m6zqfzHdDNl6CKhE6eUHxt/fS+EjBvIwEtKvbwFPJ3jgeQYRSxuo3KKwR
 a8FdWQtT9IWkSFjLgJXQrumLemg4Md23afMhjT1rFhXgeGQI17pCVBsU6
 yfx+Y3nDEo01ZzcypMmRUcHMgf18EocJJMhldmuzaMzE49kTEVdosaet7
 25ynVMFdEdMOq20xeEcfbigtwV09dqy70fRRQksZAxMw9ZZNg3wGQl9xU Q==;
X-CSE-ConnectionGUID: QuubHejVTJurPeg1kO1jRg==
X-CSE-MsgGUID: lzC7JMKJQI+da9qoQdr+uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41737751"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41737751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:02:56 -0800
X-CSE-ConnectionGUID: VPDL5lRsTMerP1HqoZumHQ==
X-CSE-MsgGUID: 6ayaKk3LSeuht0HIF7+Dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="148236199"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:02:56 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Store the VF GuC version in the compatibility
 struct
Date: Fri, 28 Feb 2025 12:02:45 -0800
Message-ID: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
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

The GuC compatibility version that we read from the CSS header in
native/PF and the GuC VF version that we get when a VF handshakes with
the GuC are the same version number, so we should store it into the same
structure. This makes all the checks based on the compatibility version
automatically work for VFs without having to copy the value over.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 121 +++++++++++---------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  16 ---
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |   8 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
 5 files changed, 71 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..eeccbf4cb4b4 100644
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
@@ -106,71 +106,84 @@ static int guc_action_match_version(struct xe_guc *guc,
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
+	struct xe_uc_fw_version wanted = { GUC_VERSION_BRANCH_ANY,
+					   GUC_VERSION_MAJOR_ANY,
+					   GUC_VERSION_MINOR_ANY,
+					   0 };
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
 	struct xe_guc *guc = &gt->uc.guc;
-	u32 wanted_branch, wanted_major, wanted_minor;
-	u32 branch, major, minor, patch;
+	struct xe_uc_fw_version *guc_version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_uc_fw_version wanted = {0};
+	struct xe_uc_fw_version found;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
 	/* select wanted version - prefer previous (if any) */
 	if (guc_version->major || guc_version->minor) {
-		wanted_branch = guc_version->branch;
-		wanted_major = guc_version->major;
-		wanted_minor = guc_version->minor;
+		wanted.branch = guc_version->branch;
+		wanted.major = guc_version->major;
+		wanted.minor = guc_version->minor;
 	} else {
-		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
-		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
+		vf_wanted_guc_version(gt, &wanted);
+		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
 	}
 
-	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
-				       &branch, &major, &minor, &patch);
+	err = guc_action_match_version(guc, &wanted, &found);
 	if (unlikely(err))
 		goto fail;
 
 	/* we don't support interface version change */
 	if ((guc_version->major || guc_version->minor) &&
-	    (guc_version->branch != branch || guc_version->major != major ||
-	     guc_version->minor != minor)) {
+	    (guc_version->branch != found.branch || guc_version->major != found.major ||
+	     guc_version->minor != found.minor)) {
 		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
-				branch, major, minor, patch);
+				found.branch, found.major, found.minor, found.patch);
 		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
 				 guc_version->branch, guc_version->major,
 				 guc_version->minor, guc_version->patch);
@@ -179,47 +192,43 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
 	}
 
 	/* illegal */
-	if (major > wanted_major) {
+	if (found.major > wanted.major) {
 		err = -EPROTO;
 		goto unsupported;
 	}
 
 	/* there's no fallback on major version. */
-	if (major != wanted_major) {
+	if (found.major != wanted.major) {
 		err = -ENOPKG;
 		goto unsupported;
 	}
 
 	/* check against minimum version supported by us */
-	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
-	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
-	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
+	vf_minimum_guc_version(gt, &wanted);
+	xe_gt_assert(gt, found.major != GUC_VERSION_MAJOR_ANY);
+	if (MAKE_GUC_VER_STRUCT(found) < MAKE_GUC_VER_STRUCT(wanted)) {
 		err = -ENOKEY;
 		goto unsupported;
 	}
 
 	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
-			branch, major, minor, patch);
+			found.branch, found.major, found.minor, found.patch);
 
-	guc_version->branch = branch;
-	guc_version->major = major;
-	guc_version->minor = minor;
-	guc_version->patch = patch;
+	memcpy(guc_version, &found, sizeof(struct xe_uc_fw_version));
 	return 0;
 
 unsupported:
 	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
-			branch, major, minor, patch, ERR_PTR(err));
+			found.branch, found.major, found.minor, found.patch,
+			ERR_PTR(err));
 fail:
 	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
-			wanted_major, wanted_minor, ERR_PTR(err));
+			wanted.major, wanted.minor, ERR_PTR(err));
 
 	/* try again with *any* just to query which version is supported */
-	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
-				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
-				      &branch, &major, &minor, &patch))
+	if (!guc_action_match_version_any(guc, &found))
 		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
-				   branch, major, minor, patch);
+				   found.branch, found.major, found.minor, found.patch);
 	return err;
 }
 
@@ -376,7 +385,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) || has_gmdid(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
+	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(guc) >= MAKE_GUC_VER(1, 2, 0));
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
 	if (unlikely(err)) {
@@ -537,7 +546,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
 	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
 
 	return gt->sriov.vf.self_config.num_ctxs;
@@ -554,7 +563,7 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
 	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
 
 	return gt->sriov.vf.self_config.lmem_size;
@@ -1079,19 +1088,19 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
+	struct xe_uc_fw_version *guc_version = &gt->uc.guc.fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_uc_fw_version ver;
 	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
-	u32 branch, major, minor;
 
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
index a57f13b5afcd..e3d3eadbba8c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -8,20 +8,6 @@
 
 #include <linux/types.h>
 
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
-
 /**
  * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
  */
@@ -71,8 +57,6 @@ struct xe_gt_sriov_vf_runtime {
  * struct xe_gt_sriov_vf - GT level VF virtualization data.
  */
 struct xe_gt_sriov_vf {
-	/** @guc_version: negotiated GuC ABI version. */
-	struct xe_gt_sriov_vf_guc_version guc_version;
 	/** @self_config: resource configurations. */
 	struct xe_gt_sriov_vf_selfconfig self_config;
 	/** @pf_version: negotiated VF/PF ABI version. */
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 58338be44558..c81544ff1cb4 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,7 +18,7 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
-#define GUC_SUBMIT_VER(guc) \
+#define GUC_COMPATIBILITY_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2a457dcf31d5..e7aeb530715b 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -98,7 +98,6 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
 static bool is_engine_activity_supported(struct xe_guc *guc)
 {
 	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
-	struct xe_uc_fw_version required = { 1, 14, 1 };
 	struct xe_gt *gt = guc_to_gt(guc);
 
 	if (IS_SRIOV_VF(gt_to_xe(gt))) {
@@ -107,11 +106,10 @@ static bool is_engine_activity_supported(struct xe_guc *guc)
 	}
 
 	/* engine activity stats is supported from GuC interface version (1.14.1) */
-	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
+	if (GUC_COMPATIBILITY_VER(guc) < MAKE_GUC_VER(1, 14, 1)) {
 		xe_gt_info(gt,
-			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
-			   version->major, version->minor, version->patch, required.major,
-			   required.minor, required.patch);
+			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v1.14.1 or higher\n",
+			   version->major, version->minor, version->patch);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index ad3b35a0e6eb..914026015019 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -65,6 +65,8 @@ enum xe_uc_fw_type {
  * struct xe_uc_fw_version - Version for XE micro controller firmware
  */
 struct xe_uc_fw_version {
+	/** @branch: branch version of the FW (not always available) */
+	u16 branch;
 	/** @major: major version of the FW */
 	u16 major;
 	/** @minor: minor version of the FW */
-- 
2.43.0

