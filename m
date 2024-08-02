Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA9C52D6D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B86310E08C;
	Fri,  2 Aug 2024 22:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6fjPOcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D07E10E0F2
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722637293; x=1754173293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3hfsNJKFPEFfORQV2W+a/ID8RD8csc8mcnMxwTXnYtA=;
 b=k6fjPOcsgl1oj6GvO2bGu/Drok6qWM0TlEdU+FRN1qN3ExN+QBamXNeu
 gGhYzUIiSugtQDZKxuTyjhCzDHmulGjgPnHr1RcnObmuLCtsRoI/yUll2
 OkPVv/B1jQYKLqNoyrrK7RkWl/rXgb4JX57YOCLdnxl8xgjItD9HI0eRc
 gYR1zQXwwyz4W65ksLrnkXDbGiLXvOPo1pHzPW/V644u36wOGApDBRGSZ
 gkG0izVVKfAUZ+shayUTgqdHzS2saTmCtw7JTfQkRHzIcu7XYpznZEQOV
 DJ+cLMBRU2lI+wMvW8BJcmBbOUjsnANThQevLM1R+ezPW6z3918HS8X4F w==;
X-CSE-ConnectionGUID: bY3q5CVgTVeLX26gDVCpug==
X-CSE-MsgGUID: 4ZjTNNQcR+mrBRhBQaCXRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20808503"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20808503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:21:31 -0700
X-CSE-ConnectionGUID: FlytoQkaRuuwYd9SAQVqOw==
X-CSE-MsgGUID: NJWpvhPATAyfIfAk0fGhow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60385237"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 15:21:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 2/4] drm/xe/guc: Bump minimum required GuC version to
 v70.29.2
Date: Fri,  2 Aug 2024 15:21:27 -0700
Message-ID: <20240802222129.3976212-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

The VF API version for this release is 1.13.4.

Bumping the minimum required GuC version just before force-probe
removal allows us to set a baseline for what API features are expected
to be available. I.e., at this point there is no need for any version
checking in the code before using a feature. Of course, if/when the
API is extended in future GuC releases, those new features will need
API version checks in the code.

Bump the recommended GuC versions to match.

Also add numerical comparison helpers to simplify the version number
checks.

v2: Reword commit message and make comparison helpers GuC specific -
review feedback from Daniele, done by JohnH

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.h   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c | 27 ++++++++++++++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index e0bbf98f849d..c3e6b51f7a09 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -11,6 +11,16 @@
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
 
+/*
+ * GuC version number components are defined to be only 8-bit size,
+ * so converting to a 32bit 8.8.8 integer allows simple (and safe)
+ * numerical comparisons.
+ */
+#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define GUC_SUBMIT_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
+#define GUC_FIRMWARE_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 5b70d23724c4..6bd1962bce36 100644
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
@@ -105,15 +106,15 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
@@ -309,10 +310,10 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 
-	/* We don't support GuC releases older than 70.19 */
-	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
-		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
-			  release->major, release->minor);
+	/* We don't support GuC releases older than 70.29.2 */
+	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
+		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer is required\n",
+			  release->major, release->minor, release->patch);
 		return -EINVAL;
 	}
 
-- 
2.45.2

