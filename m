Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380C1D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5CB10E659;
	Tue,  2 Dec 2025 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9oAOedG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BF210E659
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683643; x=1796219643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpYzII2g7Tg0g6eAYvtraesnyh0YGewqvdi7fKNSrUc=;
 b=H9oAOedGgc9+X5/XcjJ/SoQ8FWYGvzIfEjn8+L1ucksi4dpKbHZAMqC6
 WfMJniXeuFx1ggbm6TneIcOCkkLg6lejyJ0pUM3vRWnj+r2juZAjyWY6h
 5G2inoAypmsmTQhhZ4WMF2czw+kw6n+508EtkcrjCeWlHf8y7GNtQBTxC
 EwAtDpcvy4eIq6/evwjFMch60t7BIBj1cQEpaEyqbfYD36tXXzcHdVn8M
 FulEQ849NT4gsAUfhqVQhp4lY7HqsSMBZh47SyyVVXwH4PCItmHzrtj1q
 pTyh9hrs8boWNRtN1uwlomEn5UfOpBZXg+i7iP+cPSKzB7qWrMGGt2yJy A==;
X-CSE-ConnectionGUID: fLQfCbV5SUua6bKvqqf1XA==
X-CSE-MsgGUID: kE2KRPR+TJu1t/D6ePJD0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537132"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537132"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:03 -0800
X-CSE-ConnectionGUID: oUApHxmeREyPxCHSzahYRA==
X-CSE-MsgGUID: lWE9nzXYSKOaFjAAf1rV/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505807"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:59 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/20] drm/xe/eudebug: Add read/count/compare helper for eu
 attention
Date: Tue,  2 Dec 2025 15:52:36 +0200
Message-ID: <20251202135241.880267-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Add xe_eu_attentions structure to capture and store eu attention bits.
Add a function to count the number of eu threads that have turned on from
eu attentions, and add a function to count the number of eu threads that
have changed on a state between eu attentions.

v2: fix array size calculation (Christoph)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debug.c       | 65 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h       |  7 +++
 drivers/gpu/drm/xe/xe_gt_debug_types.h | 23 +++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 314eef6734c3..bf2ca95c7389 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -3,12 +3,14 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/delay.h>
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_debug_types.h"
 #include "xe_gt_mcr.h"
 #include "xe_pm.h"
 #include "xe_macros.h"
@@ -177,3 +179,66 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
 
 	return err < 0 ? 0 : err;
 }
+
+static inline unsigned int
+xe_eu_attentions_count(const struct xe_eu_attentions *a)
+{
+	return bitmap_weight((void *)a->att, a->size * BITS_PER_BYTE);
+}
+
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms)
+{
+	unsigned int prev = 0;
+	ktime_t end, now;
+
+	now = ktime_get_raw();
+	end = ktime_add_ms(now, settle_time_ms);
+
+	a->ts = 0;
+	a->size = min_t(int,
+			xe_gt_eu_attention_bitmap_size(gt),
+			sizeof(a->att));
+
+	do {
+		unsigned int attn;
+
+		xe_gt_eu_attention_bitmap(gt, a->att, a->size);
+		attn = xe_eu_attentions_count(a);
+
+		now = ktime_get_raw();
+
+		if (a->ts == 0)
+			a->ts = now;
+		else if (attn && attn != prev)
+			a->ts = now;
+
+		prev = attn;
+
+		if (settle_time_ms)
+			udelay(5);
+
+		/*
+		 * XXX We are gathering data for production SIP to find
+		 * the upper limit of settle time. For now, we wait full
+		 * timeout value regardless.
+		 */
+	} while (ktime_before(now, end));
+}
+
+unsigned int xe_eu_attentions_xor_count(const struct xe_eu_attentions *a,
+					const struct xe_eu_attentions *b)
+{
+	unsigned int count = 0;
+	unsigned int i;
+
+	if (XE_WARN_ON(a->size != b->size))
+		return -EINVAL;
+
+	for (i = 0; i < a->size; i++)
+		if (a->att[i] ^ b->att[i])
+			count++;
+
+	return count;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 9dabe9cc1d25..0d03565195b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 #include <linux/math.h>
 
+struct xe_eu_attentions;
 struct xe_gt;
 
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
@@ -29,4 +30,10 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
 			      unsigned int bitmap_size);
 
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms);
+
+unsigned int xe_eu_attentions_xor_count(const struct xe_eu_attentions *a,
+					const struct xe_eu_attentions *b);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_debug_types.h b/drivers/gpu/drm/xe/xe_gt_debug_types.h
new file mode 100644
index 000000000000..35a0e822f20a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug_types.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __XE_GT_DEBUG_TYPES_
+#define __XE_GT_DEBUG_TYPES_
+
+#include <linux/types.h>
+
+#define XE_GT_EU_ATT_ROWS 2u
+#define XE_GT_EU_ATT_MAX_THREADS 16
+#define XE_GT_EU_MAX_NUM  1024
+
+struct xe_eu_attentions {
+	u8 att[XE_GT_EU_MAX_NUM *
+	       XE_GT_EU_ATT_ROWS *
+	       XE_GT_EU_ATT_MAX_THREADS/8];
+	unsigned int size;
+	ktime_t ts;
+};
+
+#endif
-- 
2.43.0

