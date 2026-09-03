Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC96C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0810F680;
	Thu,  3 Sep 2026 15:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdJbiHBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9641910F680
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447703; x=1819983703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dmkFYuEXH3h91jC0Tp/7l31fNCmmaUNnwuusoEWyHf0=;
 b=fdJbiHBBm3N3B0Z9xHIjPfeNdWXR75BR9bv4gESAs+ey8pmJcmXhrCK4
 wMNaFjCcw5havh6ctPCQSQobKLsg08MQHWOyO9wBkfSzQIq3vrmEaHv/M
 ys/l1J9wJx4A0CE+rfhYLy5wUvr4MyakqoXDUsZ0QQ3+gsJZmqsPxT7G/
 QACDyxLqnWc0Yztx3PLhFvZyYe6YPW1mZQiuyafxEtGkKoRO0QXgTouNa
 wsic8q9eTZnUfLIJTeFCiLDbYU08z62rG+YXG1b+S2pOj2svG9cy97E6l
 ecmaMOlsKzMKcgIksXestkP+PNBn0Od7UzDWH5GOHAh04oZypHy9KxVUM g==;
X-CSE-ConnectionGUID: C9Q3jXdlR0uKB/Iar5JAmA==
X-CSE-MsgGUID: 2uYWIu3nQXmIjivvx5FH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486900"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:42 -0700
X-CSE-ConnectionGUID: QRyjJBGKTt+VZeymvYruCQ==
X-CSE-MsgGUID: ozOVMgG3R6ymFsd5RvtNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441366"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:38 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 21/27] drm/xe/eudebug: Add read/count/compare helper for
 eu attention
Date: Thu,  3 Sep 2026 17:59:45 +0300
Message-ID: <20260903145952.848051-22-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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
v3: remote timestamp (Maciej)
v4: settle time (Maciej)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debug.c       | 50 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h       |  6 +++-
 drivers/gpu/drm/xe/xe_gt_debug_types.h | 22 ++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index b20e42e66c5b..bff78c0b232a 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -3,12 +3,15 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/delay.h>
+
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
@@ -199,3 +202,50 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
 
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
+	unsigned int attn, prev = 0;
+	ktime_t end, now;
+
+	now = ktime_get_raw();
+	/* Initially wait longer for attentions to appear */
+	end = ktime_add_ms(now, settle_time_ms * 10);
+
+	a->size = min_t(int,
+			xe_gt_eu_attention_bitmap_size(gt),
+			sizeof(a->att));
+
+	do {
+		if (xe_gt_eu_attention_bitmap(gt, a->att, a->size) < 0)
+			return;
+
+		if (!settle_time_ms)
+			break;
+
+		attn = xe_eu_attentions_count(a);
+
+		now = ktime_get_raw();
+
+		if (attn > prev) {
+			prev = attn;
+			end = ktime_add_ms(now, settle_time_ms);
+		}
+
+		udelay(15);
+
+		/*
+		 * XXX We are gathering data for production SIP to find
+		 * the upper limit of settle time. For now, we wait full
+		 * timeout value regardless.
+		 */
+	} while ((attn < a->size * 8) && ktime_before(now, end));
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 9dabe9cc1d25..70794d246e35 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -9,9 +9,10 @@
 #include <linux/bits.h>
 #include <linux/math.h>
 
+struct xe_eu_attentions;
 struct xe_gt;
 
-#define XE_GT_ATTENTION_TIMEOUT_MS 100
+#define XE_GT_ATTENTION_TIMEOUT_MS 150
 #define XE_GT_EU_ATT_ROWS 2u
 
 unsigned int xe_gt_eu_att_regs(struct xe_gt *gt);
@@ -29,4 +30,7 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
 			      unsigned int bitmap_size);
 
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_debug_types.h b/drivers/gpu/drm/xe/xe_gt_debug_types.h
new file mode 100644
index 000000000000..f24eed15cf7c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug_types.h
@@ -0,0 +1,22 @@
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
+};
+
+#endif
-- 
2.53.0

