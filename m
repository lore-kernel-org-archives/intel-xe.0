Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A710C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA6110E50F;
	Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjyYEdX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9410E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826018; x=1814362018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LvhHRnjO28dYmZNiygvGXCJLg8cZgsNmUF5RyqbDjhQ=;
 b=UjyYEdX/9B2qYR7qp3WlVgUKTEeEd2Y1FceTVvJAtC/N6nX09NSgREjC
 0hXiKP8Jt5BISp1HZ4T7kY5byWrgSWLYv/flJDJxVAIwR3Oexkwb9Bwly
 daBYlLqZBm4sOKGY+ioIS/95FJMk2epdOfuPhD8meu/I5CId/DD8SmOmZ
 21dZcvg3SugjRcbaHlwIHunETJy/30+6biKzhX92EXa9/UB9RzeZiUyNR
 lS6TVzTax3q2Apnl5mhzWy1vYhG2sKhWquQErXIVkWBRm00Y8qHUgOETN
 ZSydv8c73Twg+vvIRXj+mi53UPWlTs9PvBXI66yCFvCP43s1RB45QhK7u Q==;
X-CSE-ConnectionGUID: YX+qihCWRWCYBaXrLGhn+A==
X-CSE-MsgGUID: ppcJtJnrQTCdnvcdg/W1xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623526"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623526"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:58 -0700
X-CSE-ConnectionGUID: CYCEYoHtSACE6veAGa6wTw==
X-CSE-MsgGUID: rfMCdAGfTGuaV2lV44dsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182250"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 12/13] drm/xe/tests: Add migration packet test
Date: Tue, 30 Jun 2026 15:26:31 +0200
Message-ID: <20260630132633.32804-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

One of our migration data packet (descriptor) is based on the KLV
encoding. Add a simple descriptor initialization test, as we plan
to use new KLV helper functions there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  | 83 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  4 +
 2 files changed, 87 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
new file mode 100644
index 000000000000..9af066875671
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#include "xe_device.h"
+#include "xe_guc_klv_helpers.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define TEST_VF		VFID(1)
+
+static int sriov_packet_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_PANTHERLAKE, /* we need MEMIRQ */
+		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = 3000,
+		.media_verx100 = 3000,
+	};
+	struct xe_device *xe;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+	xe = test->priv;
+
+	/* pretend we can support at least VF1 */
+	xe->sriov.pf.device_total_vfs = 1;
+	xe->sriov.pf.driver_max_vfs = 1;
+
+	KUNIT_ASSERT_EQ(test, 0, xe_sriov_init(xe));
+	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_migration_supported(xe));
+
+	return 0;
+}
+
+static void test_descriptor_init(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_sriov_packet **desc;
+
+	guard(mutex)(pf_migration_mutex(xe, TEST_VF));
+
+	KUNIT_ASSERT_EQ(test, 0, pf_descriptor_init(xe, TEST_VF));
+	desc = pf_pick_descriptor(xe, TEST_VF);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, *desc);
+	KUNIT_EXPECT_NE(test, (*desc)->hdr.version, 0);
+	KUNIT_EXPECT_EQ(test, (*desc)->hdr.version, XE_SRIOV_PACKET_SUPPORTED_VERSION);
+	KUNIT_EXPECT_EQ(test, (*desc)->hdr.type, XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
+	KUNIT_EXPECT_NE(test, (*desc)->hdr.size, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (*desc)->vaddr);
+	KUNIT_EXPECT_EQ(test, 0, xe_sriov_packet_process_descriptor(xe, TEST_VF, *desc));
+
+	switch ((*desc)->hdr.version) {
+	case 1:
+		/* v1 is KLV based */
+		KUNIT_EXPECT_TRUE(test, IS_ALIGNED((*desc)->hdr.size, sizeof(u32)));
+		/* v1 has at least DEVID and REVID KLVs */
+		KUNIT_EXPECT_LE(test, 2,
+				xe_guc_klv_count((*desc)->vaddr,
+						 (*desc)->hdr.size / sizeof(u32)));
+		break;
+	default:
+		kunit_skip(test, "missing test code for version %u\n", (*desc)->hdr.version);
+	}
+}
+
+static struct kunit_case sriov_packet_test_cases[] = {
+	KUNIT_CASE(test_descriptor_init),
+	{}
+};
+
+static struct kunit_suite sriov_packet_suite = {
+	.name = "sriov_packet",
+	.test_cases = sriov_packet_test_cases,
+	.init = sriov_packet_test_init,
+};
+
+kunit_test_suite(sriov_packet_suite);
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index e581e8e6c1d1..558a3697d639 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -516,3 +516,7 @@ int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_sriov_packet_kunit.c"
+#endif
-- 
2.47.1

