Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F0CCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 12:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50EE10E70B;
	Wed, 12 Nov 2025 12:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs2+iD3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFA110E70B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762951462; x=1794487462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ywDFSJEVw4yIA9JcZYfW0cFiNV8ig6qGfOsTVNwAjhE=;
 b=Zs2+iD3YMXy8eGoyYtUl9NA+H+0BjjcaLsEYM6xOYhotTSORPPj+Fmz/
 NMhvyM6H8V4e2eDowDLhu0wo/tX2izknGrM3ZHDwHcjSjiuX0XjV6Nb6i
 yFyNnAKfo5Xxq4elS17g+g++rsxEPGYuiyPPbS79CW/kbX0EOxl4IAGeX
 qGS+F+5NFXDD4+AejyNp37khgG7gnYGMxLi7vXxRTqJGOonRlXpbM5yZ9
 +arC28BzKcTJFsYsAYXRyrDu5Y5pO3QMD0TUfXturzmWhvxuQdViuJbg0
 YWK2enl6vpmx557Jm9mMxxgF/yVMCWrkjdPasOQpU2l+sXG7wvmGbhhNz Q==;
X-CSE-ConnectionGUID: WtGJUJf5TeSREP4RUSqD8A==
X-CSE-MsgGUID: ikXX826pT/iR2z5IVi6W7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64938612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64938612"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:44:22 -0800
X-CSE-ConnectionGUID: oG74rgIkSEqwQ6M+vq3uVA==
X-CSE-MsgGUID: f8RbhobeT0SjVsjB3UByMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="194406077"
Received: from npeltier-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.248.255])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:44:20 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Use migration-friendly GGTT auto-provisioning
Date: Wed, 12 Nov 2025 13:44:08 +0100
Message-ID: <20251112124408.8094-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Instead of trying very hard to find the largest fair GGTT size that
could be allocated for VFs on the current tile, pick some smaller
rounded down to power-of-two value that is more likely to be
provisioned in the same manner by the other PF instance:

  num VFs | GGTT space (MiB)
  --------+-----------------
   63..57 | 56
   56..29 | 64
   28..15 | 128
   14..8  | 256
    7..4  | 512
    3..2  | 1024
       1  | 2048 (regular PF)
       1  | 3584 (admin only PF)

Note that due to FW/HW limitations we can't share all 4GiB GGTT
address space with VFs, so for the larger (>7) number of the VFs
the change in the outcome is happening at different points than
we have in case of GuC contexts/doorbells IDs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 46 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 23 ++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index cb3db3e793e1..42bfc4bcfbcf 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -145,11 +145,57 @@ static void fair_doorbells(struct kunit *test)
 		KUNIT_ASSERT_EQ(test, SZ_128, pf_profile_fair_dbs(gt, num_vfs));
 }
 
+static void fair_ggtt_1vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, 1));
+
+	pf_set_admin_mode(xe, true);
+	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
+	KUNIT_EXPECT_EQ(test, SZ_2G + SZ_1G + SZ_512M, pf_profile_fair_ggtt(gt, 1));
+}
+
+static void fair_ggtt(struct kunit *test)
+{
+	unsigned int num_vfs = (unsigned long)test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 alignment = pf_get_ggtt_alignment(gt);
+	u64 shareable = SZ_2G + SZ_1G + SZ_512M;
+
+	pf_set_admin_mode(xe, false);
+	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
+
+	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_ggtt(gt, num_vfs), alignment));
+	KUNIT_EXPECT_GE(test, shareable, num_vfs * pf_profile_fair_ggtt(gt, num_vfs));
+
+	if (num_vfs > 56)
+		KUNIT_ASSERT_EQ(test, SZ_64M - SZ_8M, pf_profile_fair_ggtt(gt, num_vfs));
+	else if (num_vfs > 28)
+		KUNIT_ASSERT_EQ(test, SZ_64M, pf_profile_fair_ggtt(gt, num_vfs));
+	else if (num_vfs > 14)
+		KUNIT_ASSERT_EQ(test, SZ_128M, pf_profile_fair_ggtt(gt, num_vfs));
+	else if (num_vfs > 7)
+		KUNIT_ASSERT_EQ(test, SZ_256M, pf_profile_fair_ggtt(gt, num_vfs));
+	else if (num_vfs > 3)
+		KUNIT_ASSERT_EQ(test, SZ_512M, pf_profile_fair_ggtt(gt, num_vfs));
+	else if (num_vfs > 1)
+		KUNIT_ASSERT_EQ(test, SZ_1G, pf_profile_fair_ggtt(gt, num_vfs));
+	else
+		KUNIT_ASSERT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, num_vfs));
+}
+
 static struct kunit_case pf_gt_config_test_cases[] = {
 	KUNIT_CASE(fair_contexts_1vf),
 	KUNIT_CASE(fair_doorbells_1vf),
+	KUNIT_CASE(fair_ggtt_1vf),
 	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
 	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
+	KUNIT_CASE_PARAM(fair_ggtt, num_vfs_gen_param),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 80cc3f2cd047..56c03e6cb849 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -9,6 +9,7 @@
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
+#include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
 
 #include "xe_bo.h"
@@ -697,6 +698,22 @@ static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
 	return fair;
 }
 
+static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
+{
+	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
+	u64 shareable = ALIGN_DOWN(GUC_GGTT_TOP, SZ_512M);
+	u64 alignment = pf_get_ggtt_alignment(gt);
+
+	if (admin_only_pf && num_vfs == 1)
+		return ALIGN_DOWN(shareable, alignment);
+
+	/* need to hardcode due to ~512M of GGTT being reserved */
+	if (num_vfs > 56)
+		return SZ_64M - SZ_8M;
+
+	return rounddown_pow_of_two(shareable / num_vfs);
+}
+
 /**
  * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
  * @gt: the &xe_gt (can't be media)
@@ -710,6 +727,7 @@ static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 					unsigned int num_vfs)
 {
+	u64 profile = pf_profile_fair_ggtt(gt, num_vfs);
 	u64 fair;
 
 	xe_gt_assert(gt, vfid);
@@ -723,6 +741,11 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	if (!fair)
 		return -ENOSPC;
 
+	fair = min(fair, profile);
+	if (fair < profile)
+		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
+				 "GGTT", fair, profile);
+
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
-- 
2.47.1

