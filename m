Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22AEC5DF6A
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ED510F6CD;
	Fri, 14 Aug 2026 17:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBVkaIEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9FC10F6D0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727919; x=1818263919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TazTvjZx3H/AT3qevr+t1DDSnzmBC19mpSZTWbds+80=;
 b=IBVkaIEtbvdumyPtS7Xamz6vhko7RFMKcmoXAVrvZSbW0gRQi4PlNir3
 Der9n0JWFm8/saiTN5pCE9uutI5xwTUThrnUQH8rX9Ecv9wkfhtpsU/Jl
 Lslgpm3ho4piYcVDSPxICqXfREy/lQ1408KuM0yN6caVsp0RwJtdfU9JW
 /Gv7pGyNXvkXCmgxpSQqXrZdcmEtNKHFFn5cYoOjS6AUDUtctLuQNAkW1
 A39QLq/HfcXImap6J9B6ul8a3jmS7e3hqM3ALzQzbGx4b1s7kuatcYdES
 aPOJaj1SiW7DfmbULzeVUWI5QL+1bxyQ6JQ2PLRv7w0kJg2KIS6qQtCUw Q==;
X-CSE-ConnectionGUID: z0h05P9oSs2o8IJmHlz8LA==
X-CSE-MsgGUID: gPL/OBVuR5SvJTXeXFonnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464041"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:39 -0700
X-CSE-ConnectionGUID: XIwYY7HBTiqNIG1/9l2YTw==
X-CSE-MsgGUID: MrJTJZ2QSnOCLuBnWsuudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946177"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 12/33] drm/xe/log: Add hardware error signatures
Date: Fri, 14 Aug 2026 19:17:38 +0200
Message-ID: <20260814171801.13347-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Extend our error signatures definitions xe_sigid to cover also
firmware/hardware-originated errors and make them distinguishable
from initially defined software-initiated errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Yoni Levitt <yoni.levitt@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: update comment (Sashiko)
v3: rebased
---
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
index ff7c97b4a78e..2f3440505f69 100644
--- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -137,12 +137,18 @@
  * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
  * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
  * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
+ * @XE_SIGID_HW: Generic hardware failure.
+ * @XE_SIGID_PCIE: PCIe interface errors.
+ * @XE_SIGID_DEVICE_MEMORY: Device memory errors.
+ * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
+ * @XE_SIGID_FABRIC: Fabric errors.
+ * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
  *
  * Each SIGID represents the report sites the driver detects and reports.
  * Values are numbered sequentially, are only ever appended, and are never
  * renumbered or reused.
  *
- * Firmware- and hardware-originated signatures are not listed yet here.
+ * Firmware- and hardware-originated signatures are numbered separately.
  */
 enum xe_sigid {
 	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
@@ -154,6 +160,13 @@ enum xe_sigid {
 	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
 	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
 	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+
+	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
+	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
+	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
+	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
+	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
+	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
 };
 
 #endif
-- 
2.47.1

