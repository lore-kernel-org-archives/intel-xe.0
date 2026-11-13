Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD0606A321
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDPajAJ5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172210E4C9;
	Fri, 13 Nov 2026 11:58:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9612010E4C9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571131; x=1826107131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D99/0vo3GDcItwukrc37DCXrdYcR2JQQ2H7RjUxFb0A=;
 b=EDPajAJ5tXI4o1pcwDbfl8fcT40V1Mkxg43AFBrWrnSVSgiTuR9TlNqr
 FbNEtHO0mfmu+1hypey3m1VXWX+Pg4gd6xVsW8LDo1aH71Q8kHtbaHKbb
 3VkNcalCjLJRSSrLL30BhmHtuWfbWo8aZtK8mDXWad7zGYItFsSaRRDpi
 ni3E5wMJZyZXGfixZokV0wqqElQvkLA1Z+rMB5IkhQbP1Nnp4aXlG+lWE
 NatOLj1XclQjx7jtR9KCshDFNGvpQqwUjvphQLrd4pkvqKKxWjmDW0fUM
 2N5Ec3WUqTe3FHVKTIFEHUY4vVXckZBQT21YM5KbHDOxBwSXPzU3F9Kbv g==;
X-CSE-ConnectionGUID: B0OZuL0QQhGSUoO1djD2ng==
X-CSE-MsgGUID: QTW65LA+Sa2V57pZCgEv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3384407"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3384407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:58:51 -0800
X-CSE-ConnectionGUID: r1jTvC7MSDqifkpKfiLeQQ==
X-CSE-MsgGUID: YA7dS2xeSnWdhw7yXG6LFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8983762"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 03:58:47 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v1 2/4] drm/xe/cper: Add KUnit tests for GUID uniqueness
Date: Fri, 13 Nov 2026 17:28:30 +0530
Message-ID: <20261113115827.1913629-8-mallesh.koujalagi@intel.com>
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

Verify that CPER GUID entries have unique PCI IDs and
platform GUIDs.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_cper_kunit.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
index 6376f9e91d7e..c28df26cc10e 100644
--- a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
@@ -62,9 +62,30 @@ static void cper_test_guids_have_pci_id(struct kunit *test)
 				      i, xe_device_guids[i].device_id);
 }
 
+static void cper_test_guids_unique(struct kunit *test)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(xe_device_guids); i++) {
+		for (j = i + 1; j < ARRAY_SIZE(xe_device_guids); j++) {
+			KUNIT_EXPECT_NE_MSG(test, xe_device_guids[i].device_id,
+					    xe_device_guids[j].device_id,
+					    "duplicate PCI ID %#06x at [%u] and [%u]",
+					    xe_device_guids[i].device_id, i, j);
+			KUNIT_EXPECT_FALSE_MSG(test, guid_equal(&xe_device_guids[i].guid,
+								&xe_device_guids[j].guid),
+					       "duplicate GUID %pUl for PCI IDs %#06x and %#06x",
+					       &xe_device_guids[i].guid,
+					       xe_device_guids[i].device_id,
+					       xe_device_guids[j].device_id);
+		}
+	}
+}
+
 static struct kunit_case xe_cper_test_cases[] = {
 	KUNIT_CASE(cper_test_pci_ids_have_guid),
 	KUNIT_CASE(cper_test_guids_have_pci_id),
+	KUNIT_CASE(cper_test_guids_unique),
 	{}
 };
 
-- 
2.48.1

