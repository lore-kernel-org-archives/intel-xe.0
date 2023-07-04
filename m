Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A3EEB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B251310E1A9;
	Tue,  4 Jul 2023 15:02:52 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1291B10E1A9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688482970; x=1720018970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4dRDXhOYiV5XUbvxQVs0C/NJ4ilSCpLjTYFT8QKnd/g=;
 b=mUqJYuR0A9zCSft+pgTEkKiQOmdxbGcxrLqxxwGq84ZumpS3R4gA67OL
 I5tJPqnBeaaDj5+tTMDy4yY4BkH6PGIjKxqJRCWE6kdxlQHiXqBEpdIhz
 OpK4D0i9EWoaB7xVc4iQjPgfWmCUiCqMBUaKxGK4gFQcX/LlakQDDSJmh
 /JB2ogN5RC/3MdvQ339f70P6Ew1V1UrJPxQ8u/lulD9E5DZDnVIdZC8UO
 v3Pp90d/tLGEAhyofWaF1LMqW3/WcOzCpq5h3k8F8OfCjcYztJTPpupIN
 gFCuBm2skLB9jf5Y+kOufuFTLEQKrx/m19+9jE4Gnj3eRUWSR3MxxqHCC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="366621271"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="366621271"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832193489"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="832193489"
Received: from hlakyil-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.219.8])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:02:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 15:02:31 +0000
Message-Id: <20230704150231.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure the license is correctly identified using SPDX license
identifiers in compat header files.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h         | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h           | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h      | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h         | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h           | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h     | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h  | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h   | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h   | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h      | 5 +++++
 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h   | 5 +++++
 12 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
index e55fed3cbe9e..45e4f129eba5 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/i915_fixed.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
index 36d863f4848b..a15d1fd7b1a0 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/i915_reg.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
index 128a9a330c13..bc6332171df6 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/i915_reg_defs.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
index a88a5196c79d..e54b1a5ddd8b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/i915_utils.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c40bb27ac72a..973422c4cce1 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -1,3 +1,8 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #ifndef I915_VMA_H
 #define I915_VMA_H
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
index 99e7a2142a37..0ba42ed6912e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
@@ -1,3 +1,8 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include <linux/types.h>
 #include <linux/build_bug.h>
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
index 6e35e0bace9e..fec266fbd5e5 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/intel_clock_gating.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
index f7c0585f277b..306d30e5744d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/intel_mchbar_regs.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
index 741ef99dc0e4..9049a1ce1799 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/intel_pci_config.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
index 1a7a1224a750..a6e1e4f8b3f4 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
@@ -1,3 +1,8 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "intel_wakeref.h"
 
 enum i915_drm_suspend_mode {
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
index 678f22c36d42..d7f78aed8c69 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
@@ -1,3 +1,8 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include <linux/types.h>
 
 typedef bool intel_wakeref_t;
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
index 83166479ffb5..0bebf958c5cd 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
@@ -1 +1,6 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../i915/vlv_sideband_reg.h"
-- 
2.34.1

