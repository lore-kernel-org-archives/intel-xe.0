Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BF3EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 11:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E299E10E456;
	Fri, 30 Jun 2023 11:50:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BBB10E456
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688125841; x=1719661841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nfqd/xbwy23nbEN9YuZvzY708KIRWkbLDbRJy531rI=;
 b=m0D3rToKhsLojSJUTFC5v48Tb/D+gJSn4dokQcUGxbeEKJFFW+htxsm9
 NF7g5HHUR07VXglIaAbb1d+4RiZ+i9+9zLmaYBaSrd/QMz1LzJFBiyrBE
 zT2JuvR5DDb0GIm7aY2U28zoJzORnEjalt2CWhS0o5xYCRNXzLYA1aVGW
 EZggK8JMFhufXHgRGwgO0+gkBPF9PHpHs3iLp0qgM8p8qIESe9j7NlbL5
 tupoAWtbgDXLDrSKLHbMJFNBoKj/c0s1urOjiVklTq6Z2GJZwAEVQb41o
 oX23FQ05vimIAqFNprIfLo8xpkJBOvObbOpilIz5Sbu/1KaIS4GOcxxqF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361223368"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361223368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667914121"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="667914121"
Received: from lpascal-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.49.62])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jun 2023 14:50:17 +0300
Message-Id: <20230630115019.123675-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630115019.123675-1-jani.nikula@intel.com>
References: <20230630115019.123675-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RESEND 3/5] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We'll have struct intel_uncore uses, so add the name back instead of
fake_uncore.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_pcode.h  | 16 ++---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 58 +++++++++----------
 drivers/gpu/drm/xe/xe_device_types.h          |  2 +-
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
index 71f1fd1de2fd..0c47661bdc6a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
@@ -10,32 +10,32 @@
 #include "xe_pcode.h"
 
 static inline int
-snb_pcode_write_timeout(struct fake_uncore *uncore, u32 mbox, u32 val,
+snb_pcode_write_timeout(struct intel_uncore *uncore, u32 mbox, u32 val,
 			int fast_timeout_us, int slow_timeout_ms)
 {
-	return xe_pcode_write_timeout(__fake_uncore_to_gt(uncore), mbox, val,
+	return xe_pcode_write_timeout(__compat_uncore_to_gt(uncore), mbox, val,
 				      slow_timeout_ms ?: 1);
 }
 
 static inline int
-snb_pcode_write(struct fake_uncore *uncore, u32 mbox, u32 val)
+snb_pcode_write(struct intel_uncore *uncore, u32 mbox, u32 val)
 {
 
-	return xe_pcode_write(__fake_uncore_to_gt(uncore), mbox, val);
+	return xe_pcode_write(__compat_uncore_to_gt(uncore), mbox, val);
 }
 
 static inline int
-snb_pcode_read(struct fake_uncore *uncore, u32 mbox, u32 *val, u32 *val1)
+snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val, u32 *val1)
 {
-	return xe_pcode_read(__fake_uncore_to_gt(uncore), mbox, val, val1);
+	return xe_pcode_read(__compat_uncore_to_gt(uncore), mbox, val, val1);
 }
 
 static inline int
-skl_pcode_request(struct fake_uncore *uncore, u32 mbox,
+skl_pcode_request(struct intel_uncore *uncore, u32 mbox,
 		  u32 request, u32 reply_mask, u32 reply,
 		  int timeout_base_ms)
 {
-	return xe_pcode_request(__fake_uncore_to_gt(uncore), mbox, request, reply_mask, reply,
+	return xe_pcode_request(__compat_uncore_to_gt(uncore), mbox, request, reply_mask, reply,
 				timeout_base_ms);
 }
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index fae6213d26f1..652654b5481d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -10,31 +10,31 @@
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 
-static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
+static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
 {
 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
 
 	return xe_root_mmio_gt(xe);
 }
 
-static inline u32 intel_uncore_read(struct fake_uncore *uncore,
+static inline u32 intel_uncore_read(struct intel_uncore *uncore,
 				    i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read8(struct fake_uncore *uncore,
+static inline u32 intel_uncore_read8(struct intel_uncore *uncore,
 				     i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
 }
 
 static inline u64
-intel_uncore_read64_2x32(struct fake_uncore *uncore,
+intel_uncore_read64_2x32(struct intel_uncore *uncore,
 			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
 {
 	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
@@ -42,102 +42,102 @@ intel_uncore_read64_2x32(struct fake_uncore *uncore,
 	u32 upper, lower, old_upper;
 	int loop = 0;
 
-	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
+	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
 	do {
 		old_upper = upper;
-		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg);
-		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
+		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
+		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
 	} while (upper != old_upper && loop++ < 2);
 
 	return (u64)upper << 32 | lower;
 }
 
-static inline void intel_uncore_posting_read(struct fake_uncore *uncore,
+static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
 					     i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write(struct fake_uncore *uncore,
+static inline void intel_uncore_write(struct intel_uncore *uncore,
 				      i915_reg_t i915_reg, u32 val)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_rmw(struct fake_uncore *uncore,
+static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
 				   i915_reg_t i915_reg, u32 clear, u32 set)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg, clear, set);
+	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
 }
 
-static inline int intel_wait_for_register(struct fake_uncore *uncore,
+static inline int intel_wait_for_register(struct intel_uncore *uncore,
 					  i915_reg_t i915_reg, u32 mask,
 					  u32 value, unsigned int timeout)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
-static inline int intel_wait_for_register_fw(struct fake_uncore *uncore,
+static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
 					     i915_reg_t i915_reg, u32 mask,
 					     u32 value, unsigned int timeout)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
 static inline int
-__intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t i915_reg,
+__intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
 			  u32 mask, u32 value, unsigned int fast_timeout_us,
 			  unsigned int slow_timeout_ms, u32 *out_value)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
 
-static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
+static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
 				       i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
+static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
 					 i915_reg_t i915_reg, u32 val)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
+static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
 					    i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
+static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
 					      i915_reg_t i915_reg, u32 val)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
 }
 
 #endif /* __INTEL_UNCORE_H__ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6afe37c8704e..ed7860645e8c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -397,7 +397,7 @@ struct xe_device {
 	bool display_irqs_enabled;
 	u32 enabled_irq_mask;
 
-	struct fake_uncore {
+	struct intel_uncore {
 		spinlock_t lock;
 	} uncore;
 
-- 
2.39.2

