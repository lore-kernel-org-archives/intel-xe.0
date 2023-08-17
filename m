Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849ECEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4732D10E413;
	Thu, 17 Aug 2023 08:25:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480C210E415
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260703; x=1723796703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuIr/waAR4ds0vE8o/L3gOv9UyO4bQqAVOnILzlb+kI=;
 b=SqH6cbzJe3q6Uzgs7uEzVrz3xDYiWzbvxoPPEClKvj65lKJlLsLlABLf
 w5dwZufVZnARHMv2RIQ/WPZ/qoUg4iBzeXwx8fhRJJJUkWKKwOCuY3BVt
 jLzjo31Xi4eVpqjoGoroSamQtKCvLzG0x07cB9m+FQsHbvtxl1HIfXWa9
 vrIXfDk47VspdxGcQpDt+Ka9uookRw5zDxT6TNUh4Fj5nzcGF9B9+BxCr
 qKyq3xpq3flvG8OzFYcy9+E1hAAEOSnSfXFxhhBwSOrv/5fcLQuqhqToW
 SrpqiP1UnCR/KIq2T0xGBFN3e2w9KJyDctFqlXNutmitNzU//HWeXHOUf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514211"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803636"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803636"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:32 +0300
Message-Id: <20230817082437.3116208-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 4/9] drm/i915/irq: move all PCH irq postinstall
 calls to display code
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

Unify on making the calls from display code. Need to add an if ladder in
gen8_de_irq_postinstall() for now, but the function looks like it could
be overall be better split by platform. Something for the future.

The display version check for mtp seems a bit suspect, but this matches
current code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/fe51744aec9e2f465caf0d699b8a15591859f89e.1691509966.git.jani.nikula@intel.com
(cherry picked from commit 129ebb54f58562c17d30adf71d577aa9286e6ae4)
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 19 ++++++++++++-------
 .../gpu/drm/i915/display/intel_display_irq.h  |  2 --
 drivers/gpu/drm/i915/i915_irq.c               |  8 --------
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a697e0b32c34..62ce55475554 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1537,7 +1537,7 @@ void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
  * to avoid races with the irq handler, assuming we have MSI. Shared legacy
  * interrupts could still race.
  */
-void ibx_irq_postinstall(struct drm_i915_private *dev_priv)
+static void ibx_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	u32 mask;
@@ -1624,6 +1624,9 @@ void ilk_de_irq_postinstall(struct drm_i915_private *i915)
 		      display_mask | extra_mask);
 }
 
+static void mtp_irq_postinstall(struct drm_i915_private *i915);
+static void icp_irq_postinstall(struct drm_i915_private *i915);
+
 void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
@@ -1641,6 +1644,13 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
+	if (DISPLAY_VER(dev_priv) >= 14)
+		mtp_irq_postinstall(dev_priv);
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
+		icp_irq_postinstall(dev_priv);
+	else if (HAS_PCH_SPLIT(dev_priv))
+		ibx_irq_postinstall(dev_priv);
+
 	if (DISPLAY_VER(dev_priv) <= 10)
 		de_misc_masked |= GEN8_DE_MISC_GSE;
 
@@ -1721,7 +1731,7 @@ static void mtp_irq_postinstall(struct drm_i915_private *i915)
 	GEN3_IRQ_INIT(uncore, SDE, ~sde_mask, 0xffffffff);
 }
 
-void icp_irq_postinstall(struct drm_i915_private *dev_priv)
+static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	u32 mask = SDE_GMBUS_ICP;
@@ -1745,11 +1755,6 @@ void dg1_de_irq_postinstall(struct drm_i915_private *i915)
 	if (!HAS_DISPLAY(i915))
 		return;
 
-	if (DISPLAY_VER(i915) >= 14)
-		mtp_irq_postinstall(i915);
-	else
-		icp_irq_postinstall(i915);
-
 	gen8_de_irq_postinstall(i915);
 	intel_uncore_write(&i915->uncore, GEN11_DISPLAY_INT_CTL,
 			   GEN11_DISPLAY_IRQ_ENABLE);
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 2ccc3e53cec3..2a090dd6abd7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -58,9 +58,7 @@ void vlv_display_irq_reset(struct drm_i915_private *i915);
 void gen8_display_irq_reset(struct drm_i915_private *i915);
 void gen11_display_irq_reset(struct drm_i915_private *i915);
 
-void ibx_irq_postinstall(struct drm_i915_private *i915);
 void vlv_display_irq_postinstall(struct drm_i915_private *i915);
-void icp_irq_postinstall(struct drm_i915_private *i915);
 void ilk_de_irq_postinstall(struct drm_i915_private *i915);
 void gen8_de_irq_postinstall(struct drm_i915_private *i915);
 void gen11_de_irq_postinstall(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index d63f79259637..1bfcfbe6e30b 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -792,11 +792,6 @@ static void valleyview_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
-		icp_irq_postinstall(dev_priv);
-	else if (HAS_PCH_SPLIT(dev_priv))
-		ibx_irq_postinstall(dev_priv);
-
 	gen8_gt_irq_postinstall(to_gt(dev_priv));
 	gen8_de_irq_postinstall(dev_priv);
 
@@ -809,9 +804,6 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
-		icp_irq_postinstall(dev_priv);
-
 	gen11_gt_irq_postinstall(gt);
 	gen11_de_irq_postinstall(dev_priv);
 
-- 
2.39.2

