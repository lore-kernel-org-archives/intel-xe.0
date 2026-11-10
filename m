Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lt5o5qRq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91F10F146;
	Tue, 10 Nov 2026 18:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CFE10EB03;
 Tue, 10 Nov 2026 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336391; x=1825872391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HtjFtIlXHP6dDqRu/1DTPNPjJneLl3bQJIODyBVnT60=;
 b=Lt5o5qRqu2JLp/ZC54HFfrpy+vcIvNwrHlNfkT+GNne8VPuLVH9rLlXb
 Jys/bowJVjjDnOf+lbHDXFxxDX1yoGZTfu0S6N6vZ5NR9ASjnBq5qJVlo
 iINN82L68j4/SJHVhKOnyQDBVprGNJwpLoTB+w3zF0a3PaOhqAHeYijOG
 FJMFo7/V4xddyyuLEhF9c8GvWbMSFjRRJXNYwEwxLOcGedAewmLJFbCtF
 olRJXE8CsyKn71b96COc4ydidKUI1pcRAqXigUqmMEoBNtp+t3bNyo7YK
 vExKx4jypj8pF8KWI73YGRIavLDmDtiFUjajGgasKEnxYnFALm4KYDrxN Q==;
X-CSE-ConnectionGUID: iVXCfb5BS/2OsKKE3tw5ew==
X-CSE-MsgGUID: eimWK4MKQnuAAoZNa1hGPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2972790"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2972790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:30 -0800
X-CSE-ConnectionGUID: uNy5PZAoQzeIX+l7hM2kLQ==
X-CSE-MsgGUID: +G/B2sXhQ2+o3YaapYOncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8550880"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v2 01/10] drm/i915/de: Introduce dislay->mmio and
 intel_de_init()
Date: Tue, 10 Nov 2026 20:46:12 +0200
Message-ID: <20261110184622.1721-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a place for upcoming mmio stuff in the form of
a display->mmio struct and intel_de_init() to fill it up.
For now we'll just stick the uncore pointer there, but
it'll get replaced by something else eventually.

I originally wanted to call intel_de_init() just after
intel_display_device_probe(), but i915 calls that before
the uncore/mmio setup has been done. Right now that wouldn't
matter since the &i915->uncore is valid nonetheless. But
eventually I think we'll just want to get the 'void __iomem *'
from the core driver and that of course need to be mapped
before intel_de_init() is called. So put the init call into
__intel_display_device_info_runtime_init() which should be the
first place where we call any intel_de_*() stuff

v2: Call intel_de_init() even for !HAS_DISPLAY()

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c             |  5 +++++
 drivers/gpu/drm/i915/display/intel_de.h             |  4 +++-
 drivers/gpu/drm/i915/display/intel_display_core.h   |  5 +++++
 drivers/gpu/drm/i915/display/intel_display_device.c | 10 ++++++++++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index a7417905192d..6b3d06147e58 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -162,3 +162,8 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 
 	return intel_uncore_read16(__to_uncore(display), reg);
 }
+
+void intel_de_init(struct intel_display *display)
+{
+	display->mmio.uncore = to_intel_uncore(display->drm);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index d0a239a36980..f1135ee5071b 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -14,9 +14,11 @@
 
 static inline struct intel_uncore *__to_uncore(struct intel_display *display)
 {
-	return to_intel_uncore(display->drm);
+	return display->mmio.uncore;
 }
 
+void intel_de_init(struct intel_display *display);
+
 u8 intel_de_read8(struct intel_display *display, intel_reg_t reg);
 void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val);
 u16 intel_de_read16(struct intel_display *display, intel_reg_t reg);
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index c80b4a2f74f9..35409f9abb2f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -51,6 +51,7 @@ struct intel_hotplug_irq_funcs;
 struct intel_initial_plane_config;
 struct intel_opregion;
 struct intel_overlay;
+struct intel_uncore;
 struct task_struct;
 
 /* Amount of SAGV/QGV points, BSpec precisely defines this */
@@ -530,6 +531,10 @@ struct intel_display {
 		const struct intel_modeset_funcs *funcs;
 	} modeset;
 
+	struct {
+		struct intel_uncore *uncore;
+	} mmio;
+
 	struct {
 		/* protected by wm.wm_mutex */
 		u16 linetime[I915_MAX_PIPES];
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index c74256359c25..69046d0cd5e9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1966,6 +1966,16 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 
 void intel_display_device_info_runtime_init(struct intel_display *display)
 {
+	/*
+	 * intel_de_init() must be called even with !HAS_DISPLAY
+	 * because eg. IVB DE_MASTER_IRQ_CONTROL lives in the display.
+	 *
+	 * TODO end of intel_display_device_probe() would be a more
+	 * logical place, but at the moment i915 calls that super
+	 * early when things aren't fully set up yet.
+	 */
+	intel_de_init(display);
+
 	if (HAS_DISPLAY(display))
 		__intel_display_device_info_runtime_init(display);
 
-- 
2.56.0

