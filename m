Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEABCC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254910E28C;
	Thu, 20 Jun 2024 22:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMKpvZpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287810E8A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718923850; x=1750459850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8THKLH2UN0b1lK37uVqg8HhnCTphbckD1nYOoGjFZr8=;
 b=QMKpvZpbqp8ZbJcnpB1ANNSW6drWQiajhoaD29avOJ23ePpOPg2ueklL
 UXfJLbXJCA7M81m2qCWTuJZ/B0sQh22OZJckccrKf19O5RaNu4YmJkMOq
 aX7xvUoKHSB9M50jpwPZpRRqUhMEV7/VkE87IjtySYTsUwpHnbIiFNAxr
 dECb8eVi238DV93nf3jnWemy4etlLnUG5V8sgy0lDlV9EPcRhHf33b/cD
 uV6RU344aHJZwXIam3W2dWmDSI9lyvmU52cr+J/uKBz+tQYl3p7CgxFi1
 5v+twP5Xo6OO3AX6noLkt6NdhJHyskY7GJYaVZMcTjpke5dvjVIxnXS9T g==;
X-CSE-ConnectionGUID: J/i0U5WVRSipUwSPELibCA==
X-CSE-MsgGUID: 0oNHjsvaT2G8sVLW6ROFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33480734"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="33480734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:50:49 -0700
X-CSE-ConnectionGUID: Bs8m+7c4SK6smPNHiJeeTg==
X-CSE-MsgGUID: 2l9DGC6CQj6Bl+11g/U4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43074617"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 15:50:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 2/2] drm/xe/guc: Request max GT freq during resume
Date: Thu, 20 Jun 2024 15:49:28 -0700
Message-Id: <20240620224928.3986377-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240620224928.3986377-1-vinay.belgaumkar@intel.com>
References: <20240620224928.3986377-1-vinay.belgaumkar@intel.com>
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
index 7ecb509c87d7..51ed6002c900 100644
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
index edf4a29a2aa3..d88f5e960fbd 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -710,17 +710,28 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
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
index 55fdb55ab688..efda432fadfc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -33,5 +33,6 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
+void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

