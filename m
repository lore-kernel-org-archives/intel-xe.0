Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B384EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909510E2D0;
	Tue,  4 Jul 2023 15:33:05 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4C410E2D0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484782; x=1720020782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iR0EFUVPvAe8H8JU/49Ls5edTwgVyIrkigMuRvur3x4=;
 b=Flsn5MSAWn1SxDa0dKNCY5myK26UsYOkL24ms0coTJZrTim1g0oH0jHL
 mqCG+PzEIAaIXnVjZiMYm5zZSZVn3xd82e/XcPrWQyJeh41dgx6/ikmEW
 yF1Nmr+/CJaYURwcXSO3dqsShdEFEHE2EJImZugI+P/rk6dMmMk0lRO52
 98mHMH90JXdGR9KIj97+NDPaTt7XV/nOuFwqvzS0yBcRExOEjgmouxjhd
 DVKg60VFGZd/Ok3dGolkRlQHx3iwb8vMKp0vXFxQAaYfejgofkiN/33aH
 jt8NJg4kt9Wmto9w9iDQP/Zb4BuGqsjp/aBOmLjXPpkDO9PkuNaRyAPyN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343480175"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="343480175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712913918"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="712913918"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:33:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 18:32:42 +0300
Message-Id: <20230704153243.2489821-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
References: <20230704153243.2489821-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use soc/intel_dram.[ch] from i915 instead of copy-paste.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  10 +-
 .../drm/xe/compat-i915-headers/intel_uncore.h |   8 +
 .../xe/compat-i915-headers/soc/intel_dram.h   |   1 +
 drivers/gpu/drm/xe/display/ext/intel_dram.c   | 496 ------------------
 drivers/gpu/drm/xe/display/ext/intel_dram.h   |  14 -
 drivers/gpu/drm/xe/xe_device_types.h          |   7 +
 drivers/gpu/drm/xe/xe_display.c               |   2 +-
 7 files changed, 26 insertions(+), 512 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3f95a1147b50..054cfdbd30bd 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -126,6 +126,11 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
 
+# Rule to build SOC code shared with i915
+$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
 # Rule to build display code shared with i915
 $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
 	$(call cmd,force_checksrc)
@@ -141,9 +146,12 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/ext/i915_irq.o \
 	display/ext/intel_clock_gating.o \
 	display/ext/intel_device_info.o \
-	display/ext/intel_dram.o \
 	display/ext/intel_pch.o
 
+# SOC code shared with i915
+xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	i915-soc/intel_dram.o
+
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/icl_dsi.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index a46dca558366..ec2d4885bff0 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -33,6 +33,14 @@ static inline u32 intel_uncore_read8(struct intel_uncore *uncore,
 	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
 }
 
+static inline u32 intel_uncore_read16(struct intel_uncore *uncore,
+				      i915_reg_t i915_reg)
+{
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
+}
+
 static inline u64
 intel_uncore_read64_2x32(struct intel_uncore *uncore,
 			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
new file mode 100644
index 000000000000..1532ca7e0af6
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
@@ -0,0 +1 @@
+#include "../../../i915/soc/intel_dram.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
deleted file mode 100644
index 3e8c413280a5..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ /dev/null
@@ -1,496 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include <linux/string_helpers.h>
-
-#include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
-#include "intel_dram.h"
-#include "intel_mchbar_regs.h"
-#include "intel_pcode.h"
-
-struct dram_dimm_info {
-	u16 size;
-	u8 width, ranks;
-};
-
-struct dram_channel_info {
-	struct dram_dimm_info dimm_l, dimm_s;
-	u8 ranks;
-	bool is_16gb_dimm;
-};
-
-#define DRAM_TYPE_STR(type) [INTEL_DRAM_ ## type] = #type
-
-static const char *intel_dram_type_str(enum intel_dram_type type)
-{
-	static const char * const str[] = {
-		DRAM_TYPE_STR(UNKNOWN),
-		DRAM_TYPE_STR(DDR3),
-		DRAM_TYPE_STR(DDR4),
-		DRAM_TYPE_STR(LPDDR3),
-		DRAM_TYPE_STR(LPDDR4),
-	};
-
-	if (type >= ARRAY_SIZE(str))
-		type = INTEL_DRAM_UNKNOWN;
-
-	return str[type];
-}
-
-#undef DRAM_TYPE_STR
-
-static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
-{
-	return dimm->ranks * 64 / (dimm->width ?: 1);
-}
-
-/* Returns total Gb for the whole DIMM */
-static int skl_get_dimm_size(u16 val)
-{
-	return (val & SKL_DRAM_SIZE_MASK) * 8;
-}
-
-static int skl_get_dimm_width(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val & SKL_DRAM_WIDTH_MASK) {
-	case SKL_DRAM_WIDTH_X8:
-	case SKL_DRAM_WIDTH_X16:
-	case SKL_DRAM_WIDTH_X32:
-		val = (val & SKL_DRAM_WIDTH_MASK) >> SKL_DRAM_WIDTH_SHIFT;
-		return 8 << val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int skl_get_dimm_ranks(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val & SKL_DRAM_RANK_MASK) >> SKL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-/* Returns total Gb for the whole DIMM */
-static int icl_get_dimm_size(u16 val)
-{
-	return (val & ICL_DRAM_SIZE_MASK) * 8 / 2;
-}
-
-static int icl_get_dimm_width(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val & ICL_DRAM_WIDTH_MASK) {
-	case ICL_DRAM_WIDTH_X8:
-	case ICL_DRAM_WIDTH_X16:
-	case ICL_DRAM_WIDTH_X32:
-		val = (val & ICL_DRAM_WIDTH_MASK) >> ICL_DRAM_WIDTH_SHIFT;
-		return 8 << val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int icl_get_dimm_ranks(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val & ICL_DRAM_RANK_MASK) >> ICL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-static bool
-skl_is_16gb_dimm(const struct dram_dimm_info *dimm)
-{
-	/* Convert total Gb to Gb per DRAM device */
-	return dimm->size / (intel_dimm_num_devices(dimm) ?: 1) == 16;
-}
-
-static void
-skl_dram_get_dimm_info(struct drm_i915_private *i915,
-		       struct dram_dimm_info *dimm,
-		       int channel, char dimm_name, u16 val)
-{
-	if (GRAPHICS_VER(i915) >= 11) {
-		dimm->size = icl_get_dimm_size(val);
-		dimm->width = icl_get_dimm_width(val);
-		dimm->ranks = icl_get_dimm_ranks(val);
-	} else {
-		dimm->size = skl_get_dimm_size(val);
-		dimm->width = skl_get_dimm_width(val);
-		dimm->ranks = skl_get_dimm_ranks(val);
-	}
-
-	drm_dbg_kms(&i915->drm,
-		    "CH%u DIMM %c size: %u Gb, width: X%u, ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, dimm_name, dimm->size, dimm->width, dimm->ranks,
-		    str_yes_no(skl_is_16gb_dimm(dimm)));
-}
-
-static int
-skl_dram_get_channel_info(struct drm_i915_private *i915,
-			  struct dram_channel_info *ch,
-			  int channel, u32 val)
-{
-	skl_dram_get_dimm_info(i915, &ch->dimm_l,
-			       channel, 'L', val & 0xffff);
-	skl_dram_get_dimm_info(i915, &ch->dimm_s,
-			       channel, 'S', val >> 16);
-
-	if (ch->dimm_l.size == 0 && ch->dimm_s.size == 0) {
-		drm_dbg_kms(&i915->drm, "CH%u not populated\n", channel);
-		return -EINVAL;
-	}
-
-	if (ch->dimm_l.ranks == 2 || ch->dimm_s.ranks == 2)
-		ch->ranks = 2;
-	else if (ch->dimm_l.ranks == 1 && ch->dimm_s.ranks == 1)
-		ch->ranks = 2;
-	else
-		ch->ranks = 1;
-
-	ch->is_16gb_dimm = skl_is_16gb_dimm(&ch->dimm_l) ||
-		skl_is_16gb_dimm(&ch->dimm_s);
-
-	drm_dbg_kms(&i915->drm, "CH%u ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, ch->ranks, str_yes_no(ch->is_16gb_dimm));
-
-	return 0;
-}
-
-static bool
-intel_is_dram_symmetric(const struct dram_channel_info *ch0,
-			const struct dram_channel_info *ch1)
-{
-	return !memcmp(ch0, ch1, sizeof(*ch0)) &&
-		(ch0->dimm_s.size == 0 ||
-		 !memcmp(&ch0->dimm_l, &ch0->dimm_s, sizeof(ch0->dimm_l)));
-}
-
-static int
-skl_dram_get_channels_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	struct dram_channel_info ch0 = {}, ch1 = {};
-	u32 val;
-	int ret;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &ch0, 0, val);
-	if (ret == 0)
-		dram_info->num_channels++;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &ch1, 1, val);
-	if (ret == 0)
-		dram_info->num_channels++;
-
-	if (dram_info->num_channels == 0) {
-		drm_info(&i915->drm, "Number of memory channels is zero\n");
-		return -EINVAL;
-	}
-
-	if (ch0.ranks == 0 && ch1.ranks == 0) {
-		drm_info(&i915->drm, "couldn't get memory rank information\n");
-		return -EINVAL;
-	}
-
-	dram_info->wm_lv_0_adjust_needed = ch0.is_16gb_dimm || ch1.is_16gb_dimm;
-
-	dram_info->symmetric_memory = intel_is_dram_symmetric(&ch0, &ch1);
-
-	drm_dbg_kms(&i915->drm, "Memory configuration is symmetric? %s\n",
-		    str_yes_no(dram_info->symmetric_memory));
-
-	return 0;
-}
-
-static enum intel_dram_type
-skl_get_dram_type(struct drm_i915_private *i915)
-{
-	u32 val;
-
-	val = intel_de_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
-
-	switch (val & SKL_DRAM_DDR_TYPE_MASK) {
-	case SKL_DRAM_DDR_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case SKL_DRAM_DDR_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case SKL_DRAM_DDR_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case SKL_DRAM_DDR_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static int
-skl_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	int ret;
-
-	dram_info->type = skl_get_dram_type(i915);
-	drm_dbg_kms(&i915->drm, "DRAM type: %s\n",
-		    intel_dram_type_str(dram_info->type));
-
-	ret = skl_dram_get_channels_info(i915);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/* Returns Gb per DRAM device */
-static int bxt_get_dimm_size(u32 val)
-{
-	switch (val & BXT_DRAM_SIZE_MASK) {
-	case BXT_DRAM_SIZE_4GBIT:
-		return 4;
-	case BXT_DRAM_SIZE_6GBIT:
-		return 6;
-	case BXT_DRAM_SIZE_8GBIT:
-		return 8;
-	case BXT_DRAM_SIZE_12GBIT:
-		return 12;
-	case BXT_DRAM_SIZE_16GBIT:
-		return 16;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int bxt_get_dimm_width(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	val = (val & BXT_DRAM_WIDTH_MASK) >> BXT_DRAM_WIDTH_SHIFT;
-
-	return 8 << val;
-}
-
-static int bxt_get_dimm_ranks(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	switch (val & BXT_DRAM_RANK_MASK) {
-	case BXT_DRAM_RANK_SINGLE:
-		return 1;
-	case BXT_DRAM_RANK_DUAL:
-		return 2;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static enum intel_dram_type bxt_get_dimm_type(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return INTEL_DRAM_UNKNOWN;
-
-	switch (val & BXT_DRAM_TYPE_MASK) {
-	case BXT_DRAM_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case BXT_DRAM_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case BXT_DRAM_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case BXT_DRAM_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static void bxt_get_dimm_info(struct dram_dimm_info *dimm, u32 val)
-{
-	dimm->width = bxt_get_dimm_width(val);
-	dimm->ranks = bxt_get_dimm_ranks(val);
-
-	/*
-	 * Size in register is Gb per DRAM device. Convert to total
-	 * Gb to match the way we report this for non-LP platforms.
-	 */
-	dimm->size = bxt_get_dimm_size(val) * intel_dimm_num_devices(dimm);
-}
-
-static int bxt_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	u32 val;
-	u8 valid_ranks = 0;
-	int i;
-
-	/*
-	 * Now read each DUNIT8/9/10/11 to check the rank of each dimms.
-	 */
-	for (i = BXT_D_CR_DRP0_DUNIT_START; i <= BXT_D_CR_DRP0_DUNIT_END; i++) {
-		struct dram_dimm_info dimm;
-		enum intel_dram_type type;
-
-		val = intel_de_read(i915, BXT_D_CR_DRP0_DUNIT(i));
-		if (val == 0xFFFFFFFF)
-			continue;
-
-		dram_info->num_channels++;
-
-		bxt_get_dimm_info(&dimm, val);
-		type = bxt_get_dimm_type(val);
-
-		drm_WARN_ON(&i915->drm, type != INTEL_DRAM_UNKNOWN &&
-			    dram_info->type != INTEL_DRAM_UNKNOWN &&
-			    dram_info->type != type);
-
-		drm_dbg_kms(&i915->drm,
-			    "CH%u DIMM size: %u Gb, width: X%u, ranks: %u, type: %s\n",
-			    i - BXT_D_CR_DRP0_DUNIT_START,
-			    dimm.size, dimm.width, dimm.ranks,
-			    intel_dram_type_str(type));
-
-		if (valid_ranks == 0)
-			valid_ranks = dimm.ranks;
-
-		if (type != INTEL_DRAM_UNKNOWN)
-			dram_info->type = type;
-	}
-
-	if (dram_info->type == INTEL_DRAM_UNKNOWN || valid_ranks == 0) {
-		drm_info(&i915->drm, "couldn't get memory information\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
-{
-	struct dram_info *dram_info = &dev_priv->dram_info;
-	u32 val = 0;
-	int ret;
-
-	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
-	if (ret)
-		return ret;
-
-	if (GRAPHICS_VER(dev_priv) >= 12) {
-		switch (val & 0xf) {
-		case 0:
-			dram_info->type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info->type = INTEL_DRAM_DDR5;
-			break;
-		case 2:
-			dram_info->type = INTEL_DRAM_LPDDR5;
-			break;
-		case 3:
-			dram_info->type = INTEL_DRAM_LPDDR4;
-			break;
-		case 4:
-			dram_info->type = INTEL_DRAM_DDR3;
-			break;
-		case 5:
-			dram_info->type = INTEL_DRAM_LPDDR3;
-			break;
-		default:
-			MISSING_CASE(val & 0xf);
-			return -EINVAL;
-		}
-	} else {
-		switch (val & 0xf) {
-		case 0:
-			dram_info->type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info->type = INTEL_DRAM_DDR3;
-			break;
-		case 2:
-			dram_info->type = INTEL_DRAM_LPDDR3;
-			break;
-		case 3:
-			dram_info->type = INTEL_DRAM_LPDDR4;
-			break;
-		default:
-			MISSING_CASE(val & 0xf);
-			return -EINVAL;
-		}
-	}
-
-	dram_info->num_channels = (val & 0xf0) >> 4;
-	dram_info->num_qgv_points = (val & 0xf00) >> 8;
-	dram_info->num_psf_gv_points = (val & 0x3000) >> 12;
-
-	return 0;
-}
-
-static int gen11_get_dram_info(struct drm_i915_private *i915)
-{
-	int ret = skl_get_dram_info(i915);
-
-	if (ret)
-		return ret;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-static int gen12_get_dram_info(struct drm_i915_private *i915)
-{
-	i915->dram_info.wm_lv_0_adjust_needed = false;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-void intel_dram_detect(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	int ret;
-
-	if (GRAPHICS_VER(i915) < 9 || IS_DG2(i915) || !HAS_DISPLAY(i915))
-		return;
-
-	/*
-	 * Assume level 0 watermark latency adjustment is needed until proven
-	 * otherwise, this w/a is not needed by bxt/glk.
-	 */
-	dram_info->wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
-
-	if (GRAPHICS_VER(i915) >= 12)
-		ret = gen12_get_dram_info(i915);
-	else if (GRAPHICS_VER(i915) >= 11)
-		ret = gen11_get_dram_info(i915);
-	else if (IS_GEN9_LP(i915))
-		ret = bxt_get_dram_info(i915);
-	else
-		ret = skl_get_dram_info(i915);
-	if (ret)
-		return;
-
-	drm_dbg_kms(&i915->drm, "DRAM channels: %u\n", dram_info->num_channels);
-
-	drm_dbg_kms(&i915->drm, "Watermark level 0 adjustment needed: %s\n",
-		    str_yes_no(dram_info->wm_lv_0_adjust_needed));
-}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.h b/drivers/gpu/drm/xe/display/ext/intel_dram.h
deleted file mode 100644
index 4ba13c13162c..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#ifndef __INTEL_DRAM_H__
-#define __INTEL_DRAM_H__
-
-struct drm_i915_private;
-
-void intel_dram_edram_detect(struct drm_i915_private *i915);
-void intel_dram_detect(struct drm_i915_private *i915);
-
-#endif /* __INTEL_DRAM_H__ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a3eb0d94184c..2fc24eac0775 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -380,6 +380,12 @@ struct xe_device {
 		u8 num_psf_gv_points;
 	} dram_info;
 
+	/*
+	 * edram size in MB.
+	 * Cannot be determined by PCIID. You must always read a register.
+	 */
+	u32 edram_size_mb;
+
 	/* To shut up runtime pm macros.. */
 	struct xe_runtime_pm {} runtime_pm;
 
@@ -410,6 +416,7 @@ struct xe_device {
 	struct {
 		unsigned int hpll_freq;
 		unsigned int czclk_freq;
+		unsigned int fsb_freq, mem_freq, is_ddr3;
 		u8 vblank_enabled;
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index bf1ec9e3f9bf..8e39fb7f1fc8 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -15,7 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "ext/i915_irq.h"
-#include "ext/intel_dram.h"
+#include "soc/intel_dram.h"
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
-- 
2.39.2

