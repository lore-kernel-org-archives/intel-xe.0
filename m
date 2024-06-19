Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6639FC2BB85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 01:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1814410E826;
	Wed, 19 Jun 2024 01:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyfBu2l/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286BC10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 01:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718759281; x=1750295281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=En5IaqT0nt0T57svJ5sFRcARbAx/nROHHkmhfR+zxAY=;
 b=QyfBu2l/bge/VS71PNRLHlp0hrGgFyfcTUpaDHVHdyR7ADnqjD7131EB
 KXo4VIqimoSX3TZ81Hse72Ww05fNHP1g8Hh97Ik7D3YrnjLfIInxGOJQH
 FGvjxaKEwDKdsQ36GeQ8Ual7YVQJKQ7HhrghV2KM5puyg2LlFI/W6jW2Y
 XI5+fAhzgn5wKNuyW0Shn1Hig32PjL+ZaF4acXI3RaF75wsV6QTLnTDxo
 oIGD6mSSl+51WE2GVU2pcHgxWstmNbtBPSKE5p6to4PgXLcOP6hF2cKEs
 FYLi5KyiIVG0BzdiBO12Oqqw9ZA9OkWGTN1tfWA/AAHow80GOQqti4Cb1 w==;
X-CSE-ConnectionGUID: Km3z4nGLRIS68LS/NKgWlQ==
X-CSE-MsgGUID: kReKObzGQze5BHc7SR/yqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15804517"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15804517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 18:08:01 -0700
X-CSE-ConnectionGUID: kyOAQPwdSQ6bprYRra82sg==
X-CSE-MsgGUID: Bocjvb7ySMKXn6955rCmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41840984"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 18:08:01 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 2/2] drm/xe/guc: Request max GT freq during resume
Date: Tue, 18 Jun 2024 18:06:42 -0700
Message-Id: <20240619010642.3744702-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240619010642.3744702-1-vinay.belgaumkar@intel.com>
References: <20240619010642.3744702-1-vinay.belgaumkar@intel.com>
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

v3: Keep pc_init_early() and init RPx values there (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    |  4 +++-
 drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0e1a5674ef13..178a0fe59107 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -699,6 +699,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
 {
 	int ret;
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_raise_unslice(&guc->pc);
+
 	guc_write_params(guc);
 	guc_prepare_xfer(guc);
 
@@ -784,7 +787,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
-	/* Raise GT freq to speed up HuC/GuC load */
 	xe_guc_pc_init_early(&guc->pc);
 
 	ret = __xe_guc_upload(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9194328b495..1775183662a4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -688,17 +688,28 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
 }
 
 /**
- * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
+ * xe_guc_pc_raise_unslice - Initialize RPx values and request a higher GT
  * frequency to allow faster GuC load times
  * @pc: Xe_GuC_PC instance
  */
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
+}
+
+/**
+ * xe_guc_pc_init_early - Initialize RPx values
+ * @pc: Xe_GuC_PC instance
+ */
 void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 	pc_init_fused_rp_values(pc);
-	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
 }
 
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index ce98db2d2634..2ad8ed76b4ca 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -30,5 +30,6 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

