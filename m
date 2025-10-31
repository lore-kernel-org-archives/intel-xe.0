Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E95CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C210EAC3;
	Fri, 31 Oct 2025 08:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGB0iHZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD4610EAC3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897954; x=1793433954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8NklSQdx44Miqz1DgZ5NjPacgCOQtuerdzjynPovFK0=;
 b=aGB0iHZN72ybkis6GrPoIroxD/R3cIRC8k+1UkBcyM2q867TH6/4uxBw
 3Z8zFnLhqmzdouo8MKfRdlnUEIq3QC5soJlH3Q1wtG3ZbhpSC6lb5QYjh
 b3YP/7RJbCaZ6MQRgw/RbeSE0POzG0NUtlppyG93mI8tBRe3FpLgrkLte
 DSw6CYfp5a3vLP7XoyyrALzJwazi/Hx45gOL0NtNdSJ31VOPemz5T7KpD
 1KhIfZN5bJPDkbs5y/3iPvR1PBgQhPeRbkwsPlXcCv3tJAc7Ce9or+O64
 aBJrYMFusiHJNrsbkCJlFv7kfgRdnvSNcSYSqJc3a1veskrHrgKq/R8c9 A==;
X-CSE-ConnectionGUID: V9J7uVBBTZ+Vs0JmCyX0kw==
X-CSE-MsgGUID: zaIU92fuQoSwKUtD2AUYSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75503193"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75503193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:54 -0700
X-CSE-ConnectionGUID: Qdd347p9RGWjXJee5DOSmQ==
X-CSE-MsgGUID: Ef/N6Zu8Ssik2/T9IG6MOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186631634"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:53 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 4/4] drm/xe/pf: Handle MERT catastrophic errors
Date: Fri, 31 Oct 2025 09:05:01 +0100
Message-Id: <20251031080501.844-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251031080501.844-1-lukasz.laguna@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
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

The MERT block triggers an interrupt when a catastrophic error occurs.
Update the interrupt handler to read the MERT catastrophic error type
and log appropriate debug message.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
 - rebase,
 - fix the VF ID extraction from the read value.
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_mert.c           | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index aef66c04901d..c345e11ceea8 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -10,6 +10,11 @@
 
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
+#define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
+#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16, 9)
+#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
+#define     MERT_TLB_CT_LMTT_FAULT		0x05
+
 #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
 #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index 304cc8421999..e5e0ad872506 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -55,10 +55,21 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	unsigned long flags;
 	u32 reg_val;
+	u8 err;
 
 	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
 		return;
 
+	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
+	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
+
+	err = reg_val & MERT_TLB_CT_ERROR_MASK;
+	if (err == MERT_TLB_CT_LMTT_FAULT)
+		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault (VF%u)\n",
+			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
+	else if (err)
+		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
+
 	spin_lock_irqsave(&tile->mert.lock, flags);
 	if (tile->mert.tlb_inv_triggered) {
 		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
-- 
2.40.0

