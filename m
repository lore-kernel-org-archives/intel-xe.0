Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7FC36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 22:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172C10E2DC;
	Tue,  8 Apr 2025 22:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy/hii7H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973B310E2DC
 for <Intel-Xe@lists.freedesktop.org>; Tue,  8 Apr 2025 22:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744151802; x=1775687802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0pu04LrEjOCLu1qruEpvvEwYG/bthQlHvCBuE+XvCek=;
 b=Cy/hii7HRkHhKWjKbv9h4Jan2IMjEeAVsgSdE5Xir6gSGQSMHFWma7g2
 eIgBJV6nmxRPlue6i4iSRwNTJZRX7EPG3kRV8dSVNKaH6b6f9rN8XKrXd
 tWh/FXBSv6jkiuf4lAZ5Ap4bGQNOpUsLHTshIhfyhGZ8vDD9NTHx1fqO2
 lPaXarBPKZu+uzLg0RJrmibkn4+tePTwNEBkUPvJcsGZCzeajfQja8h3E
 eeoe+QW0VVegHTd0lpXi07ZKpMGNaQU9lS7cnymJr8vQ1qsUCRsSqUUBi
 mmJcVkWs+WOZLoJtQe4CSHQ9FE5jOZb/M1dymNigu9HcNPyEhQYuYMpcL A==;
X-CSE-ConnectionGUID: JHCqcitUTJCqEGgySbBvPA==
X-CSE-MsgGUID: DJ5NqcMGSK6nnyFZUn9+fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45619424"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45619424"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 15:36:42 -0700
X-CSE-ConnectionGUID: YZ4gjr/HQX+QFFrGrDkmmA==
X-CSE-MsgGUID: 8QKgwr9nQvK2kN8PwzLRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128137573"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 08 Apr 2025 15:36:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] [CI] drm/xe/guc: Squash of new w/a and GuC update
Date: Tue,  8 Apr 2025 15:36:41 -0700
Message-ID: <20250408223641.1903073-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
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

From: John Harrison <John.C.Harrison@Intel.com>

Single patch squash of enabling a new w/a and updating to the latest
GuC, including forcing explicit load of that version, to get CI results.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       |  5 +++++
 drivers/gpu/drm/xe/xe_uc_fw.c         | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  2 ++
 4 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index d633f1c739e4..7de8f827281f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -367,6 +367,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
+	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 88400f249e61..315f86c9164f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
 					&offset, &remain);
 
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
+		guc_waklv_enable_simple(ads,
+					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70d7b542f665..c1a933e78b0d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -114,18 +114,18 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
-	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
-	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 44, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 44, 1))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 44, 1))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	mtl,	70, 44, 1))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
+	fw_def(DG2,		GT_TYPE_ANY,	mmp_ver(i915,	guc,	dg2,	70, 44, 1))	\
+	fw_def(DG1,		GT_TYPE_ANY,	mmp_ver(i915,	guc,	dg1,	70, 44, 1))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	tgl,	70, 44, 1))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	adlp,	70, 44, 1))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	tgl,	70, 44, 1))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	tgl,	70, 44, 1))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9b9e176992a8..9efc5accd43d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -57,3 +57,5 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
+16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
+		MEDIA_VERSION_RANGE(1300, 3000)
-- 
2.49.0

