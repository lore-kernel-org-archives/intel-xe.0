Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0BFC369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 23:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108810E9E3;
	Wed, 16 Apr 2025 23:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXfYx51v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42A10E9E3
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 23:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744846346; x=1776382346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1lxqE2FiblYVa6/PpJtG4HGqgYSx5a5pSo58Nwq6Qy8=;
 b=WXfYx51vfqIeH7+wM9zofAfhKpwaAYcCaRsv7tZ+sPCKp9lyP+GM7d/H
 n3aoFMBLfHZP9E3pBjywvuyUJLfNoAr3hJYM1P1jFInqnp6oOocOWAD2O
 dF104v3HMDmv/KuKbiMOjyGqo2Qxzp3o9Sv/IvnpyfQtlPqIq19Xzl86h
 KzLlIR1vPKljBmm1EYjbwoYZTXQGamPYxP3eK5OqMHbuZnLmsB249ybCK
 Y1u9ZmCw5LDeDsC63SLP8UDmCEiAydlM2CdVP1X/Puf4eIsITBar5+9TF
 6lRWAy9GvBEYKpZp8LYEKY4hYnzz68WnlMcc8IuPMe0bGo17oaVRQ3WgE Q==;
X-CSE-ConnectionGUID: zS40xUlJS26ypoFDNs1ArQ==
X-CSE-MsgGUID: ny6pdcmZRQCOzwP90htWCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57084680"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="57084680"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 16:32:14 -0700
X-CSE-ConnectionGUID: tDYbkGgzRzqVpJCH0HpWAA==
X-CSE-MsgGUID: FLoWZdGlRFaIMvtdR0POew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="130620210"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 16:32:15 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI] drm/xe/gsc: test new GSC 104.0.5.1429 for LNL
Date: Wed, 16 Apr 2025 16:32:02 -0700
Message-ID: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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
index 7b2d01d39b86..7237737b150b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -139,8 +139,8 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
 
 /* for the GSC FW we match the compatibility version and not the release one */
-#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.5.1429.bin")) \
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
@@ -154,6 +154,8 @@ struct fw_blobs_by_type {
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
 #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
@@ -167,6 +169,8 @@ struct fw_blobs_by_type {
 #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
 	  a, b, c }
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
@@ -183,7 +187,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
-XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc, fw_filename_gsc_path)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -226,7 +230,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
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

