Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F982C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 19:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0AF10E1DA;
	Thu,  9 Mar 2023 19:19:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1B10E1DA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678389585; x=1709925585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EYsvjwd1+qwWc2znexRvXQMLqPoasE/BKr6HoAyhy0c=;
 b=eJFM/thIvUtsJr2VpJcfGc6Iv1+6TWvKvt5uZCyByNikUSP0TDX30p8j
 osXQ5vyk/r+Oxu8bGhqWiB7/7yLzGO7RpxNtQrPJQPw4ASBSCalDaCwrq
 /3qLppxQYkv/eOwLJe4rheuA/5LIz/Y4T8RLM7hMyVcNMq6IPtmq7FDKX
 xAoK73kGqN6A29nC0Rq35XDvmyFMC+ID8YakdVlUzkZzmAl+ntvqVU1lE
 LrhbWWBUU0FtxapMS3Dl4egf4z9ywqspHYbQGj1ut8cA05mgIRVpSZ4YG
 HBZk0iWlqZhClr7m2raBIPGMsPpp5c0DG7Te1dC0EjHEs6/qRxlFtV45f Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334024536"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="334024536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 11:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="709972175"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="709972175"
Received: from msobrero-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.113])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 11:19:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 21:19:23 +0200
Message-Id: <20230309191923.670451-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add config option DRM_I915_LEGACY to enable/disable legacy platform
support. This is primarily for the benefit of the drm/xe driver, and
legacy is defined in terms of the platforms drm/xe does not support,
i.e. anything before Tigerlake.

While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
is that it's not used in code. Instead, we'll pass -DI915_LEGACY=1 in
the i915 Makefile for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
does no such thing, regardless of the kconfig value.

Initially, the knob does the bare minimum: drops the legacy platforms
from module PCI ID table (and the compiler in turn automagically drops
all the unreferenced device infos).

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

*** NOTE ***

For now, I'm only sending this to the intel-xe mailing list with a bunch
of Cc's for first impressions.

The xe driver reuses i915 display code, but there's a lot of unnecessary
and/or incompatible code for platforms xe does not support. Currently
this is handled with a bunch of #ifdef I915 added to i915 in the xe
branch that isn't really upstreamble, and I'm thinking this patch might
be a better option.

This patch alone does what the commit message says, and drops the legacy
platform support, although all the code is left in place. Everything
beyond this is basically an optimization of what more to drop out of the
build. It doesn't really need to be perfect for starters but we could
start converting the legacy platform related #ifdefs from I915 to
I915_LEGACY, and that could be upstreamable to i915.

Not all of the #ifdef I915 in the xe branch are related to legacy
platforms, and they need to be handled differently. But this kconfig
knob would hopefully be a future compatible start to clean up one aspect
of them.

Thoughts?

BR,
Jani.
---
 drivers/gpu/drm/i915/Kconfig    | 11 +++++++++++
 drivers/gpu/drm/i915/Makefile   |  7 +++++++
 drivers/gpu/drm/i915/i915_pci.c |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 8eb3e60aeec9..a569c1606f51 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -53,6 +53,17 @@ config DRM_I915
 
 	  If "M" is selected, the module will be called i915.
 
+config DRM_I915_LEGACY
+	bool "Support legacy hardware in i915"
+	depends on DRM_I915
+	depends on EXPERT
+	default y
+	help
+	  Disable this option if you want the i915 driver to only support modern
+	  Intel Graphics, starting from Tigerlake.
+
+	  If in doubt, say "Y".
+
 config DRM_I915_FORCE_PROBE
 	string "Force probe i915 for selected Intel hardware IDs"
 	depends on DRM_I915
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a6e7cd2185c2..653d43e5b534 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -23,6 +23,13 @@ subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
+# Legacy platform support.
+#
+# Note: Source code needs to check for I915_LEGACY instead of
+# CONFIG_DRM_I915_LEGACY to allow Xe driver build without legacy support
+# independent of the Kconfig setting.
+subdir-ccflags-$(CONFIG_DRM_I915_LEGACY) += -DI915_LEGACY=1
+
 # Fine grained warnings disable
 CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
 CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index bc6fc268739d..9f421015d2bb 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1162,6 +1162,7 @@ static const struct intel_device_info mtl_info = {
  * PCI ID matches, otherwise we'll use the wrong info struct above.
  */
 static const struct pci_device_id pciidlist[] = {
+#if IS_ENABLED(I915_LEGACY)
 	INTEL_I830_IDS(&i830_info),
 	INTEL_I845G_IDS(&i845g_info),
 	INTEL_I85X_IDS(&i85x_info),
@@ -1225,6 +1226,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_ICL_11_IDS(&icl_info),
 	INTEL_EHL_IDS(&ehl_info),
 	INTEL_JSL_IDS(&jsl_info),
+#endif
 	INTEL_TGL_12_IDS(&tgl_info),
 	INTEL_RKL_IDS(&rkl_info),
 	INTEL_ADLS_IDS(&adl_s_info),
-- 
2.39.1

