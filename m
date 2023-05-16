Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D25C7EE2C
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 13:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092D10E219;
	Tue, 16 May 2023 13:33:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFF010E206
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684243980; x=1715779980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0L4LCoyunC4BlQyWMyouA5rAoL/eBbGO+/K3r2beK/k=;
 b=jJ2lcxhE+1WWbns4MptqZTdV1ZwNL9XTZvvkypX6NfJPwvtx4cv77pum
 eXe2CMOQh5zoIq8lpFxWfrScEsLkcZH9rqMlZrRi57ou7zJDCVELbWbsC
 nHCkePvN76iR1qzkqSvv2VDZBrNN2Gw+GJkhRsH4Kwim+tMh6kLx+t4Ky
 sr52ylTYeXib7VEu8tjIB85pAlgQ5ZVpnSO1H9DwkxU10NahRv8/Xs6Og
 NqZKrBIVzA43uqPylRQoUgplh+l71QX8RCK+zbQZFfts3TCV7R645EfRf
 U08cjfSgQznT4CRiIl4w+t3XN81PaEJP00BwG1Z39+8ry0gBeWLNUz1Wu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353758181"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="353758181"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 06:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875621855"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875621855"
Received: from khach-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 06:32:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:32:31 +0300
Message-Id: <20230516133234.2778034-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516133234.2778034-1-jani.nikula@intel.com>
References: <20230516133234.2778034-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/i915/irq: relocate gmbus and dp aux irq
 handlers
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

Move gmbus and dp aux irq handlers to their respective files. It should
be up to them what to do with the irq, not the generic irq code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/e825385fc03cb3d53c1f0b66712eea42dad69d59.1683219363.git.jani.nikula@intel.com
(cherry picked from commit 685282a3b39be5be000d28c8b88a3e0cae195104)
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c |  5 +++
 drivers/gpu/drm/i915/display/intel_dp_aux.h |  3 ++
 drivers/gpu/drm/i915/display/intel_gmbus.c  |  5 +++
 drivers/gpu/drm/i915/display/intel_gmbus.h  |  2 ++
 drivers/gpu/drm/i915/i915_irq.c             | 40 +++++++++------------
 5 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index ffa21990c1d3..1ef5b66c29fe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -817,3 +817,8 @@ enum aux_ch intel_dp_aux_ch(struct intel_encoder *encoder)
 
 	return aux_ch;
 }
+
+void intel_dp_aux_irq_handler(struct drm_i915_private *i915)
+{
+	wake_up_all(&i915->display.gmbus.wait_queue);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.h b/drivers/gpu/drm/i915/display/intel_dp_aux.h
index 138e340f94ee..5b608f9d3499 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.h
@@ -7,6 +7,7 @@
 #define __INTEL_DP_AUX_H__
 
 enum aux_ch;
+struct drm_i915_private;
 struct intel_dp;
 struct intel_encoder;
 
@@ -15,4 +16,6 @@ void intel_dp_aux_init(struct intel_dp *intel_dp);
 
 enum aux_ch intel_dp_aux_ch(struct intel_encoder *encoder);
 
+void intel_dp_aux_irq_handler(struct drm_i915_private *i915);
+
 #endif /* __INTEL_DP_AUX_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 3ddfc8080ee8..e95ddb580ef6 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -991,3 +991,8 @@ void intel_gmbus_teardown(struct drm_i915_private *i915)
 		i915->display.gmbus.bus[pin] = NULL;
 	}
 }
+
+void intel_gmbus_irq_handler(struct drm_i915_private *i915)
+{
+	wake_up_all(&i915->display.gmbus.wait_queue);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 20f704bd4e70..8111eb23e2af 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -46,4 +46,6 @@ void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
 bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
 void intel_gmbus_reset(struct drm_i915_private *dev_priv);
 
+void intel_gmbus_irq_handler(struct drm_i915_private *i915);
+
 #endif /* __INTEL_GMBUS_H__ */
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index e5f12aa141f6..02b6cbb832e9 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -37,8 +37,10 @@
 #include "display/intel_de.h"
 #include "display/intel_display_trace.h"
 #include "display/intel_display_types.h"
+#include "display/intel_dp_aux.h"
 #include "display/intel_fdi_regs.h"
 #include "display/intel_fifo_underrun.h"
+#include "display/intel_gmbus.h"
 #include "display/intel_hotplug.h"
 #include "display/intel_lpe_audio.h"
 #include "display/intel_psr.h"
@@ -925,16 +927,6 @@ static u32 intel_hpd_hotplug_enables(struct drm_i915_private *i915,
 	return hotplug;
 }
 
-static void gmbus_irq_handler(struct drm_i915_private *dev_priv)
-{
-	wake_up_all(&dev_priv->display.gmbus.wait_queue);
-}
-
-static void dp_aux_irq_handler(struct drm_i915_private *dev_priv)
-{
-	wake_up_all(&dev_priv->display.gmbus.wait_queue);
-}
-
 #if defined(CONFIG_DEBUG_FS)
 static void display_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 					 enum pipe pipe,
@@ -1181,7 +1173,7 @@ static void i965_pipestat_irq_handler(struct drm_i915_private *dev_priv,
 		intel_opregion_asle_intr(dev_priv);
 
 	if (pipe_stats[0] & PIPE_GMBUS_INTERRUPT_STATUS)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 }
 
 static void valleyview_pipestat_irq_handler(struct drm_i915_private *dev_priv,
@@ -1204,7 +1196,7 @@ static void valleyview_pipestat_irq_handler(struct drm_i915_private *dev_priv,
 	}
 
 	if (pipe_stats[0] & PIPE_GMBUS_INTERRUPT_STATUS)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 }
 
 static u32 i9xx_hpd_irq_ack(struct drm_i915_private *dev_priv)
@@ -1269,7 +1261,7 @@ static void i9xx_hpd_irq_handler(struct drm_i915_private *dev_priv,
 	if ((IS_G4X(dev_priv) ||
 	     IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    hotplug_status & DP_AUX_CHANNEL_MASK_INT_STATUS_G4X)
-		dp_aux_irq_handler(dev_priv);
+		intel_dp_aux_irq_handler(dev_priv);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
@@ -1483,10 +1475,10 @@ static void ibx_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 	}
 
 	if (pch_iir & SDE_AUX_MASK)
-		dp_aux_irq_handler(dev_priv);
+		intel_dp_aux_irq_handler(dev_priv);
 
 	if (pch_iir & SDE_GMBUS)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 
 	if (pch_iir & SDE_AUDIO_HDCP_MASK)
 		drm_dbg(&dev_priv->drm, "PCH HDCP audio interrupt\n");
@@ -1571,10 +1563,10 @@ static void cpt_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 	}
 
 	if (pch_iir & SDE_AUX_MASK_CPT)
-		dp_aux_irq_handler(dev_priv);
+		intel_dp_aux_irq_handler(dev_priv);
 
 	if (pch_iir & SDE_GMBUS_CPT)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 
 	if (pch_iir & SDE_AUDIO_CP_REQ_CPT)
 		drm_dbg(&dev_priv->drm, "Audio CP request interrupt\n");
@@ -1624,7 +1616,7 @@ static void xelpdp_pica_irq_handler(struct drm_i915_private *i915, u32 iir)
 	}
 
 	if (trigger_aux)
-		dp_aux_irq_handler(i915);
+		intel_dp_aux_irq_handler(i915);
 
 	if (!pin_mask && !trigger_aux)
 		drm_err(&i915->drm,
@@ -1666,7 +1658,7 @@ static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 		intel_hpd_irq_handler(dev_priv, pin_mask, long_mask);
 
 	if (pch_iir & SDE_GMBUS_ICP)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 }
 
 static void spt_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
@@ -1702,7 +1694,7 @@ static void spt_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 		intel_hpd_irq_handler(dev_priv, pin_mask, long_mask);
 
 	if (pch_iir & SDE_GMBUS_CPT)
-		gmbus_irq_handler(dev_priv);
+		intel_gmbus_irq_handler(dev_priv);
 }
 
 static void ilk_hpd_irq_handler(struct drm_i915_private *dev_priv,
@@ -1730,7 +1722,7 @@ static void ilk_display_irq_handler(struct drm_i915_private *dev_priv,
 		ilk_hpd_irq_handler(dev_priv, hotplug_trigger);
 
 	if (de_iir & DE_AUX_CHANNEL_A)
-		dp_aux_irq_handler(dev_priv);
+		intel_dp_aux_irq_handler(dev_priv);
 
 	if (de_iir & DE_GSE)
 		intel_opregion_asle_intr(dev_priv);
@@ -1782,7 +1774,7 @@ static void ivb_display_irq_handler(struct drm_i915_private *dev_priv,
 		ivb_err_int_handler(dev_priv);
 
 	if (de_iir & DE_AUX_CHANNEL_A_IVB)
-		dp_aux_irq_handler(dev_priv);
+		intel_dp_aux_irq_handler(dev_priv);
 
 	if (de_iir & DE_GSE_IVB)
 		intel_opregion_asle_intr(dev_priv);
@@ -2174,7 +2166,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 			ret = IRQ_HANDLED;
 
 			if (iir & gen8_de_port_aux_mask(dev_priv)) {
-				dp_aux_irq_handler(dev_priv);
+				intel_dp_aux_irq_handler(dev_priv);
 				found = true;
 			}
 
@@ -2196,7 +2188,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 
 			if ((IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv)) &&
 			    (iir & BXT_DE_PORT_GMBUS)) {
-				gmbus_irq_handler(dev_priv);
+				intel_gmbus_irq_handler(dev_priv);
 				found = true;
 			}
 
-- 
2.39.2

