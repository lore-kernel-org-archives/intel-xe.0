Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705A606A901
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E8fUEhyX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CF710E8D5;
	Thu, 19 Nov 2026 20:51:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7247C10F0E9;
 Thu, 19 Nov 2026 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121475; x=1826657475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YmNhKhHw+OyNl2UvecsUKm7lh+53yjye/thIK72lKbc=;
 b=E8fUEhyXQ49McdssNQG4BO1iStg4dDGH9eJN/XdTVFMmxx9Q+QcksG4w
 YWIqXa7txs0IQ5TjsNFu49s+ZCVPFP4BYwwOaAybOlAAAWVBhAbKcpDpl
 B4KyWInWHvyDsSXNJ30fqzGusEV0Gxv5Nej2WfdbuItKpCvfKwdFQgUdr
 L/5Nx2mqhYc9bGvOD74A3NLJ7WOhttB7YwYdyNg5Ob7AfwKcsk3wiz8pj
 G1aYI7Uggxvpaa3aYjXynT10Rk7E+VVes0ZqvNKAttmJUjwygFBupC7Dn
 deYrwlcSF6wTv74IFc//0/w22MzfDSLyHX1o+uEp5jhkIhItEyfmMym54 g==;
X-CSE-ConnectionGUID: RihSph1dT6mm0+GUQwP1nA==
X-CSE-MsgGUID: eskRsEXkQ8GVM7mhOi4YKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4030647"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4030647"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:51:14 -0800
X-CSE-ConnectionGUID: 37AMoNCUT/eLc0CsTM5urw==
X-CSE-MsgGUID: lhUXGxVeRgeWdpvpksJIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="12511741"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:51:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 6/6] drm/i915/de: Make display registers unlocked for TGL+ on
 i915
Date: Thu, 19 Nov 2026 22:50:40 +0200
Message-ID: <20261119205040.31935-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Now that the unclaimed register detection should survive
without the lock there should be no reason to use the lock
on most platforms.

Start by weaning TGL+ off the lock. Since some people have
been using the (lockless) xe driver on TGL/etc. it should
be fairly well established that serializing all register
accesses is not needed on these platforms.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index ebe3789e5441..5f7997a13764 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -482,6 +482,26 @@ static const struct intel_mmio_funcs vlv_mmio_funcs = {
 	.check_for_unclaimed_mmio_needs_lock = true,
 };
 
+#define TGL_MMIO_FLAGS __MMIO_UNCLAIMED
+
+static u32 tgl_mmio_read(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read(display, reg, TGL_MMIO_FLAGS);
+}
+
+static void tgl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	__intel_de_write(display, reg, val, TGL_MMIO_FLAGS);
+}
+
+#undef TGL_MMIO_FLAGS
+
+static const struct intel_mmio_funcs tgl_mmio_funcs = {
+	.read = tgl_mmio_read,
+	.write = tgl_mmio_write,
+	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
+};
+
 #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
 
 static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
@@ -522,8 +542,10 @@ void intel_de_init(struct intel_display *display)
 	 * rid of driver_is_i915().
 	 */
 	if (driver_is_i915()) {
-		if (DISPLAY_VER(display) >= 9 ||
-		    display->platform.broadwell || display->platform.haswell)
+		if (DISPLAY_VER(display) >= 12)
+			display->mmio.funcs = &tgl_mmio_funcs;
+		else if (DISPLAY_VER(display) >= 9 ||
+			 display->platform.broadwell || display->platform.haswell)
 			display->mmio.funcs = &hsw_mmio_funcs;
 		else if (display->platform.valleyview || display->platform.cherryview)
 			display->mmio.funcs = &vlv_mmio_funcs;
-- 
2.56.0

