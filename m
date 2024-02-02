Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48482C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 07:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60B510EBFD;
	Fri,  2 Feb 2024 07:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fcm7Gz6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E310EBFD
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706859214; x=1738395214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VG2AmIzrgpk8dZiFqe0eNyftm45FuOXt7Hw+Q3KEs7E=;
 b=Fcm7Gz6+e1VnkEU9i6BnxH7/r3d2CCqnvLODSML1mXH0r0CGxu5fJc3E
 Q/ixC6F7iomWwu6WIIbvRNAAZopfVeAuYKwaOMDFvPPUc3/b/evbjRMmB
 vFCK00MLNKmdPYd5qVG174b1Tee8PcmVX1szrwTwbP4X1HXiLvsUkTdMc
 V0KldsYxqHe1icMF00UHBP9WgBIqoJxRNsztdJpvPsczLlqUNdQqlbhHU
 gBNWJWuhDXxFHZMeuRR+6+Fcli1aPw84ubgCzb6TC0qvJiJCiXtlcBxfZ
 4MbHiC6gyVIeftidfJcijs4hyGlsm1C/hXwlr3yCeHRQS8ggE9uthwu99 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3026068"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="3026068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4634266"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 23:33:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/3] drm/xe/uc: Include patch version in expectations
Date: Thu,  1 Feb 2024 23:30:48 -0800
Message-ID: <20240202073050.1986142-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
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

