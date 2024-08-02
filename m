Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363C5C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 00:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D414410E526;
	Fri,  2 Aug 2024 00:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8887Z10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133FD10E638
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 00:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722559223; x=1754095223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMqbaU3ROElkTeNTx2cE1LWew9FEpw/t7TfGEwNRfeQ=;
 b=Y8887Z10E0BOfEytx1rZAgW16tSX/sSAKGwZ3jCNaA9E3d/fsnDgiZTM
 IhChv1Jv4U9WwQstJmSd7EunIVACZuBlijNa2uPDAmUGgQAGlJ91Zb++b
 WOWNlh36jSNleYfcit0QNBYc6jcIiVWEOe+QjIvGVJxDPCbQxNhVhhWkz
 NxhvFt5qZXTUQ8fiA8FaJArE8ttahEMB+VRd5h+363M86VYagjYeVtG/9
 ZQ4TU1UduWXz7vpwh5QhyVtoNZh4/Y33SvxJBlz+/nJ45GTQIc4MPHlqF
 JVbn4GeVd5fC342ZlOHV+HXV/z+1F8kcD2pX2iQommt67u1Clwc0aR80m Q==;
X-CSE-ConnectionGUID: 6NOozJPSTAOGpn52sc5M7A==
X-CSE-MsgGUID: FH80ITOLQk+o5yXd99tXgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="45963266"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="45963266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:22 -0700
X-CSE-ConnectionGUID: VhtvNSJBQZOrjiTJdS4yNQ==
X-CSE-MsgGUID: 5dWGHxhHR2ia3O8SKNEIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="92767538"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:21 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/2] NOT_UPSTREAM/CIdrm/xe/guc: Release GuC v70.29.2
Date: Thu,  1 Aug 2024 17:40:16 -0700
Message-ID: <20240802004017.3057708-3-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802004017.3057708-1-julia.filipchuk@intel.com>
References: <20240802004017.3057708-1-julia.filipchuk@intel.com>
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

CHANGES FOR TEST FROM OTHER PATCH SERIES.

Released version is set as recommended and minimum.
Add comparable version macro to xe_uc_fw.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.h   |  3 +++
 drivers/gpu/drm/xe/xe_uc_fw.c | 30 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index e0bbf98f849d..9a0b9123dce0 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -11,6 +11,9 @@
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
 
+#define GUC_SUBMIT_VER(guc)   MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
+#define GUC_FIRMWARE_VER(guc) MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..9c639c6b8970 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -15,6 +15,7 @@
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -105,17 +106,17 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
@@ -306,14 +307,15 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 {
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_guc *guc = container_of(uc_fw, struct xe_guc, fw);
 	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
 	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
 
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 
-	/* We don't support GuC releases older than 70.19 */
-	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
-		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
+	/* We don't support GuC releases older than 70.29.2 */
+	if (GUC_FIRMWARE_VER(guc) < MAKE_VER(70, 29, 2)) {
+		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.29.2 or newer is required\n",
 			  release->major, release->minor);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index c108e9d08e70..1b1fdd103b9c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -12,6 +12,12 @@
 #include "xe_uc_fw_abi.h"
 #include "xe_uc_fw_types.h"
 
+/* Create a comparable u64 version number. Prevent truncation from smaller types. */
+#define MAKE_VER(maj, min, pat) \
+	(((u64)(maj) << 32) | ((u64)(min) << 16) | (pat))
+
+#define MAKE_VER_STRUCT(ver) MAKE_VER((ver).major, (ver).minor, (ver).patch)
+
 struct drm_printer;
 
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
-- 
2.45.2

