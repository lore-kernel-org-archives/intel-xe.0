Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF2C2FC0E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5D510E414;
	Thu, 17 Aug 2023 08:24:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6F10E415
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260697; x=1723796697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJmK3kTuCskJkIr3iMsFyedg1iWoWniIAbaWP6cvwg4=;
 b=nU63A1W1KVYKOI8KohIONfUjvvbEDvj+Z5ydDimbUh5rKOTHXZIgQgvv
 qaaJ9baeR9GE+r0DPEMzT1BnV9Rc1Izv4g4W6PeanpD2v1zeqPAGQyNYj
 KtJ93clhn017wOto8Akly7iec+i0bsnnTEbdstY6qZyxDuCN1sVitKGLh
 tJabVI/daekMgXQpkxS12XMFijcJ++xJIDpqRG7w57QS1dudVH/gNb+fM
 Fwx0s3P9KpTukRIu30DHCSCYnfAxvF+eie3AKkE7QZbJrSs85ok/2CaVi
 l5k0E0tOcngfcHgbunL+BOdgk7boz5hvm+CieM78dy2JiUsfRLI3o1xum g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514188"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514188"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803499"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803499"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:30 +0300
Message-Id: <20230817082437.3116208-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/9] drm/i915/irq: add dg1_de_irq_postinstall()
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
Link: https://patchwork.freedesktop.org/patch/msgid/cb6bb860fb7596d6b37c3e1e4c7657064d2d747a.1691509966.git.jani.nikula@intel.com
(cherry picked from commit 1007337f5413259cb1c410e66bf980dd8adba62f)
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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

