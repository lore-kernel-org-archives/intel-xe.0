Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C9AC3DA7A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAB810E268;
	Thu, 14 Dec 2023 18:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C910E1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofBe2Y+o8C/iyC1wmP05VmSM87swv7cPvFf6bEGzA+s=;
 b=d8uS/IogbRGMGJydgOiL3wdm2UsV7wSFCNRQM2AJ6Cr3zjqF7dtJFx7W
 PaXaS6PkkwU0KiYRbLPm3ySmi5qPjjGs9+egPlRHz3Gm8nbySwZpA7LEA
 Vy7vCt8FBWr2TwvaQqd0pDuqGJRgzmtdPIAjxKRkL7r3icqLovJ2uC1jy
 /SfZI9HCQiATGlHPL0Vas+2EA535m85qS5FlaQsEYo2UjKwW7C5SVPFqk
 kI3/Aqa0QGWcXG++pyzTaKDp8S9icoa3uqM9aIDLprEjWcvdx/qBysuZh
 u95Ght30aAWmKIlNZEuHr3vs35q+rlQ6C5Sxhy50Wd+3RcIM9snIhH1yC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953933"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953933"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581847"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581847"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/8] drm/xe: Move GSC HECI base offsets out of register header
Date: Thu, 14 Dec 2023 10:47:05 -0800
Message-ID: <20231214184659.2249559-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These offsets are only used to setup the auxiliary device BAR
information and are never used for driver read/write operations.  Move
them to the GSC HECI file where they're actually used.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 4 ----
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index b7d3b42ec003..67ce087e21d0 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,10 +7,6 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define DG1_GSC_HECI2_BASE			0x00259000
-#define PVC_GSC_HECI2_BASE			0x00285000
-#define DG2_GSC_HECI2_BASE			0x00374000
-
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index d8e982e3d9a2..19eda00d5cc4 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -16,6 +16,10 @@
 
 #define GSC_BAR_LENGTH  0x00000FFC
 
+#define DG1_GSC_HECI2_BASE			0x259000
+#define PVC_GSC_HECI2_BASE			0x285000
+#define DG2_GSC_HECI2_BASE			0x374000
+
 static void heci_gsc_irq_mask(struct irq_data *d)
 {
 	/* generic irq handling */
-- 
2.43.0

