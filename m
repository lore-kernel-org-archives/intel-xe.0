Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA3ACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 20:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE0310F083;
	Tue, 29 Sep 2026 20:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FClXIHTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A47A10F083
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790712566; x=1822248566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z+O2UPx6jdXvmG9pc/b6NLNvyzltvYakyjO/02eSX3I=;
 b=FClXIHTzwcW862iZnjidPbKeWSV0/XpEUoygvGYiFF8HiZXUusByhyWc
 7WRExhBbvv35rsWfSh3DXofRW63R2heoOLMjCCY5Mb6BgEG3YEQkTFNDk
 aggz+2hOIiDXDjez2/NBIXzvhmn3pX1sXfhryczvZoktgrBNHm+WcZJR8
 6qFoMbTBKZnzn3D7ylLZVuuXrdgAuRHVwlLXwiVpwjMtu23Pf17FH692J
 r0bPJ0v4stU2BF8Na+2T1Eh6XSBrh1Z41hEDOSGGQVWsUk4A2MKIFReSc
 5sZqayLtxDxdktuPl9DGOWrs/yPxxB0+erUdUX43xLCxku9XKbi1waOLC Q==;
X-CSE-ConnectionGUID: Ieyn1p14QJKMIC8RRCoSVw==
X-CSE-MsgGUID: 9oTSaNuDQ/a66t0jF9o+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113227859"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="113227859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:09:26 -0700
X-CSE-ConnectionGUID: tcXbLbhzQKOZLPwLXykYkA==
X-CSE-MsgGUID: dXXS/qMPS6y1F7jdO81QrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274580821"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa008.jf.intel.com with ESMTP; 29 Sep 2026 13:09:26 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH] drm/xe/xe3p: Force non-compressible memory reads to 256B
 overfetches
Date: Tue, 29 Sep 2026 13:08:39 -0700
Message-ID: <20260929200839.843116-1-daniel.charles@intel.com>
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

Add a tuning entry to set bit 14 (NONCOMPMEMRD256BOVRFETCHEN) of
L3SQCREG2 for Xe3p and later platforms.

BSpec: 72161, 59927

Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2e059cb36c82d..7061b035d3c12 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -468,6 +468,7 @@
 #define   L3_SQ_DISABLE_COAMA_2WAY_COH		REG_BIT(30)
 #define   L3_SQ_DISABLE_COAMA			REG_BIT(22)
 #define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
+#define   NONCOMPMEMRD256BOVRFETCHEN		REG_BIT(14)
 
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index bcec40ca2d35f..a9bd3f8969a54 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -100,6 +100,10 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
 				   BANK_HASH_4KB_MODE))
 	},
+	{ XE_RTP_NAME("Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG2, NONCOMPMEMRD256BOVRFETCHEN))
+	},
 );
 EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
 
-- 
2.43.0

