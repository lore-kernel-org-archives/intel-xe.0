Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45266C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FF310E92D;
	Thu, 14 Dec 2023 18:47:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F1810E265
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rTA7lTNqOsEVSSjsJq4cv0a/pDGsazNY1GsJhug6WXE=;
 b=XNI9tj3tc5RDr7wcDpny0UFOJurqDbSUh6YFHvP4d8mkWqEoM7iQC746
 ZI9FenWadVYtVVMIWKzPtnojkpswwj00kBuAVQ7LdCsSu/L+2RWMVpDbG
 vPmwq8bxxHxs1iuY3cxC6gBmaf82apSjP01lMm9E5bRelHuwh/YFXwzHs
 spDgDISBQyRQcNrHMZc/8f1aUyFYs97eTqqFh7zMVduigzEC09iTxMtyR
 U8GULy17hzY/5nDZC1JW0fyCKwIMPJ/OJNgAGFaawzN84/fxeLVuONF5v
 0tbdVPue1LEiSsBeFZslwQvo30RorRybT8C4vXu3gTMn/ZdVs+SQAZp/A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953931"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953931"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581838"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581838"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/8] drm/xe: Fix whitespace in register definitions
Date: Thu, 14 Dec 2023 10:47:03 -0800
Message-ID: <20231214184659.2249559-13-matthew.d.roper@intel.com>
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

Our register headers use tabs to align the definition values.  Convert a
few definitions that were using spaces instead.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++--
 drivers/gpu/drm/xe/regs/xe_regs.h        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index e109ef912706..7f82bef3a0db 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -136,8 +136,8 @@
 #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
 #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
 
-#define VDBOX_CGCTL3F08(base)                  XE_REG((base) + 0x3f08)
-#define   CG3DDISHRS_CLKGATE_DIS               REG_BIT(5)
+#define VDBOX_CGCTL3F08(base)			XE_REG((base) + 0x3f08)
+#define   CG3DDISHRS_CLKGATE_DIS		REG_BIT(5)
 
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 4ac71b605487..4b427ec8cbff 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -34,9 +34,9 @@
 #define XEHPC_BCS7_RING_BASE			0x3ec000
 #define XEHPC_BCS8_RING_BASE			0x3ee000
 
-#define DG1_GSC_HECI2_BASE                      0x00259000
-#define PVC_GSC_HECI2_BASE                      0x00285000
-#define DG2_GSC_HECI2_BASE                      0x00374000
+#define DG1_GSC_HECI2_BASE			0x00259000
+#define PVC_GSC_HECI2_BASE			0x00285000
+#define DG2_GSC_HECI2_BASE			0x00374000
 
 #define GSCCS_RING_BASE				0x11a000
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
-- 
2.43.0

