Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089DFD69106
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 12:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF1B10E47B;
	Thu, 28 Nov 2024 12:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGIEicqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929E510E47B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732798452; x=1764334452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TrVtSOr+igjZNGzHZt2RQgRRsH6z7/SPyypwFhnEYbI=;
 b=TGIEicqULtzd7aFSJ1rT4CJSZZkouNG8AlrZ7tblWpWqDZJ3j5UaKUrz
 RMofilBBn2dnhg+H5Y1rP7ynqYQVhmYak1l3fAWisS9uHd7VM4la3n70v
 YajF/ojjj7b8lTP8LBsqriPgruidkyy2IEeqBpc+XHVm5M5lNyUg9pfrW
 5eyp+v3nWknN8NP36mNRixyfTOBKjAUMsucu3Pyf/0rfqSL0lbExzVBBx
 g07T8Zsxx6w590sH7yimiHy3DqCbZ6htVLTKO9wr0d8Mq98+TuIbE9mfY
 p6c7HyELFpgH1rlHHDQRx6d3Jzhsa1hpUoEni5TCIXA89vkn4gYFnsiky w==;
X-CSE-ConnectionGUID: KgSdM9AmRHihdapjrJxq7g==
X-CSE-MsgGUID: SUnr1C+mQhqU35NHZjG7Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43698660"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="43698660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:54:04 -0800
X-CSE-ConnectionGUID: miL+IEqBS+SVgbFWWVn9uw==
X-CSE-MsgGUID: uW7+gYBOQamqpSkqgihRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="93069862"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:54:02 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v5 4/5] drm/xe/irq: Manage MSI-X interrupts allocation
Date: Thu, 28 Nov 2024 14:53:44 +0200
Message-Id: <20241128125345.1115-5-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128125345.1115-1-ilia.levi@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
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

Expose functions to request and free MSI-X interrupts.

The request has two flavors:
- Static MSI-X allocation, for known MSI-X interrupts (e.g. GuC-to-host)
- Dynamic MSI-X allocation, which uses the next available MSI-X interrupt

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq.c          | 96 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.h          |  5 ++
 3 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ed638067aa26..1a3ded5a97c1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -353,6 +353,8 @@ struct xe_device {
 		struct {
 			/** @irq.msix.nvec: number of MSI-X interrupts */
 			u16 nvec;
+			/** @irq.msix.indexes: used to allocate MSI-X indexes */
+			struct xarray indexes;
 		} msix;
 	} irq;
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b8a0b9bbf24c..32f5a67a917b 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -830,6 +830,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
 	}
 
 	xe->irq.msix.nvec = nvec;
+	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 	return 0;
 }
 
@@ -879,8 +880,32 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
-				   const char *name, u16 msix)
+static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
+				    bool dynamic_msix, u16 *msix)
+{
+	struct xa_limit limit;
+	int ret;
+	u32 id;
+
+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.msix.nvec - 1) :
+				 XA_LIMIT(*msix, *msix);
+	ret = xa_alloc(&xe->irq.msix.indexes, &id, irq_buf, limit, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	if (dynamic_msix)
+		*msix = id;
+
+	return 0;
+}
+
+static void xe_irq_msix_release_vector(struct xe_device *xe, u16 msix)
+{
+	xa_erase(&xe->irq.msix.indexes, msix);
+}
+
+static int xe_irq_msix_request_irq_internal(struct xe_device *xe, irq_handler_t handler,
+					    void *irq_buf, const char *name, u16 msix)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int ret, irq;
@@ -889,17 +914,41 @@ static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
 	if (irq < 0)
 		return irq;
 
-	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+	ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+			    const char *name, bool dynamic_msix, u16 *msix)
+{
+	int ret;
+
+	ret = xe_irq_msix_alloc_vector(xe, irq_buf, dynamic_msix, msix);
+	if (ret)
+		return ret;
+
+	ret = xe_irq_msix_request_irq_internal(xe, handler, irq_buf, name, *msix);
+	if (ret) {
+		drm_err(&xe->drm, "Failed to request IRQ for MSI-X %u\n", *msix);
+		xe_irq_msix_release_vector(xe, *msix);
+		return ret;
+	}
+
+	return 0;
+}
+
+void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int irq;
+	void *irq_buf;
+
+	irq_buf = xa_load(&xe->irq.msix.indexes, msix);
+	if (!irq_buf)
+		return;
 
 	irq = pci_irq_vector(pdev, msix);
 	if (irq < 0) {
@@ -907,24 +956,25 @@ static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 		return;
 	}
 
-	free_irq(irq, xe);
+	free_irq(irq, irq_buf);
+	xe_irq_msix_release_vector(xe, msix);
 }
 
-static int xe_irq_msix_request_irqs(struct xe_device *xe)
+int xe_irq_msix_request_irqs(struct xe_device *xe)
 {
 	int err;
+	u16 msix;
 
-	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
-				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
-	if (err) {
-		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
+	msix = GUC2HOST_MSIX;
+	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
+				      DRIVER_NAME "-guc2host", false, &msix);
+	if (err)
 		return err;
-	}
 
-	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
-				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
+	msix = DEFAULT_MSIX;
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler, xe,
+				      DRIVER_NAME "-default-msix", false, &msix);
 	if (err) {
-		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
 		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
 		return err;
 	}
@@ -932,16 +982,22 @@ static int xe_irq_msix_request_irqs(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_irq_msix_free(struct xe_device *xe)
+void xe_irq_msix_free(struct xe_device *xe)
 {
-	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
-	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+	unsigned long msix;
+	u32 *dummy;
+
+	xa_for_each(&xe->irq.msix.indexes, msix, dummy)
+		xe_irq_msix_free_irq(xe, msix);
+	xa_destroy(&xe->irq.msix.indexes);
 }
 
-static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+void xe_irq_msix_synchronize_irq(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned long msix;
+	u32 *dummy;
 
-	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
-	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+	xa_for_each(&xe->irq.msix.indexes, msix, dummy)
+		synchronize_irq(pci_irq_vector(pdev, msix));
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 24ff16111b96..a28bd577ba52 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -6,6 +6,8 @@
 #ifndef _XE_IRQ_H_
 #define _XE_IRQ_H_
 
+#include <linux/interrupt.h>
+
 #define XE_IRQ_DEFAULT_MSIX 1
 
 struct xe_device;
@@ -17,5 +19,8 @@ int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
+int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+			    const char *name, bool dynamic_msix, u16 *msix);
+void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
 
 #endif
-- 
2.43.2

