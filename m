Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72381EC1E82
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204D610E83D;
	Thu,  5 Feb 2026 09:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWDLgxQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AB310E837;
 Thu,  5 Feb 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283701; x=1801819701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zh09468r5OOxEzNchLv0cxs5d1KJLEs1NHI9D3XfHSc=;
 b=FWDLgxQ9PPYJxDsK7Atl+chyWj4PtXP3T1oZE3dn6/42PorsdJFWWtdq
 3vBwR7Ib9v+LbBExJuk+ZJseTeZYppvcc05kokU0ynQ2bzVi0S3Y0mKol
 lhkIaAWfZmhkzN/rPegHxdmRuFw3POgGis4yxqbLbGNVHSd6LncWgKnhE
 bQfK/z21nRzUFFr5Okd/ZKU5gTAADs8Gx9Rj/KaoVOICtSq8iX/mUdeqd
 naZgzIdqHKZv8d/3gl6GUCfC/MEBiTfzO0FjaLOvgqGaJvmv4mMhTHFtY
 cXJXlUkRTJwvUpv2JT/t6aTs3565EfgufPtB4RTFjOXFp00yzI0ztPHYP A==;
X-CSE-ConnectionGUID: Yu5lHkbPQSKHThlt7uYq+g==
X-CSE-MsgGUID: P/8KgMYkSSmgTbPjZtkC7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060127"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:21 -0800
X-CSE-ConnectionGUID: A6//Dw52Q8KE8O1pWrllkA==
X-CSE-MsgGUID: jfE2NyGjRTyqsN5VDNrobg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807795"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:28:19 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 13/20] drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
Date: Thu,  5 Feb 2026 15:13:34 +0530
Message-ID: <20260205094341.1882816-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260205094341.1882816-1-uma.shankar@intel.com>
References: <20260205094341.1882816-1-uma.shankar@intel.com>
MIME-Version: 1.0
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

Move TRANS_CHICKEN1 reg to display header to make g4x_hdmi.c
free from i915_reg.h dependency.

v2: Remove from common header in include and use display_regs.h (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_hdmi.c           |  1 -
 drivers/gpu/drm/i915/display/intel_display_regs.h | 12 ++++++++++++
 drivers/gpu/drm/i915/i915_reg.h                   | 12 ------------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index 8b22447e8e23..5fe5067c4237 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -8,7 +8,6 @@
 #include <drm/drm_print.h>
 
 #include "g4x_hdmi.h"
-#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_connector.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 9f241655aa99..d4c5fd975b1b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2144,6 +2144,18 @@
 #define  TRANS_BPC_6			REG_FIELD_PREP(TRANS_BPC_MASK, 2)
 #define  TRANS_BPC_12			REG_FIELD_PREP(TRANS_BPC_MASK, 3)
 
+/* Icelake PPS_DATA and _ECC DIP Registers.
+ * These are available for transcoders B,C and eDP.
+ * Adding the _A so as to reuse the _MMIO_TRANS2
+ * definition, with which it offsets to the right location.
+ */
+
+#define _TRANSA_CHICKEN1	 0xf0060
+#define _TRANSB_CHICKEN1	 0xf1060
+#define TRANS_CHICKEN1(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN1, _TRANSB_CHICKEN1)
+#define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
+#define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
+
 #define _TRANSA_CHICKEN2	0xf0064
 #define _TRANSB_CHICKEN2	0xf1064
 #define TRANS_CHICKEN2(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN2, _TRANSB_CHICKEN2)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2bac216bd2b9..2c279bd3342d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -836,18 +836,6 @@
 #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
 
 
-/* Icelake PPS_DATA and _ECC DIP Registers.
- * These are available for transcoders B,C and eDP.
- * Adding the _A so as to reuse the _MMIO_TRANS2
- * definition, with which it offsets to the right location.
- */
-
-#define _TRANSA_CHICKEN1	 0xf0060
-#define _TRANSB_CHICKEN1	 0xf1060
-#define TRANS_CHICKEN1(pipe)	_MMIO_PIPE(pipe, _TRANSA_CHICKEN1, _TRANSB_CHICKEN1)
-#define   TRANS_CHICKEN1_HDMIUNIT_GC_DISABLE	REG_BIT(10)
-#define   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE	REG_BIT(4)
-
 #define  VLV_PMWGICZ				_MMIO(0x1300a4)
 
 #define  HSW_EDRAM_CAP				_MMIO(0x120010)
-- 
2.50.1

