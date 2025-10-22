Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B84CCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DB010E6A7;
	Wed, 22 Oct 2025 05:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzzQX8JB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2173910E6AB
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110319; x=1792646319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0HIQFF6G2mdzRlPlvKQ5TQ0ySccPoTqLcJ7l8rS3xLk=;
 b=BzzQX8JB4j8PAEQRa2ZDfUbiCnB/qp+MYoLmvKxU/h9kQ8oBr/6uLO/e
 Y9XyVgCYOzJz/XL0KW8hOOo4t0X6F4D3kbbyEnPNMtaWoX8qPxLniRSZT
 Ty7A3o5J0O3bT7sWmcHx9u0SvyhP+UqJ0132XyjbGBIL5bKPc3DRqKcC7
 ML5rojPQvzKQYz/lmU1qBj983uZnSrqF6VY5Rq9328EyV40I0iDKVzCx4
 hMNeVM9uSGrdrBLCFfghgm/u/XXoUZPAEZfKgCt9NK59D20kZc7sNAOMD
 U3wnyKrgIl4g+k+xv6cVbTPqbpKiYgtW6mG6qHcUOvLff5OjPODVcnFSG g==;
X-CSE-ConnectionGUID: QR2+Jru5TRm5top0ueUicg==
X-CSE-MsgGUID: 4VGm4iF5TB29TI/2zLU2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083982"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: RPVS2Q91SD6UNdRpiM8HNg==
X-CSE-MsgGUID: Yn11y7vLTBGzWuOcr1cEvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959716"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 12/12] drm/xe/pf: Handle MERT catastrophic errors
Date: Tue, 21 Oct 2025 22:17:44 -0700
Message-ID: <20251021-cri-v1-12-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

The MERT block triggers an interrupt when a catastrophic error occurs.
Update the interrupt handler to read the MERT catastrophic error type
and log appropriate debug message.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_irq.c            | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index aef66c04901d2..7c58b207263c2 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -10,6 +10,11 @@
 
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
+#define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
+#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16, 9)
+#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
+#define   MERT_TLB_CT_LMTT_FAULT		0x05
+
 #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
 #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 82bf0d3995dfe..a09abf7bacb33 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -471,10 +471,21 @@ static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
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
+			reg_val & MERT_TLB_CT_VFID_MASK);
+	else if (err)
+		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
+
 	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
 	if (!(reg_val & MERT_TLB_INV_DESC_A_VALID))
 		complete(&tile->mert.tlb_inv_done);

-- 
2.51.0

