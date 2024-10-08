Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC72CED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F56B10E46A;
	Tue,  8 Oct 2024 06:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wlrvs0DC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5342010E46A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370365; x=1759906365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxpGNK9kStoiF3VSBahehTz1iDmJoQ8TY4tCeTgoeus=;
 b=Wlrvs0DC0ffyWG5eNXssQ6hzy9IyOPu5SRop4pCNdId1h9yLmOmSLhgB
 A7UuETsWMHQP0xzLRikowXsNU7DEGrW2nX4ZVjeczwDYcOSs09/NKh5ug
 Qp4W/zGPuUwrA6KFmYw8rZi5kVrs9eVT1v6Z0muoGAOFPXNJiCEEKj8XL
 qeJMTgf32R5ml2mKg49g10ah9BU6G6hVfCWLL4qDHuVjKur6BzLAeZUKH
 oKLOCM0XhMq4DOm3AZj/x96d0s1BJNke4gKkt16loPQ3SDmU42kUkBOaT
 2PDAD1Q2Ap+Ts9Cub3cja3fODuyZnsViQOqEz4d0kwtUt+8X3C8M+X58T g==;
X-CSE-ConnectionGUID: 3vU8eNdESMaa6ukfvyO0OA==
X-CSE-MsgGUID: BRG5ZnekTXmCqi8bqmCbPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430359"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430359"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:52:45 -0700
X-CSE-ConnectionGUID: 6aS/1EsCTLyIdMwdEdG6hw==
X-CSE-MsgGUID: wk7cWpa2Q4qakRFPkTk/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577635"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:52:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 01/26] drm/xe: Add member initialized_domains to
 xe_force_wake()
Date: Tue,  8 Oct 2024 12:40:50 +0530
Message-Id: <20241008071115.1862704-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

This field serves as a bitmask representing all initialized forcewake
domains on the GT.

v2
- Move awake_domains datatype change out of this patch (Michal)
- Rename domain_init to init_domain (Michal)
- optimize alignment (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 30 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 ++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..ac0419da7173 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -21,15 +21,25 @@ static const char *str_wake_sleep(bool wake)
 	return wake ? "wake" : "sleep";
 }
 
-static void domain_init(struct xe_force_wake_domain *domain,
+static void mark_domain_initialized(struct xe_force_wake *fw,
+				    enum xe_force_wake_domain_id id)
+{
+	fw->initialized_domains |= BIT(id);
+}
+
+static void init_domain(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
 {
+	struct xe_force_wake_domain *domain = &fw->domains[id];
+
 	domain->id = id;
 	domain->reg_ctl = reg;
 	domain->reg_ack = ack;
 	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
 	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
+
+	mark_domain_initialized(fw, id);
 }
 
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -43,13 +53,11 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
+		init_domain(fw, XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT_MTL);
 	} else {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
+		init_domain(fw, XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
 	}
@@ -63,8 +71,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (!xe_gt_is_media_type(gt))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
-			    XE_FW_DOMAIN_ID_RENDER,
+		init_domain(fw, XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
 			    FORCEWAKE_ACK_RENDER);
 
@@ -72,8 +79,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
+		init_domain(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
 	}
@@ -82,15 +88,13 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
+		init_domain(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
-			    XE_FW_DOMAIN_ID_GSC,
+		init_domain(fw, XE_FW_DOMAIN_ID_GSC,
 			    FORCEWAKE_GSC,
 			    FORCEWAKE_ACK_GSC);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..494240777d03 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -79,6 +79,8 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	enum xe_force_wake_domains awake_domains;
+	/** @initialized_domains: mask of all initialized domains */
+	unsigned int initialized_domains;
 	/** @domains: force wake domains */
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
-- 
2.34.1

