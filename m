Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE40FD5B172
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 14:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19A810E4F8;
	Mon, 15 Dec 2025 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVH8Ap1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361D810E4E1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809497; x=1797345497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rH11E9fliUsYkc2GGkPfn8O5znAGKwq4rM177Q6anlQ=;
 b=nVH8Ap1AX/CuV6IgCgpjRniolz99EhEajYSwEgfgfquSR3Q9PikSG+Mk
 aQKvyC8vnZ9HBmXS2cCDJhr/84D5jc3IbccH8JzcPT6G/4/WCQv89bce9
 A0MPmG6vyCx/wNGwnj2Ehscnvo+IDUCCgiR8Sce5Srn5XRmc5PDVhFMaz
 uI1WqJ4GGwe4Czm9vPofm6ghpw+VZVv6aAeKmBa3MHBoFlKwOyLUjkizL
 H5CU0nwtguUcYvyYxL9TGQJLPgSu7zAGXwcfp5iNiYi6kgVilbD3JO342
 ANZwCufydJ1J0ai8v/tKh4qzqwC5e8kNsao1duCbup5ykSS3Ss6nsXRqo Q==;
X-CSE-ConnectionGUID: wZN7hCk9RE6ohQwZD1THfg==
X-CSE-MsgGUID: CRn7hCHMRoq+RDj1lCwBeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85304130"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85304130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:11 -0800
X-CSE-ConnectionGUID: nW3OizXaRFKcWYYaHLMTfQ==
X-CSE-MsgGUID: FckS/u5iQ8q3327yfAPRyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="196828293"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
Date: Mon, 15 Dec 2025 15:37:37 +0100
Message-ID: <20251215143739.196336-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215143739.196336-1-michal.wajdeczko@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
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

There are already few places in the code where we need to check GuC
firmware version. Wrap existing raw conditions into a named helper
macro to make it clear and avoid explicit call of the MAKE_GUC_VER.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
v1: split from [1] (Michal)
    rename helper and add new macro (Daniele)

[1] https://patchwork.freedesktop.org/patch/693953/?series=158874&rev=1
---
note: there is yet another place that could be updated (xe_guc.c)
      but since it seems already broken (VFs don't know FW version)
      it should be fixed separately anyway.
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 ++--
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 3174a8dee779..7410e7b93256 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -1026,7 +1026,7 @@ static void action_ring_cleanup(void *arg)
 
 static void pf_gt_migration_check_support(struct xe_gt *gt)
 {
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
+	if (!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 54))
 		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..a169f231cbd8 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,10 +18,16 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define MAKE_GUC_VER_ARGS(ver...) \
+	(BUILD_BUG_ON_ZERO(COUNT_ARGS(ver) < 2 || COUNT_ARGS(ver) > 3) + \
+	 MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
+
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+#define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
+	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
 struct drm_printer;
 
@@ -96,4 +102,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
 	return &guc_to_xe(guc)->drm;
 }
 
+/**
+ * xe_guc_fw_version_at_least() - Check if GuC is at least of given version.
+ * @guc: the &xe_guc
+ * @ver: the version to check
+ *
+ * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
+ *
+ * Return: true if loaded GuC firmware is at least of given version,
+ *         false otherwise.
+ */
+static inline bool xe_guc_fw_version_at_least(const struct xe_guc *guc, u32 ver)
+{
+	return GUC_FIRMWARE_VER(guc) >= ver;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e06c6aa335bf..5feeb91426ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -347,10 +347,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
 
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364)) {
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
 		u32 data[] = {
 			0x0,
 			0xF,
-- 
2.47.1

