Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2074AC77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFB710EA52;
	Wed, 26 Apr 2023 21:33:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329A10EA52
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544777; x=1714080777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPYXS/hKpsXKVtCRCVZ9wGmX7mBuG4R6vy0oqPoT0XA=;
 b=P4PrNONxwXw2PgZ+rQS//3cGV8ezZ3IsnC+GmM82/V/TgybzU6GSKRNh
 iPA6l/fgyewDwEz+fOOs1x1BYtZFO+3VkGC16OJJgAgDkRZJb6eOAcAAD
 T8Kfv0GQXcaRlp9to4zuXBLTNOKbl7Fd5K13STtFy6/D/gfFieuD21Uvd
 pCt10PamcvN5oxznGOsFFVMVlZvBy8fgU1qtrB+IKFiAXtqh3iIDQQMtr
 2CjPIPnK5N8I/8xDGTwBzjRFj7p7Wy2/bKkwv+tmqPsM9rERq1YihZpeS
 j63Gfho2D3S6J8tsoj/EBMaH5X9942czMyM8rv+JrBXbchc1WPmLgkz7/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213101"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213101"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415201"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415201"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:41 -0700
Message-Id: <20230426213242.1315119-17-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 16/17] drm/xe: Plumb xe_reg into WAs, rtp, etc
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that struct xe_reg and struct xe_reg_mcr are types that can be used
by xe, convert more of the driver to use them. Some notes about the
conversions:

	- The RTP tables don't need the MASKED flags anymore in the
	  actions as that information now comes from the register
	  definition

	- There is no need for the _XE_RTP_REG/_XE_RTP_REG_MCR macros an
	  the register types on RTP infra: that comes from the register
	  definitions.

	- When declaring the RTP entries, there is no need anymore to
	  undef XE_REG and friends: the RTP macros deal with removing
	  the cast where needed due to not being able to use a compound
	  statement for initialization in the tables

	- The index in the reg-sr xarray is the register offset only.
	  Otherwise we wouldn't catch mistakes about adding both a
	  MCR-style and normal-style registers. For that, the register
	  is now also part of the entry, so the options can be compared
	  to check for compatible entries.

xe_mmio_* still need to be converted, from u32 to xe_reg, but that is
left for another change.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  41 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c        |   2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c         |  51 ++++++----
 drivers/gpu/drm/xe/xe_reg_sr.h         |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h   |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |   4 +-
 drivers/gpu/drm/xe/xe_rtp.c            |   7 +-
 drivers/gpu/drm/xe/xe_rtp.h            |  42 ++++----
 drivers/gpu/drm/xe/xe_rtp_types.h      |  22 ++--
 drivers/gpu/drm/xe/xe_tuning.c         |   7 +-
 drivers/gpu/drm/xe/xe_wa.c             | 134 ++++++++-----------------
 11 files changed, 129 insertions(+), 194 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 51d215f08113..ad2fe8a39a78 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -18,25 +18,21 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 
-#undef XE_REG
-#undef XE_REG_MCR
-#define XE_REG(x, ...)		_XE_RTP_REG(x)
-#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
-
 #define REGULAR_REG1	XE_REG(1)
 #define REGULAR_REG2	XE_REG(2)
 #define REGULAR_REG3	XE_REG(3)
 #define MCR_REG1	XE_REG_MCR(1)
 #define MCR_REG2	XE_REG_MCR(2)
 #define MCR_REG3	XE_REG_MCR(3)
+#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
+
+#undef XE_REG_MCR
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
 struct rtp_test_case {
 	const char *name;
-	struct {
-		u32 offset;
-		u32 type;
-	} expected_reg;
-        u32 expected_set_bits;
+	struct xe_reg expected_reg;
+	u32 expected_set_bits;
 	u32 expected_clr_bits;
 	unsigned long expected_count;
 	unsigned int expected_sr_errors;
@@ -56,7 +52,7 @@ static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
 static const struct rtp_test_case cases[] = {
 	{
 		.name = "coalesce-same-reg",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
 		.expected_count = 1,
@@ -75,7 +71,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "no-match-no-add",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
@@ -94,7 +90,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "no-match-no-add-multiple-rules",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
@@ -113,7 +109,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "two-regs-two-entries",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 2,
@@ -132,7 +128,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "clr-one-set-other",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
 		.expected_count = 1,
@@ -153,7 +149,7 @@ static const struct rtp_test_case cases[] = {
 #define TEMP_MASK	REG_GENMASK(10, 8)
 #define TEMP_FIELD	REG_FIELD_PREP(TEMP_MASK, 2)
 		.name = "set-field",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = TEMP_FIELD,
 		.expected_clr_bits = TEMP_MASK,
 		.expected_count = 1,
@@ -171,7 +167,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "conflict-duplicate",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
@@ -191,7 +187,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "conflict-not-disjoint",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
@@ -211,7 +207,7 @@ static const struct rtp_test_case cases[] = {
 	},
 	{
 		.name = "conflict-reg-type",
-		.expected_reg = { REGULAR_REG1 },
+		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
@@ -229,8 +225,7 @@ static const struct rtp_test_case cases[] = {
 			/* drop: regular vs masked */
 			{ XE_RTP_NAME("basic-3"),
 			  XE_RTP_RULES(FUNC(match_yes)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0),
-					     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			  XE_RTP_ACTIONS(SET(MASKED_REG1, REG_BIT(0)))
 			},
 			{}
 		},
@@ -249,7 +244,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
-		if (idx == param->expected_reg.offset)
+		if (idx == param->expected_reg.reg)
 			sr_entry = sre;
 
 		count++;
@@ -258,7 +253,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, count, param->expected_count);
 	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
 	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
-	KUNIT_EXPECT_EQ(test, sr_entry->reg_type, param->expected_reg.type);
+	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6a723bda2aa9..676137dcb510 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -461,7 +461,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 	BUILD_BUG_ON(ARRAY_SIZE(extra_regs) > ADS_REGSET_EXTRA_MAX);
 
 	xa_for_each(&hwe->reg_sr.xa, idx, entry) {
-		u32 flags = entry->masked_reg ? GUC_REGSET_MASKED : 0;
+		u32 flags = entry->reg.masked ? GUC_REGSET_MASKED : 0;
 
 		guc_mmio_regset_write_one(ads, regset_map, idx, flags, count++);
 	}
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 1e792ec8239b..801f211fb733 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -77,10 +77,7 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
 	    e1->clr_bits & e2->set_bits || e1->set_bits & e2->clr_bits)
 		return false;
 
-	if (e1->masked_reg != e2->masked_reg)
-		return false;
-
-	if (e1->reg_type != e2->reg_type)
+	if (e1->reg.raw != e2->reg.raw)
 		return false;
 
 	return true;
@@ -93,10 +90,10 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 #endif
 }
 
-int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
+int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  const struct xe_reg_sr_entry *e)
 {
-	unsigned long idx = reg;
+	unsigned long idx = e->reg.reg;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
 	int ret;
 
@@ -127,18 +124,30 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
 	return 0;
 
 fail:
-	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
+	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
 		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->masked_reg), ret);
+		  str_yes_no(e->reg.masked),
+		  str_yes_no(e->reg.mcr),
+		  ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
 }
 
-static void apply_one_mmio(struct xe_gt *gt, u32 reg,
-			   struct xe_reg_sr_entry *entry)
+/*
+ * Convert back from encoded value to type-safe, only to be used when reg.mcr
+ * is true
+ */
+static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
+{
+	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
+}
+
+static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_reg reg = entry->reg;
+	struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
 	u32 val;
 
 	/*
@@ -149,12 +158,12 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
 	 * When it's not masked, we have to read it from hardware, unless we are
 	 * supposed to set all bits.
 	 */
-	if (entry->masked_reg)
+	if (reg.masked)
 		val = (entry->clr_bits ?: entry->set_bits) << 16;
 	else if (entry->clr_bits + 1)
-		val = (entry->reg_type == XE_RTP_REG_MCR ?
-		       xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(reg)) :
-		       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
+		val = (reg.mcr ?
+		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
+		       xe_mmio_read32(gt, reg.reg)) & (~entry->clr_bits);
 	else
 		val = 0;
 
@@ -165,12 +174,12 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
 	 */
 	val |= entry->set_bits;
 
-	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg, val);
+	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.reg, val);
 
-	if (entry->reg_type == XE_RTP_REG_MCR)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(reg), val);
+	if (entry->reg.mcr)
+		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
 	else
-		xe_mmio_write32(gt, reg, val);
+		xe_mmio_write32(gt, reg.reg, val);
 }
 
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
@@ -190,7 +199,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 		goto err_force_wake;
 
 	xa_for_each(&sr->xa, reg, entry)
-		apply_one_mmio(gt, reg, entry);
+		apply_one_mmio(gt, entry);
 
 	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
@@ -259,6 +268,6 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
 	xa_for_each(&sr->xa, reg, entry)
 		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
 			   reg, entry->clr_bits, entry->set_bits,
-			   str_yes_no(entry->masked_reg),
-			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
+			   str_yes_no(entry->reg.masked),
+			   str_yes_no(entry->reg.mcr));
 }
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 3af369089faa..0bfe66ea29bf 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -19,8 +19,7 @@ struct drm_printer;
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
-int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
-		  const struct xe_reg_sr_entry *e);
+int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 			       struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index 91469784fd90..ad48a52b824a 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -9,18 +9,14 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
+#include "regs/xe_reg_defs.h"
+
 struct xe_reg_sr_entry {
+	struct xe_reg	reg;
 	u32		clr_bits;
 	u32		set_bits;
 	/* Mask for bits to consider when reading value back */
 	u32		read_mask;
-	/*
-	 * "Masked registers" are marked in spec as register with the upper 16
-	 * bits as a mask for the bits that is being updated on the lower 16
-	 * bits when writing to it.
-	 */
-	u8		masked_reg;
-	u8		reg_type;
 };
 
 struct xe_reg_sr {
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 310d5dfe30d5..7a2bb60ebd85 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -11,10 +11,8 @@
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
 
-#undef XE_REG
 #undef XE_REG_MCR
-#define XE_REG(x, ...)		_XE_RTP_REG(x)
-#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
 static bool match_not_render(const struct xe_gt *gt,
 			     const struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 20acd43cb60b..f2a0e8eb4936 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -94,16 +94,15 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 			     u32 mmio_base,
 			     struct xe_reg_sr *sr)
 {
-	u32 reg = action->reg + mmio_base;
 	struct xe_reg_sr_entry sr_entry = {
+		.reg = action->reg,
 		.clr_bits = action->clr_bits,
 		.set_bits = action->set_bits,
 		.read_mask = action->read_mask,
-		.masked_reg = action->flags & XE_RTP_ACTION_FLAG_MASKED_REG,
-		.reg_type = action->reg_type,
 	};
 
-	xe_reg_sr_add(sr, reg, &sr_entry);
+	sr_entry.reg.reg += mmio_base;
+	xe_reg_sr_add(sr, &sr_entry);
 }
 
 static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 0139dd4d1cd7..4a333b9792ac 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -231,7 +231,6 @@ struct xe_reg_sr;
  * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
  *                    the bits
  * @reg_: Register
- * @reg_type_: Register type - automatically expanded by XE_REG
  * @val_: Value to set
  * @...: Additional fields to override in the struct xe_rtp_action entry
  *
@@ -239,15 +238,14 @@ struct xe_reg_sr;
  *
  *	REGNAME = VALUE
  */
-#define XE_RTP_ACTION_WR(reg_, reg_type_, val_, ...)				\
-	{ .reg = (reg_), .reg_type = (reg_type_),				\
+#define XE_RTP_ACTION_WR(reg_, val_, ...)					\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
 	  .clr_bits = ~0u, .set_bits = (val_),					\
 	  .read_mask = (~0u), ##__VA_ARGS__ }
 
 /**
  * XE_RTP_ACTION_SET - Set bits from @val_ in the register.
  * @reg_: Register
- * @reg_type_: Register type - automatically expanded by XE_REG
  * @val_: Bits to set in the register
  * @...: Additional fields to override in the struct xe_rtp_action entry
  *
@@ -258,15 +256,14 @@ struct xe_reg_sr;
  *	REGNAME[2] = 1
  *	REGNAME[5] = 1
  */
-#define XE_RTP_ACTION_SET(reg_, reg_type_, val_, ...)				\
-	{ .reg = (reg_), .reg_type = (reg_type_),				\
-	  .clr_bits = (val_), .set_bits = (val_),				\
-	  .read_mask = (val_), ##__VA_ARGS__ }
+#define XE_RTP_ACTION_SET(reg_, val_, ...)					\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = val_, .set_bits = val_,					\
+	  .read_mask = val_, ##__VA_ARGS__ }
 
 /**
  * XE_RTP_ACTION_CLR: Clear bits from @val_ in the register.
  * @reg_: Register
- * @reg_type_: Register type - automatically expanded by XE_REG
  * @val_: Bits to clear in the register
  * @...: Additional fields to override in the struct xe_rtp_action entry
  *
@@ -277,15 +274,14 @@ struct xe_reg_sr;
  *	REGNAME[2] = 0
  *	REGNAME[5] = 0
  */
-#define XE_RTP_ACTION_CLR(reg_, reg_type_, val_, ...)				\
-	{ .reg = (reg_), .reg_type = (reg_type_),				\
-	  .clr_bits = (val_), .set_bits = 0,					\
-	  .read_mask = (val_), ##__VA_ARGS__ }
+#define XE_RTP_ACTION_CLR(reg_, val_, ...)					\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = val_, .set_bits = 0,					\
+	  .read_mask = val_, ##__VA_ARGS__ }
 
 /**
  * XE_RTP_ACTION_FIELD_SET: Set a bit range
  * @reg_: Register
- * @reg_type_: Register type - automatically expanded by XE_REG
  * @mask_bits_: Mask of bits to be changed in the register, forming a field
  * @val_: Value to set in the field denoted by @mask_bits_
  * @...: Additional fields to override in the struct xe_rtp_action entry
@@ -295,29 +291,29 @@ struct xe_reg_sr;
  *
  *	REGNAME[<end>:<start>] = VALUE
  */
-#define XE_RTP_ACTION_FIELD_SET(reg_, reg_type_, mask_bits_, val_, ...)		\
-	{ .reg = (reg_), .reg_type = (reg_type_),				\
-	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
-	  .read_mask = (mask_bits_), ##__VA_ARGS__ }
+#define XE_RTP_ACTION_FIELD_SET(reg_, mask_bits_, val_, ...)			\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = mask_bits_, .set_bits = val_,				\
+	  .read_mask = mask_bits_, ##__VA_ARGS__ }
 
-#define XE_RTP_ACTION_FIELD_SET_NO_READ_MASK(reg_, reg_type_, mask_bits_, val_, ...)	\
-	{ .reg = (reg_), .reg_type = (reg_type_),				\
+#define XE_RTP_ACTION_FIELD_SET_NO_READ_MASK(reg_, mask_bits_, val_, ...)	\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
 	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
 	  .read_mask = 0, ##__VA_ARGS__ }
 
 /**
  * XE_RTP_ACTION_WHITELIST - Add register to userspace whitelist
  * @reg_: Register
- * @reg_type_: Register type - automatically expanded by XE_REG
  * @val_: Whitelist-specific flags to set
  * @...: Additional fields to override in the struct xe_rtp_action entry
  *
  * Add a register to the whitelist, allowing userspace to modify the ster with
  * regular user privileges.
  */
-#define XE_RTP_ACTION_WHITELIST(reg_, reg_type_, val_, ...)			\
+#define XE_RTP_ACTION_WHITELIST(reg_, val_, ...)				\
 	/* TODO fail build if ((flags) & ~(RING_FORCE_TO_NONPRIV_MASK_VALID)) */\
-	{ .reg = (reg_), .reg_type = (reg_type_), .set_bits = (val_),		\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .set_bits = val_,							\
 	  .clr_bits = RING_FORCE_TO_NONPRIV_MASK_VALID,				\
 	  ##__VA_ARGS__ }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index e87f1b280d96..12df8a9e9c45 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -8,14 +8,11 @@
 
 #include <linux/types.h>
 
+#include "regs/xe_reg_defs.h"
+
 struct xe_hw_engine;
 struct xe_gt;
 
-enum {
-	XE_RTP_REG_REGULAR,
-	XE_RTP_REG_MCR,
-};
-
 /**
  * struct xe_rtp_action - action to take for any matching rule
  *
@@ -24,20 +21,17 @@ enum {
  */
 struct xe_rtp_action {
 	/** @reg: Register */
-	u32		reg;
+	struct xe_reg		reg;
 	/** @clr_bits: bits to clear when updating register */
-	u32		clr_bits;
+	u32			clr_bits;
 	/** @set_bits: bits to set when updating register */
-	u32		set_bits;
+	u32			set_bits;
 #define XE_RTP_NOCHECK		.read_mask = 0
 	/** @read_mask: mask for bits to consider when reading value back */
-	u32		read_mask;
-#define XE_RTP_ACTION_FLAG_MASKED_REG		BIT(0)
-#define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(1)
+	u32			read_mask;
+#define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
 	/** @flags: flags to apply on rule evaluation or action */
-	u8		flags;
-	/** @reg_type: register type, see ``XE_RTP_REG_*`` */
-	u8		reg_type;
+	u8			flags;
 };
 
 enum {
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index f6eefa951175..5fc6a408429b 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -12,10 +12,8 @@
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
 
-#undef XE_REG
 #undef XE_REG_MCR
-#define XE_REG(x, ...)		_XE_RTP_REG(x)
-#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
 static const struct xe_rtp_entry gt_tunings[] = {
 	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
@@ -54,8 +52,7 @@ static const struct xe_rtp_entry lrc_tunings[] = {
 	},
 	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index ed3fa51ccd24..b0bb2f4438f4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -87,10 +87,8 @@
  *    a more declarative approach rather than procedural.
  */
 
-#undef XE_REG
 #undef XE_REG_MCR
-#define XE_REG(x, ...)		_XE_RTP_REG(x)
-#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
@@ -232,8 +230,7 @@ static const struct xe_rtp_entry gt_was[] = {
 	},
 	{ XE_RTP_NAME("16016694945"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
-	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))
 	},
 	{}
 };
@@ -248,36 +245,30 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
 		       ENGINE_CLASS(RENDER),
 		       IS_INTEGRATED),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, PUSH_CONST_DEREF_HOLD_DIS,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, PUSH_CONST_DEREF_HOLD_DIS))
 	},
 	{ XE_RTP_NAME("14010229206, 1409085225"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
 		       ENGINE_CLASS(RENDER),
 		       IS_INTEGRATED),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
 	{ XE_RTP_NAME("1606931601"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ))
 	},
 	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021, 18019627453"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE))
 	},
 	{ XE_RTP_NAME("1406941453"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL))
 	},
 	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1,
-			     FFSC_PERCTX_PREEMPT_CTRL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     FFSC_PERCTX_PREEMPT_CTRL))
 	},
 
 	/* TGL */
@@ -286,8 +277,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
 			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
-			     RC_SEMA_IDLE_MSG_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     RC_SEMA_IDLE_MSG_DISABLE))
 	},
 
 	/* RKL */
@@ -296,8 +286,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
 			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
-			     RC_SEMA_IDLE_MSG_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     RC_SEMA_IDLE_MSG_DISABLE))
 	},
 
 	/* ADL-P */
@@ -306,8 +295,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(ALDERLAKE_P), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
 			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
-			     RC_SEMA_IDLE_MSG_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     RC_SEMA_IDLE_MSG_DISABLE))
 	},
 
 	/* DG2 */
@@ -324,8 +312,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	{ XE_RTP_NAME("18017747507"),
 	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
-			     POLYGON_TRIFAN_LINELOOP_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     POLYGON_TRIFAN_LINELOOP_DISABLE))
 	},
 	{ XE_RTP_NAME("22012826095, 22013059131"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
@@ -366,15 +353,13 @@ static const struct xe_rtp_entry engine_was[] = {
 	{ XE_RTP_NAME("14015227452"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
 	{ XE_RTP_NAME("16015675438"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
-			     PERF_FIX_BALANCING_CFE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("16011620976, 22015475538"),
 	  XE_RTP_RULES(PLATFORM(DG2),
@@ -385,7 +370,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
-			     XE_RTP_ACTION_FLAG(MASKED_REG),
 			     /*
 			      * Register can't be read back for verification on
 			      * DG2 due to Wa_14012342262
@@ -396,7 +380,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
-			     XE_RTP_ACTION_FLAG(MASKED_REG),
 			     /*
 			      * Register can't be read back for verification on
 			      * DG2 due to Wa_14012342262
@@ -405,55 +388,46 @@ static const struct xe_rtp_entry engine_was[] = {
 	},
 	{ XE_RTP_NAME("1509727124"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB))
 	},
 	{ XE_RTP_NAME("22012856258"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
 	},
 	{ XE_RTP_NAME("14013392000"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
 	},
 	{ XE_RTP_NAME("14012419201"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
 	},
 	{ XE_RTP_NAME("14012419201"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
 	},
 	{ XE_RTP_NAME("1308578152"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
 		       FUNC(xe_rtp_match_first_gslice_fused_off)),
 	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
-			     REPLAY_MODE_GRANULARITY,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     REPLAY_MODE_GRANULARITY))
 	},
 	{ XE_RTP_NAME("22010960976, 14013347512"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
-			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK))
 	},
 	{ XE_RTP_NAME("1608949956, 14010198302"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN,
-			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
 	},
 	{ XE_RTP_NAME("22010430635"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_GRF_CLEAR,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DISABLE_GRF_CLEAR))
 	},
 	{ XE_RTP_NAME("14013202645"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
@@ -466,21 +440,18 @@ static const struct xe_rtp_entry engine_was[] = {
 	{ XE_RTP_NAME("22012532006"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
-			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
 	},
 	{ XE_RTP_NAME("22012532006"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
-			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
 	},
 	{ XE_RTP_NAME("22014600077"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
 			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     XE_RTP_ACTION_FLAG(MASKED_REG),
 			     /* 
 			      * Wa_14012342262 write-only reg, so skip
 			      * verification
@@ -491,7 +462,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
 			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     XE_RTP_ACTION_FLAG(MASKED_REG),
 			     /* 
 			      * Wa_14012342262 write-only reg, so skip
 			      * verification
@@ -507,18 +477,15 @@ static const struct xe_rtp_entry engine_was[] = {
 	},
 	{ XE_RTP_NAME("14015227452"),
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
 	{ XE_RTP_NAME("16015675438"),
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("14014999345"),
 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
 	},
 	{}
 };
@@ -527,25 +494,21 @@ static const struct xe_rtp_entry lrc_was[] = {
 	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
-			     DISABLE_CPS_AWARE_COLOR_PIPE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DISABLE_CPS_AWARE_COLOR_PIPE))
 	},
 	{ XE_RTP_NAME("WaDisableGPGPUMidThreadPreemption"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1,
 				   PREEMPT_GPGPU_LEVEL_MASK,
-				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
-				   XE_RTP_ACTION_FLAG(MASKED_REG)))
+				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL))
 	},
 	{ XE_RTP_NAME("1806527549"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
-	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE))
 	},
 	{ XE_RTP_NAME("1606376872"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
 	},
 
 	/* DG1 */
@@ -553,65 +516,54 @@ static const struct xe_rtp_entry lrc_was[] = {
 	{ XE_RTP_NAME("1409044764"),
 	  XE_RTP_RULES(PLATFORM(DG1)),
 	  XE_RTP_ACTIONS(CLR(COMMON_SLICE_CHICKEN3,
-			     DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN))
 	},
 	{ XE_RTP_NAME("22010493298"),
 	  XE_RTP_RULES(PLATFORM(DG1)),
 	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN,
-			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE))
 	},
 
 	/* DG2 */
 
 	{ XE_RTP_NAME("16011186671"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
-	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH,
-			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG),
-			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE,
-			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG))
+	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
+			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
 	},
 	{ XE_RTP_NAME("14010469329"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
-			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
 	},
 	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
-			     DISABLE_CPS_AWARE_COLOR_PIPE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     DISABLE_CPS_AWARE_COLOR_PIPE))
 	},
 	{ XE_RTP_NAME("16013271637"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
-			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE))
 	},
 	{ XE_RTP_NAME("14014947963"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(FIELD_SET(VF_PREEMPTION,
 				   PREEMPTION_VERTEX_COUNT,
-				   0x4000,
-				   XE_RTP_ACTION_FLAG(MASKED_REG)))
+				   0x4000))
 	},
 	{ XE_RTP_NAME("18018764978"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
-			     SCOREBOARD_STALL_FLUSH_CONTROL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			     SCOREBOARD_STALL_FLUSH_CONTROL))
 	},
 	{ XE_RTP_NAME("15010599737"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
 	},
 	{ XE_RTP_NAME("18019271663"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
 	{}
 };
-- 
2.40.1

