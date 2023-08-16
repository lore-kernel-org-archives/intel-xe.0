Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6ECC27C42
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 21:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61B610E3D6;
	Wed, 16 Aug 2023 21:55:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAB610E3D6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692222926; x=1723758926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4hMQHZTU05WxeliS8/YybHvdvrCsOMNQ5vW+pO7TdE=;
 b=dnSNoMnFgFlH4uGnJijcolD6xPE+cxGyAbdnJsrtfAYT2qX7Tk7Q8JHY
 /6CaxidOR4dTre9zEXXB+biOZmOPITRjszHZEOMkkucfOmQAEA0TiP+c6
 guZYLn2NfHCm5oh98H99WiALYtZdAFxHpVGE/u6ax8pmSCka6RpmkxBHh
 9bhDGuG22m6ht24YVN6Nyys2nuRYUPgWdiRNDH/AH8nfcI/B88wHcKWj6
 eOEbz13pr4vetIJgJXD2ilYlM6ItzMKCyaiyjd0SBNvhQubYjPOqKQrQk
 R/X1cMcjeJUiRQXUZI+bLAwpBu8l5M3ROMwDV8Nq8xEWY4dxGs24Ek4e6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372647051"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="372647051"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 14:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711266950"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="711266950"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 14:55:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 14:55:15 -0700
Message-ID: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe/uc: rework uC version tracking
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
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
Instead of special casing the GSC, this patch proposes a rework of the
FW logic so that we store both versions at the uc_fw level for all
binaries and we allow checking against either of the versions. Initially,
we'll use it to support GSC, but the logic could be re-used to allow VFs
to check against their expected GuC compatibility version.

RFC note: I've added a couple of the GSC defines to show how this is
supposed to be different for the GSC, but those are not intended to be
part of this patch in its final version. I'd like to get some early
feedback on this before I build the full GSC version checking on top of
it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
 drivers/gpu/drm/xe/xe_uc_fw.c       | 131 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  36 ++++++--
 4 files changed, 108 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index a5e58917a499..343cc39ce5bc 100644
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
 		/** @enabled: submission is enabled */
 		bool enabled;
 	} submission_state;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2e70dd4880f6..e22afd65e5d6 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -201,9 +201,15 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	for (i = 0; i < count && p <= entries[i].platform; i++) {
 		if (p == entries[i].platform) {
 			uc_fw->path = entries[i].path;
-			uc_fw->major_ver_wanted = entries[i].major;
-			uc_fw->minor_ver_wanted = entries[i].minor;
+			uc_fw->versions.wanted.major = entries[i].major;
+			uc_fw->versions.wanted.minor = entries[i].minor;
 			uc_fw->full_ver_required = entries[i].full_ver_required;
+
+			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
+				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+			else
+				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
+
 			break;
 		}
 	}
@@ -245,33 +251,30 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 
 static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 {
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
 
 	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
-	XE_WARN_ON(uc_fw->major_ver_found < 70);
+	XE_WARN_ON(release->major < 70);
 
-	if (uc_fw->minor_ver_found >= 6) {
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
@@ -280,30 +283,31 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
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
@@ -325,6 +329,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct device *dev = xe->drm.dev;
 	const struct firmware *fw = NULL;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
 	struct uc_css_header *css;
 	struct xe_bo *obj;
 	size_t size;
@@ -395,15 +400,13 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	}
 
 	/* Get version numbers from the CSS header */
-	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-					   css->sw_version);
-	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-					   css->sw_version);
+	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
+	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
+	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
 
 	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
 		 xe_uc_fw_type_repr(uc_fw->type),
-		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
-		 uc_fw->path);
+		 release->major, release->minor, uc_fw->path);
 
 	err = uc_fw_check_version_requirements(uc_fw);
 	if (err)
@@ -523,26 +526,50 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return err;
 }
 
+static const char *version_wanted_type_repr(enum xe_uc_fw_version_types type)
+{
+	switch (type) {
+	case XE_UC_FW_VER_RELEASE:
+		return "release version wanted";
+	case XE_UC_FW_VER_COMPATIBILITY:
+		return "compatibility version wanted";
+	default:
+		return "Unknown version type wanted";
+	}
+}
+
+static void print_uc_version(struct drm_printer *p, const char *prefix, struct xe_uc_fw_version *version)
+{
+	if (version->build)
+		drm_printf(p, "\t%s %u.%u.%u.%u\n",
+			   prefix, version->major, version->minor,
+			   version->patch, version->build);
+	else
+		drm_printf(p, "\t%s %u.%u.%u\n",
+			   prefix, version->major, version->minor,
+			   version->patch);
+}
 
 void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
 {
+	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
+
 	drm_printf(p, "%s firmware: %s\n",
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 	drm_printf(p, "\tstatus: %s\n",
 		   xe_uc_fw_status_repr(uc_fw->status));
-	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
-		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
-		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
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
-	}
+	print_uc_version(p, version_wanted_type_repr(uc_fw->versions.wanted_type), wanted);
+
+	if (release->major)
+		print_uc_version(p, "release version found", release);
+
+	if (compatibility->major)
+		print_uc_version(p, "compatibility version found", compatibility);
+
+	if (uc_fw->ucode_size)
+		drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
+	if (uc_fw->rsa_size)
+		drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index a519c77d4962..1b5bbbb97aaf 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
 		return "GuC";
 	case XE_UC_FW_TYPE_HUC:
 		return "HuC";
+	case XE_UC_FW_TYPE_GSC:
+		return "GSC";
 	}
 	return "uC";
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 837f49a2347e..69d3f2446781 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -55,10 +55,27 @@ enum xe_uc_fw_status {
 
 enum xe_uc_fw_type {
 	XE_UC_FW_TYPE_GUC = 0,
-	XE_UC_FW_TYPE_HUC
+	XE_UC_FW_TYPE_HUC,
+	XE_UC_FW_TYPE_GSC
 };
 #define XE_UC_FW_NUM_TYPES 2
 
+/**
+ * struct xe_uc_fw_version - Version for XE micro controller firmware
+ */
+struct xe_uc_fw_version {
+	u16 major;
+	u16 minor;
+	u16 patch;
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
@@ -98,14 +115,15 @@ struct xe_uc_fw {
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

