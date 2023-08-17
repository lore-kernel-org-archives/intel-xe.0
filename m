Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E70EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8B810E3EC;
	Thu, 17 Aug 2023 08:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8B310E414
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260699; x=1723796699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZdsyuouvY7pWDAuuw6v7h49m1w7fO83q4j6S/6uVgY=;
 b=ByESDA7KrhoItP8PtQDI28sTr3MB5jcwDEms1Mds1W3AhjxmREyFZ5do
 eQDvy0WlEaULaYTYVqRlN2VmgoXSCJHfIxyuKarximPXndXNnKfPqykN8
 /DRi4vP3RVXvG7c1JjsD2XXPLsC0Pnptmc4k63VT+YZ0uzAVI9da91ecg
 ZPBO9GZcjsqaZaM9cWonvJaX2Uds39piZ1zvIjT1FzuynRMuES8Rfx9Tg
 6DaBj6XOfK5pV/aCi1e4Y/hGyp8FpOgwn4b8fMsJnpR4ABX4JqUbnLjkN
 wlT/YEWl/myE3MqHHoRCoeViXnLDu96LwD9Nq6GhFVLluLpkJSzgqc4u8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514196"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514196"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803513"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803513"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:31 +0300
Message-Id: <20230817082437.3116208-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 3/9] drm/i915/irq: add ilk_de_irq_postinstall()
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a dedicated de postinstall function.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/f4a8570881e9be28a2406134b2898b8680f9e765.1691509966.git.jani.nikula@intel.com
(cherry picked from commit fcc02c754f313e244cbecfa057ba27978f3b09ce)
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 41 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_display_irq.h  |  1 +
 drivers/gpu/drm/i915/i915_irq.c               | 38 +----------------
 3 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a706ba740dd6..a697e0b32c34 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1583,6 +1583,47 @@ void valleyview_disable_display_irqs(struct drm_i915_private *dev_priv)
 		vlv_display_irq_reset(dev_priv);
 }
 
+void ilk_de_irq_postinstall(struct drm_i915_private *i915)
+{
+	struct intel_uncore *uncore = &i915->uncore;
+	u32 display_mask, extra_mask;
+
+	if (GRAPHICS_VER(i915) >= 7) {
+		display_mask = (DE_MASTER_IRQ_CONTROL | DE_GSE_IVB |
+				DE_PCH_EVENT_IVB | DE_AUX_CHANNEL_A_IVB);
+		extra_mask = (DE_PIPEC_VBLANK_IVB | DE_PIPEB_VBLANK_IVB |
+			      DE_PIPEA_VBLANK_IVB | DE_ERR_INT_IVB |
+			      DE_PLANE_FLIP_DONE_IVB(PLANE_C) |
+			      DE_PLANE_FLIP_DONE_IVB(PLANE_B) |
+			      DE_PLANE_FLIP_DONE_IVB(PLANE_A) |
+			      DE_DP_A_HOTPLUG_IVB);
+	} else {
+		display_mask = (DE_MASTER_IRQ_CONTROL | DE_GSE | DE_PCH_EVENT |
+				DE_AUX_CHANNEL_A | DE_PIPEB_CRC_DONE |
+				DE_PIPEA_CRC_DONE | DE_POISON);
+		extra_mask = (DE_PIPEA_VBLANK | DE_PIPEB_VBLANK |
+			      DE_PIPEB_FIFO_UNDERRUN | DE_PIPEA_FIFO_UNDERRUN |
+			      DE_PLANE_FLIP_DONE(PLANE_A) |
+			      DE_PLANE_FLIP_DONE(PLANE_B) |
+			      DE_DP_A_HOTPLUG);
+	}
+
+	if (IS_HASWELL(i915)) {
+		gen3_assert_iir_is_zero(uncore, EDP_PSR_IIR);
+		display_mask |= DE_EDP_PSR_INT_HSW;
+	}
+
+	if (IS_IRONLAKE_M(i915))
+		extra_mask |= DE_PCU_EVENT;
+
+	i915->irq_mask = ~display_mask;
+
+	ibx_irq_postinstall(i915);
+
+	GEN3_IRQ_INIT(uncore, DE, i915->irq_mask,
+		      display_mask | extra_mask);
+}
+
 void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index ce190557826b..2ccc3e53cec3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -61,6 +61,7 @@ void gen11_display_irq_reset(struct drm_i915_private *i915);
 void ibx_irq_postinstall(struct drm_i915_private *i915);
 void vlv_display_irq_postinstall(struct drm_i915_private *i915);
 void icp_irq_postinstall(struct drm_i915_private *i915);
+void ilk_de_irq_postinstall(struct drm_i915_private *i915);
 void gen8_de_irq_postinstall(struct drm_i915_private *i915);
 void gen11_de_irq_postinstall(struct drm_i915_private *i915);
 void dg1_de_irq_postinstall(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 8c074643b6d1..d63f79259637 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -772,45 +772,9 @@ static void cherryview_irq_reset(struct drm_i915_private *dev_priv)
 
 static void ilk_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_uncore *uncore = &dev_priv->uncore;
-	u32 display_mask, extra_mask;
-
-	if (GRAPHICS_VER(dev_priv) >= 7) {
-		display_mask = (DE_MASTER_IRQ_CONTROL | DE_GSE_IVB |
-				DE_PCH_EVENT_IVB | DE_AUX_CHANNEL_A_IVB);
-		extra_mask = (DE_PIPEC_VBLANK_IVB | DE_PIPEB_VBLANK_IVB |
-			      DE_PIPEA_VBLANK_IVB | DE_ERR_INT_IVB |
-			      DE_PLANE_FLIP_DONE_IVB(PLANE_C) |
-			      DE_PLANE_FLIP_DONE_IVB(PLANE_B) |
-			      DE_PLANE_FLIP_DONE_IVB(PLANE_A) |
-			      DE_DP_A_HOTPLUG_IVB);
-	} else {
-		display_mask = (DE_MASTER_IRQ_CONTROL | DE_GSE | DE_PCH_EVENT |
-				DE_AUX_CHANNEL_A | DE_PIPEB_CRC_DONE |
-				DE_PIPEA_CRC_DONE | DE_POISON);
-		extra_mask = (DE_PIPEA_VBLANK | DE_PIPEB_VBLANK |
-			      DE_PIPEB_FIFO_UNDERRUN | DE_PIPEA_FIFO_UNDERRUN |
-			      DE_PLANE_FLIP_DONE(PLANE_A) |
-			      DE_PLANE_FLIP_DONE(PLANE_B) |
-			      DE_DP_A_HOTPLUG);
-	}
-
-	if (IS_HASWELL(dev_priv)) {
-		gen3_assert_iir_is_zero(uncore, EDP_PSR_IIR);
-		display_mask |= DE_EDP_PSR_INT_HSW;
-	}
-
-	if (IS_IRONLAKE_M(dev_priv))
-		extra_mask |= DE_PCU_EVENT;
-
-	dev_priv->irq_mask = ~display_mask;
-
-	ibx_irq_postinstall(dev_priv);
-
 	gen5_gt_irq_postinstall(to_gt(dev_priv));
 
-	GEN3_IRQ_INIT(uncore, DE, dev_priv->irq_mask,
-		      display_mask | extra_mask);
+	ilk_de_irq_postinstall(dev_priv);
 }
 
 static void valleyview_irq_postinstall(struct drm_i915_private *dev_priv)
-- 
2.39.2

