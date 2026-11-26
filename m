Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dI8NRqU6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D75C112726;
	Thu, 26 Nov 2026 21:27:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29C21126CD;
 Thu, 26 Nov 2026 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728468; x=1827264468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SU8F38DjWoGxRG1EExLv8Tu0uI9OXjwObqxGVV2q9Gk=;
 b=dI8NRqU6rQn7sfOBvVCVZauP4Ol7a07GRqS5QqYsh0CF1x3bMd/52Ayu
 SN3iSu0UK09i9KfHu5EN6yc0TIDHVqbAG7qXLQ9ZXL3n3XzosRDcIlhEq
 SBO8MByEPOeEKsoyVZe8avP/euYZOaa0dwDH7Fs0Q2VVqmLrFcRK/8pV4
 mSN7GOW3PzPX0JOJk3hq0AkgA3LIIjditGmRKo2O6DUI8V3kmyDe9sxad
 ad+0ghPUaWtXxPUi2NfjGOh3aL92eIn9eRGW0IcT3vf/OskyhsPUEVrfD
 lICjSCcRkDtbnu79Z4mwmL0guJt4wAV1knx0/Er+WRda8cGMx6ewTUxx3 Q==;
X-CSE-ConnectionGUID: 9WbFLcgBQYG2GK1q3XK4lQ==
X-CSE-MsgGUID: IUr6twHFQkKkvAqbmsmgwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4537097"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4537097"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:47 -0800
X-CSE-ConnectionGUID: g8sFFEpITmGPjuFmwNQqkg==
X-CSE-MsgGUID: Og9rw3IzT2CTIIuONG26rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="13933827"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915/de: Convert intel_de_read_fw() into a vfunc
Date: Thu, 26 Nov 2026 23:27:24 +0200
Message-ID: <20261126212728.9034-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
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

When we eventually implement the display MMIO stuff using
raw readl()/writel()/etc we'll need to implement the LNL
read vs. write reordering workaround in intel_de_read_fw().
To avoid runtime platform checks convert intel_de_read_fw()
into a vfunc. For now everyone implements this the same way,
and the LNL w/a is still handled in the underlying xe_mmio
code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 16 +++++++++++-----
 drivers/gpu/drm/i915/display/intel_de.h |  6 +++++-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index fe77e8769c9b..658380cb8973 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -201,11 +201,6 @@ __intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
 	intel_uncore_write_fw(__to_uncore(display), reg, val);
 }
 
-u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
-{
-	return __intel_de_read_fw(display, reg);
-}
-
 void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
 {
 	__intel_de_write_fw(display, reg, val);
@@ -429,6 +424,11 @@ __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 
 #define I9XX_MMIO_FLAGS 0
 
+static u32 i9xx_mmio_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read_fw(display, reg);
+}
+
 static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
 {
 	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
@@ -442,6 +442,7 @@ static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32
 #undef I9XX_MMIO_FLAGS
 
 static const struct intel_mmio_funcs i9xx_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = i9xx_mmio_read,
 	.write = i9xx_mmio_write,
 };
@@ -461,6 +462,7 @@ static void snb_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 #undef SNB_MMIO_FLAGS
 
 static const struct intel_mmio_funcs snb_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = snb_mmio_read,
 	.write = snb_mmio_write,
 };
@@ -480,6 +482,7 @@ static void hsw_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 #undef HSW_MMIO_FLAGS
 
 static const struct intel_mmio_funcs hsw_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = hsw_mmio_read,
 	.write = hsw_mmio_write,
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
@@ -487,6 +490,7 @@ static const struct intel_mmio_funcs hsw_mmio_funcs = {
 };
 
 static const struct intel_mmio_funcs vlv_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = hsw_mmio_read,
 	.write = hsw_mmio_write,
 	.check_for_unclaimed_mmio = vlv_check_for_unclaimed_mmio,
@@ -508,6 +512,7 @@ static void tgl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 #undef TGL_MMIO_FLAGS
 
 static const struct intel_mmio_funcs tgl_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = tgl_mmio_read,
 	.write = tgl_mmio_write,
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
@@ -528,6 +533,7 @@ static void lnl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 #undef LNL_MMIO_FLAGS
 
 static const struct intel_mmio_funcs lnl_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
 	.read = lnl_mmio_read,
 	.write = lnl_mmio_write,
 };
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index c21fff7be748..10b66de460be 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -10,6 +10,7 @@
 #include "intel_dsb.h"
 
 struct intel_mmio_funcs {
+	u32 (*read_fw)(struct intel_display *display, intel_reg_t reg);
 	u32 (*read)(struct intel_display *display, intel_reg_t reg);
 	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
 	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
@@ -102,7 +103,10 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
  *
  * These will also skip the mmio_debug unclaimed register detection.
  */
-u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
+static inline u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	return display->mmio.funcs->read_fw(display, reg);
+}
 void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val);
 
 static inline u32
-- 
2.56.1

