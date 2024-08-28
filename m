Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7700C71151
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6776910E5FD;
	Wed, 28 Aug 2024 21:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhGWc2Yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2310E5FA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724881930; x=1756417930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k5L6JhG1Srxo/6D5CgskxNsN16h3qESAbhaE0EBLErs=;
 b=DhGWc2Yo6A8aOxxY3/M+D1wRIqtXaaMtWc5CSTng/vwnCN4kSu3ERDDo
 7Gf6f/pn/KbySix1Gi2NE2Z5YdA6nMcv0j3fjsCM9jJIz5FkqEbXa3QBx
 4QUfaOYs6MuMyhI3euIyEupjvFXH47iqOoUDIca7oIDo/UGBS889v2WST
 cUI4NspUU13yMy+/P3Yza3KxyyiLjovOMZnl93SgLbcag8uc0OZrlh5o5
 ZglFV7MhjXInSs0ArTVgHrGU4nk1fvnQ3I2mSuxF54H57o6kwpgVcCbaT
 4N8GRFyLtyLzsipLTabPJWgzCOutLSIxfQXnXDpCb+0uAl6m8oLZGQJUz A==;
X-CSE-ConnectionGUID: aUXV95pYRFaYvO1wa3QsKA==
X-CSE-MsgGUID: SeKWXDlCRSakTXmSQtx+Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23330692"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23330692"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:10 -0700
X-CSE-ConnectionGUID: s58Zw98KT+OZhY6Nh4gHGA==
X-CSE-MsgGUID: WmZrkHgnRISLEjMdNm4pDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63356538"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/4] drm/xe/gsc: Track the platform in the compatibility version
Date: Wed, 28 Aug 2024 14:51:56 -0700
Message-ID: <20240828215158.2743994-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

The GSC compatibility version number is reset for each new platform. To
indicate this, the version includes a number that identifies the
platform (102 = MTL, 104 = LNL); this matches what happens for the
release version, where the major number also identifies a platform.

To make it clearer in our logs that the compatibility version is
specific to the platform, it is useful to include this platform number.
However, given that our binary names already include the platform, it is
not necessary to add this extra number there.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c   |  7 ++++---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 +++++++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 6a94d51fb933..50ff43f5426a 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -165,10 +165,11 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 		return err;
 	}
 
-	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, compat_major);
-	compat->minor = version_query_rd(xe, &bo->vmap, rd_offset, compat_minor);
+	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, proj_major);
+	compat->minor = version_query_rd(xe, &bo->vmap, rd_offset, compat_major);
+	compat->patch = version_query_rd(xe, &bo->vmap, rd_offset, compat_minor);
 
-	xe_gt_info(gt, "found GSC cv%u.%u\n", compat->major, compat->minor);
+	xe_gt_info(gt, "found GSC cv%u.%u.%u\n", compat->major, compat->minor, compat->patch);
 
 out_bo:
 	xe_bo_unpin_map_no_vm(bo);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d4809ec7d634..821b46c9b4ee 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -130,8 +130,8 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	1, 0, 0)) \
-	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
+	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
+	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
@@ -142,6 +142,8 @@ struct fw_blobs_by_type {
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
 #define fw_filename_no_ver(dir_, uc_, shortname_)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
+#define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
@@ -152,6 +154,9 @@ struct fw_blobs_by_type {
 #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
 	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
 	  0, 0 }
+#define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
+	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
+	  a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
@@ -167,7 +172,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
-XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -210,7 +215,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 				     uc_fw_entry_no_ver)
 	};
 	static const struct uc_fw_entry entries_gsc[] = {
-		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
+		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
-- 
2.43.0

