Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3084C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 06:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91BC10E2B3;
	Mon, 12 May 2025 06:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSvxjAJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4760A10E2B3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032618; x=1778568618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=updcudaCWihu6BEPww+tGH+OM6OWAfaOW2dh7Kt+0L8=;
 b=VSvxjAJsmziX3WjXHvatcx/OImbZHd3LdOy7EkT9L/qwwAuaIukIMd3O
 lFa4+79/UHP1+mBXmmLMmfj+f/CdPBkBGDHOoyunNU7odkuvFoWFOZPTd
 iMp2t/FJBVTZ6SeP/kqY5ZOETelJ0h8nPOwH8tgFcxDW6DLQ9ZRTzD2fh
 6rFc2NC8JXl6qcO+PBWaQNYt0UUrU5JDLR1sHuoX6gQy7IJ/g2UkTPla7
 oMWf2HdPefpYPX+6DD5KQeBU5ZoU1rHJULCkLNo/OnteEncn1dkNNeW+G
 Ktj00TolOLLjiurDaI5KY1xjemKXQkyoB+Bn/MxzNt4YtEYnSoTpzs+O4 g==;
X-CSE-ConnectionGUID: B8aIehYBTWCuPvaP+lGCEg==
X-CSE-MsgGUID: tdC6lOXGQ/ONGzMPW2uQ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59817382"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="59817382"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:50:17 -0700
X-CSE-ConnectionGUID: QUBe5pQyQ6avl+/vNy96LQ==
X-CSE-MsgGUID: Ybqmtb0ER8eCkqWiRWXEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137781986"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:50:14 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v3] drm/xe/xe2hpg: Add Wa_22021007897
Date: Mon, 12 May 2025 06:50:04 +0000
Message-ID: <20250512065004.2576-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) IP. It is
a permanent workaround, and applicable on all the steppings.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
Changes in v3:
  - Change the word, "platform", to "IP" in the commit message, as
    suggested by Gustavo.
  - Add R-b tags of Gustavo Sousa, and Tejas Upadhyay.

Changes in v2:
  - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.

---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cbb9f7cbcfc0..5cd5ab8529c5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
 
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
+#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6f6563cc7430..67196baa4249 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("22021007897"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),

base-commit: e05492e926ff62470c03598c0ac0d7c3f353b8cf
-- 
2.43.0

