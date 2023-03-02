Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6014C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7B210E05A;
	Thu,  2 Mar 2023 14:24:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B18A10E05A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767067; x=1709303067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8lxr09s0M7XebVmOCmqGM8BcpM2qWw1UMZBkIJqUwE=;
 b=A3CgSJDQ2dNHuHaR4zRi2K3cShKUG6TSl3rBO3QauIQBiS9bRum9QubE
 OQMT50rXAilZpD8eyvNslG8xT2jTU8jpWf8QIgec+GP55JaZQ5pK3P2/p
 0FnE9hvRb/0knAOn8dfRPtQ6dMHv9FQUkFE9wVBfp9driC6+zUY1KtZ/T
 82tTG3sBePsKT9zj5G6Ck87+x92yLIVX9H1Vpa3uV7tKzP+TCohK5LT74
 Wz+qXRerC9yo4FwPNjhawCv/vY1ZU1Sq1NaynIDN0B9iC9bPXpdi+k+wN
 qbDY7rp6mt3XllhEvUmtkdH2xFpFiISibXgvgrYs6Z1CF6n+lGxIfpwkK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397301559"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397301559"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086272"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086272"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:13:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:30 +0200
Message-Id: <20230302141230.2804699-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/8] drm/xe: drop top level i915 from include path
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

Add stub headers under compat-headers/ to be explicit about which
headers are needed from i915. These also act as a TODO list of what to
fix. Remove top level i915 from include path.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                           | 7 +++----
 drivers/gpu/drm/xe/compat-headers/i915_fixed.h        | 1 +
 drivers/gpu/drm/xe/compat-headers/i915_reg.h          | 1 +
 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h     | 1 +
 drivers/gpu/drm/xe/compat-headers/i915_utils.h        | 1 +
 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h | 1 +
 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h  | 1 +
 drivers/gpu/drm/xe/display/intel_display_core.h       | 2 ++
 drivers/gpu/drm/xe/regs/xe_reg_defs.h                 | 2 +-
 9 files changed, 12 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_fixed.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_utils.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_display_core.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 42a34597f16c..166f47324377 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,16 +101,15 @@ xe-y += xe_bb.o \
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
-	-I$(srctree)/$(src)/compat-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
-	-I$(srctree)/drivers/gpu/drm/i915/ \
 	-DBUILD_FOR_XE=1 \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
-# XXX: Needed for i915 register definitions. Will be removed after xe-regs.
-subdir-ccflags-y += -I$(srctree)/drivers/gpu/drm/i915/
+# XXX: Needed for #include "display/intel_display_core.h" in xe_device_types.h
+subdir-ccflags-y += \
+	-I$(srctree)/$(src)/compat-headers
 
 CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
diff --git a/drivers/gpu/drm/xe/compat-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
new file mode 100644
index 000000000000..e55fed3cbe9e
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
@@ -0,0 +1 @@
+#include "../../i915/i915_fixed.h"
diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
new file mode 100644
index 000000000000..36d863f4848b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
@@ -0,0 +1 @@
+#include "../../i915/i915_reg.h"
diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
new file mode 100644
index 000000000000..128a9a330c13
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
@@ -0,0 +1 @@
+#include "../../i915/i915_reg_defs.h"
diff --git a/drivers/gpu/drm/xe/compat-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
new file mode 100644
index 000000000000..a88a5196c79d
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
@@ -0,0 +1 @@
+#include "../../i915/i915_utils.h"
diff --git a/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
new file mode 100644
index 000000000000..f7c0585f277b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
@@ -0,0 +1 @@
+#include "../../i915/intel_mchbar_regs.h"
diff --git a/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
new file mode 100644
index 000000000000..741ef99dc0e4
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
@@ -0,0 +1 @@
+#include "../../i915/intel_pci_config.h"
diff --git a/drivers/gpu/drm/xe/display/intel_display_core.h b/drivers/gpu/drm/xe/display/intel_display_core.h
new file mode 100644
index 000000000000..5be8d246ee27
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_display_core.h
@@ -0,0 +1,2 @@
+/* FIXME: Remove once xe_device_types.h does not need this for CONFIG_DRM_XE_DISPLAY=n */
+#include "../../i915/display/intel_display_core.h"
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 5f6735697d9c..631cd6d1ffa6 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -6,6 +6,6 @@
 #ifndef _XE_REG_DEFS_H_
 #define _XE_REG_DEFS_H_
 
-#include "../../i915/i915_reg_defs.h"
+#include "compat-headers/i915_reg_defs.h"
 
 #endif
-- 
2.39.1

