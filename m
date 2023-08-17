Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08B2C61CE5
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4E210E0C7;
	Thu, 17 Aug 2023 20:18:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE9510E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303531; x=1723839531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNECnCJoVMh8oguy9rPfUl5pd1rGj/98IF+PGJ2VURo=;
 b=Ft2FQmenxglIlURiyXnmBeeV3YvLX7KNO7GHYFLdtkTwsvAecqH9ALO3
 hSvNoD1gApY588uPeant8AC4ARss0rUmyRs/qqIfpwV386E0wbm3pKVLS
 o6r3BRm9gtSe03ulAQUPlTz6VkRzJmQsG/h0X87UE2rYcLtf5heRHLmia
 Ka3BgVIxPEMtqn22DoSupAK17EvUQIv0GayJjuCO1OCNFZ76DwkApccyS
 mDvvkIX1G7alG/ReIxqcKB7CBbtd9weGnLniUXeBSY37OU1e25+H3RExn
 RBLH3TrA1xJPGvd7KxbF8GKQSijF5OCxgyDAHBj2bJ4EDUH9ZsAe+TgXI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077725"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379333"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:29 -0700
Message-ID: <20230817201831.1583172-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/7] drm/xe: GSC forcewake support
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The ID for the GSC forcewake domain already exists, but we're missing
the register definitions and the domain intialization, so add that in.

v2: move reg definition to be in address order (Matt)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_force_wake.c   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index db4208399cda..baa00557f114 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -39,6 +39,7 @@
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_REVID				REG_GENMASK(5, 0)
 
+#define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
 /* L3 Cache Control */
@@ -256,6 +257,7 @@
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
+#define FORCEWAKE_GSC				XE_REG(0xa618)
 
 #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index e563de862581..ef7279e0b006 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -97,6 +97,13 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
 			    BIT(0), BIT(16));
 	}
+
+	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
+		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
+			    XE_FW_DOMAIN_ID_GSC,
+			    FORCEWAKE_GSC,
+			    FORCEWAKE_ACK_GSC,
+			    BIT(0), BIT(16));
 }
 
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
-- 
2.41.0

