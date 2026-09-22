Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC921C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 07:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94310E3DD;
	Tue, 22 Sep 2026 07:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYW7EKdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ABC10E3DD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790062609; x=1821598609;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SzGKHt1503z3L/14nDBy0QvLIzUs2T4uxwcP303hO74=;
 b=BYW7EKdHGydaaiTMcyArQcjnjGa1zomXXHgvadIZpH8Nc+jof0kLkzuU
 mp2hu0fd613D4dIwhQ6PpYEJodPktXUMT1+Cu5RNQ1yKRm18a6lfI1GfM
 7L/6rjQ2ecnaVpfCI0Ox5ng14TJzqeAGt1P+MCoK4foHAD4ufOlVrfjjH
 92+Fjv/SuhgzKk2zog+ZjNIm6/LHkt8/L01xmI6XD+/PU5NLj/WJBEy5M
 DfY8/TPQ+RvHfu5z8zDk/zJpXQg7PdnNFzq5e5acKbeQ6ORTB0cFK+c9d
 MWRlVwYYOYB2jR7BBAEQUcJMPqm4jaE77EFESwBSe4XFxjObW5GstlV0S w==;
X-CSE-ConnectionGUID: jl0xlbI/SNa9QqSxHkS7Kg==
X-CSE-MsgGUID: khtEyABnTb2oMqx7fNhP6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116162724"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="116162724"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:36:48 -0700
X-CSE-ConnectionGUID: 9ibOM0y7SRuoyu7m9Ml1lg==
X-CSE-MsgGUID: KFBVqQrdRZWxzn+/TvJwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4329264"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 00:36:46 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org,
 gustavo.sousa@intel.com
Subject: [PATCH] drm/xe/xe3p_lpg: Add support for Wa_16030224309
Date: Tue, 22 Sep 2026 13:05:18 +0530
Message-ID: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Opt in to the GuC workaround, to ignore context completion status
with preemption or preemption-to-idle in the CSB when the multi-queue
feature is enabled, which is supported on Graphics Version 35.10.
This WA is supported starting from GuC 70.73.

Apply Wa_16030224309 to Graphics Version 35.10.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 685c4ef17b73..4bcdc1a96785 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -525,6 +525,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
 	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
+	GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB			= 0x9011,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ff8eee3831aa..70babe95a6aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -396,6 +396,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
 	}
 
+	/* GuC only applies this WA for scheduled MultiQ contexts; no KMD-side gating needed. */
+	if (XE_GT_WA(gt, 16030224309) &&
+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 73))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index dd69ad07f7a9..d06ee78bf534 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,3 +72,4 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
+16030224309	GRAPHICS_VERSION(3510)
-- 
2.46.0

