Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365A5CFD34E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 19:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B8E10E184;
	Mon, 24 Nov 2025 19:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/7veN6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF310E184
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 19:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764010981; x=1795546981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jt4WnnO7gyRgXbNtu5wqE9Lzt4ExVuM967Nd9wKLb0w=;
 b=N/7veN6dA38dJFmIxbdcrm3ZwWx0CcPqPBrLaRUaAGZNBB7XQTVjePas
 5JwyLnW+3IMLvH4vXvC7dtJ0jYexkxR4mCD+hGzURsW6r9n7MTaTehmnb
 ZjkA1SUJVKdzWB9G35mXpVPJPni++wOPBvjyNemzoB2mRsYEWgz/hP0s0
 BRjUUaXdB/Bpeuea6Hz6iVYAgPZIpJPQBJHtiD/fZmnVnOE5LPltahfYX
 gn2C7hlLk34BE+ctF1r5VUfzP3922Qwh1HMKOqQFrd2TWYyNiIqawPn05
 bmyTKlFtu3AehDC7Vg5ZVfOqmMCST8BqiP2ExQOuicj03z1QmzKwREIS/ g==;
X-CSE-ConnectionGUID: gSoa9RrNTZaHn/B+RmG53w==
X-CSE-MsgGUID: HM/8Dn4lR5atlhHVjK/luA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83410051"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="83410051"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:03:00 -0800
X-CSE-ConnectionGUID: 6orXg8KeQ5yuw50W1PCrrA==
X-CSE-MsgGUID: g4vow+y6QH2g/TqEl62fNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196858193"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:59 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
Date: Mon, 24 Nov 2025 20:02:37 +0100
Message-Id: <20251124190237.20503-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124190237.20503-1-lukasz.laguna@intel.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v3:
 - use FIELD_GET() for consistency
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
index 304cc8421999..f7689e922953 100644
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
+	err = FIELD_GET(MERT_TLB_CT_ERROR_MASK, reg_val);
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

