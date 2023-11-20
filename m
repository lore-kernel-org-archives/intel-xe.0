Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68681C54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE4B10E16D;
	Mon, 20 Nov 2023 21:28:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC45C10E178
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515680; x=1732051680;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dNsF6k01Hl12Afm+J1G+4A/77uaIY31i3JmDatUz1No=;
 b=QqP0/b64F25judpGcNV7pWIf0K8UT9e+xLL6xJViNDKPyY1sQtUCS7jY
 LgcPuSet1BjLTnIdkexPBvgiHc8vqTg0oZ12otQrTpcdU68AbyYOxzsJB
 DJ4rhq/4qlvTLPwpbDMeV3X0FJcTiYbSwnqNIMQQT0f0n7obR62JPczWe
 FN7V/1e4+Xz0Gl5onCrLw0fW4tEwU8HzaQXFOqB6YZpNf/1BNOcFEEupK
 yg1/5/HyTtGBCw9PWtjjnWxUdHNSLt/WYTpD834alz2ucA1hxZt+q9DQ/
 am+vpgA8eCTJCtbQgfS0bCOfSteSrSphTzekTYrmr9YHn+wGhPZzawmXp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13256869"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13256869"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883984467"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883984467"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:53 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:27:31 -0800
Message-ID: <20231120212741.2634679-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
References: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 02/10] drm/xe/uc: Rework uC version tracking
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

The GSC firmware, support for which is coming soon for Xe, has both a
release version (updated on every release) and a compatibility version
(update only on interface changes). The GuC has something similar, with
a global release version and a submission version (which is also known
as the VF compatibility version). The main difference is that for the
GuC we still want to check the driver requirement against the release
version, while for the GSC we'll need to check against the compatibility
version.
Instead of special casing the GSC, this patch reworks the FW logic so
that we store both versions at the uc_fw level for all binaries and we
allow checking against either of the versions. Initially, we'll use it
to support GSC, but the logic could be re-used to allow VFs to check
against the GuC compatibility version.
Note that the GSC version has 4 numbers (major, minor, hotfix, build),
so support for that has been added as part of the rework and will be
used in follow-up patches.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
 drivers/gpu/drm/xe/xe_uc_fw.c       | 141 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  39 ++++++--
 3 files changed, 114 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 0fdcc05dc16a..cd80802e8918 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -52,15 +52,6 @@ struct xe_guc {
 			/** @seqno: suspend fences seqno */
 			u32 seqno;
 		} suspend;
-		/** @version: submission version */
-		struct {
-			/** @major: major version of GuC submission */
-			u32 major;
-			/** @minor: minor version of GuC submission */
-			u32 minor;
-			/** @patch: patch version of GuC submission */
-			u32 patch;
-		} version;
 #ifdef CONFIG_PROVE_LOCKING
 #define NUM_SUBMIT_WQ	256
 		/** @submit_wq_pool: submission ordered workqueues pool */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 91d4a2272ee7..9205a3ecff78 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -204,9 +204,12 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	for (i = 0; i < count && p <= entries[i].platform; i++) {
 		if (p == entries[i].platform) {
 			uc_fw->path = entries[i].path;
-			uc_fw->major_ver_wanted = entries[i].major;
-			uc_fw->minor_ver_wanted = entries[i].minor;
+			uc_fw->versions.wanted.major = entries[i].major;
+			uc_fw->versions.wanted.minor = entries[i].minor;
 			uc_fw->full_ver_required = entries[i].full_ver_required;
+
+			/* compatibility version checking coming soon */
+			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
 			break;
 		}
 	}
@@ -273,32 +276,30 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 {
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
 
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
-	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
+	xe_gt_assert(gt, release->major >= 70);
 
-	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
+	if (release->major > 70 || release->minor >= 6) {
 		/* v70.6.0 adds CSS header support */
-		guc->submission_state.version.major =
-			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-				  css->submission_version);
-		guc->submission_state.version.minor =
-			FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-				  css->submission_version);
-		guc->submission_state.version.patch =
-			FIELD_GET(CSS_SW_VERSION_UC_PATCH,
-				  css->submission_version);
-	} else if (uc_fw->minor_ver_found >= 3) {
+		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
+						 css->submission_version);
+		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
+						 css->submission_version);
+		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
+						 css->submission_version);
+	} else if (release->minor >= 3) {
 		/* v70.3.0 introduced v1.1.0 */
-		guc->submission_state.version.major = 1;
-		guc->submission_state.version.minor = 1;
-		guc->submission_state.version.patch = 0;
+		compatibility->major = 1;
+		compatibility->minor = 1;
+		compatibility->patch = 0;
 	} else {
 		/* v70.0.0 introduced v1.0.0 */
-		guc->submission_state.version.major = 1;
-		guc->submission_state.version.minor = 0;
-		guc->submission_state.version.patch = 0;
+		compatibility->major = 1;
+		compatibility->minor = 0;
+		compatibility->patch = 0;
 	}
 
 	uc_fw->private_data_size = css->private_data_size;
@@ -307,30 +308,31 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
+	struct xe_uc_fw_version *found = &uc_fw->versions.found[uc_fw->versions.wanted_type];
 
 	/* Driver has no requirement on any version, any is good. */
-	if (!uc_fw->major_ver_wanted)
+	if (!wanted->major)
 		return 0;
 
 	/*
 	 * If full version is required, both major and minor should match.
 	 * Otherwise, at least the major version.
 	 */
-	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
-	    (uc_fw->full_ver_required &&
-	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
+	if (wanted->major != found->major ||
+	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
 		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
-			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
+			   found->major, found->minor,
+			   wanted->major, wanted->minor);
 		goto fail;
 	}
 
-	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
+	if (wanted->minor > found->minor) {
 		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
 			   xe_uc_fw_type_repr(uc_fw->type),
-			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
-			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
+			   wanted->major, wanted->minor,
+			   found->major, found->minor,
 			   uc_fw->path);
 		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			 XE_UC_FIRMWARE_URL);
@@ -349,6 +351,7 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
 	struct uc_css_header *css;
 	size_t size;
 
@@ -390,12 +393,9 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	}
 
 	/* Get version numbers from the CSS header */
-	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-					   css->sw_version);
-	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-					   css->sw_version);
-	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
-					   css->sw_version);
+	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
+	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
+	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
 
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
 		guc_read_css_info(uc_fw, css);
@@ -431,6 +431,7 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_device *xe = gt_to_xe(gt);
 	const struct gsc_cpd_header_v2 *header = data;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
 	const struct gsc_manifest_header *manifest;
 	size_t min_size = sizeof(*header);
 	u32 offset;
@@ -468,9 +469,9 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 
 	manifest = data + offset;
 
-	uc_fw->major_ver_found = manifest->fw_version.major;
-	uc_fw->minor_ver_found = manifest->fw_version.minor;
-	uc_fw->patch_ver_found = manifest->fw_version.hotfix;
+	release->major = manifest->fw_version.major;
+	release->minor = manifest->fw_version.minor;
+	release->patch = manifest->fw_version.hotfix;
 
 	/* then optionally look for the css header */
 	if (css_entry) {
@@ -524,12 +525,25 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 	return 0;
 }
 
+#define print_uc_fw_version(p_, version_, prefix_, ...) \
+do { \
+	struct xe_uc_fw_version *ver_ = (version_); \
+	if (ver_->build) \
+		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
+			   ver_->major, ver_->minor, \
+			   ver_->patch, ver_->build); \
+	else \
+		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
+			  ver_->major, ver_->minor, ver_->patch); \
+} while (0)
+
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct device *dev = xe->drm.dev;
+	struct drm_printer p = drm_info_printer(dev);
 	const struct firmware *fw = NULL;
 	struct xe_bo *obj;
 	int err;
@@ -567,9 +581,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
-		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
+	print_uc_fw_version(&p,
+			    &uc_fw->versions.found[XE_UC_FW_VER_RELEASE],
+			    "Using %s firmware from %s",
+			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 
 	err = uc_fw_check_version_requirements(uc_fw);
 	if (err)
@@ -686,26 +701,40 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return err;
 }
 
+static const char *version_type_repr(enum xe_uc_fw_version_types type)
+{
+	switch (type) {
+	case XE_UC_FW_VER_RELEASE:
+		return "release";
+	case XE_UC_FW_VER_COMPATIBILITY:
+		return "compatibility";
+	default:
+		return "Unknown version type";
+	}
+}
 
 void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
 {
+	int i;
+
 	drm_printf(p, "%s firmware: %s\n",
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 	drm_printf(p, "\tstatus: %s\n",
 		   xe_uc_fw_status_repr(uc_fw->status));
-	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u.%u\n",
-		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
-		   uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
-	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
-	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
-
-	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
-		struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-		struct xe_guc *guc = &gt->uc.guc;
-
-		drm_printf(p, "\tSubmit version: %u.%u.%u\n",
-			   guc->submission_state.version.major,
-			   guc->submission_state.version.minor,
-			   guc->submission_state.version.patch);
+
+	print_uc_fw_version(p, &uc_fw->versions.wanted, "\twanted %s",
+			    version_type_repr(uc_fw->versions.wanted_type));
+
+	for (i = 0; i < XE_UC_FW_VER_TYPE_COUNT; i++) {
+		struct xe_uc_fw_version *ver = &uc_fw->versions.found[i];
+
+		if (ver->major)
+			print_uc_fw_version(p, ver, "\tfound %s",
+					    version_type_repr(i));
 	}
+
+	if (uc_fw->ucode_size)
+		drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
+	if (uc_fw->rsa_size)
+		drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 1650599303c8..46c801d8e954 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -59,6 +59,26 @@ enum xe_uc_fw_type {
 };
 #define XE_UC_FW_NUM_TYPES 2
 
+/**
+ * struct xe_uc_fw_version - Version for XE micro controller firmware
+ */
+struct xe_uc_fw_version {
+	/** @major: major version of the FW */
+	u16 major;
+	/** @minor: minor version of the FW */
+	u16 minor;
+	/** @patch: patch version of the FW */
+	u16 patch;
+	/** @build: build version of the FW (not always available) */
+	u16 build;
+};
+
+enum xe_uc_fw_version_types {
+	XE_UC_FW_VER_RELEASE,
+	XE_UC_FW_VER_COMPATIBILITY,
+	XE_UC_FW_VER_TYPE_COUNT
+};
+
 /**
  * struct xe_uc_fw - XE micro controller firmware
  */
@@ -98,16 +118,15 @@ struct xe_uc_fw {
 	 * version required per platform.
 	 */
 
-	/** @major_ver_wanted: major firmware version wanted by platform */
-	u16 major_ver_wanted;
-	/** @minor_ver_wanted: minor firmware version wanted by platform */
-	u16 minor_ver_wanted;
-	/** @major_ver_found: major version found in firmware blob */
-	u16 major_ver_found;
-	/** @minor_ver_found: major version found in firmware blob */
-	u16 minor_ver_found;
-	/** @patch_ver_found: patch version found in firmware blob */
-	u16 patch_ver_found;
+	/** @versions: FW versions wanted and found */
+	struct {
+		/** @wanted: firmware version wanted by platform */
+		struct xe_uc_fw_version wanted;
+		/** @wanted_type: type of firmware version wanted (release vs compatibility) */
+		enum xe_uc_fw_version_types wanted_type;
+		/** @found: fw versions found in firmware blob */
+		struct xe_uc_fw_version found[XE_UC_FW_VER_TYPE_COUNT];
+	} versions;
 
 	/** @rsa_size: RSA size */
 	u32 rsa_size;
-- 
2.41.0

