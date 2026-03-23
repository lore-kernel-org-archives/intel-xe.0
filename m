Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6360F483D7
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 18:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931A610E36C;
	Mon, 23 Mar 2026 18:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKtVajFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C0610E36C
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774289813; x=1805825813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rB13Aa1G8e/Mv5P12zcnVVIRpD6e8aJJGwwJ+HYkIXw=;
 b=aKtVajFdSOGP7cWLMn5RNuNs0m6W/clD4AOmSjTMUhlBzx36Tp7EHv2h
 3JJ7+dtE3liT+944a7/H32WLOl6CNHWzBv//w3PhOlHduLny4uH+5D9fT
 NN18xNHHhTwtJaevlFYI1Tx514ahQjvj9nbycMDuhf92njpU3b1UMTMaV
 UI+chdycm8hZvnycN8PwuMZ36oMRR6Tu10ZJ3Ybek6fSAL6/5oWuDUQ6I
 Rdd2mc2rbc7uO/tYdOfu+ivIfBIoJMjJYq4rTsMNL4puwuXqrxaSfXRCL
 9TVl8uw/3L86zjWQgGU6s5sY33eO2mgMq8CjpX4Dk1LGS30rh8z93Qa0h w==;
X-CSE-ConnectionGUID: ckDXBMa9RqOqlLqT+p00LQ==
X-CSE-MsgGUID: NMgz99UgRvWjJk7EFf22wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75415214"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75415214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 11:16:53 -0700
X-CSE-ConnectionGUID: O8ZX3SwjTyajvtLUruK16A==
X-CSE-MsgGUID: NyqsfkgGTLaPV68XAvWcyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254589818"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 11:16:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI] drm/xe/gsc: test new GSC 105.0.2.1397 for PTL
Date: Mon, 23 Mar 2026 11:16:46 -0700
Message-ID: <20260323181645.3013877-2-daniele.ceraolospurio@intel.com>
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
ptl_gsc_1.bin binary will be replaced with this one.

Note that the GSC FW macros use the compatibility version, so we can't
use them to produce the path of a binary based on the release version.
Since this is a ci-only patch to test a specific FW release, instead
of updating the macros we can just hardcode the path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 50ec86b259b5..ff6bc1d12901 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -144,8 +144,8 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
 
 /* for the GSC FW we match the compatibility version and not the release one */
-#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	ptl,	105, 1, 0, "xe/ptl_gsc_105.0.2.1397.bin"))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
@@ -160,6 +160,8 @@ struct fw_blobs_by_type {
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
 #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
@@ -173,6 +175,8 @@ struct fw_blobs_by_type {
 #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
 	  a, b, c }
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
@@ -189,7 +193,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
-XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc, fw_filename_gsc_path)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -232,7 +236,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
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

