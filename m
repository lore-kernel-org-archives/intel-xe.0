Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7BCC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 10:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C87E10EC71;
	Mon, 22 Jan 2024 10:14:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06C610EC71
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705918475; x=1737454475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HKsI8G7ZokBhuJPxdKcAhtKSOFuAa5K+7wPW7xNTEqQ=;
 b=T70vJXTpi+PNGFhdivd9JWwptIiwGB66NsDTq488G4PBQGJQaU57jGK5
 DYZIV9rmrMQRgKqiG+omNJRsuFV5PGlQtz04w2jd4c2g5HcWdzJmHGJU/
 1j5JvjDAYqBR7W1QbtdjrujrkLPWnatlRYi4TkKjiXvL71YBiyTPapolt
 qot8LkChBIt9A//L4m4Mzyj4n0WcL+1k8CTrLmlvMPepIZ60Dzh/eKtyg
 PVdtZgx7H7fxQyk8968oiMFUW6KTasuHFoe3daLwwQza4hS+pk8sq6y9o
 xN55Ul8QeL+oTJE5kQ4EJ68KEfm+FvvSmcnpLagpKH9uw8xFBiBpt9F79 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7833759"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7833759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 02:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="908889619"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="908889619"
Received: from mshelego-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.40.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 02:14:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: move xe_display.[ch] under display/
Date: Mon, 22 Jan 2024 12:14:27 +0200
Message-Id: <20240122101428.2683468-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All the other display related files are under display/ subdirectory,
also move xe_display.[ch] there.

Sort the build list while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   | 18 +++++++++---------
 drivers/gpu/drm/xe/{ => display}/xe_display.c |  0
 drivers/gpu/drm/xe/{ => display}/xe_display.h |  0
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename drivers/gpu/drm/xe/{ => display}/xe_display.c (100%)
 rename drivers/gpu/drm/xe/{ => display}/xe_display.h (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index fe8b266a9819..e06f99def559 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -185,17 +185,17 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
 
 # Display code specific to xe
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
-	xe_display.o \
-	display/xe_fb_pin.o \
-	display/xe_hdcp_gsc.o \
-	display/xe_plane_initial.o \
-	display/xe_display_rps.o \
+	display/ext/i915_irq.o \
+	display/ext/i915_utils.o \
+	display/intel_fb_bo.o \
+	display/intel_fbdev_fb.o \
+	display/xe_display.o \
 	display/xe_display_misc.o \
+	display/xe_display_rps.o \
 	display/xe_dsb_buffer.o \
-	display/intel_fbdev_fb.o \
-	display/intel_fb_bo.o \
-	display/ext/i915_irq.o \
-	display/ext/i915_utils.o
+	display/xe_fb_pin.o \
+	display/xe_hdcp_gsc.o \
+	display/xe_plane_initial.o
 
 # SOC code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
similarity index 100%
rename from drivers/gpu/drm/xe/xe_display.c
rename to drivers/gpu/drm/xe/display/xe_display.c
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
similarity index 100%
rename from drivers/gpu/drm/xe/xe_display.h
rename to drivers/gpu/drm/xe/display/xe_display.h
-- 
2.39.2

