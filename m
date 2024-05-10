Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED06C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D242D10E396;
	Fri, 10 May 2024 21:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miroGoGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2910E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374804; x=1746910804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Ng0PcVrnFqdbis2oIOzJFEXWQAwPZlzsry3oicHtvg=;
 b=miroGoGpl2LW7DdubXQvAwQd1cllVic0dpAvoSkDdHu4phhtxzN25y3o
 mDpG/6ElAxkgvNb65QF9pp2zH47R8nNzQRR7/gPkE0LjcpA+NZ4vHu/tL
 uluSDT0WQiuZgKN1ZYBGkOcAEOJpVRYfxtNBp71xINVf8QzLLfcfEgJDk
 JNdadX/b4/lAcE79QmLZVC4X860gWb/GAH2LtbvLpn4FYZnDRyAF3N49J
 P7j5o9KSXHFZStEccBncI2RlIIM/kkXleNm5bgZDrT7eDoVis/zzT0h8U
 d8pHqfRl/fLUYPQrUlnd05+DXvHY55TYftZJqqjEyuIMverKnERPUjGu0 g==;
X-CSE-ConnectionGUID: 22qLa63uQAGutUs8+A73TQ==
X-CSE-MsgGUID: +EURVUOgRXC9uD+2Lxy0RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048286"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:04 -0700
X-CSE-ConnectionGUID: gYaZH3pETRiKn/YW+Y3gkg==
X-CSE-MsgGUID: x2foqt3mT2+cEkO/tqi2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604049"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com
Subject: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
Date: Fri, 10 May 2024 16:59:33 -0400
Message-ID: <20240510205948.904409-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510205948.904409-1-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
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

From: "David E. Box" <david.e.box@linux.intel.com>

Some drivers outside of PDX86 need access to the vsec header. Move it to
include/linux to make it easier to include.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core_ssram.c                  | 2 +-
 drivers/platform/x86/intel/pmt/class.c                       | 2 +-
 drivers/platform/x86/intel/pmt/class.h                       | 2 +-
 drivers/platform/x86/intel/pmt/crashlog.c                    | 2 +-
 drivers/platform/x86/intel/pmt/telemetry.c                   | 2 +-
 drivers/platform/x86/intel/sdsi.c                            | 3 +--
 drivers/platform/x86/intel/tpmi.c                            | 3 +--
 drivers/platform/x86/intel/vsec.c                            | 5 ++---
 .../platform/x86/intel/vsec.h => include/linux/intel_vsec.h  | 4 ++--
 9 files changed, 11 insertions(+), 14 deletions(-)
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (98%)

diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 1bde86c54eb9..baddaaec25ee 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -9,11 +9,11 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/intel_vsec.h>
 #include <linux/pci.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "core.h"
-#include "../vsec.h"
 #include "../pmt/telemetry.h"
 
 #define SSRAM_HDR_SIZE		0x100
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 4b53940a64e2..d7939b28e937 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -9,12 +9,12 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 #define PMT_XA_START		1
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index d23c63b73ab7..d6f9ccaf28c8 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -2,13 +2,13 @@
 #ifndef _INTEL_PMT_CLASS_H
 #define _INTEL_PMT_CLASS_H
 
+#include <linux/intel_vsec.h>
 #include <linux/xarray.h>
 #include <linux/types.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/io.h>
 
-#include "../vsec.h"
 #include "telemetry.h"
 
 /* PMT access types */
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 4014c02cafdb..9079d5dffc03 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -16,7 +17,6 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 /* Crashlog discovery header types */
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 09258564dfc4..3478f891ea0b 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -16,7 +17,6 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 #define TELEM_SIZE_OFFSET	0x0
diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
index 556e7c6dbb05..322ada188ee9 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/intel_vsec.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -21,8 +22,6 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
-#include "vsec.h"
-
 #define ACCESS_TYPE_BARID		2
 #define ACCESS_TYPE_LOCAL		3
 
diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 910df7c654f4..be7ea557b72d 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -51,6 +51,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -59,8 +60,6 @@
 #include <linux/sizes.h>
 #include <linux/string_helpers.h>
 
-#include "vsec.h"
-
 /**
  * struct intel_tpmi_pfs_entry - TPMI PM Feature Structure (PFS) entry
  * @tpmi_id:	TPMI feature identifier (what the feature is and its data format).
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 0fdfaf3a4f5c..5a1e964783cc 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -17,14 +17,13 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
-#include <linux/kernel.h>
 #include <linux/idr.h>
+#include <linux/intel_vsec.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/types.h>
 
-#include "vsec.h"
-
 #define PMT_XA_START			0
 #define PMT_XA_MAX			INT_MAX
 #define PMT_XA_LIMIT			XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
diff --git a/drivers/platform/x86/intel/vsec.h b/include/linux/intel_vsec.h
similarity index 98%
rename from drivers/platform/x86/intel/vsec.h
rename to include/linux/intel_vsec.h
index e23e76129691..7f19a3d90abe 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/include/linux/intel_vsec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _VSEC_H
-#define _VSEC_H
+#ifndef _INTEL_VSEC_H
+#define _INTEL_VSEC_H
 
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
-- 
2.44.0

