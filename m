Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB5DC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EADA10E394;
	Tue,  7 Jul 2026 22:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWKf9ess";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAF410EF2D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462122; x=1814998122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0mSe4RoSybG1Gs+xYcT/asxvsRSwWYshrdpv/hm7YI=;
 b=eWKf9essgXlLwfdb/6MQJGz1vnyLEogyd+pa77kGMl31SYIJqWMp65wS
 3K9mAgN8FO8qsjD5KsbFSUTTSsJBK2nfww0gZsPjZDG3bGp6YkRGrhoO2
 Yn2UxnDo+vhO0QR/hSQkba/NfDLzuBvTgD5J2MsfcS/z4Ixe0SJkHzNAz
 x5we8RsgS9FnEX6qlVD4czNBPyMU6/md+PGxbDtli1Jl2yZYCMZb6wH6T
 ea3jsU+GXeLPoyYjtbcag3UobmMSzs7cttEkWh/QVO+faVUb59/+x7LgJ
 zUHv6dem/cbKbzFSCuXjYJihzOmePPxaY1voGE1d35lj0BQ65L2N1+H0h A==;
X-CSE-ConnectionGUID: RoLX+3IWTeGObnJ9AuCWiQ==
X-CSE-MsgGUID: TZqzxALyTQy4/T8MUqZqgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176552"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:42 -0700
X-CSE-ConnectionGUID: 3xv3KXbORO2iKJTKYvDYNA==
X-CSE-MsgGUID: UajH6nhXQbKirnngaRGYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487688"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 12/13] drm/xe/tests: Add migration packet test
Date: Wed,  8 Jul 2026 00:08:14 +0200
Message-ID: <20260707220816.677-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
v2: avoid KUNIT_ASSERT under mutex (Sashiko/Michal)
---
 .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  | 88 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  4 +
 2 files changed, 92 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
new file mode 100644
index 000000000000..8dcf5e9d3ad2
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
@@ -0,0 +1,88 @@
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
+	/* note: with lock held we should avoid KUNIT_ASSERT() */
+	guard(mutex)(pf_migration_mutex(xe, TEST_VF));
+
+	KUNIT_EXPECT_EQ(test, 0, pf_descriptor_init(xe, TEST_VF));
+	desc = pf_pick_descriptor(xe, TEST_VF);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, *desc);
+	if (!*desc)
+		return;
+	KUNIT_EXPECT_NE(test, (*desc)->hdr.version, 0);
+	KUNIT_EXPECT_EQ(test, (*desc)->hdr.version, XE_SRIOV_PACKET_SUPPORTED_VERSION);
+	KUNIT_EXPECT_EQ(test, (*desc)->hdr.type, XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
+	KUNIT_EXPECT_NE(test, (*desc)->hdr.size, 0);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, (*desc)->vaddr);
+	if (!(*desc)->vaddr)
+		return;
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

