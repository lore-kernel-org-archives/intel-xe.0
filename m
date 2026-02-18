Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A14E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D110E630;
	Wed, 18 Feb 2026 20:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcqmP6hA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3ED10E62D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448191; x=1802984191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8h/7828scp1jqqPGOWF1LRsb9PJ+fLk5rxwsJjCZtU=;
 b=PcqmP6hA9JxnUifjCX65CE/NGhaRj8+hgaezwWKpWqiJpR5sov6HjyNA
 zDN3hDU+Yr1LfIlfNUvhzfKSePr/08qVd0WklQKFNYuKJzZKAruCEfDUo
 Y7SKJ41aDnUeOX4J6HY681yiIlgE29x7CZYf6Q9nB4UZNGEGiig/Pl75O
 GfE1qZT+t19+lB42MOnPNsurz/RStGTq8VYBwOGp9WJTL31Y+PL6+5cM0
 Mhefv6Mqsosq7a0VkKElFsfvLxM7mdeT2+I+E00V5uuE99mixTQAwv3/k
 582C9efCC4Gm8Jp72qKQr9r3S41TNtObkuojktjZhgg9Uo+TD4JD6l1dW g==;
X-CSE-ConnectionGUID: oN32BNRNSp+QvturdhjgrA==
X-CSE-MsgGUID: o8JJlH9NS5uRfcsYOjFjoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710598"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:31 -0800
X-CSE-ConnectionGUID: Arrb9bDpQyyjtu0Vo+SbIQ==
X-CSE-MsgGUID: r7PdYpUdSdGBek3ybuhKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548263"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:30 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 06/10] drm/xe/tests: Add KUnit tests for new VRAM fair
 provisioning
Date: Wed, 18 Feb 2026 21:55:48 +0100
Message-ID: <20260218205553.3561-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

Add basic test cases to check outcome of the fair VRAM provisioning
for regular and admin-only PF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: add LMTT setup to .test_init()
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 96 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 3889dc3e49ca..305dbd4e5d1a 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -11,6 +11,7 @@
 #include "xe_pci_test.h"
 
 #define TEST_MAX_VFS	63
+#define TEST_VRAM	0x37a800000ull
 
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
@@ -19,6 +20,17 @@ static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
 }
 
+static void pf_set_usable_vram(struct xe_device *xe, u64 usable)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct kunit *test = kunit_get_current_test();
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile);
+	xe->mem.vram->usable_size = usable;
+	tile->mem.vram->usable_size = usable;
+	KUNIT_ASSERT_EQ(test, usable, xe_vram_region_usable_size(tile->mem.vram));
+}
+
 static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
 {
 	unsigned long next = 1 + (unsigned long)prev;
@@ -34,9 +46,11 @@ static int pf_gt_config_test_init(struct kunit *test)
 {
 	struct xe_pci_fake_data fake = {
 		.sriov_mode = XE_SRIOV_MODE_PF,
-		.platform = XE_TIGERLAKE, /* any random platform with SR-IOV */
+		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
 		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = 2001,
 	};
+	struct xe_vram_region *vram;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -50,6 +64,19 @@ static int pf_gt_config_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
 	test->priv = gt;
 
+	/* pretend it has some VRAM */
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
+	vram->usable_size = TEST_VRAM;
+	xe->mem.vram = vram;
+	xe->tiles[0].mem.vram = vram;
+
+	/* pretend we have a valid LMTT */
+	KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
+	KUNIT_ASSERT_GE(test, GRAPHICS_VERx100(xe), 1260);
+	xe->tiles[0].sriov.pf.lmtt.ops = &lmtt_ml_ops;
+
 	/* pretend it can support up to 63 VFs */
 	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
 	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
@@ -189,13 +216,80 @@ static void fair_ggtt(struct kunit *test)
 		KUNIT_ASSERT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, num_vfs));
 }
 
+static const u64 vram_sizes[] = {
+	SZ_4G - SZ_512M,
+	SZ_8G + SZ_4G - SZ_512M,
+	SZ_16G - SZ_512M,
+	SZ_32G - SZ_512M,
+	SZ_64G - SZ_512M,
+	TEST_VRAM,
+};
+
+static void u64_param_get_desc(const u64 *p, char *desc)
+{
+	string_get_size(*p, 1, STRING_UNITS_2, desc, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(vram_size, vram_sizes, u64_param_get_desc);
+
+static void fair_vram_1vf(struct kunit *test)
+{
+	const u64 usable = *(const u64 *)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	pf_set_usable_vram(xe, usable);
+
+	KUNIT_EXPECT_NE(test, 0, pf_profile_fair_lmem(gt, 1));
+	KUNIT_EXPECT_GE(test, usable, pf_profile_fair_lmem(gt, 1));
+	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_lmem(gt, 1)));
+	KUNIT_EXPECT_GE(test, usable - pf_profile_fair_lmem(gt, 1), pf_profile_fair_lmem(gt, 1));
+}
+
+static void fair_vram_1vf_admin_only(struct kunit *test)
+{
+	const u64 usable = *(const u64 *)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, true);
+	pf_set_usable_vram(xe, usable);
+
+	KUNIT_EXPECT_NE(test, 0, pf_profile_fair_lmem(gt, 1));
+	KUNIT_EXPECT_GE(test, usable, pf_profile_fair_lmem(gt, 1));
+	KUNIT_EXPECT_LT(test, usable - pf_profile_fair_lmem(gt, 1), pf_profile_fair_lmem(gt, 1));
+	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_lmem(gt, 1), SZ_1G));
+}
+
+static void fair_vram(struct kunit *test)
+{
+	unsigned int num_vfs = (unsigned long)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 alignment = pf_get_lmem_alignment(gt);
+	char size[10];
+
+	pf_set_admin_mode(xe, false);
+
+	string_get_size(pf_profile_fair_lmem(gt, num_vfs), 1, STRING_UNITS_2, size, sizeof(size));
+	kunit_info(test, "fair %s %llx\n", size, pf_profile_fair_lmem(gt, num_vfs));
+
+	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_lmem(gt, num_vfs)));
+	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_lmem(gt, num_vfs), alignment));
+	KUNIT_EXPECT_GE(test, TEST_VRAM, num_vfs * pf_profile_fair_lmem(gt, num_vfs));
+}
+
 static struct kunit_case pf_gt_config_test_cases[] = {
 	KUNIT_CASE(fair_contexts_1vf),
 	KUNIT_CASE(fair_doorbells_1vf),
 	KUNIT_CASE(fair_ggtt_1vf),
+	KUNIT_CASE_PARAM(fair_vram_1vf, vram_size_gen_params),
+	KUNIT_CASE_PARAM(fair_vram_1vf_admin_only, vram_size_gen_params),
 	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
 	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
 	KUNIT_CASE_PARAM(fair_ggtt, num_vfs_gen_param),
+	KUNIT_CASE_PARAM(fair_vram, num_vfs_gen_param),
 	{}
 };
 
-- 
2.47.1

