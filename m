Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02A4C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5CC10E3E0;
	Wed,  1 Jul 2026 16:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuerCLt3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F32E10E3E0
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782925123; x=1814461123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nwcHulQJK9ceEnxAuQgnZoZ7YYlsE00L/HaznKkOd2E=;
 b=UuerCLt3k6Ek1dwv8DA67YhYWAiXF+BJyGC+VE4W0gmzRV/HZw+EIbWH
 J7DTR23aTRd1bepue+WGExt3raVUpJPykBhduKF+gr/IWMSauUJ6zZYKT
 aBO/qC0fUF0gWvowEDy+QF6T45rA0RBpihq2PFIdR7hLL26RSJQ17HWcp
 FVc7eaacDYqmxOFtrE1qJGskjmu5IGLBw3Hb1P6J47uXhqdUvxqSNebdK
 BwNKS0WpnnCxVLh0h7KIWjygjcsEgMKfCvcMZcx4pY61JGotVQO1VbW0q
 6bUWogwn4jjoKxAHJpsII+htmPwiE1mvAcfjgkDFzFTkJ3fFgyACDhXHI A==;
X-CSE-ConnectionGUID: pUFI1r8TR2mC+NjWAePNKg==
X-CSE-MsgGUID: Yj5FlpFMRYqPnQHVkvyFnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94317791"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94317791"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:58:43 -0700
X-CSE-ConnectionGUID: bUNrfWf3Qy256X48ukpVPw==
X-CSE-MsgGUID: vYRjZVz7RcyZAUEbsip8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="290731515"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:58:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/2] drm/xe: Add support for WA 22022079272
Date: Wed,  1 Jul 2026 09:58:31 -0700
Message-ID: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The WA is implemented by the GuC, so we just need to enable it via the
dedicated KLV.
This WA is supported starting from GuC 70.62.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..fbbee40d7217 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -504,6 +504,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
+	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c98454545a85..becf9a004867 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -364,6 +364,9 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
 
+	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9027365f0043..a2ccd036abce 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -66,3 +66,6 @@
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
 16029380221	MEDIA_VERSION(3500)
+22022079272	MEDIA_VERSION(3503)
+		GRAPHICS_VERSION(3510)
+		GRAPHICS_VERSION(3511)
-- 
2.43.0

