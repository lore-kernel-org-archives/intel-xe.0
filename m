Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89055606A84C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qg4A3toV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0C10FF51;
	Wed,  4 Nov 2026 22:19:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC710FF51;
 Wed,  4 Nov 2026 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830736; x=1825366736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4STy6EbQ8hc+t3uJ6DqJ4TgFx7mpH4zkqqppnfhMAk=;
 b=Qg4A3toVtu/QZK1Xq3rsCbRIiLklG8SjUodmreAlWLPhdyA5cLDmBQES
 fWx9MaIsoAusavtFCIxVGEnBq7D2zsQGx+DIJXJG9mJrCGRWYZa8t9nO1
 kefvx0upqW3pSs2qRh/AJAgUKKSrIccVuTlzsATc0iTKM0tBLxlc+ISey
 AHngaC9HAg8BRn4l2LBMFp39kRokvD0KzgGp/W8n5U1T8f1DCPrcAr9e3
 7HVBKIvxUcUu2lOcJkggs5aMe0CWGH5CZ0iJCjxbtUuxTjY/L/a0Q+431
 5vMTCiZ0FudBDx+kvd5gB4SJM2DXrXvC8rPn6bfRyPjOiobpz9cPAXnZN Q==;
X-CSE-ConnectionGUID: Azebx/b6QZGp5ald22KxDw==
X-CSE-MsgGUID: WrRLbGXmSYG4FJAW78Qp4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2479795"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2479795"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:18:56 -0800
X-CSE-ConnectionGUID: KUdwCO7NTNqjnZV/0tCUeg==
X-CSE-MsgGUID: 2qWDHO3VQJetNjRtxJTqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6989874"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:18:55 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/de: Convert intel_de_{read,write}() into vfuncs
Date: Thu,  5 Nov 2026 00:18:35 +0200
Message-ID: <20261104221842.18799-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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

Different platforms will need to do different things in
their mmio accessors. The plan is to trade the overhead
of runtime platform checks into no runtime checks and
the cost of a vfunc call. This seems to provide slightly
better overall performance.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c         | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_de.h         |  9 +++++++--
 .../gpu/drm/i915/display/intel_display_core.h   |  2 ++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 6b3d06147e58..4f423a684ec2 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -163,7 +163,24 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	return intel_uncore_read16(__to_uncore(display), reg);
 }
 
+static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
+{
+	return intel_uncore_read(__to_uncore(display), reg);
+}
+
+static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	intel_uncore_write(__to_uncore(display), reg, val);
+}
+
+static const struct intel_mmio_funcs i9xx_mmio_funcs = {
+	.read = i9xx_mmio_read,
+	.write = i9xx_mmio_write,
+};
+
 void intel_de_init(struct intel_display *display)
 {
 	display->mmio.uncore = to_intel_uncore(display->drm);
+
+	display->mmio.funcs = &i9xx_mmio_funcs;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index f1135ee5071b..63aef17e6ed3 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -12,6 +12,11 @@
 #include "intel_uncore.h"
 #include "intel_uncore_trace.h"
 
+struct intel_mmio_funcs {
+	u32 (*read)(struct intel_display *display, intel_reg_t reg);
+	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
+};
+
 static inline struct intel_uncore *__to_uncore(struct intel_display *display)
 {
 	return display->mmio.uncore;
@@ -30,7 +35,7 @@ intel_de_read(struct intel_display *display, intel_reg_t reg)
 
 	intel_dmc_wl_get(display, reg);
 
-	val = intel_uncore_read(__to_uncore(display), reg);
+	val = display->mmio.funcs->read(display, reg);
 
 	intel_dmc_wl_put(display, reg);
 
@@ -60,7 +65,7 @@ intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
 {
 	intel_dmc_wl_get(display, reg);
 
-	intel_uncore_write(__to_uncore(display), reg, val);
+	display->mmio.funcs->write(display, reg, val);
 
 	intel_dmc_wl_put(display, reg);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 35409f9abb2f..3a48119f7890 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -49,6 +49,7 @@ struct intel_fbdev;
 struct intel_fdi_funcs;
 struct intel_hotplug_irq_funcs;
 struct intel_initial_plane_config;
+struct intel_mmio_funcs;
 struct intel_opregion;
 struct intel_overlay;
 struct intel_uncore;
@@ -533,6 +534,7 @@ struct intel_display {
 
 	struct {
 		struct intel_uncore *uncore;
+		const struct intel_mmio_funcs *funcs;
 	} mmio;
 
 	struct {
-- 
2.56.0

