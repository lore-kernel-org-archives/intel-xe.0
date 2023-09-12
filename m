Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA32CA0ED4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 04:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2468B10E321;
	Tue, 12 Sep 2023 04:48:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A0210E265;
 Tue, 12 Sep 2023 04:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694494116; x=1726030116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a7+gh32prj8nz06hf6z+QcrNIirN7XXaqMYJyv6/LZw=;
 b=DzpBNrFP7slETQZKcJDb/aT7Yujlgr8F42iXyEj2foD0BGPL1dF+7D2g
 upITLuSInBwDWWPsgWtR9Ax+KvM4mKfeGG4lgb4NpLCqfetMSpVgOYE12
 h62e8vVKXJVcfn2mdyBcShT927euXIX2+CJAWfv1h2zVwah4DX6huogAl
 pT2Cr7uuu3M96zLL9WPaS9OcJvVn3iH+hJsdi18az4TPVovpQz3bOpefU
 cJcJ2Suv5H2yFj6NjmT45cWFVxETemZGgxR0VDUqhebfaxCETKaMXbRR0
 U+DCHRgf1IHBdmPtfwHTQhEtCBXOJoHJ1dK+wGcCkaz2IPHqA+gWoknXR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378182339"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="378182339"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 21:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074419971"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="1074419971"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 21:48:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Mon, 11 Sep 2023 21:48:29 -0700
Message-Id: <20230912044837.1672060-22-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912044837.1672060-1-lucas.demarchi@intel.com>
References: <20230912044837.1672060-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 21/29] drm/i915/xe2lpd: Add support for HPD
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Gustavo Sousa <gustavo.sousa@intel.com>

Hotplug setup for Xe2_LPD differs from Xe_LPD+ by the fact that the
extra programming for hotplug inversion and DDI HPD filter duration is
not necessary anymore. As mtp_hpd_irq_setup() is reasonably small,
prefer to fork it into a new function for Xe2_LPD instead of adding a
platform check.

v2: Add extra bspec reference and fix missing else (Matt Roper)

BSpec: 68970, 69940
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 3398cc21bd26..f07047e9cb30 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -163,7 +163,9 @@ static void intel_hpd_init_pins(struct drm_i915_private *dev_priv)
 	    (!HAS_PCH_SPLIT(dev_priv) || HAS_PCH_NOP(dev_priv)))
 		return;
 
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_LNL)
+		hpd->pch_hpd = hpd_mtp;
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		hpd->pch_hpd = hpd_sde_dg1;
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_MTP)
 		hpd->pch_hpd = hpd_mtp;
@@ -1063,6 +1065,19 @@ static void mtp_hpd_irq_setup(struct drm_i915_private *i915)
 	mtp_tc_hpd_detection_setup(i915);
 }
 
+static void xe2lpd_sde_hpd_irq_setup(struct drm_i915_private *i915)
+{
+	u32 hotplug_irqs, enabled_irqs;
+
+	enabled_irqs = intel_hpd_enabled_irqs(i915, i915->display.hotplug.pch_hpd);
+	hotplug_irqs = intel_hpd_hotplug_irqs(i915, i915->display.hotplug.pch_hpd);
+
+	ibx_display_interrupt_update(i915, hotplug_irqs, enabled_irqs);
+
+	mtp_ddi_hpd_detection_setup(i915);
+	mtp_tc_hpd_detection_setup(i915);
+}
+
 static bool is_xelpdp_pica_hpd_pin(enum hpd_pin hpd_pin)
 {
 	return hpd_pin >= HPD_PORT_TC1 && hpd_pin <= HPD_PORT_TC4;
@@ -1122,7 +1137,9 @@ static void xelpdp_hpd_irq_setup(struct drm_i915_private *i915)
 
 	xelpdp_pica_hpd_detection_setup(i915);
 
-	if (INTEL_PCH_TYPE(i915) >= PCH_MTP)
+	if (INTEL_PCH_TYPE(i915) >= PCH_LNL)
+		xe2lpd_sde_hpd_irq_setup(i915);
+	else if (INTEL_PCH_TYPE(i915) >= PCH_MTP)
 		mtp_hpd_irq_setup(i915);
 }
 
-- 
2.40.1

