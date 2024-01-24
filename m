Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12108C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 09:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2C310E988;
	Wed, 24 Jan 2024 09:05:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9910E988
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706087133; x=1737623133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7qis36dGCXVQs0t5af1sepSYrOi3N+Kfwx79TKzTfEU=;
 b=aGO+GHYRd3k7htpDzreSXDJIBoblGJ2cddvZR6HNq/TORiSOBQMszAZw
 u6nEJj6zs5KQni+kS0ae5MwbbSel7AuMaMXXhWROwWoSsaWVjWyGHwoEG
 fLmvWz1gOSxvFgzZITWhRR0jL+LrCrghP8y/f5BBHK63V1iS7Mij3PwGO
 0Yf8EB9ptPktLj09frMWOuuhY4rcdVpX3NhZgorg6EMdDgOtOfM93LLh7
 xPDZT7MZY6Sc92w3/RJemiF3jGes3+pSzT675xi3qOGglXwq1zF4ooSDU
 UG5K0gz4FLmr/XXcFvy1NpVSgvYb8wDLP43SBjwFSoj1ADTeXpQf1ofDb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="683797"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="683797"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959441184"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959441184"
Received: from komalav-mobl2.gar.corp.intel.com (HELO localhost)
 ([10.252.41.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:05:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
Date: Wed, 24 Jan 2024 11:05:15 +0200
Message-Id: <20240124090515.3363901-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Randy Dunlap <rdunlap@infradead.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If we unconditionally build the debugfs files, we'll get both the static
inline stubs from the headers and the real functions for
CONFIG_DEBUG_FS=n. Avoid building the debugfs files with that config.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/r/152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index fe8b266a9819..abb2be8268d0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -222,8 +222,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi.o \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_display.o \
-	i915-display/intel_display_debugfs.o \
-	i915-display/intel_display_debugfs_params.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
 	i915-display/intel_display_irq.o \
@@ -267,7 +265,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_modeset_setup.o \
 	i915-display/intel_modeset_verify.o \
 	i915-display/intel_panel.o \
-	i915-display/intel_pipe_crc.o \
 	i915-display/intel_pmdemand.o \
 	i915-display/intel_pps.o \
 	i915-display/intel_psr.o \
@@ -294,6 +291,13 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
 endif
 
+ifeq ($(CONFIG_DEBUG_FS),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += \
+		i915-display/intel_display_debugfs.o \
+		i915-display/intel_display_debugfs_params.o \
+		i915-display/intel_pipe_crc.o
+endif
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
-- 
2.39.2

