Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E13C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 23:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6026410E25E;
	Tue,  4 Jun 2024 23:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKmOUXAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BA210E25E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 23:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717544340; x=1749080340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=64Ps6FuDB4yKWmtIvqew57FMVESmO1gmQ1nPkiZNa5U=;
 b=WKmOUXAtAAoWqckeCIb5ACK/dyJepNTfu+uJ2ZE912LqDYs6shY3gEQO
 kj/GgcWbpON+WoDa3rnK2eJPnY7FHMAKrSzsLfiILWdCkn9KrqiR0OG60
 HzDQUobLQ2QweW16xLMFKP80viXd6sBFmPoFubqXZnqfSkOxKlgeSyPw9
 9Qfcayu+YzUIvK4PTXpxvLFavII7/e9BBWYxkLSX47eanB9rHYskPsXlz
 9kwX2OrI+xMJKKxKwD1KZ7CyEcNpRRw4hnbyunZHv/xDWxHxLoXiygk2T
 ET5r6+PgGPOG8SCH1ijhxjysKN/i3ZTEnjD7JpmdapwF2f3QkFNfXECm7 Q==;
X-CSE-ConnectionGUID: It3N9/IzSXeZScQ/4SQYMA==
X-CSE-MsgGUID: JUlsfH5uQZm82Efd7DJSkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24696991"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="24696991"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 16:38:57 -0700
X-CSE-ConnectionGUID: fMYPOIRXSGSYWNGC1J4SZg==
X-CSE-MsgGUID: t+3Jxp33Rb+ikcTvkbOsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41833168"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2024 16:38:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2] drm/xe/guc: Request max GT freq during resume
Date: Tue,  4 Jun 2024 16:37:51 -0700
Message-Id: <20240604233751.3947374-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

We already request max freq in the load path, moving it
to __xe_guc_upload will ensure this speeds up GuC load in
the resume path as well.

v2: Rename xe_guc_pc_init_early since we now call it per
GuC load (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 6 +++---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 086a048876ba..dff9a9dfda87 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -696,6 +696,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
 {
 	int ret;
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_raise_unslice(&guc->pc);
+
 	guc_write_params(guc);
 	guc_prepare_xfer(guc);
 
@@ -781,9 +784,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&guc->pc);
-
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8187dfb2ad6c..eb7950c36151 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -675,11 +675,11 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 }
 
 /**
- * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
+ * xe_guc_pc_raise_unslice - Initialize RPx values and request a higher GT
  * frequency to allow faster GuC load times
  * @pc: Xe_GuC_PC instance
  */
-void xe_guc_pc_init_early(struct xe_guc_pc *pc)
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 532cac985a6d..ae000e66684f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -28,6 +28,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
-void xe_guc_pc_init_early(struct xe_guc_pc *pc);
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

