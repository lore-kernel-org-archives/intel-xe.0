Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D5DC98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBDC10E0F4;
	Fri, 16 Jan 2026 22:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0CKvBVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8210E272
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601574; x=1800137574;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jjRIg+fJBreovb7yAH+fQCUXHWIR50UCq/Lw04hLHDo=;
 b=d0CKvBVAZC6/J5Yqh9SIp6dYRckQK/+44WKbgH/ZZBbIVTpE81VIkS7Z
 6nvOKbHeK32Aa1fEsDOTS+MZA6UaH7VKPHZ7B+PdHCdyqqtUb99ExjE79
 LA377WhHhs744SNN0kp6mgHu7GdPlgAWp3P4px1FWFekbTPTcWfK1ub/W
 +QMK8krZNflN8UOykb6ISE4duJcxgufRpY2LgfPkHlwKyjrqmn+Lgoiyh
 ZgMLeaUj4TOvILtkijx8F02XKsZZBiZMqWnLy/09svyz/1PgDO0n0yYJw
 u+Lt+XNKIl33IXk2kIDyqhhMiIQUhtp8u5ji4XAwK4fMh3mEvqZC9Rvc/ g==;
X-CSE-ConnectionGUID: b2p3ViHFSg2HK9upIsZFJA==
X-CSE-MsgGUID: Yqe0MckbReW2n6/+7X72zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123032"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:53 -0800
X-CSE-ConnectionGUID: DHXvtR4QQOmXvW7C/QCx2A==
X-CSE-MsgGUID: 6gcZjQ2qSHugaYR+S4wTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961827"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:53 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:20 -0300
Subject: [PATCH 12/12] drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-rtp-mcr-check-v1-12-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The type struct xe_reg_mcr exists to ensure that the correct API is used
when handling MCR registers.  However, for in the register save/restore
functionality, the RTP processing always cast the register to a struct
xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr"
field of the register instance.

This allows the developer to commit mistakes like passing a MCR register
for an RTP action for a platform where the respective register is not
MCR; and vice-versa.

To capture such scenarios, do a sanity check in xe_reg_sr_add() and
raise warnings if inconsistencies are detected.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 11 +++++-
 drivers/gpu/drm/xe/xe_gt_mcr.c         | 21 ++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
 drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
 5 files changed, 132 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index d2255a59e58f..80bd83f56d04 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -9,24 +9,30 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_gt_mcr.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 
-#define REGULAR_REG1	XE_REG(1)
-#define REGULAR_REG2	XE_REG(2)
-#define REGULAR_REG3	XE_REG(3)
-#define MCR_REG1	XE_REG_MCR(1)
-#define MCR_REG2	XE_REG_MCR(2)
-#define MCR_REG3	XE_REG_MCR(3)
-#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
+#define REGULAR_REG1		XE_REG(1)
+#define REGULAR_REG2		XE_REG(2)
+#define REGULAR_REG3		XE_REG(3)
+#define REGULAR_REG4		XE_REG(4)
+#define BAD_REGULAR_REG5	XE_REG(5)
+#define MCR_REG1		XE_REG_MCR(1)
+#define MCR_REG2		XE_REG_MCR(2)
+#define MCR_REG3		XE_REG_MCR(3)
+#define BAD_MCR_REG4		XE_REG_MCR(4)
+#define MCR_REG5		XE_REG_MCR(5)
+#define MASKED_REG1		XE_REG(1, XE_REG_OPTION_MASKED)
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
@@ -48,6 +54,23 @@ struct rtp_test_case {
 	const struct xe_rtp_entry *entries;
 };
 
+static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
+{
+	/*
+	 * All supported platforms in this imaginary setup will always have REG4
+	 * as a non-MCR register and REG5 as MCR, meaning that BAD_MCR_REG4 and
+	 * BAD_REGULAR_REG5 represent programming errors to be captured by our
+	 * tests.
+	 */
+	if (reg.raw == BAD_REGULAR_REG5.raw)
+		return true;
+
+	if (reg.raw == BAD_MCR_REG4.raw)
+		return false;
+
+	return reg.mcr;
+}
+
 static bool match_yes(const struct xe_device *xe, const struct xe_gt *gt,
 		      const struct xe_hw_engine *hwe)
 {
@@ -304,6 +327,38 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 			{}
 		},
 	},
+	{
+		.name = "bad-mcr-reg-forced-to-regular",
+		.expected_reg = REGULAR_REG4,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0),
+		.expected_count_sr_entries = 1,
+		.expected_sr_errors = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("bad-mcr-regular-reg"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "bad-regular-reg-forced-to-mcr",
+		.expected_reg = MCR_REG5,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0),
+		.expected_count_sr_entries = 1,
+		.expected_sr_errors = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("bad-regular-reg"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
+			},
+			{}
+		},
+	},
 };
 
 static void xe_rtp_process_to_sr_tests(struct kunit *test)
@@ -522,6 +577,8 @@ static int xe_rtp_test_init(struct kunit *test)
 	xe->drm.dev = dev;
 	test->priv = xe;
 
+	kunit_activate_static_stub(test, xe_gt_mcr_check_reg, fake_xe_gt_mcr_check_reg);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 3311f05a6fc2..326278488cdb 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -13,6 +13,7 @@
 #include "tests/xe_mmio_intercept.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_hw_engine.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
@@ -38,8 +39,10 @@ static int xe_wa_test_init(struct kunit *test)
 {
 	const struct xe_pci_fake_data *param = test->param_value;
 	struct xe_pci_fake_data data = *param;
-	struct xe_device *xe;
 	struct device *dev;
+	struct xe_device *xe;
+	struct xe_gt *gt;
+	int id;
 	int ret;
 
 	dev = drm_kunit_helper_alloc_device(test);
@@ -52,6 +55,12 @@ static int xe_wa_test_init(struct kunit *test)
 	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	/* Needed for sanitize_mcr(). */
+	for_each_gt(gt, xe, id) {
+		xe_gt_mcr_init_early(gt);
+		xe_gt_mmio_init(gt);
+	}
+
 	kunit_activate_static_stub(test,
 				   xe_mmio_intercept_read32,
 				   xe_wa_mmio_intercept_read32);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index e7eb3c6da234..c6d9766b6cc6 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <kunit/static_stub.h>
+
 #include "xe_gt_mcr.h"
 
 #include "regs/xe_gt_regs.h"
@@ -623,6 +625,25 @@ static bool reg_in_steering_type_ranges(struct xe_gt *gt,
 	return false;
 }
 
+/*
+ * xe_gt_mcr_check_reg - check if a register is recognized by this GT as MCR
+ * @gt: GT structure
+ * @reg: The register to check
+ *
+ * Returns true if the register offset falls within one of the MMIO ranges
+ * classified as MCR for the GT.
+ */
+bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_gt_mcr_check_reg, gt, reg);
+
+	for (int type = 0; type <= IMPLICIT_STEERING; type++)
+		if (reg_in_steering_type_ranges(gt, reg, type))
+			return true;
+
+	return false;
+}
+
 /*
  * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
  *    will steer a register to a non-terminated instance
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 283a1c9770e2..d6b50b52b1d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -26,6 +26,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
+bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg);
 bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 					  struct xe_reg_mcr reg_mcr,
 					  u8 *group, u8 *instance);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index d3e13ea33123..89d35301defa 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -68,14 +68,49 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 #endif
 }
 
+static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
+				  const struct xe_reg_sr_entry *e,
+				  struct xe_gt *gt)
+{
+	struct xe_reg reg = e->reg;
+	bool is_mcr;
+
+	/*
+	 * We need the gt structure to check MCR ranges.
+	 */
+	if (!gt)
+		return reg;
+
+	is_mcr = xe_gt_mcr_check_reg(gt, reg);
+
+	if (is_mcr && !reg.mcr) {
+		reg.mcr = 1;
+		xe_gt_warn(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
+			   reg.addr);
+		reg_sr_inc_error(sr);
+	}
+
+	if (!is_mcr && reg.mcr) {
+		reg.mcr = 0;
+		xe_gt_warn(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
+			   reg.addr);
+		reg_sr_inc_error(sr);
+	}
+
+	return reg;
+}
+
 int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  const struct xe_reg_sr_entry *e,
 		  struct xe_gt *gt)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
+	struct xe_reg reg;
 	int ret;
 
+	reg = sanitize_mcr(sr, e, gt);
+
 	if (pentry) {
 		if (!compatible_entries(pentry, e)) {
 			ret = -EINVAL;
@@ -96,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	}
 
 	*pentry = *e;
+	pentry->reg = reg;
 	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
 	if (ret)
 		goto fail;

-- 
2.52.0

