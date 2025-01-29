Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65F5C02193
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 09:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867D610E784;
	Wed, 29 Jan 2025 09:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C932ruNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF9F10E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738144615; x=1769680615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSa66nbB27Z9iHL0R2rqUWxAu7u9kgowA9XnMUjGLk0=;
 b=C932ruNlhUaFj8D+NXWOELKAgy+oTG4B7P1t8ixt9p4QZRLwEEFHjWr3
 zkxl1pLCzV5uBYDzIBQSEdB1ZBATT122qFdnGQxsCs47KJdxkJoU85oCJ
 l0cLdT0imFUys9V/3J6jWknwVA5Z9RXNqRd7ytEBS57W/5wCv+aw/JGXO
 NjjVxeXwXys1URDJ5kbLF/3MQNVzTpi2fK5PqWXS9XzRQtrKU9ej+s+bu
 a1IYCMwDwYXkfNJCeuQez1ZUgaby0x8jaG2kTFW3oxBqyZsLsVlPKH1Dh
 UyCRtDTEccruKXoEMitHYLfCsjfKePM8kdJbUAqFseh+5//3WNDjlySn0 g==;
X-CSE-ConnectionGUID: bXlVye2sTMWca3pNEC7aew==
X-CSE-MsgGUID: vYMBSiHhQC+Z6Pt7MK5m5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42579507"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="42579507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:41 -0800
X-CSE-ConnectionGUID: N2BC3qLZShWEyeH7J1T8nA==
X-CSE-MsgGUID: AVSbnWCpQp2oIkWhahI4/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108958166"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to
 v70.36.0
Date: Wed, 29 Jan 2025 15:46:48 +0530
Message-ID: <20250129101653.1976699-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
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
index 18e06ee9e23f..d9ff285c5d1d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -108,17 +108,17 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
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

