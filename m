Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A5C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 22:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C7710E412;
	Mon,  6 Jul 2026 22:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yiyo9HNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A110E412
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783377835; x=1814913835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B10I+LmBREmirMJ17dvu59uhj1pvBfFEdizNQtbQHNQ=;
 b=Yiyo9HNJVG3QrU4wqNgNTmTgsFT82gJabs5c+4wZcOE9PPuP9sqUPVEK
 JBNYKmg0F0kGe5Y7RRfw0qjTwqxaMtG+JBGruaixyjdkOcXlglIBWDBh1
 4sG9ECeLkL5dXlapJzQqFMU8WuA/pnIihftMf9ZstSr0dhfVSU4rwqpXv
 yNcQDFvrk8HXHKdSfcNt9YHbxICpxhFPeNsACHdV1t5f1eIQdCiO5L3+7
 rhG18yZ46eYULpqZM0HQnVtOXx+xoUm7jJ8OUVsBW0vk10R3rtO41EOUm
 dQzMEGXDrbER11I3TnfttmWrq9NxmkmGgyMGBBRLrycy6Jm3MoklO6q4r Q==;
X-CSE-ConnectionGUID: ahO8LkK1SLyoEHI6fE7Q1Q==
X-CSE-MsgGUID: O3essD8LRBOSUcRoZejSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83892285"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="83892285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:43:55 -0700
X-CSE-ConnectionGUID: bj9gR97oRLKakgD9Wu6Jgw==
X-CSE-MsgGUID: 1ue7yoCuTDizwIPdazj1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="283935386"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:43:55 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Add support for WA 22022079272
Date: Mon,  6 Jul 2026 15:43:45 -0700
Message-ID: <20260706224344.2723462-3-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

