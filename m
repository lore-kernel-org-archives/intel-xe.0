Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BA5E63F16
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBEC10E37B;
	Sun, 15 Feb 2026 20:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzBhxOvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3510E0A3
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187626; x=1802723626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8l2ehPipOXwltZtz4WiInd9el0oSBAC4EcKDNJkmS0=;
 b=bzBhxOvRpuFxKCwQKN0qVUDgoSaGr1vxrTNbZSIXPaU7apQqOHdNvW7h
 5PUETo7eE2B+mJKnDoI0vCxAlRMb09FKBnpOGhJMi2rxCNpbEJPUDUQKG
 4vkDVTc4aHQ3ohIPFG4PWk5HaSXG6I1nX+opM0iBu1f3HZ6Wd+M8Oe07k
 QmZewxqTvQ1z76h/xyZHTr2F2gQmnX5IHjEu5sY65EyWhqe7t8W3gbZxN
 HH915sWed14vyNkA8CObmDwZOZFcYzutebUJyhzt3gd9XOGV+iiBqIbK3
 tZjDR59IziQYJDCmafCbs3rNJAWmGuhXw5gPE53t8N7AEazc4JvPxqXo1 g==;
X-CSE-ConnectionGUID: Uon3/KLBRhayd+CboxTRGg==
X-CSE-MsgGUID: AEJcson4RLaVfOafygD2GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996391"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:45 -0800
X-CSE-ConnectionGUID: b01EbN4MT+iuDkGiXoj9Rg==
X-CSE-MsgGUID: +r0nzSz9RliHcg6PZnKttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096605"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/9] drm/xe/tests: Add KUnit tests for new VRAM fair
 provisioning
Date: Sun, 15 Feb 2026 21:33:19 +0100
Message-ID: <20260215203323.595-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

Add basic test cases to check outcome of the fair VRAM provisioning
for regular and admin-only PF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 90 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 3889dc3e49ca..80e5065beb2c 100644
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
 
@@ -50,6 +64,13 @@ static int pf_gt_config_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
 	test->priv = gt;
 
+	/* pretend it has some VRAM */
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
+	vram->usable_size = TEST_VRAM;
+	xe->mem.vram = xe->tiles[0].mem.vram = vram;
+
 	/* pretend it can support up to 63 VFs */
 	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
 	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
@@ -189,13 +210,80 @@ static void fair_ggtt(struct kunit *test)
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

