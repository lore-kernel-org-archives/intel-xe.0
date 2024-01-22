Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA728C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C08310E64D;
	Mon, 22 Jan 2024 21:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A410EFC3
 for <Intel-Xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705959288; x=1737495288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VG2AmIzrgpk8dZiFqe0eNyftm45FuOXt7Hw+Q3KEs7E=;
 b=fhar81x00d//txmXhuZ12RKrNNbdom96GAv7vhIWlM+MKi5bZ8799ODS
 bVUS9ERt3D2P+0TgIz9O1Hb1ijI+P+MvLyeZhlzupmx2UZeVpfqw9u4Qm
 ypHUmDoIIv0MWGhJL5QJyLzVPXQmJzAqIoFuIWjJQ83x6HQsI89k6rWrQ
 gZvwgXC//c7sv1mU+/mriyYGc7SB9yaSb7gBwPHe0h7pJDWAVRtOnC1Tg
 Gegci4hfm30ex2asDXOwqGmRROGhKZCmes11yIdLpAZYI3po5GAd2SPvh
 fnpCN/yMr+0WPB7eJ4o2QHSYfsJFiBQcU0Shraw3LXwK1WWdLkqbhMRkt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432489922"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432489922"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909073622"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="909073622"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 22 Jan 2024 13:34:47 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/xe/uc: Include patch version in expectations
Date: Mon, 22 Jan 2024 13:37:07 -0800
Message-ID: <20240122213708.1841488-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
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

