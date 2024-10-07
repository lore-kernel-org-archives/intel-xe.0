Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6452CFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D3C10E1AD;
	Mon,  7 Oct 2024 06:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Efxjb8+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CB610E1AD
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283307; x=1759819307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxpGNK9kStoiF3VSBahehTz1iDmJoQ8TY4tCeTgoeus=;
 b=Efxjb8+5cl15ieGnPAzENH5Mc3ojhoqaaMALi+mG6P+cGSI2Z9or6F+z
 yrI2mqZj2uIQhQau3N3HlVjHzvzEjkh53oorPY3Z/HA40lXImwBMmoyC2
 NvtSWyJZDVYRB0xIwRseQQw1gG0nXJQeXb2FabnyzA1JcDBRvpR/7WY0l
 nirVRBNDqH6h5Wft70n1Ko8i8q2usyEColDgzQxlVEh64lnZIJZHD7NhJ
 Gp2P2khTSswD/XCGHfixNR87FGJZOhFsgwfmjAmPEwY1nmyqSpNphfPDO
 +UGWw7935W27uRtwel3X9ecbi+Xkez383KuuG3I9n2I7tlAqz1fbwdwi1 A==;
X-CSE-ConnectionGUID: g14rFZxVRfODS/i5ITsxBg==
X-CSE-MsgGUID: MT3WTMWhTxaJdOQkzV5ntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548429"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:41:47 -0700
X-CSE-ConnectionGUID: gjDIz2R+T1G2kvvIQXmn3A==
X-CSE-MsgGUID: fFu8ZIiDRX60CPwADkpHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842298"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:41:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 01/26] drm/xe: Add member initialized_domains to
 xe_force_wake()
Date: Mon,  7 Oct 2024 12:29:52 +0530
Message-Id: <20241007070017.1732886-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

