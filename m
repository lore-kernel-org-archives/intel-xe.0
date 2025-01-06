Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152E7E77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72CD10E5AA;
	Mon,  6 Jan 2025 07:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXvSgHC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C05C10E5AA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736149012; x=1767685012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QRcV0oM7Ah4d0Yk7w0XFT+yU3L2UYJ6w1+p1WOKAzrA=;
 b=iXvSgHC2PKJoBgJqqagxfap/FwaqZnJ6OwDQDtxFLkU+TA4AHx69+WKH
 h9R+I19wYg9ExWZiapyBn760oQju3G5w7ucVcTgkpwYiA9QnP1h1gmA8b
 DUxNb+oFygwrqCJK00o/peT833tbHPETo+KCFHeYbxfY/skAw3XVGp6NJ
 PXy7+vSvryH8SqbAA/J57oB8hJ2l1KqvCpDDTs2WaaRlaR/0JpTeiQbla
 jq8cHIcltqsqM0PFFVJsTtkfgALkOF5U2qmNMkHc0BxCkc2RM/kV3wCsn
 Db1zG+aZ1tP7TBT6iy6Ch3jepI695LB1vSdB8v2jmJIpsEekVk+sQeEXU Q==;
X-CSE-ConnectionGUID: py0uxnkuR5qGXpAk3GeYeA==
X-CSE-MsgGUID: 0/iE/YU5QXi2cqfmTn75QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873093"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:52 -0800
X-CSE-ConnectionGUID: 6pOBPiY4TpeNAV1NNA6q1A==
X-CSE-MsgGUID: 4vO3nXaVQYyd3e9yCHF7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650840"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:49 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 10/10] drm/xe/guc: Bump minimum required GuC version to
 v70.36.0
Date: Mon,  6 Jan 2025 13:25:59 +0530
Message-ID: <20250106075600.852080-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
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

The VF API version for this release is 1.17.1

Bump the minimum required version to v70.36.0 to support
engine activity.

Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9c14b0adad0c..831d87507856 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -108,17 +108,17 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
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
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 36, 0))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 36, 0))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 36, 0))	\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 36, 0))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 36, 0))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 36, 0))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 36, 0))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
@@ -320,9 +320,9 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 
-	/* We don't support GuC releases older than 70.29.2 */
-	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
-		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer is required\n",
+	/* We don't support GuC releases older than 70.36.0 */
+	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 36, 0)) {
+		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.36.0 or newer is required\n",
 			  release->major, release->minor, release->patch);
 		return -EINVAL;
 	}
-- 
2.47.1

