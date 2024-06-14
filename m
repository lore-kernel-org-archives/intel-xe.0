Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E136C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 22:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0987D10E2BD;
	Fri, 14 Jun 2024 22:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKmqiDLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE810E2B9
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718404913; x=1749940913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6OzldBnEBhqmM81K132UQaJG156dQSEkdBtrcaVldU=;
 b=VKmqiDLqiJTtE+flFjOeMXPj86lD8mK4Dc5byk4SOPBH7DJI343DB15R
 XWdaD2Qay2Vzt0zii4p28gHCbemwsukVBRwWxH9u3fi70KgYLNbPD0J0P
 n5ijIXWqhnjtGRxMq5aTp51YW7Ls5m4YQPoDz2paUPzmHcK6Yx2MlvX+X
 dIzpjOsr/S5KfVeLQO0Kpwd51B/CSjNr8dd86J2j6EvU5+tggnkn9o6PY
 rhziwaGmXYtsCUG70pG1PzFDCMCqKoZFrAw0Mn2cmuCePNChdm8HMv2js
 AU7mpiVstQ0vuXBtzDDtGPJHikjckqTBjaU2yxC4Q+LL5FMhva0S2mQYG Q==;
X-CSE-ConnectionGUID: KE16S71dSRSZL3jPp/+IaA==
X-CSE-MsgGUID: SbWU3pvBQtiwxEtpSgQs1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19168526"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="19168526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 15:41:53 -0700
X-CSE-ConnectionGUID: sN0tEdZlRUKyh31l1A5sCA==
X-CSE-MsgGUID: TtTFyJnxRyKt4sMDqVuxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="63842126"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2024 15:41:52 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/2] drm/xe/guc: Request max GT freq during resume
Date: Fri, 14 Jun 2024 15:40:32 -0700
Message-Id: <20240614224032.2965600-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240614224032.2965600-1-vinay.belgaumkar@intel.com>
References: <20240614224032.2965600-1-vinay.belgaumkar@intel.com>
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
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    |  4 +++-
 drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0bf6e01b8910..847feb150775 100644
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
index 7ba875c3613b..3b4103f59b19 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,5 +31,6 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

