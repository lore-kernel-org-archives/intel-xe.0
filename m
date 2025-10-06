Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4233CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AEC10E0D1;
	Mon,  6 Oct 2025 14:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgb4AQEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEED10E341
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762604; x=1791298604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yBmrGfrUnq8L/H82e7SjeH8S/Cwdrb8gBsIL+HcM3XY=;
 b=hgb4AQEQIgJ6rsfDaAybag0k+ptzZO1TYwi8t9YWyWRDuWN7HA3JFEg3
 tXBMD6AdnTg18A029XBhp4v+s8W2MNVRVZIiZCM1hOSi+6mwn9uGOY/FW
 A0wLd7kFYrWSBTmbu0MYVLZkHi5JXy2yIIo2muBYggDqDMJZkInahvzdY
 6zCrq4EatDRVobARFb4MwOO7HMzqp84ENb+IzQw/9XtvFBP8lJAqG8BXh
 jxxRiBP8Sw/XsLZo8L610xOToBT99nl5JgxcPW6kN3uTsOYbS/4cCB1Fu
 fn9vSR1JjH+97cxoDmXk1xkGFr7wbzElawN9LiDkcdMzbubBWhnixJrpl w==;
X-CSE-ConnectionGUID: rMihygJyTzyjwNBUacac7w==
X-CSE-MsgGUID: MEJmxX5TSqWn2IfWbXtW5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143157"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:44 -0700
X-CSE-ConnectionGUID: d0/wWdopSuu+e8OGuuJdzw==
X-CSE-MsgGUID: ZRsMFdXFQH+NOisq7rjkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507633"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:41 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 2/8] drm/xe: Add xe_gt_clock_interval_to_ns function
Date: Mon,  6 Oct 2025 14:20:23 +0000
Message-ID: <20251006142034.674435-3-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

