Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572C4CF9C46
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 16:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640B10E76E;
	Thu, 20 Nov 2025 16:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fz5aTODb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C2B10E76E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763657488; x=1795193488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IShFnuBuA4rpR5/Sk2iA3sM477lzuKacnTDMGdttzvU=;
 b=Fz5aTODbBfVg75U3ZOe/Tg6pzmaN2H4tf4k0cLXAf156xdp6mFSJnPfW
 RDnvWaglSCR+He7eGfwaUEDAnKY1x243wtUiLwy96iFuu6o9P9szGosUd
 rzR/WeiFP7nGQBHE4LEk7FR5QCY1XDTDeMOyvGzZIjEfbdU/02AvKmgUT
 WN3h81PWATEQineteQIU03EK6BZ8FFwfBWWSeNuJ6WjXeuErp//qX9dWM
 q3lRcxcXa2NxmD/TP+5sHAps06flarSxm2ECGpYfcjGNBbWPJSdmtatQi
 VMxyfrzyYoc1ue9cFU3msHkdnsm8TXN5osPsDFtka4Jo+7PKZQR9qQGUn w==;
X-CSE-ConnectionGUID: 44INlG8sQUuUT1owT21Y4g==
X-CSE-MsgGUID: 158exUVlRf2Y5hcsgLSVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64743661"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64743661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:50:02 -0800
X-CSE-ConnectionGUID: AUzSVdWBTfWCLi8n7Ylazw==
X-CSE-MsgGUID: TKh3/K/RTZyv8+NKKCQLcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228726145"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:49:59 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe3_lpg: Apply Wa_16028005424
Date: Thu, 20 Nov 2025 22:20:43 +0530
Message-ID: <20251120165042.1062-2-balasubramani.vivekanandan@intel.com>
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

Applied Wa_16028005424 to Graphics version from 30.00 to 30.05

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c            | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 2118f7dec287..65f6d2a5238f 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -121,6 +121,9 @@
 #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
 #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
 
+#define GUC_INTR_CHICKEN			XE_REG(0xc50c)
+#define   DISABLE_SIGNALING_ENGINES		REG_BIT(1)
+
 /* GuC Interrupt Vector */
 #define GUC_INTR_GUC2HOST			REG_BIT(15)
 #define GUC_INTR_EXEC_ERROR			REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3764abca3d4f..7fdb2b7cb8e4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -15,6 +15,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
@@ -323,6 +324,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
-- 
2.43.0

