Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0DAC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 23:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2A110E0F9;
	Wed, 29 Nov 2023 23:28:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43310E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701300514; x=1732836514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n35QwnjVGEc/BWnwXsRNAsCHDxuw0GF9H8vERCvlOOo=;
 b=RHqOgffvQh1MtzGHo44bNgdByezrCAuq3zgWlJk3Ug61IYZYkdWeicEu
 2Sxya/US00E2Z/8htsTRYM6O1pnKeSd4lormUU+8/nxRU/P52YEQCj9ZU
 UGbBPaCeTpMIXM26Omid8DI2yyhX8fbIYb9p8goZnKo0p3OZRchQXqoX5
 c4QPYOvOKAuGEQ7tmNAog/8Voko39wqk+nzcTC5b92bpY8jHyRVpGBmiK
 NTry/MLuRtWIDfBqcGdWo9zbGhXcHq1Y4rVC0/54fRYWWXpv0is3c6CTP
 71aMfSXZAzxDXKaBbQP8vlIecSBBB/NsAq0TLTfu28IyRSVmhCegsvfry Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14797375"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14797375"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798088848"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798088848"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 15:28:06 -0800
Message-Id: <20231129232807.1499826-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129232807.1499826-1-lucas.demarchi@intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/5] drm/xe/kunit: Add stub to read_gmdid
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently it's not possible to test the WAs for platforms using gmdid
since they don't have the IP information on the descriptor struct. In
order to allow that, add a stub function for read_gmdid() that is
activated when the test executes, replacing the iomap and read of the
real register.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 ++++++
 drivers/gpu/drm/xe/xe_pci.c            |  3 +++
 drivers/gpu/drm/xe/xe_step.h           |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index be2000987877..5b4e73cc31db 100644
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
 	xe_info_init(xe, desc, subplatform_desc);
 
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
index c949ec7ec43e..cc2e87c0eb97 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -5,6 +5,7 @@
 
 #include "xe_pci.h"
 
+#include <kunit/static_stub.h>
 #include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -456,6 +457,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
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

