Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B50DCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4077410EBEC;
	Fri, 12 Sep 2025 09:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwGnvD0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786F610EBEC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669794; x=1789205794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yBmrGfrUnq8L/H82e7SjeH8S/Cwdrb8gBsIL+HcM3XY=;
 b=OwGnvD0htETawTJHIqFX+UeJxXCyjKnu3rAQrvymDjFF3zqY7kMhM5IS
 eAzy5MbDVKkS1iVH/3Y13FXP6mggobEFTJ183yhXsiysZqg0XeRB0Rzhc
 TNbh+BwXW+AXez39FZGKaW2tD6np3nxZ9fcUs53oqZu5ZNpwel7wYZqLT
 hgDFYT6aE4CSaDY999oSV8FDBzU0lCI42Xv02ZQj39NFvlj4/pcv+H4XS
 yVLeR+5m0l7mk0jttlRNxdAQOsZpF0n3YaMvyqVI3SFV9JqluMv4+cmU6
 FyB+iPmJnJWQUqoVKZbkwjJUfwY3Jkf7PEnElku6eRa6JzND3nyJt2SAp A==;
X-CSE-ConnectionGUID: s4gNCfRyQLGP8x0lP3L8Ww==
X-CSE-MsgGUID: ti206xS1R62Ro+wH2S4VoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159837"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:34 -0700
X-CSE-ConnectionGUID: 51jAvn1bTU2t2BOcUQj9ig==
X-CSE-MsgGUID: XPv8saFzS+qIHFIacWQOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311687"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:31 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 2/9] Add xe_gt_clock_interval_to_ns function
Date: Fri, 12 Sep 2025 09:03:45 +0000
Message-ID: <20250912090354.2619418-3-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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

The runtime of a user id in the GPU work period event are required
to be given in nanosec unit. Since we want to use the HW Context
timestamp register to derive the runtime for a context, we need
a way to convert from GT clock ticks to nano seconds.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 4f011d1573c6..17c1cc6bff5a 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -110,3 +110,17 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
 {
 	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
 }
+
+/**
+ * xe_gt_clock_interval_to_ns - Convert sampled GT clock ticks to nanosec
+ *
+ * @gt: the &xe_gt
+ * @count: count of GT clock ticks
+ *
+ * Returns: time in nanosec
+ */
+u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count)
+{
+	return div_u64_roundup(count * NSEC_PER_SEC, gt->info.reference_clock);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 3adeb7baaca4..bd87971bce97 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -12,5 +12,6 @@ struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
 u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
+u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count);
 
 #endif
-- 
2.49.0

