Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0D7CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B697510F766;
	Mon,  8 Jun 2026 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXYz4DLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E321D10F772
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937697; x=1812473697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BNLEbrbx6IwaoF/pVQtGdzKU3Q5yZVpvpplr+NDmdfU=;
 b=AXYz4DLWY2RV04DaMMCTwPKcgiuSzM7SmCLSr9060deV3bHwz1ArVgz8
 Yp8wC71NxQTmN1RkuecmIRzoWdAI70SJ8fwHzVFK0RkyQCdHKXFH/lQzj
 bjQ/dYrzSh3JVmPyFDPH4FmzcWN8P1nQhorwJCGhJDAJ7MOS+v4r0hdm8
 T0kL55VIjF0Mkb/nEmMlOI0+7IEqjVSbBJyQwTI36CYxOrBogipONyxnD
 1LRefxlEONkw9zdkAcr93DSx+Lq6U5oUj7ntJXj/+uGrEFTeI0B7P9fw4
 fXGQvzhR+CJIz/Pb4uNawzL2LBguPP9t0Akb02+o4v0LzTIgaDSWqrnKB A==;
X-CSE-ConnectionGUID: XGiZVogNSy6Ge1oYwEzr0g==
X-CSE-MsgGUID: uIOWWKK+R1ypqHEuFz4/mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744575"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744575"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:57 -0700
X-CSE-ConnectionGUID: 6IGl3j4VS12viSvDXAi7yA==
X-CSE-MsgGUID: pJk/9dHaTbSV7iwDg6LqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467605"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 14/16] drm/xe/kunit: Promote GGTT initialization to test_init()
Date: Mon,  8 Jun 2026 18:54:27 +0200
Message-ID: <20260608165429.587-15-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

Our test_init() helper already do a minimal initialization of the
kunit fake xe_device, including basic setup of main components like
xe_tile and xe_gt, but some other main components, like xe_ggtt,
were completely untouched. Move basic GGTT initialization to the
test_init() helper function, as it does not require much work and
will allow us to simplify other tests' init functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  9 +++------
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |  3 +++
 drivers/gpu/drm/xe/tests/xe_pci.c           | 14 ++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  8 ++++++++
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 64f106406844..1e41bb4831d6 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -62,19 +62,16 @@ static int guc_buf_test_init(struct kunit *test)
 		.sriov_mode = XE_SRIOV_MODE_PF,
 		.platform = XE_TIGERLAKE, /* some random platform */
 		.subplatform = XE_SUBPLATFORM_NONE,
+		.ggtt.start = DUT_GGTT_START,
+		.ggtt.size = DUT_GGTT_SIZE,
 	};
-	struct xe_ggtt *ggtt;
 	struct xe_guc *guc;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
 
-	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
 	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
-
-	KUNIT_ASSERT_EQ(test, 0,
-			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-					   DUT_GGTT_SIZE));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc);
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index e0eeb419e837..3c80e72af69d 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -65,6 +65,9 @@ static void kunit_action_restore_priv(void *priv)
  * in &kunit.priv pointer to the struct xe_pci_fake_data supplemented with
  * desired parameters prior to calling this function.
  *
+ * If xe_pci_fake_data->ggtt.size and .start are set then this function will
+ * also do a minimal GGTT initialization.
+ *
  * This function uses KUNIT_ASSERT to detect any failures.
  *
  * Return: Always 0.
diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 3a31cfe1d490..dc9999397956 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -14,6 +14,8 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+#include "xe_ggtt.h"
+
 #define PLATFORM_CASE(platform__, graphics_step__)					\
 	{										\
 		.platform = XE_ ## platform__,						\
@@ -483,6 +485,18 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc);
 
+	if (data && data->ggtt.size) {
+		struct xe_tile *tile;
+		unsigned int id;
+
+		KUNIT_ASSERT_NE(test, 0, data->ggtt.start);
+		for_each_tile(tile, xe, id)
+			KUNIT_ASSERT_EQ(test, 0,
+					xe_ggtt_init_kunit(tile->mem.ggtt,
+							   data->ggtt.start,
+							   data->ggtt.size));
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 90a33bd2a72b..87d5b6cac815 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -27,6 +27,14 @@ struct xe_pci_fake_data {
 		const struct logic_iomem_ops *ops;
 		void *priv;
 	} gttmmadr;
+
+	/** @ggtt: fake GGTT configuration */
+	struct {
+		/** @ggtt.start: start address, or 0 if unavailable */
+		u64 start;
+		/** @ggtt.size: size, or 0 if unavailable */
+		u64 size;
+	} ggtt;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
-- 
2.47.1

