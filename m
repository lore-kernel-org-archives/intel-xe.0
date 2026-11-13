Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EA606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tzv9Ll/E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8357E10E7B2;
	Fri, 13 Nov 2026 11:59:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239AC10E7B2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571138; x=1826107138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FI4XB58GRG7rFdFXRNc4fWwUvabI96hb8Bj+c9vRP/w=;
 b=Tzv9Ll/Eu9mMLt2GkvZH855MvZROMDUUSC37emxi/wN59XXIRBSqbSzz
 6Xiiyb67m/VdHIXsmIYOSWmcOfTe7gzWTojw4wGs2luFM0y0miw4O8aFh
 fWNDNW78+961s8y0Gh6UR44vgyuNRSHmVl7M5XY5rMvv+2quV3XkXfkGI
 1d8iX15yUYFfd3UbIEhgAGzMI6aWTSbabGYUZk08GmJiBtVJyvccBnl1Q
 f+d+PeIf9+tcWhAzz/MKi0zOFVPkKHyRFFZMXZ+PcB2EWgTWCTcLPAZIC
 T/IT8X5g71JtHOlPO+t9IwS3xQAQznWwm2gzjpw6Lfo0+uxKkjR+d1IHo A==;
X-CSE-ConnectionGUID: pvVaUt2SQXKZR/oAu7HEvQ==
X-CSE-MsgGUID: K351Q2CnREKAjQ2cvsGqHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3384433"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3384433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:58:57 -0800
X-CSE-ConnectionGUID: oA4tDftHRZmoQ4I+AKyCGQ==
X-CSE-MsgGUID: lZI/H0HxRHqvHSGa8NW0hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8983776"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 03:58:53 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v1 4/4] drm/xe/cper: Add PCI ID to GUID mapping verification
 in KUnit
Date: Fri, 13 Nov 2026 17:28:32 +0530
Message-ID: <20261113115827.1913629-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
References: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add expected UUIDv5 mappings to verify each PCI ID maps to its
correct GUID.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_cper_kunit.c | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
index 5bd0bbcef566..4b0de6637d20 100644
--- a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
@@ -18,6 +18,24 @@ static const u16 cper_test_pci_ids[] = {
 
 #undef CPER_TEST_PCI_ID
 
+/* UUIDv5 outputs for "platform/8086:<device_id>". */
+static const struct xe_device_guid_entry cper_test_expected_guids[] = {
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+	{ 0x6752, GUID_INIT(0xb778ead8, 0x0009, 0x59a7,
+			    0xa1, 0x3a, 0x78, 0xce, 0x4d, 0xdd, 0xae, 0xf5) },
+};
+
 static bool cper_test_pci_id_known(u16 device_id)
 {
 	unsigned int i;
@@ -40,6 +58,17 @@ static const struct xe_device_guid_entry *cper_test_guid_entry(u16 device_id)
 	return NULL;
 }
 
+static const struct xe_device_guid_entry *cper_test_expected_guid_entry(u16 device_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cper_test_expected_guids); i++)
+		if (cper_test_expected_guids[i].device_id == device_id)
+			return &cper_test_expected_guids[i];
+
+	return NULL;
+}
+
 static void cper_test_pci_ids_have_guid(struct kunit *test)
 {
 	unsigned int i;
@@ -52,6 +81,31 @@ static void cper_test_pci_ids_have_guid(struct kunit *test)
 					  cper_test_pci_ids[i]);
 }
 
+static void cper_test_guid_matches_pci_id(struct kunit *test)
+{
+	unsigned int i;
+
+	KUNIT_ASSERT_EQ(test, ARRAY_SIZE(cper_test_expected_guids),
+			ARRAY_SIZE(cper_test_pci_ids));
+
+	for (i = 0; i < ARRAY_SIZE(cper_test_pci_ids); i++) {
+		u16 device_id = cper_test_pci_ids[i];
+		const struct xe_device_guid_entry *actual = cper_test_guid_entry(device_id);
+		const struct xe_device_guid_entry *expected =
+			cper_test_expected_guid_entry(device_id);
+
+		KUNIT_ASSERT_NOT_NULL_MSG(test, expected,
+					  "PCI ID %#06x has no expected GUID",
+					  device_id);
+		KUNIT_ASSERT_NOT_NULL_MSG(test, actual,
+					  "PCI ID %#06x has no GUID entry",
+					  device_id);
+		KUNIT_EXPECT_TRUE_MSG(test, guid_equal(&actual->guid, &expected->guid),
+				      "PCI ID %#06x has GUID %pUl, expected %pUl",
+				      device_id, &actual->guid, &expected->guid);
+	}
+}
+
 static void cper_test_guids_have_pci_id(struct kunit *test)
 {
 	unsigned int i;
@@ -115,6 +169,7 @@ static void cper_test_guids_are_uuidv5(struct kunit *test)
 
 static struct kunit_case xe_cper_test_cases[] = {
 	KUNIT_CASE(cper_test_pci_ids_have_guid),
+	KUNIT_CASE(cper_test_guid_matches_pci_id),
 	KUNIT_CASE(cper_test_guids_have_pci_id),
 	KUNIT_CASE(cper_test_guids_unique),
 	KUNIT_CASE(cper_test_guids_are_uuidv5),
-- 
2.48.1

