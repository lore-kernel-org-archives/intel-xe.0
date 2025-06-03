Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB1C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569BC10E64C;
	Tue,  3 Jun 2025 19:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JB5jAXvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997BA10E63F;
 Tue,  3 Jun 2025 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979442; x=1780515442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ1gxaLOC6YpZDb0mTFMumCInfynmA/9La4YAHzYBz4=;
 b=JB5jAXvO6XxFG5LtfgoVqsDuzv1QRHpDqTdb3GSaUzyDN/JHUVjQZBVA
 AkwO2hA9insRnFpwct2i4re6dhGOEmdvWmL8KHWyo7pi+I9eQm8Tegchy
 xhoUSSMQFMzWNw5qIVWoXvKIMOBeeLTXGQFwlHEvWtvDWF25Q/QxjZGYL
 tbOH+JXiW59gR7iUtJPsPRcjbkcykf/wWB2fAtObJfiGXkIkMNXaT0gFp
 BhQNvsTNXboM6atakO7t86rfPdztF7SqruqWWhCi+fDPEBVkKPkZjxFVx
 JAZLQe0VtaFja050Vkyi4Uy+A9IXdhOeCDLcp49mKjESXJfGPJNHW1Jem w==;
X-CSE-ConnectionGUID: aF3GNkDaQHSgxeRSo6KHCw==
X-CSE-MsgGUID: OiN4XZIIQaW9CfEjed90Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50276046"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50276046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:37:21 -0700
X-CSE-ConnectionGUID: DR08HTyYRLaNSkn71OouEQ==
X-CSE-MsgGUID: KZSjmHl+R2mKt5rMhYVPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="144844809"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa006.jf.intel.com with ESMTP; 03 Jun 2025 12:37:20 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@intel.com, jani.nikula@intel.com
Subject: [PATCH v6 12/17] drm/i915/dsb: Add pipedmc dc balance enable/disable
Date: Wed,  4 Jun 2025 01:05:17 +0530
Message-ID: <20250603193522.2567092-13-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250603193522.2567092-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250603193522.2567092-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add function to control DC balance enable/disable bit via DSB.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dmc.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a7ba17361d63..13652dd1ed2a 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1478,3 +1478,20 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
 		drm_err(display->drm, "[CRTC:%d:%s]] PIPEDMC interrupt vector 0x%x\n",
 			crtc->base.base.id, crtc->base.name, tmp);
 }
+
+void intel_pipedmc_dcb_enable(struct intel_dsb *dsb, struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	enum pipe pipe = crtc->pipe;
+
+	intel_de_write_dsb(display, dsb, PIPEDMC_DCB_CTL(pipe),
+			   PIPEDMC_ADAPTIVE_DCB_ENABLE);
+}
+
+void intel_pipedmc_dcb_disable(struct intel_dsb *dsb, struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	enum pipe pipe = crtc->pipe;
+
+	intel_de_write_dsb(display, dsb, PIPEDMC_DCB_CTL(pipe), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.h b/drivers/gpu/drm/i915/display/intel_dmc.h
index a98e8deff13a..12912e80bbc6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc.h
@@ -9,9 +9,11 @@
 #include <linux/types.h>
 
 enum pipe;
+struct intel_crtc;
 struct drm_printer;
 struct intel_display;
 struct intel_dmc_snapshot;
+struct intel_dsb;
 
 void intel_dmc_init(struct intel_display *display);
 void intel_dmc_load_program(struct intel_display *display);
@@ -35,5 +37,7 @@ void intel_dmc_update_dc6_allowed_count(struct intel_display *display, bool star
 void assert_dmc_loaded(struct intel_display *display);
 
 void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe);
+void intel_pipedmc_dcb_enable(struct intel_dsb *dsb, struct intel_crtc *crtc);
+void intel_pipedmc_dcb_disable(struct intel_dsb *dsb, struct intel_crtc *crtc);
 
 #endif /* __INTEL_DMC_H__ */
-- 
2.48.1

