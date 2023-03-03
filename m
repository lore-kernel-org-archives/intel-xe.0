Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C4C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88CE10E07E;
	Fri,  3 Mar 2023 10:53:09 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B0F10E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840788; x=1709376788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3jlZUkTOH/RUnzZurDoFjCiJmpAYaaWGUQDUO1xuSw=;
 b=ULfNfr4zrOfEunKnCFQuidOsQfh+L1CX825A96AM+OCT+wS1x54xIjnT
 /g63daIB/ZCGADCqjIZ9p4ky9S1l73t5VI3w8BP1bHjuMPvMok5Ow4F7u
 tvvQWW6mTwQKE+wU+uemvU1JTKamNsI3y6l0YeFUeQK/FaSApvG/bHotj
 DMF95lv+xTgeSWqxhbU/K9nOndpEfjWR81Ayj/b9gavTyMo3dS7LGCDVh
 iWbbrEjnmCtwqvDcXcyZ+TrDRIHcIBW70Lv+6x3Ky8usQ61aizbIG27PG
 xJMhldtwj60fT+jCm22rsWaBv0NJ4O3gY2szpI3Saif1zp2F/KLSwiHj6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288218"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288218"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739467834"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739467834"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:20 +0200
Message-Id: <20230303105222.3550161-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/8] drm/xe: move all top level i915 compat
 headers to a separate subdirectory
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Be more explicit about which headers override i915 top level
headers. These are not specifically related to display, although they
are mostly only needed for display support.

v2: rename compat-headers to compat-i915-headers (Lucas)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                                 | 6 ++++--
 .../xe/{display => compat-i915-headers}/i915_active_types.h | 0
 .../gpu/drm/xe/{display => compat-i915-headers}/i915_drv.h  | 0
 .../gpu/drm/xe/{display => compat-i915-headers}/i915_vma.h  | 0
 .../xe/{display => compat-i915-headers}/i915_vma_types.h    | 0
 .../xe/{display => compat-i915-headers}/intel_pm_types.h    | 0
 .../xe/{display => compat-i915-headers}/intel_runtime_pm.h  | 0
 .../drm/xe/{display => compat-i915-headers}/intel_wakeref.h | 0
 8 files changed, 4 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_active_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_drv.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_vma.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_vma_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_pm_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_runtime_pm.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_wakeref.h (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5489d761f6f6..f9e18e5d6ea6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,7 +96,9 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 # i915 Display compat #defines and #includes
-subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
+subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
+	-I$(srctree)/$(src)/display/ext \
+	-I$(srctree)/$(src)/compat-i915-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/ \
@@ -214,7 +216,7 @@ obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
 ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
-	skipdisplay:=-not -path display/\* -not -path xe_display.h
+	skipdisplay:=-not -path display/\* -not -path compat-i915-headers/\* -not -path xe_display.h
 endif
 
 # header test
diff --git a/drivers/gpu/drm/xe/display/i915_active_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_active_types.h
rename to drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_drv.h
rename to drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
diff --git a/drivers/gpu/drm/xe/display/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_vma.h
rename to drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
diff --git a/drivers/gpu/drm/xe/display/i915_vma_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_vma_types.h
rename to drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
diff --git a/drivers/gpu/drm/xe/display/intel_pm_types.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_pm_types.h
rename to drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
diff --git a/drivers/gpu/drm/xe/display/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_runtime_pm.h
rename to drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
diff --git a/drivers/gpu/drm/xe/display/intel_wakeref.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_wakeref.h
rename to drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
-- 
2.39.1

