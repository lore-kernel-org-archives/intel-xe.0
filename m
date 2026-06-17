Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B7ACD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 10:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA510EFA8;
	Wed, 17 Jun 2026 10:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhM6Gw59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7B310EFA8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693442; x=1813229442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOWYMFS/7MqTC0Ygk/s3gzGwgA3/7OxqlziAbLzIbHo=;
 b=ZhM6Gw59L5VK3gIrtjUHTAW432oJlg71bsGfbEr3mdHfQ9JesqEDqVf5
 IOyXcE6sycNQMJJ8Lmaap8b8qJjqG9pk33Wkq98gwzLRayk+jN6rzIAKt
 EDXNcldRL2ekqzs8vyZ5TFvoETuTWzHbbowYNbVhguSTWdSbAuDM3j7S1
 s66BOWe7U+HBVu4RVIH0kCP+8geVGyP+DbMKmBCBRqCVDU8nu7iyiNzah
 KJW8mVZcI9E4kzkKsldPH44DvAkK1UbAzpZTJ6MhpIlM9SCsuNvzCnXkE
 dbZon14YSrKnAWYyRNA2FeebUH4I6NaGrwOsKaQTswVMrcqSJx0nbOETj Q==;
X-CSE-ConnectionGUID: THAfB0I9Q3OqBewEc59O6w==
X-CSE-MsgGUID: ZJu7rUSfRIWGoIsYIl30eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82677386"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82677386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:50:42 -0700
X-CSE-ConnectionGUID: y0+G8eozQs2BWluOFagGwA==
X-CSE-MsgGUID: Fzc+VGeKTAWcqqXqa8iJzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248099619"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 03:50:39 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v3 1/3] drm/xe: Add error Signature IDs for RAS logging
Date: Wed, 17 Jun 2026 16:17:13 +0530
Message-ID: <20260617104711.79646-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
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

Every GPU fault needs a stable numeric label so monitoring tools can
identify what went wrong without parsing log text. Add xe_sig_ids.h
which defines those labels, called SIG_IDs.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Add HW SIG IDS details. (Riana)
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
2.34.1

