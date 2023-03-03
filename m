Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A69C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330010E07E;
	Fri,  3 Mar 2023 10:53:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D77D10E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840805; x=1709376805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EXAjdKNTqpbqy/RbtT9ATy0PFj2omGQfiN3hnCgj2Hk=;
 b=lTelhN1S5VGksKmRbC477g5kERK/mn1TacdAZg6QQS7i1HuBZ4H6Xhlf
 MU3XeUP4GSs0Bbgeh112m1IpCfSO8Ib0DKmUjLv3XMSEita9SfT6OCM91
 TXz6hI5yzKgvampTlnnMxCfZo+plkrdNn7uDSeJu8YoCK9YqGXRLtsDA2
 KWO/THoGMr2dgqKo73CgTptYMf2NOnsKwpT23atDx42KGoC8EQKj943AH
 LeDL+Yz2bK90Jxp8KedkduFew6i5IQxpJFFvk9nHZGaJphXoo6GI9nZ4k
 Z5ZWHo/d3L0D7K7YMHdUSNPGWObyf5bF85bOUKtwPi6l9sF0KZ5difj5v Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288290"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288290"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799191978"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="799191978"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:53:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:22 +0200
Message-Id: <20230303105222.3550161-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/8] drm/xe: drop top level i915 from include
 path
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

Add stub headers under compat-i915-headers/ to be explicit about which
headers are needed from i915. These also act as a TODO list of what to
fix. Remove top level i915 from include path.

Since xe_reg_defs.h needs i915_reg_defs.h also for
CONFIG_DRM_XE_DISPLAY=n, include it via the relative include.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                                | 1 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h        | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h          | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h     | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h        | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h  | 1 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h                      | 2 +-
 8 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f9e18e5d6ea6..b94e65c91101 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,7 +101,6 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/compat-i915-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
-	-I$(srctree)/drivers/gpu/drm/i915/ \
 	-DBUILD_FOR_XE=1 \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
new file mode 100644
index 000000000000..e55fed3cbe9e
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
@@ -0,0 +1 @@
+#include "../../i915/i915_fixed.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
new file mode 100644
index 000000000000..36d863f4848b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
@@ -0,0 +1 @@
+#include "../../i915/i915_reg.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
new file mode 100644
index 000000000000..128a9a330c13
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
@@ -0,0 +1 @@
+#include "../../i915/i915_reg_defs.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
new file mode 100644
index 000000000000..a88a5196c79d
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
@@ -0,0 +1 @@
+#include "../../i915/i915_utils.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
new file mode 100644
index 000000000000..f7c0585f277b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
@@ -0,0 +1 @@
+#include "../../i915/intel_mchbar_regs.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
new file mode 100644
index 000000000000..741ef99dc0e4
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
@@ -0,0 +1 @@
+#include "../../i915/intel_pci_config.h"
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 5f6735697d9c..b5c25e31b889 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -6,6 +6,6 @@
 #ifndef _XE_REG_DEFS_H_
 #define _XE_REG_DEFS_H_
 
-#include "../../i915/i915_reg_defs.h"
+#include "compat-i915-headers/i915_reg_defs.h"
 
 #endif
-- 
2.39.1

