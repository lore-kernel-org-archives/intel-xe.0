Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797EFC282D5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6F610E4D0;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQtAjyEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCF710E4CC
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k5bCfsUIo/62Knh5b0NW8AyF173lxew2/36rzplxIpU=;
 b=UQtAjyEAlIAKVpLbe38tpX3JXxEgjsP953c8YiSB/GycPKZ+A1dxBpKq
 b5ah1qi6z/auqtJX3EG/hhVZz/gbiyaLVKmKQ0xmcYqNPhiPnlicvtHm0
 4Vjrh8oulwuQ34rKFBkQODHe260ckSBwVdq1JHHUmzOhk7aKq36X0qVMU
 lEi5u+vCxRTp1sZHM8JzncLwvb0zfu1k0I92PPThwWhh+8YQsWDWJxI6D
 BlQJZZ2dbE05UVY7RnMQynjavoNGpThgEuljKNceBPKxxeK+qnBeJFJmA
 KpczEnaBLV3GVz0OiDG/2Z/98YHQJUnhBU69c50t7EQ+tkUtHrUGxSKjq Q==;
X-CSE-ConnectionGUID: h3Y57hbOR26d2LRXxCv5WQ==
X-CSE-MsgGUID: ++qiUQHuRuWW6U8aemMmdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167370"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167370"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:16 -0800
X-CSE-ConnectionGUID: 59nIt5mlQDCk8LEuO0ocuQ==
X-CSE-MsgGUID: Z7/e9vT4SjSKVfPwKTXfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366095"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2 4/7] drm/xe/uc: Add support for different firmware files on
 each GT
Date: Mon,  3 Mar 2025 11:52:12 -0800
Message-ID: <20250303195215.1046192-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
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

The different GTs on a device can be very different. So add support
for being able to load a GuC firmware image that is tailored to the
specific GT type.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 67 +++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fb0eda3d5682..748863b75adf 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -98,6 +98,7 @@ struct uc_fw_entry {
 		u16 minor;
 		u16 patch;
 		bool full_ver_required;
+		const char *gt_type;
 	};
 };
 
@@ -107,16 +108,16 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2, ""))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2, ""))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2, ""))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
@@ -133,30 +134,30 @@ struct fw_blobs_by_type {
 	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
-#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
+#define MAKE_FW_PATH(dir__, uc__, shortname__, type__, version__)			\
+	__stringify(dir__) "/" __stringify(shortname__) type__ "_" __stringify(uc__) version__ ".bin"
 
-#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
-#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
+#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a ## . ## b ## . ## c))
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))
 #define fw_filename_no_ver(dir_, uc_, shortname_)				\
-	MAKE_FW_PATH(dir_, uc_, shortname_, "")
+	MAKE_FW_PATH(dir_, uc_, shortname_, "", "")
 #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
-
-#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
-	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
-	  a, b, c, true }
-#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
-	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
-	  a, b, c }
+	MAKE_FW_PATH(dir_, uc_, shortname_, "", "_" __stringify(b))
+
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }
 #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
 	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
-	  0, 0 }
+	  0, 0, 0, false, "" }
 #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
-	  a, b, c }
+	  a, b, c, false, "" }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
@@ -224,6 +225,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	};
 	static const struct uc_fw_entry *entries;
 	enum xe_platform p = xe->info.platform;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	u32 count;
 	int i;
 
@@ -231,8 +233,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
 
+	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
+
 	for (i = 0; i < count && p <= entries[i].platform; i++) {
 		if (p == entries[i].platform) {
+			if (entries[i].gt_type[0]) {
+				if (gt->info.type == XE_GT_TYPE_MAIN &&
+				    (entries[i].gt_type[0] != 'g'))
+					continue;
+				if (gt->info.type == XE_GT_TYPE_MEDIA &&
+				    (entries[i].gt_type[0] != 'm'))
+					continue;
+			}
+
 			uc_fw->path = entries[i].path;
 			uc_fw->versions.wanted.major = entries[i].major;
 			uc_fw->versions.wanted.minor = entries[i].minor;
-- 
2.47.0

