Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5046BCCF9E4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357F410E6AF;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwrzPCjw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF0B10E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ZsBzub55hBmyQEHvqKfKC/ZeTafn1TFpL57tMUmMTM=;
 b=HwrzPCjwxBnWiN+JC64sF8kE2zIpgCubYQoUYICFE28q7CbB+WnYl4g3
 uCIbtRppdW0UAtzxoffGUoSgfSyL/zRQpkw9j6zoYCRCr2gr4dPMoYfag
 jyW3YdW/05og4JE/BEJx4vin1CjFFe6hw29wccgQIudzdEhGEhYivgkx3
 5Bdo2i30KZgo3a22cNjS6zCIDVmTcTH+LGmQoOvt4X+DynmXxBuKqZf6l
 kjHINYMO7QLT1iWd+2KVSwU9vzJdIfg8aE53qLjPoBrNErSxFKFZfsTx8
 e5TlSLuvZ4PKkkQ7b2CypDAyd50Y0JKfMQqZJsON6RlrNlAxqsvEMjMpR w==;
X-CSE-ConnectionGUID: oK7bRM9HTlGJawvOGBjV9g==
X-CSE-MsgGUID: TONnDc2gQam2fvPlXgZiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083980"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: h5s9krUKSvCvvwf9u2EC+w==
X-CSE-MsgGUID: c669G/m1Rt2xpOvral6NBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959710"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 10/12] drm/xe: Handle MERT interrupts
Date: Tue, 21 Oct 2025 22:17:42 -0700
Message-ID: <20251021-cri-v1-10-bf11e61d9f49@intel.com>
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

The MERT interrupts are indicated via bit 13 in the GFX master interrupt
register. Detect these interrupts and start supporting them.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
 drivers/gpu/drm/xe/xe_irq.c           | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 2f97662d958de..9d74f454d3ffd 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -20,6 +20,7 @@
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   ERROR_IRQ(x)				REG_BIT(26 + (x))
 #define   DISPLAY_IRQ				REG_BIT(16)
+#define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
 #define   I2C_IRQ				REG_BIT(12)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e5ed0242f7b1d..011b5eb66102f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -466,6 +466,12 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
+static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
+		return;
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -525,6 +531,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
 			xe_i2c_irq_handler(xe, master_ctl);
+			mert_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
 	}

-- 
2.51.0

