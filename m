Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FFED0D17D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916D10E2E0;
	Thu,  8 Jan 2026 00:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFYbMK7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE27810E0FA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767831613; x=1799367613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRu5ySxjcp6SLTG8F2pJpGmCBYxI2Ng+wbQuk2Ix0I8=;
 b=AFYbMK7lqmuiBXdgN+vMX+uw3UcNxQEkcOUWZTiSu5vcKdgTM8EH6NOQ
 P0xucJFX2l0Xa8ddADbtnmWAWPmaEs1HZVwc1pcSlInoKYsQkyUMUcVCw
 D51jO6Hl4vAwyZ3X4VHYi6Xt5KuCeid/IBhJlogM2fMoX2kudWeG9KZGH
 +HFj9IDa0y0ajoBRssPnsn5o16/YqOz3pPiKBoLj4tnarbNS5juSn6Qbm
 yEd5freDz8CZTwrAZDinK8kcUboywKFyC5mjw9Ik8Okz5/wpIjIKfLC2g
 7pTUGdNnKR8+aYUEqBr0wW7jhcsqyiqol54SRsKy8HcUfNKG7hwmrJ9ZH w==;
X-CSE-ConnectionGUID: 6a0g0TOXTpKkGFexv6Om7A==
X-CSE-MsgGUID: fKCOMmfYQReyX61FVN/65Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71785538"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="71785538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:12 -0800
X-CSE-ConnectionGUID: gMjMzQBeQ1eXKNhAwn0oqg==
X-CSE-MsgGUID: YY4U6ncsSIW0IkmshFC7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203500992"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/4] drm/xe/oa: Stop whitelisting MMIO_TRG registers on non-DG2
Date: Wed,  7 Jan 2026 16:20:02 -0800
Message-ID: <20260108002000.384449-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108002000.384449-6-matthew.d.roper@intel.com>
References: <20260108002000.384449-6-matthew.d.roper@intel.com>
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

OAG_MMIOTRIGGER should only be software whitelisted on DG2's Xe_HPG IP
to satisfy Wa_1809940648.  The register did not exist before Xe_HPG (and
thus should not be whitelisted on Xe_LP platforms) and was part of the
hardware's builtin whitelist for all relevant engines/units on the
production steppings of all subsequent platforms.

Bspec: 45546, 60151
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1391cb6ec9c6..1bcb01f93914 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -55,6 +55,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("1809940648_rcs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1255), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER, 0))
+	},
+	{ XE_RTP_NAME("1809940648_ccs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1255), ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER, 0))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
@@ -83,27 +91,23 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+#define WHITELIST_OA_MMIO_TRG(status, head) \
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
+	WHITELIST_OA_MMIO_TRG(OAG_OASTATUS, OAG_OAHEADPTR)
 
 #define WHITELIST_OAM_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_STATUS, OAMERT_HEAD_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.52.0

