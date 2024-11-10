Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5431D3C931
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 12:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751610E2D1;
	Sun, 10 Nov 2024 12:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLn2QZ1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F10D10E2D1
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731242021; x=1762778021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMDMD9PVojPqBmFS8GFKx07KbVXLZ6HEsdEeNsU8IfY=;
 b=iLn2QZ1YeY1VxMLBy9cE02Y5amxX2KKzONcDM+Zw3UYCZxhd8PGAVA79
 C7SOpwM/3HYcn5Wq/s5ilD3Yg0UDDAlsRil5IT8ZcGnXhXgUrhZqo7bRE
 PR7tpVDrdqFm/qKnUQE7jKMIi1EXnWOvrhhKxzIwLGG7CRFKwSPX8scM2
 mW8zHUrn8JS3WGingEc3gyhRuH3RdVHKjwRa2VKuj6VWxF39likZU861h
 ojFtgFie+uvDRrws1LlhcH2dzbZ/gcXD/8jAOcDRjbBfSAzkaSQ9iaaKJ
 j0CwfchhxQVXy2+gt/q8wfBMMGtfIPhMOiyUdcAbF6HBKzLotVv9Ua1x+ A==;
X-CSE-ConnectionGUID: 3bt81l/bRj+ohaEo14BQNg==
X-CSE-MsgGUID: z7VQoIP1RPKxi24a+T/8EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31286897"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="31286897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:41 -0800
X-CSE-ConnectionGUID: AuhOFF2WRKCXVvTaWzwd9Q==
X-CSE-MsgGUID: 8n1SPyUPSp2K6COISm+J/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="123996768"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:40 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v3 2/3] drm/xe: Manage MSI-X interrupts allocation
Date: Sun, 10 Nov 2024 14:33:27 +0200
Message-Id: <20241110123328.202229-3-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110123328.202229-1-ilia.levi@intel.com>
References: <20241110123328.202229-1-ilia.levi@intel.com>
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
 drivers/gpu/drm/xe/xe_irq_msix.c     | 90 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_irq_msix.h     |  5 ++
 3 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 159b0e25e2bb..989fcebdba45 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,6 +355,8 @@ struct xe_device {
 			u16 num_of_interrupts;
 			/** @irq.msix.default_msix: Default MSI-X vector */
 			u16 default_msix;
+			/** @irq.msix.indexes: used to allocate MSI-X indexes */
+			struct xarray indexes;
 		} msix;
 	} irq;
 
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
index dac339ba5ed2..f873bcfe5283 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.c
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -24,6 +24,7 @@ void xe_irq_msix_init(struct xe_device *xe, int nvec)
 	xe->irq.msix.enabled = true;
 	xe->irq.msix.num_of_interrupts = nvec;
 	xe->irq.msix.default_msix = DEFAULT_MSIX;
+	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 }
 
 static irqreturn_t guc2host_irq_handler(int irq, void *arg)
@@ -66,8 +67,32 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
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
+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.msix.num_of_interrupts - 1) :
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
@@ -76,17 +101,41 @@ static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
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
@@ -94,24 +143,25 @@ static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 		return;
 	}
 
-	free_irq(irq, xe);
+	free_irq(irq, irq_buf);
+	xe_irq_msix_release_vector(xe, msix);
 }
 
 int xe_irq_msix_request(struct xe_device *xe)
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
@@ -121,14 +171,20 @@ int xe_irq_msix_request(struct xe_device *xe)
 
 void xe_irq_msix_free(struct xe_device *xe)
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
 
 void xe_irq_msix_synchronize_irq(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned long msix;
+	u32 *dummy;
 
-	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
-	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+	xa_for_each(&xe->irq.msix.indexes, msix, dummy)
+		synchronize_irq(pci_irq_vector(pdev, msix));
 }
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
index 9c36d11f05fc..a9c8ce18172e 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.h
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -6,11 +6,16 @@
 #ifndef _XE_IRQ_MSIX_H_
 #define _XE_IRQ_MSIX_H_
 
+#include <linux/interrupt.h>
+
 struct xe_device;
 
 void xe_irq_msix_init(struct xe_device *xe, int nvec);
 void xe_irq_msix_free(struct xe_device *xe);
 int xe_irq_msix_request(struct xe_device *xe);
 void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+			    const char *name, bool dynamic_msix, u16 *msix);
+void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
 
 #endif
-- 
2.43.2

