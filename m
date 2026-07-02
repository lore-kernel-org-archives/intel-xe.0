Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBFC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348010F2CD;
	Thu,  2 Jul 2026 11:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+Dfp1Tb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1410F2CD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990172; x=1814526172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fc8J3KMheTdy5i+0KCbyrXVybls4Dcz6Lh251dfbqXE=;
 b=O+Dfp1Tb/un0gGHK5sSmwX+TX67WEFxklbAYE8LwecrftTDyScDFzA6A
 42z0HCXondRWyzmM7a/0VA8vIcuDHCKE9JTh57GBGG9yZNjBWnaK3TV0x
 SVCBWSZt+WOMDyh9dh6iDsGdHdSqWDkhBScIlaB7HyMZEQq9imvJdKZVU
 TVgDnXowtBnYXsZwTNG3mzjtv/gzKgVwP5Hh/KT2NkGpfC8hTMwh9jEf2
 oGaYvwphHDvq+/wEbgoRfUfc5BuXEY3AdzFPz2AUSyyYjc2B+hC6+8ijP
 qJo6j3p5BOT6YCPmNBdlPbLMOt9HLzR0wqOn7BIdTUD1SaqEARPIF4BUX w==;
X-CSE-ConnectionGUID: XarS0RLPTYO8hPggsEVZZw==
X-CSE-MsgGUID: 2YSZVktZTVy23AJ40hq/tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852876"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:52 -0700
X-CSE-ConnectionGUID: RqekusLrRYKBpQI43UMEYA==
X-CSE-MsgGUID: RPUc/+p5SOe/tNxrXVmVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738706"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 1/7] drm/xe: Add error Signature IDs for RAS logging
Date: Thu,  2 Jul 2026 16:44:03 +0530
Message-ID: <20260702111401.3680214-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Every GPU fault needs a stable numeric label so monitoring tools can
identify what went wrong without parsing log text. Add xe_sig_ids.h
which defines those labels, called SIG_IDs.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_sig_ids.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
new file mode 100644
index 000000000000..7badd0d7ad72
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sig_ids.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SIG_IDS_H_
+#define _XE_SIG_IDS_H_
+
+/*
+ * Driver SIG_IDs
+ */
+#define XE_SIG_PROBE			1  /* FATAL: probe failed */
+#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
+#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
+#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
+#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
+#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
+#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
+
+/*
+ * HW SIG_IDs
+ */
+#define XE_SIG_HW_DEVICE_MEMORY		8  /* Device memory errors (e.g. ECC) */
+#define XE_SIG_HW_CORE_COMPUTE		9  /* Compute/shader core errors */
+#define XE_SIG_HW_PCIE			10 /* PCIe interface errors */
+#define XE_SIG_HW_FABRIC		11 /* On-package fabric errors */
+#define XE_SIG_HW_SOC_INTERNAL		12 /* SoC-internal errors */
+
+#endif /* _XE_SIG_IDS_H_ */
-- 
2.54.0

