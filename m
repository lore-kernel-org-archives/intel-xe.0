Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D5C7EE21
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 22:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8AA10E1CC;
	Thu, 27 Apr 2023 22:33:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B8210E177
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682634786; x=1714170786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iTEHeKrXGbvp2xMw1ZHcDQUB6vapxj4t+p0YVBNvIZs=;
 b=b7BWV3qJ2yXgKAOk+9fxe6jGfAPpbYS6aonuduaxRA+Qf1kZ40wPhGyC
 1J6PqF9yHv9Q4qyTL01zLrt4e1hKMTPVwHow/gfjwySqm3cOXg9NhyHBz
 y7sM7qyyPH3W37Lx5Kc/sVd3WW9K01Ayx3xp/BsN7kKXFcPmwkP2Pxtil
 6ULcLjNjtcmZ2e7BaV4ugqnR+nzhbhRPeysC4z7s+bWEQm+u51gcqRebw
 zKOx8lpGUDMA+k2859DNbfi9k1Q8WLkjxCR1xoLzGpo89KEWdCzyBcGjR
 h3GEXt8ZuxzgOQoP1No6axNGQBMSa2xm0MfpnjmCwHeM1FUM631AP4tfu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412950615"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="412950615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727314341"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="727314341"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Apr 2023 15:32:52 -0700
Message-Id: <20230427223256.1432787-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427223256.1432787-1-lucas.demarchi@intel.com>
References: <20230427223256.1432787-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/10] drm/xe: Introduce xe_reg/xe_reg_mcr
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

Stop using i915 types for registers. Use our own types. Differently from
i915, this will keep under the register definition the knowledge for the
different types of registers. For now, the "flags"/"options" are mcr and
masked, although only the former is being used.

Additionally MCR registers have their own type. The only place that
should really look inside a xe_mcr_reg_t is that code dealing with the
steering and using other APIs when the register is MCR has been a source
of problem in the past.

Most of the driver is agnostic to the register differences since they
either use the definition from the header or already call the correct
MCR_REG()/_MMIO() macros. By embeding the struct xe_reg inside the
struct it's also possible to guarantee the compiler will break if
using RANDOM_MCR_REG.reg is attempted, since now the u32 is inside the
inner struct.

v2:
  - Deep a dedicated type for MCR registers to avoid misuse
    (Matt Roper, Jani)
  - Drop the typedef and just use a struct since it's not an opaque type
    (Jani)
  - Add more kernel-doc
v3:
  - Use only 22 bits for the register address since all the platforms
    supported so far have only 4MB of MMIO per tile  (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 93 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c        | 44 ++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h        | 11 ++--
 drivers/gpu/drm/xe/xe_irq.c           |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
 5 files changed, 129 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index b5c25e31b889..a56c87380b64 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -8,4 +8,97 @@
 
 #include "compat-i915-headers/i915_reg_defs.h"
 
+/**
+ * struct xe_reg - Register definition
+ *
+ * Register defintion to be used by the individual register. Although the same
+ * definition is used for xe_reg and xe_reg_mcr, they use different internal
+ * APIs for accesses.
+ */
+struct xe_reg {
+	union {
+		struct {
+			/** @reg: address */
+			u32 reg:22;
+			/**
+			 * @masked: register is "masked", with upper 16bits used
+			 * to identify the bits that are updated on the lower
+			 * bits
+			 */
+			u32 masked:1;
+			/**
+			 * @__mcr: register is multicast/replicated in the
+			 * hardware and needs special handling. Any register
+			 * with this set should also use a type of xe_reg_mcr_t.
+			 * It's only here so the few places that deal with MCR
+			 * registers specially (xe_sr.c) and tests using the raw
+			 * value can inspect it.
+			 */
+			u32 mcr:1;
+		};
+		/** @raw: Raw value with both address and options */
+		u32 raw;
+	};
+};
+
+/**
+ * xe_reg_mcr_t - MCR register is the same as a regular register, but uses
+ * another type since the internal API used for accessing them is different:
+ * it's never correct to use regular MMIO access.
+ */
+struct xe_reg_mcr {
+	/** reg: The register */
+	struct xe_reg __reg;
+};
+
+
+/**
+ * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
+ * read/written bits on the lower 16 bits.
+ *
+ * To be used with XE_REG(). XE_REG_MCR() and XE_REG_INITIALIZER()
+ */
+#define XE_REG_OPTION_MASKED		.masked = 1
+
+/**
+ * XE_REG_INITIALIZER - Initializer for xe_reg_t.
+ * @r_: Register offset
+ * @...: Additional options like access mode. See struct xe_reg for available
+ *       options.
+ *
+ * Register field is mandatory, and additional options may be passed as
+ * arguments. Usually ``XE_REG()`` should be preferred since it creates an
+ * object of the right type. However when initializing static const storage,
+ * where a compound statement is not allowed, this can be used instead.
+ */
+#define XE_REG_INITIALIZER(r_, ...)    { .reg = r_, __VA_ARGS__ }
+
+
+/**
+ * XE_REG - Create a struct xe_reg from offset and additional flags
+ * @r: Register offset
+ * @...: Additional options like access mode. See struct xe_reg for available
+ *       options.
+ */
+#define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
+
+/**
+ * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
+ * @r: Register offset
+ * @...: Additional options like access mode. See struct xe_reg for available
+ *       options.
+ */
+#define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
+				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
+				 })
+
+/*
+ * TODO: remove these once the register declarations are not using them anymore
+ */
+#undef _MMIO
+#undef MCR_REG
+#define _MMIO(r_)	((const struct xe_reg){ .reg = r_ })
+#define MCR_REG(r_)	((const struct xe_reg_mcr){ .__reg.reg = r_,		\
+						    .__reg.mcr = 1 })
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index aa04ba5a6dbe..55b240a5eaa7 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -40,6 +40,11 @@
  * non-terminated instance.
  */
 
+static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
+{
+	return reg_mcr.__reg;
+}
+
 enum {
 	MCR_OP_READ,
 	MCR_OP_WRITE
@@ -360,9 +365,10 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
  * returned.  Returns false if the caller need not perform any steering
  */
 static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
-						 i915_mcr_reg_t reg,
+						 struct xe_reg_mcr reg_mcr,
 						 u8 *group, u8 *instance)
 {
+	const struct xe_reg reg = to_xe_reg(reg_mcr);
 	const struct xe_mmio_range *implicit_ranges;
 
 	for (int type = 0; type < IMPLICIT_STEERING; type++) {
@@ -436,9 +442,10 @@ static void mcr_unlock(struct xe_gt *gt) {
  *
  * Caller needs to make sure the relevant forcewake wells are up.
  */
-static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
-				int group, int instance, u32 value)
+static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
+				u8 rw_flag, int group, int instance, u32 value)
 {
+	const struct xe_reg reg = to_xe_reg(reg_mcr);
 	u32 steer_reg, steer_val, val = 0;
 
 	lockdep_assert_held(&gt->mcr_lock);
@@ -485,7 +492,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
 /**
  * xe_gt_mcr_unicast_read_any - reads a non-terminated instance of an MCR register
  * @gt: GT structure
- * @reg: register to read
+ * @reg_mcr: register to read
  *
  * Reads a GT MCR register.  The read will be steered to a non-terminated
  * instance (i.e., one that isn't fused off or powered down by power gating).
@@ -494,17 +501,19 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
  *
  * Returns the value from a non-terminated instance of @reg.
  */
-u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
+u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
 {
+	const struct xe_reg reg = to_xe_reg(reg_mcr);
 	u8 group, instance;
 	u32 val;
 	bool steer;
 
-	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
+	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg_mcr,
+						     &group, &instance);
 
 	if (steer) {
 		mcr_lock(gt);
-		val = rw_with_mcr_steering(gt, reg, MCR_OP_READ,
+		val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ,
 					   group, instance, 0);
 		mcr_unlock(gt);
 	} else {
@@ -517,7 +526,7 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
 /**
  * xe_gt_mcr_unicast_read - read a specific instance of an MCR register
  * @gt: GT structure
- * @reg: the MCR register to read
+ * @reg_mcr: the MCR register to read
  * @group: the MCR group
  * @instance: the MCR instance
  *
@@ -525,13 +534,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
  * group/instance.
  */
 u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
-			   i915_mcr_reg_t reg,
+			   struct xe_reg_mcr reg_mcr,
 			   int group, int instance)
 {
 	u32 val;
 
 	mcr_lock(gt);
-	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
+	val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ, group, instance, 0);
 	mcr_unlock(gt);
 
 	return val;
@@ -540,7 +549,7 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
 /**
  * xe_gt_mcr_unicast_write - write a specific instance of an MCR register
  * @gt: GT structure
- * @reg: the MCR register to write
+ * @reg_mcr: the MCR register to write
  * @value: value to write
  * @group: the MCR group
  * @instance: the MCR instance
@@ -548,24 +557,27 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
  * Write an MCR register in unicast mode after steering toward a specific
  * group/instance.
  */
-void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
-			     int group, int instance)
+void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
+			     u32 value, int group, int instance)
 {
 	mcr_lock(gt);
-	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
+	rw_with_mcr_steering(gt, reg_mcr, MCR_OP_WRITE, group, instance, value);
 	mcr_unlock(gt);
 }
 
 /**
  * xe_gt_mcr_multicast_write - write a value to all instances of an MCR register
  * @gt: GT structure
- * @reg: the MCR register to write
+ * @reg_mcr: the MCR register to write
  * @value: value to write
  *
  * Write an MCR register in multicast mode to update all instances.
  */
-void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
+void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
+			       u32 value)
 {
+	struct xe_reg reg = to_xe_reg(reg_mcr);
+
 	/*
 	 * Synchronize with any unicast operations.  Once we have exclusive
 	 * access, the MULTICAST bit should already be set, so there's no need
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 2a6cd38c8cb7..27ca1bc880a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -15,13 +15,14 @@ void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
 
-u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
+u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			   int group, int instance);
-u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
+u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr mcr_reg);
 
-void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
-			     int group, int instance);
-void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
+void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
+			     u32 value, int group, int instance);
+void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
+			       u32 value);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 13f9f220bca0..4409490024a6 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -27,7 +27,7 @@
 #define IIR(offset)				_MMIO(offset + 0x8)
 #define IER(offset)				_MMIO(offset + 0xc)
 
-static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
+static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(gt, reg.reg);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9b466803c68e..24a3c1842144 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -393,7 +393,7 @@ int xe_mmio_init(struct xe_device *xe)
 	DRM_XE_MMIO_READ |\
 	DRM_XE_MMIO_WRITE)
 
-static const i915_reg_t mmio_read_whitelist[] = {
+static const struct xe_reg mmio_read_whitelist[] = {
 	RING_TIMESTAMP(RENDER_RING_BASE),
 };
 
-- 
2.40.1

