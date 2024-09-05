Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A0ACD4F20
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 05:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F92010E418;
	Thu,  5 Sep 2024 05:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwEWleNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3FC10E023
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 05:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725513260; x=1757049260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7g4xdSTrtXBgAZzu5BWhVUWHgKGxHCQ5BXdzPBmy+HU=;
 b=EwEWleNmL42Mq/t3jc8EWsVlVqd+IrAVDe6ijYguviNsx/v4qLRD9VAK
 yGvIB7qBckYpITYBblQzxoXHqIzbH4+yTaJRgMKKDdERQLj/XYJPV+X4/
 YEm0O/2nmtvuvatjPCOsmTsiCHL7NBdm97BGfBhldyT9OHJW99ND9n131
 YizjVL/LtqND5WnHhhDogyy8NQcF+RUzUAV2QlpIMRXcclV1QoNMRrvYf
 I9raRQ3ScmEzG860CwJsvn8wE73Gh6a8hbUjKjgblU5aO58R44ipe2EDy
 fQ+jocOM8ukF62eo8Djg7NNdmWbOk9QKOiZVC9HrdYZsmjY7bmoSxD7/g w==;
X-CSE-ConnectionGUID: Aiu8PQ3ZSqOvLAlCa/9evQ==
X-CSE-MsgGUID: kDJiF0oWS4qKN+pZ+8qxtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23717410"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="23717410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:14:20 -0700
X-CSE-ConnectionGUID: 9cwzBdC5QtmLHw4i/VFD6Q==
X-CSE-MsgGUID: zLdVevRkSwC+TY3uLsdAcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="65519322"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:14:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 1/2] drm/xe/xe_gt_idle: modify powergate enable condition
Date: Thu,  5 Sep 2024 10:58:12 +0530
Message-Id: <20240905052813.4169007-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240905052813.4169007-1-riana.tauro@intel.com>
References: <20240905052813.4169007-1-riana.tauro@intel.com>
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

modify powergate enable condition based on the type of GT or presence of
media engines. Also have a copy of the value written to powergate enable
register.

v2: add condition to enable render or media powergating (Badal)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c       | 26 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..3924f9f3d0a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -98,7 +98,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 pg_enable;
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+	u32 vcs_mask, vecs_mask;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -110,12 +111,19 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
-	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
+	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
+
+	if (vcs_mask || vecs_mask)
+		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
+
+	if (!xe_gt_is_media_type(gt))
+		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if ((gt->info.engine_mask & BIT(i)))
-			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
-				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
+			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
+						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
@@ -128,20 +136,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
-
-	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
+	gtidle->powergate_enable = 0;
 
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
index f99b447534f3..7a8e63f2ebcc 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
@@ -23,6 +23,8 @@ enum xe_gt_idle_state {
 struct xe_gt_idle {
 	/** @name: name */
 	char name[16];
+	/** powergate_enable: copy of powergate enable bits*/
+	u32 powergate_enable;
 	/** @residency_multiplier: residency multiplier in ns */
 	u32 residency_multiplier;
 	/** @cur_residency: raw driver copy of idle residency */
-- 
2.40.0

