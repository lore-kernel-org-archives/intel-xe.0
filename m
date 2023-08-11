Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF1C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62410E688;
	Fri, 11 Aug 2023 09:36:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD61510E686
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746575; x=1723282575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pyL5Qu2hoojbh5JrlpMSock6OAdomE+bqkP6pEUMCds=;
 b=m8/gY1FQVtidMNaHl1RT1eSsRicP9QygcXjeFpa1SovRNF32eRUCZEiQ
 QsUrVna3KouL7mpKtU/M7Ms/Sexyt7HCvCJwRLqlySI7fKT5gVUwJIyn6
 2pzYOPiO+y8j6eNWPs9pliM/lSL6tkC4q3QckOQ0MCKVIkZCOLclRoPfe
 stJn4MyY6qGJ9PVBcxInbqC2gVAUYrGA9N3py5/5tH1VMaVduDkQgWkE7
 moONQJM0opJyLMgoRpvtcGKn707R2ZpT9LTNzyWm26X6fGm5EMnCkj+Pu
 pmNdBZPwz4fImXetab6CL8Q8M/ZsB6IUqWIQBklRGFSvZRxOe5c9EhYuD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012767"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012767"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374737"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374737"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:52 +0300
Message-Id: <20230811093559.2304457-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/9] drm/i915/irq: add dg1_de_irq_postinstall()
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a dedicated de postinstall function.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/cb6bb860fb7596d6b37c3e1e4c7657064d2d747a.1691509966.git.jani.nikula@intel.com
(cherry picked from commit 1007337f5413259cb1c410e66bf980dd8adba62f)
---
 .../gpu/drm/i915/display/intel_display_irq.c    | 17 ++++++++++++++++-
 .../gpu/drm/i915/display/intel_display_irq.h    |  2 +-
 drivers/gpu/drm/i915/i915_irq.c                 | 11 +----------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 168f6d4ce208..a706ba740dd6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1666,7 +1666,7 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	}
 }
 
-void mtp_irq_postinstall(struct drm_i915_private *i915)
+static void mtp_irq_postinstall(struct drm_i915_private *i915)
 {
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 sde_mask = SDE_GMBUS_ICP | SDE_PICAINTERRUPT;
@@ -1699,6 +1699,21 @@ void gen11_de_irq_postinstall(struct drm_i915_private *dev_priv)
 			   GEN11_DISPLAY_IRQ_ENABLE);
 }
 
+void dg1_de_irq_postinstall(struct drm_i915_private *i915)
+{
+	if (!HAS_DISPLAY(i915))
+		return;
+
+	if (DISPLAY_VER(i915) >= 14)
+		mtp_irq_postinstall(i915);
+	else
+		icp_irq_postinstall(i915);
+
+	gen8_de_irq_postinstall(i915);
+	intel_uncore_write(&i915->uncore, GEN11_DISPLAY_INT_CTL,
+			   GEN11_DISPLAY_IRQ_ENABLE);
+}
+
 void intel_display_irq_init(struct drm_i915_private *i915)
 {
 	i915->drm.vblank_disable_immediate = true;
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 8a2d069d3aac..ce190557826b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -62,8 +62,8 @@ void ibx_irq_postinstall(struct drm_i915_private *i915);
 void vlv_display_irq_postinstall(struct drm_i915_private *i915);
 void icp_irq_postinstall(struct drm_i915_private *i915);
 void gen8_de_irq_postinstall(struct drm_i915_private *i915);
-void mtp_irq_postinstall(struct drm_i915_private *i915);
 void gen11_de_irq_postinstall(struct drm_i915_private *i915);
+void dg1_de_irq_postinstall(struct drm_i915_private *i915);
 
 u32 i915_pipestat_enable_mask(struct drm_i915_private *i915, enum pipe pipe);
 void i915_enable_pipestat(struct drm_i915_private *i915, enum pipe pipe, u32 status_mask);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 1723c215dcf6..8c074643b6d1 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -869,16 +869,7 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-	if (HAS_DISPLAY(dev_priv)) {
-		if (DISPLAY_VER(dev_priv) >= 14)
-			mtp_irq_postinstall(dev_priv);
-		else
-			icp_irq_postinstall(dev_priv);
-
-		gen8_de_irq_postinstall(dev_priv);
-		intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL,
-				   GEN11_DISPLAY_IRQ_ENABLE);
-	}
+	dg1_de_irq_postinstall(dev_priv);
 
 	dg1_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
-- 
2.39.2

