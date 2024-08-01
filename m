Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D0CC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 09:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3410E8CF;
	Thu,  1 Aug 2024 09:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nw4NPNyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A70F10E8CF
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722505193; x=1754041193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzBaHUc3ik2dEonmL5czKR8RSbBArrorZfimbFkUcGs=;
 b=nw4NPNyNhjKhX64xd+meejgKn/HDgYtEPIl2W+UX6DePmjx2S531XROq
 hZ0pMpUlo8F+1aMjrwEP231TNhe7123iJf9Q6RvCdfm+icy6pxB4xPDH3
 fXWlQwO6w/802aePcOW51KFoGp0EfnenxiSXXMSwNjXyxQxy/9rftX6Dm
 SPP4wgjQzki4/dVrX8JY6YNVXMr373ccw7XXBX46fntadMWpsINBR/ggj
 +e7GZstYfqJMISH7jltLWfMAjnJD7ebyWp4fHDWTWK0UKAvKZpU+O14x0
 +Jm5gf+TQiPFmD7/BoU8WmAelxeSV0p8T5hBYtfiQnMntsERXlx2o22LS A==;
X-CSE-ConnectionGUID: rjX0oJzzT1y/RdbXqOvI8A==
X-CSE-MsgGUID: VGaTp0jFQqa7Vfru+vENiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="45859383"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="45859383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:50 -0700
X-CSE-ConnectionGUID: JnglUcKRTiOqWtSqNVS8uw==
X-CSE-MsgGUID: AG7awenuSgG6VDDTpxxuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55221571"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, matthew.d.roper@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v3 1/2] drm/xe/xe_gt_idle: store powergate enable bits in
 gtidle
Date: Thu,  1 Aug 2024 15:23:04 +0530
Message-Id: <20240801095305.1209046-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240801095305.1209046-1-riana.tauro@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
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

Have a copy of the value written to powergate enable
register. No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c       | 18 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..7188542aea43 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -98,7 +98,7 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 pg_enable;
+	struct xe_gt_idle *gtidle = &gt->gtidle;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -110,12 +110,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
-	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+	gtidle->powergate_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if ((gt->info.engine_mask & BIT(i)))
-			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
-				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
+			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
+						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
@@ -128,20 +128,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
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

