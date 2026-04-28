Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB0FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8310EC92;
	Tue, 28 Apr 2026 14:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/zz7URo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B956010EBDB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386466; x=1808922466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tz1Ud22Y2GKkmnAiirDDNJT5sfq7l6jhSJLo3BDQA50=;
 b=S/zz7URoH8/EZJI0vfhSawX+FZULcod1X85tfkRdCYcrLuZnFuNlqquM
 VKgvYAGwvojGSzNzb/4R/mEFrk9K/EAHGcRT7uxNIPHVZk+4D/SE7q3D9
 ERx/bNq2qiHhM3tVD66r5jDbpSQMS2AfmlH8KtB00wm7nJjWn8EUgLTGU
 1FSQAuQuF8KAhyh70uaoIsy+qsAAouNQ+ayInagi3/xkAOqjWvi0uSBX6
 xwYF6l/3LCTsq2eXISzUjwTLCn64HgpKySbSdTsSle13DHUxiZOgOmOju
 HZwz2fse3U81XYD4YeiYByD/Go/Vgydso7LlZt2D/qGDQa8wb7UjadKwS A==;
X-CSE-ConnectionGUID: nw1nOxqITOyocHk6qrhwMQ==
X-CSE-MsgGUID: rRtuU+uaS36Kx08eKKkZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862327"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:46 -0700
X-CSE-ConnectionGUID: nl3uzza8Rq6Qy7k2GQUbVg==
X-CSE-MsgGUID: zSJDYsJbRJW9uPyS/uuHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942366"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 07/13] drm/xe/kunit: Activate empty MMIO stubs in test_init()
Date: Tue, 28 Apr 2026 16:27:14 +0200
Message-ID: <20260428142722.582-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

Our fake xe_device created in test_init() will immediately crash
when test code attempts to reuse any function that is accessing
the xe_mmio structure. But in many cases we can simply ignore
writes and return some value on reads, to make the code happy.

Activate simple stubs that will just log the MMIO accesses and
allow to pass test specific value, if non-zero value is better.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 37 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index 8276cabc4820..14271c4662d6 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_ggtt.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 
 /**
@@ -99,6 +100,28 @@ static struct xe_bo *fake_xe_managed_bo_create_pin_map(struct xe_device *xe,
 	return bo;
 }
 
+static u32 fake_xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct kunit_resource *res;
+	u32 val = 0;
+
+	res = kunit_find_named_resource(test, "mmio_read");
+	if (res) {
+		val = *(u32 *)res->data;
+		kunit_put_resource(res);
+	}
+	kunit_info(test, "mmio[%#x] read %#x\n", reg.addr, val);
+	return val;
+}
+
+static void fake_xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	kunit_info(test, "mmio[%#x] write %#x\n", reg.addr, val);
+}
+
 /**
  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
  * @test: the &kunit where this fake &xe_device will be used
@@ -116,6 +139,9 @@ static struct xe_bo *fake_xe_managed_bo_create_pin_map(struct xe_device *xe,
  * If xe_pci_fake_data->ggtt_size is set then this function will also do
  * a minimal GGTT initialization.
  *
+ * This function will also activate stubs for some xe_mmio operations.
+ * The xe_mmio reads will return value passed in xe_pci_fake_data->mmio_read.
+ *
  * This function uses KUNIT_ASSERT to detect any failures.
  *
  * Return: Always 0.
@@ -145,6 +171,17 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   fake_xe_managed_bo_create_pin_map);
 
+	if (data && data->mmio_read) {
+		struct kunit_resource *res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res);
+		err = kunit_add_named_resource(test, NULL, NULL, res,
+					       "mmio_read", &data->mmio_read);
+		KUNIT_ASSERT_EQ(test, err, 0);
+	}
+	kunit_activate_static_stub(test, xe_mmio_read32, fake_xe_mmio_read32);
+	kunit_activate_static_stub(test, xe_mmio_write32, fake_xe_mmio_write32);
+
 	test->priv = xe;
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index e807585b88c2..0011b9e710e5 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -24,6 +24,7 @@ struct xe_pci_fake_data {
 	u32 media_verx100;
 	u64 ggtt_start;
 	u64 ggtt_size;
+	u32 mmio_read;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
-- 
2.47.1

