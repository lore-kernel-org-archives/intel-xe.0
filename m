Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB335C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 09:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CD410E72E;
	Wed,  5 Jun 2024 09:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etTcdhKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C8710E023
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717580045; x=1749116045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AvZq6S7f4wOj2aCiz/H3Zt1wAoySV3SLmsHV+QwEIG4=;
 b=etTcdhKVLkG80+i+B7JNPhkOOy47r499n20gRlo0mg9QvIY+w5cEwSt1
 gt9bGi9PSdmDg1X9b55eed/ShoCE5pGYspzvONsKYOxn62HZ6zqsJYlAX
 fsBybrPabM/zYKM8QdwrtQ6/NfVX7Sib1pCQWOADJi6gIWT89yrLeHSZw
 6KwmezIhDXZL6wsB8XHjFu7kn3Jme3Tlhuft7llOUDGxzMPkllC0t9TR2
 p4JfdEV2V3emx+Oo3rwHYRGfwHXhph/aK6bUm5BxMdFkmS0txZmrzHd73
 hYCOjr/F4AFo66ilNydYzibUdpC8unrIRSDXY2VsMhiyrzxYw9pK66KSK A==;
X-CSE-ConnectionGUID: kfpbg737QxSzCEIh/cBipQ==
X-CSE-MsgGUID: uPmYffVmRMWmOmqOyI8IAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14289350"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14289350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:34:05 -0700
X-CSE-ConnectionGUID: hXUhX274QJOeQVeG3QYIug==
X-CSE-MsgGUID: S0smJh30TkCcS2MKj+tX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37525708"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2024 02:34:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Add member initialized_domains to xe_force_wake
Date: Wed,  5 Jun 2024 15:20:04 +0530
Message-Id: <20240605095005.1261268-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
References: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
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

To determine the wake status of all initialized domains, a direct
comparison using (XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL
won't suffice due to difference in domain support across platforms and GTs.
For instance, MTL GT0 only supports GT and RENDER domains, thus for the
force wake all scenario, only bits corresponding to GT and RENDER should
be activated. Consequently, the condition
(XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL will
consistently be false.

To address this, introduce a new member named initialized_domains to
xe_force_wake. This attribute will function as a bitmask, encapsulating
all initialized force wake domains on the GT.

v2:
- %s/supported/initialized/
- update commit message (Rodrigo)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 30 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 ++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 54279c3814af..ae0685473ec3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -26,15 +26,25 @@ fw_to_xe(struct xe_force_wake *fw)
 	return gt_to_xe(fw_to_gt(fw));
 }
 
-static void domain_init(struct xe_force_wake_domain *domain,
+static inline void mark_domain_initialized(struct xe_force_wake *fw,
+					   enum xe_force_wake_domain_id id)
+{
+	fw->initialized_domains |= BIT(id);
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
+	mark_domain_initialized(fw, id);
 }
 
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -48,15 +58,13 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
+		domain_init(fw, XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT_MTL,
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
 			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 	} else {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
-			    XE_FW_DOMAIN_ID_GT,
+		domain_init(fw, XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT,
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
@@ -72,8 +80,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (!xe_gt_is_media_type(gt))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
-			    XE_FW_DOMAIN_ID_RENDER,
+		domain_init(fw, XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
 			    FORCEWAKE_ACK_RENDER,
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
@@ -83,8 +90,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
+		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
@@ -95,8 +101,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
-			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
+		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
@@ -104,8 +109,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
-			    XE_FW_DOMAIN_ID_GSC,
+		domain_init(fw, XE_FW_DOMAIN_ID_GSC,
 			    FORCEWAKE_GSC,
 			    FORCEWAKE_ACK_GSC,
 			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..1056d196b29d 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -79,6 +79,8 @@ struct xe_force_wake {
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	enum xe_force_wake_domains awake_domains;
+	/** @initialized_domains: mask of all supported domains */
+	enum xe_force_wake_domains initialized_domains;
 	/** @domains: force wake domains */
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
-- 
2.25.1

