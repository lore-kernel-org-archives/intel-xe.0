Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB837606A321
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQTEoa7e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDC3112472;
	Fri, 13 Nov 2026 11:59:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E8610E7CF
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571134; x=1826107134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VaAPMKGwKErELWbEgIEmnvDloltaL8hiBQQhK7o1fJg=;
 b=KQTEoa7e0cDQ+XrDUrPzuUxt6WEmMBUrS+axkxcgmad3gnQeMx2ceP0E
 ThXpsC/NNi4O9OtczToMn0VHGjehISdGlK8xLEgJexErRsfHBmCD5m5Cg
 K1kb8bdwgKaBJ5ukUzdNA24GIiXHXatP4+83jjjTg5Pp+s1792Z1Yhaou
 IzD26TGaI4Gpptu5iJJdGI/vxxVBBU/3KP9BRd7vzK/ovnMj2iZ3TSJOw
 byPgEUz4cDltAvlDrSCXUJgsRD33qz1mguTGU8BrFx+Fh9dyUnrMtxgAf
 D7ps1oy0yKBEXd5pIW3aaRyWQ1ngD+0TIB4IXDv0lUNQ3hSWS9rgVt8fl A==;
X-CSE-ConnectionGUID: VVB6aKVQSjCvWquzLDoGJQ==
X-CSE-MsgGUID: sbPpFzfySiiKT27wmvqxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3384423"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3384423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:58:54 -0800
X-CSE-ConnectionGUID: 0iKW0mDfQ7OloUEQ8Mx06g==
X-CSE-MsgGUID: FfAPFjQQRzmjokmbtODOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8983768"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 03:58:50 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v1 3/4] drm/xe/cper: Validate platform GUIDs in KUnit tests
Date: Fri, 13 Nov 2026 17:28:31 +0530
Message-ID: <20261113115827.1913629-9-mallesh.koujalagi@intel.com>
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

Verify that platform GUIDs use the expected UUIDv5
format and do not overlap with reserved CPER GUIDs.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_cper_kunit.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
index c28df26cc10e..5bd0bbcef566 100644
--- a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
@@ -82,10 +82,42 @@ static void cper_test_guids_unique(struct kunit *test)
 	}
 }
 
+/*
+ * GUIDs are UUIDv5 (RFC 9562): version in byte 7, variant in byte 8.
+ */
+static void cper_test_guids_are_uuidv5(struct kunit *test)
+{
+	static const guid_t reserved[] = {
+		INTEL_CPER_CREATOR_XEKMD,
+		INTEL_CPER_NOTIFY_GPU_ERROR,
+		INTEL_CPER_SECTION_ACCEL_GENERIC,
+	};
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(xe_device_guids); i++) {
+		const struct xe_device_guid_entry *e = &xe_device_guids[i];
+
+		KUNIT_EXPECT_FALSE_MSG(test, guid_is_null(&e->guid),
+				       "PCI ID %#06x has a null GUID", e->device_id);
+		KUNIT_EXPECT_EQ_MSG(test, e->guid.b[7] >> 4, 5,
+				    "PCI ID %#06x GUID %pUl is not UUIDv5",
+				    e->device_id, &e->guid);
+		KUNIT_EXPECT_EQ_MSG(test, e->guid.b[8] & 0xc0, 0x80,
+				    "PCI ID %#06x GUID %pUl has wrong variant",
+				    e->device_id, &e->guid);
+
+		for (j = 0; j < ARRAY_SIZE(reserved); j++)
+			KUNIT_EXPECT_FALSE_MSG(test, guid_equal(&e->guid, &reserved[j]),
+					       "PCI ID %#06x GUID %pUl collides with a CPER type GUID",
+					       e->device_id, &e->guid);
+	}
+}
+
 static struct kunit_case xe_cper_test_cases[] = {
 	KUNIT_CASE(cper_test_pci_ids_have_guid),
 	KUNIT_CASE(cper_test_guids_have_pci_id),
 	KUNIT_CASE(cper_test_guids_unique),
+	KUNIT_CASE(cper_test_guids_are_uuidv5),
 	{}
 };
 
-- 
2.48.1

