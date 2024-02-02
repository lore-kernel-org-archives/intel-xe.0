Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF15AC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C310E1DF;
	Fri,  2 Feb 2024 20:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+crlGh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAAA10E3C8
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904181; x=1738440181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aJmiEEHFVvLFm8QPGfkhgSz6o6aDi3MexWGMVe5E60U=;
 b=R+crlGh6UgUTtqHHojWy3SHJxFmt0VWe3a+0gJ7lSyePewPX2qhH17f4
 SNaTVAUJy0rD2fYglKtmbBMqRCxEku6vrlLfFABvtPGC1ZB6Ick9ERTzh
 BOE6O4/fQ/6ZW0NpITDauoMajjE5iLrVgRqtuOHJhulapoV9c7gvhTvZl
 G6BFswaP2mVen6tiEwTy9fZaVz4cxGMg6mrkiXetSzqoLUuZTxX4deZzu
 t8pguYHHN0N2T2wbuOCK4KkWmEZvZBH0itHOLgKE9Ph8XInbxDy5kV1N0
 4DijnZO6Izr6Z+faAUyi7IW99O4x8nLaj/IxDRGPMLMTcvHlovuSDU6ed Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3188623"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3188623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="439129"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 12:02:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/6] drm/xe/uc: Include patch version in expectations
Date: Fri,  2 Feb 2024 12:00:14 -0800
Message-ID: <20240202200017.2133438-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Patch level releases can be just as important as major level releases
if they fix a critical bug. So include the patch version in the
expectation check so the user is properly informed if they need to
update.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 49 +++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9dff96dfe455..d3f0fe2101a7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -92,6 +92,7 @@ struct uc_fw_entry {
 		const char *path;
 		u16 major;
 		u16 minor;
+		u16 patch;
 		bool full_ver_required;
 	};
 };
@@ -102,14 +103,14 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
@@ -121,24 +122,24 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0))
+	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
 
 #define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
-#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)			\
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
 #define fw_filename_no_ver(dir_, uc_, shortname_)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
-	  a, b, true }
-#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)			\
-	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),			\
-	  a, b }
+	  a, b, c, true }
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
+	  a, b, c }
 #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
 	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
 	  0, 0 }
@@ -221,6 +222,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 			uc_fw->path = entries[i].path;
 			uc_fw->versions.wanted.major = entries[i].major;
 			uc_fw->versions.wanted.minor = entries[i].minor;
+			uc_fw->versions.wanted.patch = entries[i].patch;
 			uc_fw->full_ver_required = entries[i].full_ver_required;
 
 			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
@@ -340,19 +342,22 @@ int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 	 * Otherwise, at least the major version.
 	 */
 	if (wanted->major != found->major ||
-	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
-		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+	    (uc_fw->full_ver_required &&
+	     ((wanted->minor != found->minor) ||
+	      (wanted->patch != found->patch)))) {
+		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u.%u != %u.%u.%u\n",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			   found->major, found->minor,
-			   wanted->major, wanted->minor);
+			   found->major, found->minor, found->patch,
+			   wanted->major, wanted->minor, wanted->patch);
 		goto fail;
 	}
 
-	if (wanted->minor > found->minor) {
-		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
+	if (wanted->minor > found->minor ||
+	    (wanted->minor == found->minor && wanted->patch > found->patch)) {
+		drm_notice(&xe->drm, "%s firmware (%u.%u.%u) is recommended, but only (%u.%u.%u) was found in %s\n",
 			   xe_uc_fw_type_repr(uc_fw->type),
-			   wanted->major, wanted->minor,
-			   found->major, found->minor,
+			   wanted->major, wanted->minor, wanted->patch,
+			   found->major, found->minor, found->patch,
 			   uc_fw->path);
 		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			 XE_UC_FIRMWARE_URL);
-- 
2.43.0

