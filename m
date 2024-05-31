Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8689C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 06:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2C10F34B;
	Fri, 31 May 2024 06:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGC6dc4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572C310E599
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717137179; x=1748673179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1OtvOId9O9608pnOyBr+NAZK0dQ3+V3LSrrCMe1VMs=;
 b=oGC6dc4Aaj+37K/wjTHccAh0asUH1G2UlmEmZM6YbJGAtVd/eZH/WLm/
 bPtmxGCAEHEBCXJX9YR6N/wgsAnDZEUdIa/8XcdDc9dLvog8RaKX3sgEi
 DJn6oqm5YZoXA8HREP1y5KGgfMBPsuJMX/c0XqwkXja6QLusQKD7VJdS3
 pdwqvfvALcHXS3yWcbLvst/oe0GjidSgmr6oo9oxYuVk/kCcjgxB/w5R4
 d0dRe8jMrWkOwajPepA4G0WzB1QB7MQGTEFxZiSJd1+ET6+5NZwTFl3AU
 sm1t8v++KHnmaVRMXzd+ySoR+mDLbbE4raVsQeb8UrXMUrGFrZqxiXk8k A==;
X-CSE-ConnectionGUID: sDxRPvM1QtWNAeJYiCdjcQ==
X-CSE-MsgGUID: uhsqtVbcQbevLXIOjsyyUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13427722"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13427722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:32:58 -0700
X-CSE-ConnectionGUID: 8f9ZEtwWTtaMM2pzDbNXWw==
X-CSE-MsgGUID: +dK4Nhl9Ry+tduMh1qfNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="59251211"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 23:32:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Add member supported_domains to xe_force_wake
Date: Fri, 31 May 2024 12:18:44 +0530
Message-Id: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

This field serves as a bitmask representing all supported forcewake
domains on the GT.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 48 ++++++++++++------------
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9bbe8a5040da..a2947f0046d4 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -26,15 +26,25 @@ fw_to_xe(struct xe_force_wake *fw)
 	return gt_to_xe(fw_to_gt(fw));
 }
 
-static void domain_init(struct xe_force_wake_domain *domain,
+static inline void mark_domain_supported(struct xe_force_wake *fw,
+					 enum xe_force_wake_domain_id id)
+{
+	fw->supported_domains |= BIT(id);
+}
+
+static void domain_init(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack, u32 val, u32 mask)
 {
+	struct xe_force_wake_domain *domain = &fw->domains[id];
+
 	domain->id = id;
 	domain->reg_ctl = reg;
 	domain->reg_ack = ack;
 	domain->val = val;
 	domain->mask = mask;
+
+	mark_domain_supported(fw, id);
 }
 
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -48,17 +58,11 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
-			    FORCEWAKE_GT,
-			    FORCEWAKE_ACK_GT_MTL,
-			    BIT(0), BIT(16));
+		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
+			    FORCEWAKE_ACK_GT_MTL, BIT(0), BIT(16));
 	} else {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
-			    FORCEWAKE_GT,
-			    FORCEWAKE_ACK_GT,
-			    BIT(0), BIT(16));
+		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
+			    FORCEWAKE_ACK_GT, BIT(0), BIT(16));
 	}
 }
 
@@ -70,18 +74,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (!xe_gt_is_media_type(gt))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
-			    XE_FW_DOMAIN_ID_RENDER,
-			    FORCEWAKE_RENDER,
-			    FORCEWAKE_ACK_RENDER,
-			    BIT(0), BIT(16));
+		domain_init(fw, XE_FW_DOMAIN_ID_RENDER, FORCEWAKE_RENDER,
+			    FORCEWAKE_ACK_RENDER, BIT(0), BIT(16));
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
+		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
 			    BIT(0), BIT(16));
@@ -91,19 +91,17 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
+		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
 			    BIT(0), BIT(16));
+
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
-			    XE_FW_DOMAIN_ID_GSC,
-			    FORCEWAKE_GSC,
-			    FORCEWAKE_ACK_GSC,
-			    BIT(0), BIT(16));
+		domain_init(fw, XE_FW_DOMAIN_ID_GSC, FORCEWAKE_GSC,
+			    FORCEWAKE_ACK_GSC, BIT(0), BIT(16));
+
 }
 
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..4179fc51291e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -79,6 +79,8 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	enum xe_force_wake_domains awake_domains;
+	/** @supported_domains: mask of all supported domains */
+	enum xe_force_wake_domains supported_domains;
 	/** @domains: force wake domains */
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
-- 
2.25.1

