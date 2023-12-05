Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170CCC07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 13:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EB210E52D;
	Tue,  5 Dec 2023 13:40:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA09710E52D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701783602; x=1733319602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HfbzPqDcJvqjYlMCB6enhBwBoTtabZaUwS+u7JiXkqs=;
 b=gjMLtw/jO3sp3s3JhTHm7L6Qfjn0Ir/ErE88o8JE8RD06YtmDxrFqlFb
 q57RJDRfkUv5Wzhq3/QcXOqBL/w/FAXkHr3sjYf2GrwfwbkeREoMiVjZ9
 C5BEojITmkGgLlcnCwVMdcxfg10j2OG1qPlGXo5yE+YnCh3fVoKk/GHhv
 3Z5DhIBT63Cxyn0FyVrmR5F61dXjAD8W1EIdD8casfZnK8CIbDbiHYZiR
 HVorfGxi38wSLvPKS1jWVtnA4xqekG2o4hxUojvLTK3Tf/1+MGEp71N1z
 FnUOzRjq1yvaQrZDsi3wgt5aj9dutaUJuLlRNPGQGCAlaxC/TRhQH+kEP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12610419"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="12610419"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720701180"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="720701180"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:40:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 05:39:53 -0800
Message-Id: <20231205133954.2089546-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231205133954.2089546-1-lucas.demarchi@intel.com>
References: <20231205133954.2089546-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 3/4] drm/xe/kunit: Add stub to read_gmdid
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently it's not possible to test the WAs for platforms using gmdid
since they don't have the IP information on the descriptor struct. In
order to allow that, add a stub function for read_gmdid() that is
activated when the test executes, replacing the iomap and read of the
real register.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231129232807.1499826-5-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 ++++++
 drivers/gpu/drm/xe/xe_pci.c            |  3 +++
 drivers/gpu/drm/xe/xe_step.h           |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index b93cb1e96108..602793644f61 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -9,6 +9,7 @@
 
 #include <kunit/test-bug.h>
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
 struct kunit_test_data {
@@ -107,6 +108,21 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
 
+static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
+			    u32 *ver, u32 *revid)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_pci_fake_data *data = test->priv;
+
+	if (type == GMDID_MEDIA) {
+		*ver = data->media_verx100;
+		*revid = xe_step_to_gmdid(data->media_step);
+	} else {
+		*ver = data->graphics_verx100;
+		*revid = xe_step_to_gmdid(data->graphics_step);
+	}
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -140,6 +156,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		return -ENODEV;
 
 done:
+	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
+
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc->graphics, desc->media);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index b4b3fb2df09c..811ffe5bd9fd 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -6,6 +6,8 @@
 #ifndef _XE_PCI_TEST_H_
 #define _XE_PCI_TEST_H_
 
+#include <linux/types.h>
+
 #include "xe_platform_types.h"
 
 struct xe_device;
@@ -23,6 +25,10 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 struct xe_pci_fake_data {
 	enum xe_platform platform;
 	enum xe_subplatform subplatform;
+	u32 graphics_verx100;
+	u32 media_verx100;
+	u32 graphics_step;
+	u32 media_step;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 076e9dc85838..2186ebfbe05c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -5,6 +5,7 @@
 
 #include "xe_pci.h"
 
+#include <kunit/static_stub.h>
 #include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -457,6 +458,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
+	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
+
 	if (type == GMDID_MEDIA)
 		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index a384b640f2af..686cb59200c2 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -16,6 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
 struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 				      u32 graphics_gmdid_revid,
 				      u32 media_gmdid_revid);
+static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
+
 const char *xe_step_name(enum xe_step step);
 
 #endif
-- 
2.40.1

