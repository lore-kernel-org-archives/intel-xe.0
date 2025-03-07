Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6678C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341EE10E191;
	Fri,  7 Mar 2025 18:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2uODvnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3449510E191
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741371321; x=1772907321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/JhEqMCsqeJlct7/rGjtJr5I5fFFqVnruu9flSfNj8=;
 b=N2uODvnQdkWu/eqsWud9c6GnaJbK7eYjSx5LPza+veKT3G7zWgsWt0l3
 3wwZY91Ee9AbnO5uBzoWSp9WRBTQMYBB580/wanDFpcgg9+ic60Oei9b2
 dffwd1JThnQVvqZJ5ViC2XpZ350cp8D4Az+ARd01aKczX+fcd/SWPNkl8
 fQ2W5W6cLPid2xr0jzKKqdVNZBrFmMLWjUHL47s9s8HxRpqlRZp7UDXI9
 /Htyh/PcjcHGws5o0yo7fQxs0+D4dSLfCFwJBb3XuuwnDKNOs8QCHVsbc
 RfZ7jDgcCkFhEjcgw90qdSZ1mXWvq43TTzjNQH8wmg0KOBJxKCc5V4Zof A==;
X-CSE-ConnectionGUID: HB8dkOW4TX+JE8YNxdY1pg==
X-CSE-MsgGUID: owWe3l+HSmO1dwVS4TdbVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53825235"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53825235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:20 -0800
X-CSE-ConnectionGUID: tdEVtYUeQX2icOX/WGUM+Q==
X-CSE-MsgGUID: Ue0YcgM4R1avbodQvYdgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123580769"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/uc: Add support for different firmware files on
 each GT
Date: Fri,  7 Mar 2025 10:13:22 -0800
Message-ID: <20250307-xe-per-gt-fw-v1-2-459574d76400@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

The different GTs on a device can be very different. Right now for all
platforms the same firmware is loaded in each GT, however future
platforms may benefit from loading a different file depending on the GT
type.

Based on previous patch by John Harrison <John.C.Harrison@Intel.com>.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 100 ++++++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c22da0ce9fb0d..a230d0501f804 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -92,6 +92,8 @@
 
 struct uc_fw_entry {
 	enum xe_platform platform;
+	enum xe_gt_type gt_type;
+
 	struct {
 		const char *path;
 		u16 major;
@@ -106,35 +108,40 @@ struct fw_blobs_by_type {
 	u32 count;
 };
 
-#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
-	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
+/*
+ * Add an "ANY" define just to convey the meaning it's given here.
+ */
+#define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
+
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
-	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
-	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
-	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
-	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
-	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
-	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
-	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
 
 /* for the GSC FW we match the compatibility version and not the release one */
-#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
-	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)							\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY, major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY, major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
@@ -162,12 +169,13 @@ struct fw_blobs_by_type {
 	  a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
-#define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
+#define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
 	MODULE_FIRMWARE(fw_filename);
 
-#define XE_UC_FW_ENTRY(platform__, entry__)					\
+#define XE_UC_FW_ENTRY(platform__, gt_type__, entry__)				\
 	{									\
 		.platform = XE_ ## platform__,					\
+		.gt_type = XE_ ## gt_type__,					\
 		entry__,							\
 	},
 
@@ -225,30 +233,38 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
 		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
 	};
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	enum xe_platform p = xe->info.platform;
 	const struct uc_fw_entry *entries;
 	u32 count;
 	int i;
 
-	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
+	xe_gt_assert(gt, uc_fw->type < ARRAY_SIZE(blobs_all));
+	xe_gt_assert(gt, gt->info.type != XE_GT_TYPE_UNINITIALIZED);
+
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
 
 	for (i = 0; i < count && p <= entries[i].platform; i++) {
-		if (p == entries[i].platform) {
-			uc_fw->path = entries[i].path;
-			uc_fw->versions.wanted.major = entries[i].major;
-			uc_fw->versions.wanted.minor = entries[i].minor;
-			uc_fw->versions.wanted.patch = entries[i].patch;
-			uc_fw->full_ver_required = entries[i].full_ver_required;
-
-			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
-				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
-			else
-				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
-
-			break;
-		}
+		if (p != entries[i].platform)
+			continue;
+
+		if (entries[i].gt_type != XE_GT_TYPE_ANY &&
+		    entries[i].gt_type != gt->info.type)
+			continue;
+
+		uc_fw->path = entries[i].path;
+		uc_fw->versions.wanted.major = entries[i].major;
+		uc_fw->versions.wanted.minor = entries[i].minor;
+		uc_fw->versions.wanted.patch = entries[i].patch;
+		uc_fw->full_ver_required = entries[i].full_ver_required;
+
+		if (uc_fw->type == XE_UC_FW_TYPE_GSC)
+			uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+		else
+			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
+
+		break;
 	}
 }
 

-- 
2.48.1

