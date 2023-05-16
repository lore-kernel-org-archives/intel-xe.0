Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B696CC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 13:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CA810E21B;
	Tue, 16 May 2023 13:33:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CB110E219
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684243981; x=1715779981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sv2zcxrGO6Vo8VGeEPcZ4XHscMFHajD2vBfyo9Zruog=;
 b=Q2wm64KR57yLJETz2nz/ZTzBXWXg9/zERkM9YHhi31GTQuKq9KSl9DQC
 F0/KSy9+oY3bilnLQ6lbmq2kFYm2MorRaPCvIuTRLYTiVf4Klchbf17Qa
 QdIJ7Qo5xGYFFiSs3ezpS/CoC1WJDvg8FT20PCkfKs4qG9ABWZLaO7wB3
 CE73s9gVfy9BA+zupP4z0Lt8n6mZ+JR/ZEnQlPoGtm7sAPfKfN/bLrVpV
 wC3J0GLri4PADZoIzjt4GFbWreBDB6eDnqftTw7ebTPUJaVHDZn77RvvO
 inTgStjBkgtUggBL8DW9cCK027IaR5zFHx7eaU2YbMkMVps/W4om9ixuL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353758188"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="353758188"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 06:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875621888"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875621888"
Received: from khach-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 06:32:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:32:32 +0300
Message-Id: <20230516133234.2778034-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516133234.2778034-1-jani.nikula@intel.com>
References: <20230516133234.2778034-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/i915/irq: convert gen8_de_irq_handler()
 to void
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The return value is not used for anything.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230515101738.2399816-1-jani.nikula@intel.com
(cherry picked from commit 08d8f43045af8589671d4462190d27765653cdf8)
---
 drivers/gpu/drm/i915/i915_irq.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 02b6cbb832e9..64cc52538206 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2124,10 +2124,8 @@ static void gen8_read_and_ack_pch_irqs(struct drm_i915_private *i915, u32 *pch_i
 		intel_de_write(i915, PICAINTERRUPT_IER, pica_ier);
 }
 
-static irqreturn_t
-gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
+static void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 {
-	irqreturn_t ret = IRQ_NONE;
 	u32 iir;
 	enum pipe pipe;
 
@@ -2137,7 +2135,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		iir = intel_uncore_read(&dev_priv->uncore, GEN8_DE_MISC_IIR);
 		if (iir) {
 			intel_uncore_write(&dev_priv->uncore, GEN8_DE_MISC_IIR, iir);
-			ret = IRQ_HANDLED;
 			gen8_de_misc_irq_handler(dev_priv, iir);
 		} else {
 			drm_err_ratelimited(&dev_priv->drm,
@@ -2149,7 +2146,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		iir = intel_uncore_read(&dev_priv->uncore, GEN11_DE_HPD_IIR);
 		if (iir) {
 			intel_uncore_write(&dev_priv->uncore, GEN11_DE_HPD_IIR, iir);
-			ret = IRQ_HANDLED;
 			gen11_hpd_irq_handler(dev_priv, iir);
 		} else {
 			drm_err_ratelimited(&dev_priv->drm,
@@ -2163,7 +2159,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 			bool found = false;
 
 			intel_uncore_write(&dev_priv->uncore, GEN8_DE_PORT_IIR, iir);
-			ret = IRQ_HANDLED;
 
 			if (iir & gen8_de_port_aux_mask(dev_priv)) {
 				intel_dp_aux_irq_handler(dev_priv);
@@ -2223,7 +2218,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 			continue;
 		}
 
-		ret = IRQ_HANDLED;
 		intel_uncore_write(&dev_priv->uncore, GEN8_DE_PIPE_IIR(pipe), iir);
 
 		if (iir & GEN8_PIPE_VBLANK)
@@ -2257,8 +2251,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		 */
 		gen8_read_and_ack_pch_irqs(dev_priv, &iir, &pica_iir);
 		if (iir) {
-			ret = IRQ_HANDLED;
-
 			if (pica_iir)
 				xelpdp_pica_irq_handler(dev_priv, pica_iir);
 
@@ -2277,8 +2269,6 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 				"The master control interrupt lied (SDE)!\n");
 		}
 	}
-
-	return ret;
 }
 
 static inline u32 gen8_master_intr_disable(void __iomem * const regs)
-- 
2.39.2

