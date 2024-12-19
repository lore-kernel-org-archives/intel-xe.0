Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E7E7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 00:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7710E1DC;
	Thu, 19 Dec 2024 00:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeJ08p1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AA110E1DC
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734569253; x=1766105253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=idNTgfCpaIAD8EytZBXSDOCLeezh89j+IIMezg47DqY=;
 b=QeJ08p1jISEL8okg6Dl9P27S+jKnokRsXLBPhBt//fm5BPn6jMG53qmR
 owHf9iDvzKBpw6UOoWjd1XMzV0/kYfeXlx7WobztGFLLVu8XOh4zaKFqi
 02kB3/JHi5WA7OdqhULR25NJnuuQ90m9+fzt0isBgQUjAcVIYJhrDzHhA
 HnCVLTZYhEHEZEWVAmgNXcpG9eysQQB+FTGSGZ4T5qiqQGOIYk6iLjqAP
 1ZZZcv5ZKpBwji6z6XGDrNOBjF0Gi0Mw+u41HxsveGQm1zsFD8nH5rvya
 4SVBQwW2OjIio/O4JGo35xnjoXOOEDyW6dy/oUmN0o3PrhoJw4BnO389k Q==;
X-CSE-ConnectionGUID: 6lXsEuHGTA64HW8vzhw+lA==
X-CSE-MsgGUID: JVFxEGotSp2EPYkTtN5UUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34956455"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="34956455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:47:32 -0800
X-CSE-ConnectionGUID: OCr97Nq/TueXg9UK3cVZ0A==
X-CSE-MsgGUID: wfGFdjP5QqCBgw8MZ2wb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103114157"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:47:32 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI] drm/xe/gsc: test new GSC 1040.0.0.1345 for LNL
Date: Wed, 18 Dec 2024 16:47:18 -0800
Message-ID: <20241219004718.2460963-1-daniele.ceraolospurio@intel.com>
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

This patch is for testing only. If the testing is ok, the current
lnl_gsc_1.bin binary will be replaced with this one.

Note that the GSC FW macros use the compatibility version, so we can't
use them to produce the path of a binary based on the release version.
Since this is a ci-only patch to test a specific FW release, instead
of updating the macros we can just hardcode the path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9c14b0adad0c..98f4fcaae2a2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -132,8 +132,8 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
 
 /* for the GSC FW we match the compatibility version and not the release one */
-#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.0.1345.bin")) \
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
@@ -147,6 +147,8 @@ struct fw_blobs_by_type {
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
 #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
@@ -160,6 +162,8 @@ struct fw_blobs_by_type {
 #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
 	  a, b, c }
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
@@ -175,7 +179,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
-XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc, fw_filename_gsc_path)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -218,7 +222,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 				     uc_fw_entry_no_ver)
 	};
 	static const struct uc_fw_entry entries_gsc[] = {
-		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc)
+		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc, uc_fw_entry_gsc_path)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
-- 
2.43.0

