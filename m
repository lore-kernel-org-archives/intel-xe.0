Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4F606A32F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NvAG0KSz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1754F10ECE4;
	Wed, 18 Nov 2026 22:30:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D8510ECE4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795041026; x=1826577026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOjUPErAuOxme0x2HPcayzvowb9pxVf6bh1gsWTWfI0=;
 b=NvAG0KSzdvAykBzA7EpngacMqYKssvyj45FAZ00w0ydL+9wq4zPAX+NX
 rwwAcGvBhAiqjAjK/ZzJ9NyZOqsCTXoC5uuqvb+GImRSebs5/K+r6fauF
 R4BKX31PGFBr+4GXOnxKV1GhB0E61R1CPRggLxfnauJPWmzSaSMHjSaFL
 A7qxctKE8q6coFZvJukuNRE6gDvrCkM3QJKo7hBAx5D3W8YOau3SBC1Og
 t1PyujPSfDi1/nROwGQF8Ck/vfOMmADZGgeGMFgSt3prOjevZ46TnPuau
 yJsfpEo5pt51tG7Db1bZA6XzGA1OpZ00BRtSL+GIDwl4jd9nRI3HzD9S0 w==;
X-CSE-ConnectionGUID: G0mmk8rITXi8oUPU48ccTg==
X-CSE-MsgGUID: VPWT68kfThCSVaf1O9LM5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758838"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:30:26 -0800
X-CSE-ConnectionGUID: Ma3dO4YpSYSBan5+LCv4BA==
X-CSE-MsgGUID: hBM+G52kRACUK2aDbW1Jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10655816"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:30:26 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
 balasubramani.vivekanandan@intel.com, intel-xe@lists.freedesktop.org,
 heikki.krogerus@linux.intel.com, dakr@kernel.org,
 andriy.shevchenko@linux.intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/1] driver core: platform: tests: add a shared software node
 test case
Date: Wed, 18 Nov 2026 22:30:23 +0000
Message-ID: <20261118223023.19653-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118223023.19653-3-stuart.summers@intel.com>
References: <20261118223023.19653-3-stuart.summers@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cover the pattern used by drm/xe + i2c-designware, where a software node
assigned as a platform device's primary firmware node is handed to a
second device via device_set_node(), and make sure removing that second
device leaves the owner's node intact.

A potential fix for this issue in the drm/xe driver is being discussed
in [1].

The signature in this case looks like this:
Oops: general protection fault, probably for non-canonical address
0x6b6b6b6b6b6b6b73
RIP: platform_device_release+0x6f/0x80

Link: https://patchwork.freedesktop.org/series/175858/ [1]
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/base/test/platform-device-test.c | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 9ce563f76aad..378ba7fab2ac 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -420,9 +420,66 @@ static void platform_device_two_swnodes(struct kunit *test)
 			    "Expected errno == -EINVAL, got: %pe", pdev);
 }
 
+static void platform_device_swnode_sharer_release(struct device *dev)
+{
+}
+
+/*
+ * A software node assigned as a platform device's primary firmware node may be
+ * shared with other devices: i2c-designware passes dev_fwnode() of its platform
+ * device down to the i2c adapter device it creates. Check that removing the
+ * sharing device leaves the owner's software node intact.
+ */
+static void platform_device_swnode_shared(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_STRING("compatible", "test,shared-swnode"),
+		{ }
+	};
+	struct fwnode_handle *fwnode;
+	struct platform_device *pdev;
+	struct device *shared;
+	int ret;
+
+	pdev = platform_device_alloc(DEVICE_NAME, PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	fwnode = fwnode_create_software_node(properties, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+	platform_device_set_fwnode(pdev, fwnode);
+
+	ret = platform_device_add(pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * A second, non-platform device referencing the same fwnode, like the
+	 * i2c adapter device created by i2c-designware.
+	 */
+	shared = kunit_kzalloc(test, sizeof(*shared), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shared);
+
+	device_initialize(shared);
+	shared->release = platform_device_swnode_sharer_release;
+	ret = dev_set_name(shared, "test-swnode-sharer");
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	device_set_node(shared, dev_fwnode(&pdev->dev));
+
+	ret = device_add(shared);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	device_unregister(shared);
+
+	/* The owner must still have its software node. */
+	KUNIT_EXPECT_PTR_EQ(test, dev_fwnode(&pdev->dev), fwnode);
+
+	platform_device_unregister(pdev);
+	fwnode_remove_software_node(fwnode);
+}
+
 static struct kunit_case platform_device_swnode_tests[] = {
 	KUNIT_CASE(platform_device_swnode_add_twice),
 	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_swnode_shared),
 	KUNIT_CASE(platform_device_two_swnodes),
 	{}
 };
-- 
2.43.0

