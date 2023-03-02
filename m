Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2DEC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53610E118;
	Thu,  2 Mar 2023 14:24:13 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53FD10E501
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767050; x=1709303050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/cKp0jU8lv+ePANSK8Z0grWsqPcKuX5AbgJNMoOjGoQ=;
 b=cFPwO1Ajdv3/URzttQVRlSl4uJwrFZEmkz6KMiYK2EEZq66Y6lkHRUcn
 tM56j76iNn4jTMFgmJUMivp0BQ8gbsrOdRXMLapjZQeHkzdZETfn4uPgw
 cyxIktXo0PIfjSG3EjE9s4aJP2pO59HA82/fakmjFyflaarr1n+n8vm9f
 5f0NOCnlLF0D6mqy8vxmsu7cjA6mJK1OCOZeE6cFZbzInQTsLhbSp83Sy
 KsHsUltKlAip8q56CVr8qG5ojV6+cD1wqYQTQ/C5tlSd58nRWGoEMWAbe
 aCix4GIWeFCEMv31WCXTlDQwGf40CDsnHPqT6w4WcRwrLoetG055wHljy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397301412"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397301412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086252"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086252"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:28 +0200
Message-Id: <20230302141230.2804699-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/8] drm/xe: move all top level i915 compat
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

Be more explicit about which headers override i915 top level headers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                                 | 6 ++++--
 .../drm/xe/{display => compat-headers}/i915_active_types.h  | 0
 drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h   | 0
 drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h   | 0
 .../gpu/drm/xe/{display => compat-headers}/i915_vma_types.h | 0
 .../gpu/drm/xe/{display => compat-headers}/intel_pm_types.h | 0
 .../drm/xe/{display => compat-headers}/intel_runtime_pm.h   | 0
 .../gpu/drm/xe/{display => compat-headers}/intel_wakeref.h  | 0
 8 files changed, 4 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_active_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_pm_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_runtime_pm.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_wakeref.h (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 18257cd7227d..42a34597f16c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -99,7 +99,9 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 # i915 Display compat #defines and #includes
-subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
+subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
+	-I$(srctree)/$(src)/display/ext \
+	-I$(srctree)/$(src)/compat-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/ \
@@ -220,7 +222,7 @@ obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
 ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
-	skipdisplay:=-not -path display/\* -not -path xe_display.h
+	skipdisplay:=-not -path display/\* -not -path compat-headers/\* -not -path xe_display.h
 endif
 
 # header test
diff --git a/drivers/gpu/drm/xe/display/i915_active_types.h b/drivers/gpu/drm/xe/compat-headers/i915_active_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_active_types.h
rename to drivers/gpu/drm/xe/compat-headers/i915_active_types.h
diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/compat-headers/i915_drv.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_drv.h
rename to drivers/gpu/drm/xe/compat-headers/i915_drv.h
diff --git a/drivers/gpu/drm/xe/display/i915_vma.h b/drivers/gpu/drm/xe/compat-headers/i915_vma.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_vma.h
rename to drivers/gpu/drm/xe/compat-headers/i915_vma.h
diff --git a/drivers/gpu/drm/xe/display/i915_vma_types.h b/drivers/gpu/drm/xe/compat-headers/i915_vma_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/i915_vma_types.h
rename to drivers/gpu/drm/xe/compat-headers/i915_vma_types.h
diff --git a/drivers/gpu/drm/xe/display/intel_pm_types.h b/drivers/gpu/drm/xe/compat-headers/intel_pm_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_pm_types.h
rename to drivers/gpu/drm/xe/compat-headers/intel_pm_types.h
diff --git a/drivers/gpu/drm/xe/display/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-headers/intel_runtime_pm.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_runtime_pm.h
rename to drivers/gpu/drm/xe/compat-headers/intel_runtime_pm.h
diff --git a/drivers/gpu/drm/xe/display/intel_wakeref.h b/drivers/gpu/drm/xe/compat-headers/intel_wakeref.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_wakeref.h
rename to drivers/gpu/drm/xe/compat-headers/intel_wakeref.h
-- 
2.39.1

