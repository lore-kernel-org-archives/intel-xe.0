Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB39CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17F10E42E;
	Mon,  6 Oct 2025 11:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY88EuPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4F610E42E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749522; x=1791285522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8pVRdVUMtPVwM2MtUhlkcrEhD0SdOYFTXGh6tHxGsw=;
 b=BY88EuPAjAF+hy39mjR6s6T4VCiZyM/WqsbRDoftnp6NLaQItN2OwrjG
 rPlK0hC38f8B7E5YCNIeJLAlHBmYvW/1V1nbzQtfugGmUVqRvfwhQHjWn
 fCZWH3x4pyotOl4XIg/fiCGHEjj9CKvKQxaxHyuk4S7CnNhZYZv86g2V5
 E+3rmzWrfVuncmXbpdl3pVQDjrFhxUbpmaU8Myx0bkpvJKUuT2qsi/fC0
 Z5zCXJWwyCzG/FBf9M1WAJ1mTKfPB2jyQ7eraRs/Q1SPs1T5G3aAM6EHe
 nmpk9+o4cd1/7qwNGJLVn+/PRGsoBDVAKfnyv4/GEtgarknNbKyLOb9qL A==;
X-CSE-ConnectionGUID: dN4wSNMFS9uDGqbNNNd93g==
X-CSE-MsgGUID: 4UFWivrOTOa1/tby3TFQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825468"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:42 -0700
X-CSE-ConnectionGUID: 3AhTAQeWR6y620diDkNPwA==
X-CSE-MsgGUID: gNcsWDw9S0WfAtDSt0bewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216947220"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:38 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/20] drm/xe/eudebug: Add read/count/compare helper for eu
 attention
Date: Mon,  6 Oct 2025 14:17:07 +0300
Message-ID: <20251006111711.201906-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debug.c | 64 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h |  6 +++
 2 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 314eef6734c3..8386a527adf0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/delay.h>
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -177,3 +178,66 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
 
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
index f882770e18d3..aba36bc5f85d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -38,4 +38,10 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
 			      unsigned int bitmap_size);
 
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms);
+
+unsigned int xe_eu_attentions_xor_count(const struct xe_eu_attentions *a,
+					const struct xe_eu_attentions *b);
 #endif
-- 
2.43.0

