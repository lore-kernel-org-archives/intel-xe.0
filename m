Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49898C04FE1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCB210E3A4;
	Wed, 16 Aug 2023 18:05:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648E410E39F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209111; x=1723745111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EOwlaMc4bZGmOGIm97X9sqnMk5XeFPmzBV0WI7fHZvM=;
 b=mfSD0uZHG8eVzJGukHA/Wlx+SPmJJaKLsn+t76062S9cwk1do1gsyuWj
 URdwJD1bY90hjX+v5ZMaDUPy5ADCXrpiVpKuu5YHmpmVIyOnA+RY9vg08
 xsawN5vXFrZ42BapUa9pmADbcG/7zhzJTouwzrh61hrGews9iivG0HMuT
 QuzTGecRJxvJ28lL9EiBnVguCtl+zwIKh/+mvqjQ0M9SPvulP0YhB45rD
 ge3OHD9fcXfQcehNglo8oeDDRAKLVtBzGNSNIok+FIUWvO9UIE7K3WJSi
 oZnVOJJt+czqx0HNqL/oufCUCBfkcARXxWlyRmBYDLCBy7PuEEmem3sAg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458956585"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="458956585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980816375"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="980816375"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 11:04:24 -0700
Message-ID: <20230816180425.1481448-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: GSC forcewake support
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

The ID for the GSC forcewake domain already exists, but we're missing
the register definitions and the domain intialization, so add that in.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_force_wake.c   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e3d1cec7ba8d..d8f00e84b41a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -33,6 +33,7 @@
 #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		XE_REG(0xd50 + (n) * 4)
 #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
 #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
+#define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 
 #define GMD_ID					XE_REG(0xd8c)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
@@ -259,6 +260,7 @@
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

