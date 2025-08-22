Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFED7CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B63F10EAA7;
	Fri, 22 Aug 2025 09:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvWUiyiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2C610E0D1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855218; x=1787391218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yBmrGfrUnq8L/H82e7SjeH8S/Cwdrb8gBsIL+HcM3XY=;
 b=WvWUiyiCEyASTy5zLzuSW/XN1Obhl7Yl3lvG+6xU7P7KSwl/wZUitzOK
 +EFRBMP0tDfcEtg2tGAmMBQ7muSVKAh26+gdLS5TOKbloYblA87stC2jb
 WAHA7qL1Hk5jsP7xD9jQwob2GjsXfBTPGtYHHewW6BwALnKFS6fdRg18J
 tX6bDfXE3ZjkcM1OKYc1rHmVYv1NMz8y54tq1Hdq+qeeArpKBl6TEZx+E
 IdAd7oJvMTy0FPV6CbZ2H8SuBTG2AEhPR6skmLKyMnU/+8O91m9zj/zso
 lCbShxO8iBVG9cQxnPFIjpqkw7HfYxzvZ1Y6SIXbZv4kxxYrXzBA/Oyb2 A==;
X-CSE-ConnectionGUID: qhZPx6mxRBeUAKPKe0Wjmw==
X-CSE-MsgGUID: glHesG/xTy2ZGP9tZtpCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80759898"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80759898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:33:38 -0700
X-CSE-ConnectionGUID: cigC6BBDSHSAUi1jXfpDfA==
X-CSE-MsgGUID: K93+U8fITXWyOsRThYIDTA==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 02:33:36 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, carlos.santa@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 2/8] [ANDROID]: Add xe_gt_clock_interval_to_ns function
Date: Fri, 22 Aug 2025 08:59:24 +0000
Message-ID: <20250822085932.2221054-3-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
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

