Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D16CDB47F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440DE10ED07;
	Tue, 23 Jun 2026 22:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LspmxkgO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A55410ECFC;
 Tue, 23 Jun 2026 22:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254832; x=1813790832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ZKvCxsZ/XEBuzk1gFWlmkd0KF7fMV+Idxl/yEQXWq4=;
 b=LspmxkgO4O6ZyrBlkyS1Wv+LzpTmn5jUKPuZYsbASz+sppkyMAbL9Kmh
 oO1/7y4eH43H0o3qMhZwW20Kqt/k66P8bh42f6b8HWsGvSCiGBqnNZMPS
 JkTiwf8btK54R8QITCJrOcOg6OnFB33Ur/oEkBaygF1MPAeoysx1G8Ybl
 +5CZ/3X4G8FoOtVDaeVb9djgRghYmxATODF1P2CdNdWEF/VhfciuO/CVE
 jLhpt+L1CybHhO2kfCoCEWpf5urWZ7HbrdUTOdKmS6AXbh55FG08zdzMk
 wWkm5dKYXUe8LNbPRuiYKwqJ5N74qN4C0wmnE2eIufOOIwZ8Pka6Cc+H/ A==;
X-CSE-ConnectionGUID: x3aGZsVYRRCGTRAuAKboog==
X-CSE-MsgGUID: f6XdWNJjSPWOQoWb1vnJpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775550"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:12 -0700
X-CSE-ConnectionGUID: 8RAKpCldTTmQVOhultltJg==
X-CSE-MsgGUID: psmxOTv3TuGE+w1dBQYSUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497090"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:09 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 03/30] drm/i915/dp_link_caps: Introduce DP link capability
 module
Date: Wed, 24 Jun 2026 00:45:52 +0200
Message-ID: <20260623224619.1949975-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

Start isolating the DP link capability logic from the generic DP code by
adding a separate intel_dp_link_caps module and a corresponding state
object.

Allocate the state so it can remain opaque within its module.

Follow-up changes will move link capability helpers and state from
intel_dp.c and intel_dp_link_training.c to the new module and state.

v2: Remove unnecessary function documentation. (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  9 ++++++
 .../gpu/drm/i915/display/intel_dp_link_caps.c | 30 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_caps.h | 12 ++++++++
 drivers/gpu/drm/xe/Makefile                   |  1 +
 6 files changed, 55 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_link_caps.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_link_caps.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1fd7a1a5f3158..c4de717505d73 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -356,6 +356,7 @@ i915-y += \
 	display/intel_dp_aux.o \
 	display/intel_dp_aux_backlight.o \
 	display/intel_dp_hdcp.o \
+	display/intel_dp_link_caps.o \
 	display/intel_dp_link_training.o \
 	display/intel_dp_mst.o \
 	display/intel_dp_test.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8c1af7b8ba270..2b32e8467e62c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -58,6 +58,7 @@ struct cec_notifier;
 struct drm_printer;
 struct intel_connector;
 struct intel_ddi_buf_trans;
+struct intel_dp_link_caps;
 struct intel_dp_link_training;
 struct intel_fbc;
 struct intel_global_objs_state;
@@ -1867,6 +1868,7 @@ struct intel_dp {
 		int force_lane_count;
 		int force_rate;
 		struct intel_dp_link_training *training;
+		struct intel_dp_link_caps *caps;
 	} link;
 	bool reset_link_params;
 	int mso_link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 00eb3f5103383..fa095c4db7fe6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -71,6 +71,7 @@
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_dp_hdcp.h"
+#include "intel_dp_link_caps.h"
 #include "intel_dp_link_training.h"
 #include "intel_dp_mst.h"
 #include "intel_dp_test.h"
@@ -7458,10 +7459,18 @@ int intel_dp_link_init(struct intel_dp *intel_dp)
 	if (!intel_dp->link.training)
 		return -ENOMEM;
 
+	intel_dp->link.caps = intel_dp_link_caps_init(intel_dp);
+	if (!intel_dp->link.caps) {
+		intel_dp_link_training_cleanup(intel_dp->link.training);
+
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
 void intel_dp_link_cleanup(struct intel_dp *intel_dp)
 {
+	intel_dp_link_caps_cleanup(intel_dp->link.caps);
 	intel_dp_link_training_cleanup(intel_dp->link.training);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
new file mode 100644
index 0000000000000..63989d97effd7
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/slab.h>
+
+#include "intel_dp_link_caps.h"
+
+struct intel_dp_link_caps {
+	struct intel_dp *dp;
+};
+
+struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *intel_dp)
+{
+	struct intel_dp_link_caps *link_caps;
+
+	link_caps = kzalloc_obj(*link_caps);
+	if (!link_caps)
+		return NULL;
+
+	link_caps->dp = intel_dp;
+
+	return link_caps;
+}
+
+void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
+{
+	kfree(link_caps);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
new file mode 100644
index 0000000000000..050b279463d6e
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2026 Intel Corporation */
+
+#ifndef __INTEL_DP_LINK_CAPS_H__
+#define __INTEL_DP_LINK_CAPS_H__
+
+struct intel_dp;
+
+struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *intel_dp);
+void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps);
+
+#endif /* __INTEL_DP_LINK_CAPS_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e7b146880f46..e5a04253e73bf 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -278,6 +278,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_dp_aux.o \
 	i915-display/intel_dp_aux_backlight.o \
 	i915-display/intel_dp_hdcp.o \
+	i915-display/intel_dp_link_caps.o \
 	i915-display/intel_dp_link_training.o \
 	i915-display/intel_dp_mst.o \
 	i915-display/intel_dp_test.o \
-- 
2.45.2

