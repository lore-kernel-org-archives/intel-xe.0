Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4107C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD7810E503;
	Tue,  8 Sep 2026 06:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fH8jkd1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB0B10E4F1;
 Tue,  8 Sep 2026 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849540; x=1820385540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tnim1a/TuVL1PeT2LUN4jrlxcxfuupsofnvSG3n35p8=;
 b=fH8jkd1kcAvXX5Ty1yhSkMVlRKjrYFr1ot11trG7Q29NJovYGX6NYegm
 qXwzVtBIpwtOwP8VCwU45Pya3UXTvisbptzikZenjRojkKIb90Wly3297
 f+wVM7oS8yPVFKqOcRhbZQ18Ufs8c2hlBnrFNhleVrnZmsXvkBJEmCRES
 +lwzyND6koL2tZMUEFAm8bNjytKG3/B544Sp+jbVfG12Z16zZzjXAcIWV
 5tHF7/OB8LJ3PWg+XdYw1z8V9CjQx06RKsIT/VQONxiVd5bV4wtMgIzMV
 zk6QjYfaGiooj/uhLIrJiW6c1SwRPZwfKM2Qn4h9FM//ZzpL97XaH6lyc w==;
X-CSE-ConnectionGUID: MqkwX2YbREKESeKOmE1vrg==
X-CSE-MsgGUID: ARUeqISzTL2Bl9VE4e4DNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061773"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:38:59 -0700
X-CSE-ConnectionGUID: /Y8OTZv3QIyu78i1Bg8eug==
X-CSE-MsgGUID: uiJLaxJWRSKe+7mxtB3NnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702404"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:38:57 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 01/12] drm/i915/dip: Add new file to handle Data Island
 Packet hardware
Date: Tue,  8 Sep 2026 11:52:12 +0530
Message-ID: <20260908062224.2897987-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add new files intel_dip.c, intel_dip.h, and intel_dip_regs.h to handle
low level hardware programming related to Data Island Packets.

Currently only programming of the Transmission Line for HDMI 2.1
Extended Metadata Packet (EMP) and DP Adaptive-Sync Secondary Data
Packet (SDP) is added (MMIO register EMP_AS_SDP_TL).

This will serve as a common place for DIP related code, which is currently
scattered across DP and HDMI files. A TODO has been added for extracting
the remaining DIP helpers.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_dip.c      | 39 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      | 38 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip_regs.h | 17 ++++++++
 drivers/gpu/drm/i915/display/intel_vrr.c      |  1 +
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |  6 ---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 7 files changed, 97 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a83fa8be0aba..d4e7764621e1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -349,6 +349,7 @@ i915-y += \
 	display/intel_cx0_phy.o \
 	display/intel_ddi.o \
 	display/intel_ddi_buf_trans.o \
+	display/intel_dip.o \
 	display/intel_display_device.o \
 	display/intel_display_trace.o \
 	display/intel_dkl_phy.o \
diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
new file mode 100644
index 000000000000..2e2bdb2b199c
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ */
+
+#include "intel_de.h"
+#include "intel_dip.h"
+#include "intel_dip_regs.h"
+#include "intel_display_types.h"
+
+u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 val;
+
+	if (!HAS_EMP_AS_SDP_TL(display))
+		return 0;
+
+	val = intel_de_read(display, EMP_AS_SDP_TL(display, cpu_transcoder));
+	return REG_FIELD_GET(EMP_AS_SDP_DB_TL_MASK, val);
+}
+
+void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if (!HAS_EMP_AS_SDP_TL(display))
+		return;
+	/*
+	 * Since currently we support VRR only for DP/eDP, so this is programmed
+	 * only for Adaptive Sync SDP to Vsync start.
+	 */
+	intel_de_write(display,
+		       EMP_AS_SDP_TL(display, cpu_transcoder),
+		       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
new file mode 100644
index 000000000000..25bae4a04d6b
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __INTEL_DIP_H__
+#define __INTEL_DIP_H__
+
+#include "intel_display_device.h"
+
+/*
+ * Video DIP (Data Island Packet) helpers.
+ *
+ * This file contains helpers for programming video DIP related hardware.
+ *
+ * TODO: Currently, this is only used for programming EMP_AS_SDP_TL i.e. to
+ * program Transmission Line for HDMI 2.1 Extended Metadata Packet (EMP) and
+ * DP Adaptive Sync (AS) Secondary Data Packet (SDP). However, all low level
+ * DIP buffer read/write and related helpers should be extracted here later.
+ */
+
+struct intel_crtc_state;
+
+/*
+ * EMP AS SDP TL: Extended Metadata Packet (EMP) Adaptive Sync (AS)
+ * Secondary Data Packet (SDP) Transmission Line (TL).
+ *
+ * Starting with BMG (display ver 14.01) and LNL+ (display ver 20+),
+ * the AS SDP transmission line is programmable via the EMP AS SDP TL
+ * register.
+ */
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || \
+					 DISPLAY_VER(__display) >= 20)
+
+u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
+void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
+
+#endif /* __INTEL_DIP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dip_regs.h b/drivers/gpu/drm/i915/display/intel_dip_regs.h
new file mode 100644
index 000000000000..85dcbf42e77d
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dip_regs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __INTEL_DIP_REGS_H__
+#define __INTEL_DIP_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* EMP (Extended Metadata Packet) AS (Adaptive Sync) SDP Transmission Line */
+#define _EMP_AS_SDP_TL_A			0x60204
+#define EMP_AS_SDP_TL(display, trans)		_MMIO_TRANS2((display), (trans), _EMP_AS_SDP_TL_A)
+#define   EMP_AS_SDP_DB_TL_MASK			REG_GENMASK(12, 0)
+#define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))
+
+#endif /* __INTEL_DIP_REGS_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e36db1174440..fd8b6f829cfe 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -17,6 +17,7 @@
 #include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
+#include "intel_dip_regs.h"
 #include "intel_display_limits.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
index 9d4d6573a149..ba8631cbc672 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -174,12 +174,6 @@
 #define   VRR_VSYNC_START_MASK			REG_GENMASK(12, 0)
 #define   VRR_VSYNC_START(vsync_start)		REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
 
-/* Common register for HDMI EMP and DP AS SDP */
-#define _EMP_AS_SDP_TL_A			0x60204
-#define EMP_AS_SDP_TL(display, trans)		_MMIO_TRANS2((display), (trans), _EMP_AS_SDP_TL_A)
-#define   EMP_AS_SDP_DB_TL_MASK			REG_GENMASK(12, 0)
-#define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))
-
 #define _TRANS_CMRR_M_LO_A			0x604F0
 #define TRANS_CMRR_M_LO(display, trans)		_MMIO_TRANS2((display), (trans), _TRANS_CMRR_M_LO_A)
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..ba4404896f2f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -259,6 +259,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi.o \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_de.o \
+	i915-display/intel_dip.o \
 	i915-display/intel_display.o \
 	i915-display/intel_display_conversion.o \
 	i915-display/intel_display_device.o \
-- 
2.50.1

