Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5D6C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 22:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D7410FD40;
	Thu, 21 Mar 2024 22:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6tUk9CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8D31121CA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711059438; x=1742595438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4hesS23fqS3ytgergenUfYpq08ZQGLYaGSdepiNREQ=;
 b=h6tUk9CUJ0EQb+wCpEDPT815vDIcR2pLaZETfPzxi/gjFygVSBoE4Ln6
 3JFKKNQMuEIamt0WddmJnq80Cn/qZtj6FGdfDYtHKmtTPy6c7mmVf5sPI
 p73+m9AqTKpTrZu0e98scvGhNyOG9pqPYFzZO7oluFtswmN4sVBdrmCsk
 4CRZwPYp/QrEYBOF5PgYefesj5xWnkr5vI42t0nXQwbajq26q6Xw5N84F
 Xs6mO0QFjs2sRE06spJHBcbNBRghYIsteXydXL9JqwjwfHESeKIrHzdJG
 4blZwYfwUBHpt9Z6d5izzwF0kbzjWqtyrmR3TBn3fQw5UizinhK/bsJFl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31525663"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="31525663"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="52114392"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Let set_offsets() get the per-platform offsets
Date: Thu, 21 Mar 2024 15:17:26 -0700
Message-ID: <20240321221726.102193-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321221726.102193-1-lucas.demarchi@intel.com>
References: <20240321221726.102193-1-lucas.demarchi@intel.com>
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

Instead of doing set_offsets(..., get_offsets()), just let the former
figure out the proper array to use. This makes it easier to bundle the
array + size and thus avoid the need for a sentinel.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 202 ++++++++++++++++++------------------
 1 file changed, 103 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index db0793273de0..a87541b82dda 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -13,6 +13,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_lrc_layout.h"
+#include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -80,33 +81,6 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
 	}
 }
 
-/*
- * The per-platform tables are u8-encoded in @data. Decode @data and set the
- * addresses' offset and commands in @regs. The following encoding is used
- * for each byte. There are 2 steps: decoding commands and decoding addresses.
- *
- * Commands:
- * [7]: create NOPs - number of NOPs are set in lower bits
- * [6]: When creating MI_LOAD_REGISTER_IMM command, allow to set
- *      MI_LRI_FORCE_POSTED
- * [5:0]: Number of NOPs or registers to set values to in case of
- *        MI_LOAD_REGISTER_IMM
- *
- * Addresses: these are decoded after a MI_LOAD_REGISTER_IMM command by "count"
- * number of registers. They are set by using the REG/REG16 macros: the former
- * is used for offsets smaller than 0x200 while the latter is for values bigger
- * than that. Those macros already set all the bits documented below correctly:
- *
- * [7]: When a register offset needs more than 6 bits, use additional bytes, to
- *      follow, for the lower bits
- * [6:0]: Register offset, without considering the engine base.
- *
- * This function only tweaks the commands and register offsets. Values are not
- * filled out.
- */
-static void set_offsets(u32 *regs,
-			const u8 *data,
-			const struct xe_hw_engine *hwe)
 #define NOP(x) (BIT(7) | (x))
 #define LRI(count, flags) ((flags) << 6 | (count) | \
 			   BUILD_BUG_ON_ZERO(count >= BIT(6)))
@@ -115,46 +89,6 @@ static void set_offsets(u32 *regs,
 #define REG16(x) \
 	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
 	(((x) >> 2) & 0x7f)
-{
-	const u32 base = hwe->mmio_base;
-
-	while (*data) {
-		u8 count, flags;
-
-		if (*data & BIT(7)) { /* skip */
-			count = *data++ & ~BIT(7);
-			regs += count;
-			continue;
-		}
-
-		count = *data & 0x3f;
-		flags = *data >> 6;
-		data++;
-
-		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
-		if (flags & POSTED)
-			*regs |= MI_LRI_FORCE_POSTED;
-		*regs |= MI_LRI_LRM_CS_MMIO;
-		regs++;
-
-		xe_gt_assert(hwe->gt, count);
-		do {
-			u32 offset = 0;
-			u8 v;
-
-			do {
-				v = *data++;
-				offset <<= 7;
-				offset |= v & ~BIT(7);
-			} while (v & BIT(7));
-
-			regs[0] = base + (offset << 2);
-			regs += 2;
-		} while (--count);
-	}
-
-	*regs = MI_BATCH_BUFFER_END | BIT(0);
-}
 
 static const u8 gen12_xcs_offsets[] = {
 	NOP(1),
@@ -184,8 +118,6 @@ static const u8 gen12_xcs_offsets[] = {
 	REG16(0x278),
 	REG16(0x274),
 	REG16(0x270),
-
-	0
 };
 
 static const u8 dg2_xcs_offsets[] = {
@@ -218,8 +150,6 @@ static const u8 dg2_xcs_offsets[] = {
 	REG16(0x278),
 	REG16(0x274),
 	REG16(0x270),
-
-	0
 };
 
 static const u8 gen12_rcs_offsets[] = {
@@ -314,8 +244,6 @@ static const u8 gen12_rcs_offsets[] = {
 	REG(0x068),
 	REG(0x084),
 	NOP(1),
-
-	0
 };
 
 static const u8 xehp_rcs_offsets[] = {
@@ -355,8 +283,6 @@ static const u8 xehp_rcs_offsets[] = {
 	NOP(6),
 	LRI(1, 0),
 	REG(0x0c8),
-
-	0
 };
 
 static const u8 dg2_rcs_offsets[] = {
@@ -398,8 +324,6 @@ static const u8 dg2_rcs_offsets[] = {
 	NOP(6),
 	LRI(1, 0),
 	REG(0x0c8),
-
-	0
 };
 
 static const u8 mtl_rcs_offsets[] = {
@@ -441,8 +365,6 @@ static const u8 mtl_rcs_offsets[] = {
 	NOP(6),
 	LRI(1, 0),
 	REG(0x0c8),
-
-	0
 };
 
 #define XE2_CTX_COMMON \
@@ -487,8 +409,6 @@ static const u8 xe2_rcs_offsets[] = {
 	NOP(6),                 /* [0x41] */
 	LRI(1, 0),              /* [0x47] */
 	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
-
-	0
 };
 
 static const u8 xe2_bcs_offsets[] = {
@@ -498,14 +418,10 @@ static const u8 xe2_bcs_offsets[] = {
 	LRI(2, POSTED),         /* [0x41] */
 	REG16(0x200),           /* [0x42] BCS_SWCTRL */
 	REG16(0x204),           /* [0x44] BLIT_CCTL */
-
-	0
 };
 
 static const u8 xe2_xcs_offsets[] = {
 	XE2_CTX_COMMON,
-
-	0
 };
 
 #undef REG16
@@ -513,34 +429,121 @@ static const u8 xe2_xcs_offsets[] = {
 #undef LRI
 #undef NOP
 
-static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
+static const u8 *reg_offsets(const struct xe_hw_engine *hwe,
+			     unsigned int *n_entries)
 {
-	if (class == XE_ENGINE_CLASS_RENDER) {
-		if (GRAPHICS_VER(xe) >= 20)
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER) {
+		if (GRAPHICS_VER(xe) >= 20) {
+			*n_entries = ARRAY_SIZE(xe2_rcs_offsets);
 			return xe2_rcs_offsets;
-		else if (GRAPHICS_VERx100(xe) >= 1270)
+		} else if (GRAPHICS_VERx100(xe) >= 1270) {
+			*n_entries = ARRAY_SIZE(mtl_rcs_offsets);
 			return mtl_rcs_offsets;
-		else if (GRAPHICS_VERx100(xe) >= 1255)
+		} else if (GRAPHICS_VERx100(xe) >= 1255) {
+			*n_entries = ARRAY_SIZE(dg2_rcs_offsets);
 			return dg2_rcs_offsets;
-		else if (GRAPHICS_VERx100(xe) >= 1250)
+		} else if (GRAPHICS_VERx100(xe) >= 1250) {
+			*n_entries = ARRAY_SIZE(xehp_rcs_offsets);
 			return xehp_rcs_offsets;
-		else
+		} else {
+			*n_entries = ARRAY_SIZE(gen12_rcs_offsets);
 			return gen12_rcs_offsets;
-	} else if (class == XE_ENGINE_CLASS_COPY) {
-		if (GRAPHICS_VER(xe) >= 20)
+		}
+	} else if (hwe->class == XE_ENGINE_CLASS_COPY) {
+		if (GRAPHICS_VER(xe) >= 20) {
+			*n_entries = ARRAY_SIZE(xe2_bcs_offsets);
 			return xe2_bcs_offsets;
-		else
+		} else {
+			*n_entries = ARRAY_SIZE(gen12_xcs_offsets);
 			return gen12_xcs_offsets;
+		}
 	} else {
-		if (GRAPHICS_VER(xe) >= 20)
+		if (GRAPHICS_VER(xe) >= 20) {
+			*n_entries = ARRAY_SIZE(xe2_xcs_offsets);
 			return xe2_xcs_offsets;
-		else if (GRAPHICS_VERx100(xe) >= 1255)
+		} else if (GRAPHICS_VERx100(xe) >= 1255) {
+			*n_entries = ARRAY_SIZE(dg2_xcs_offsets);
 			return dg2_xcs_offsets;
-		else
+		} else {
+			*n_entries = ARRAY_SIZE(gen12_xcs_offsets);
 			return gen12_xcs_offsets;
+		}
+	}
+}
+
+/*
+ * The per-platform tables are u8-encoded in @data. Decode @data and set the
+ * addresses' offset and commands in @regs. The following encoding is used
+ * for each byte. There are 2 steps: decoding commands and decoding addresses.
+ *
+ * Commands:
+ * [7]: create NOPs - number of NOPs are set in lower bits
+ * [6]: When creating MI_LOAD_REGISTER_IMM command, allow to set
+ *      MI_LRI_FORCE_POSTED
+ * [5:0]: Number of NOPs or registers to set values to in case of
+ *        MI_LOAD_REGISTER_IMM
+ *
+ * Addresses: these are decoded after a MI_LOAD_REGISTER_IMM command by "count"
+ * number of registers. They are set by using the REG/REG16 macros: the former
+ * is used for offsets smaller than 0x200 while the latter is for values bigger
+ * than that. Those macros already set all the bits documented below correctly:
+ *
+ * [7]: When a register offset needs more than 6 bits, use additional bytes, to
+ *      follow, for the lower bits
+ * [6:0]: Register offset, without considering the engine base.
+ *
+ * This function only tweaks the commands and register offsets. Values are not
+ * filled out.
+ */
+static void set_offsets(u32 *regs, const struct xe_hw_engine *hwe)
+{
+	const u32 base = hwe->mmio_base;
+	unsigned int n_entries = 0;
+	const u8 *data = reg_offsets(hwe, &n_entries);
+
+	xe_gt_assert(hwe->gt, n_entries);
+
+	for (; n_entries; n_entries--) {
+		u8 count, flags;
+
+		if (*data & BIT(7)) { /* skip */
+			count = *data++ & ~BIT(7);
+			regs += count;
+			continue;
+		}
+
+		count = *data & 0x3f;
+		flags = *data >> 6;
+		data++;
+
+		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
+		if (flags & POSTED)
+			*regs |= MI_LRI_FORCE_POSTED;
+		*regs |= MI_LRI_LRM_CS_MMIO;
+		regs++;
+
+		xe_gt_assert(hwe->gt, count);
+		do {
+			u32 offset = 0;
+			u8 v;
+
+			do {
+				v = *data++;
+				offset <<= 7;
+				offset |= v & ~BIT(7);
+			} while (v & BIT(7));
+
+			regs[0] = base + (offset << 2);
+			regs += 2;
+		} while (--count);
 	}
+
+	*regs = MI_BATCH_BUFFER_END | BIT(0);
 }
 
+
 static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 {
 	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH) |
@@ -704,7 +707,8 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 
 	/* 1st page: Per-Process of HW status Page */
 	regs = data + LRC_PPHWSP_SIZE;
-	set_offsets(regs, reg_offsets(xe, hwe->class), hwe);
+	set_offsets(regs, hwe);
+
 	set_context_control(regs, hwe);
 	set_memory_based_intr(regs, hwe);
 	reset_stop_ring(regs, hwe);
-- 
2.43.0

