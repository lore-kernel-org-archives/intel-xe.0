Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBC606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DrQVC00H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D110E037;
	Fri, 13 Nov 2026 19:23:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453010E037
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794597804; x=1826133804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MTYQtFwRIlTxSOSRLKdhCSUozBmBCWKD9BATWFLO9R4=;
 b=DrQVC00HJbIgByuDmLMrqyt+jH8EBX1NuOBzHksx1RIPNiu8datwDGrI
 WR9OCPXH+J4VtBoi3P9CcXx9QayP+6B8LYUUT211/CXxUye5pLYZhNwOe
 RcyQp8553X8zlrv16JenX6jQSWujLkVVySigES/DNYmAKkagfkrKvJ+dZ
 VOTEiWN9PH2cxAKp8tX6BYpBkeNI5e8AuIU4atz/mRNmlrNEcUNv5WYxe
 YLiohFqWajL4vZiNl2Owdp3R/w5pBc8cc4o0to2pxsLYY6hVCOOPJdvKP
 L+LGvsD70KACgN9iHTnPiP2fRKVMw5j4NSgt6pcGcK3lcW9yMhijuKY0q w==;
X-CSE-ConnectionGUID: l9PLgUYgRNOs4CNgpZ/y6g==
X-CSE-MsgGUID: r8MZ4AHUTwa7u2jmp+eC9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3444053"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3444053"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:23:24 -0800
X-CSE-ConnectionGUID: f7lsOrQLT6yly+4S0F9o1Q==
X-CSE-MsgGUID: ev1x2g4CTaGMRGJMpYEh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9340920"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:23:23 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI] drm/xe/gsc: Test NVL GSC 108.0.0.1242
Date: Fri, 13 Nov 2026 19:23:12 +0000
Message-ID: <20261113192311.1455041-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch is for testing only. If the testing is ok, the current
nvl_gsc_1.bin binary will be replaced with this one.

Note that the GSC FW macros use the compatibility version, so we can't
use them to produce the path of a binary based on the release version.
Since this is a ci-only patch to test a specific FW release, instead
of updating the macros we can just hardcode the path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c042075a36e5..44ea31da066e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -146,8 +146,8 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
 
 /* for the GSC FW we match the compatibility version and not the release one */
-#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/nvl_gsc_108.0.0.1242.bin"))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
@@ -163,6 +163,8 @@ struct fw_blobs_by_type {
 	MAKE_FW_PATH(dir_, uc_, shortname_, "")
 #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
 	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_
 
 #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
 	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
@@ -176,6 +178,8 @@ struct fw_blobs_by_type {
 #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
 	  a, b, c }
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }
 
 /* All blobs need to be declared via MODULE_FIRMWARE() */
 #define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
@@ -192,7 +196,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
-XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
+XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc, fw_filename_gsc_path)
 
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
@@ -246,7 +250,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 				     uc_fw_entry_no_ver)
 	};
 	static const struct uc_fw_entry entries_gsc[] = {
-		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc)
+		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc, uc_fw_entry_gsc_path)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
-- 
2.53.0

