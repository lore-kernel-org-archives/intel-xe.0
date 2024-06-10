Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB80C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E838C10E475;
	Mon, 10 Jun 2024 14:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XF/GEUsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0A210E475
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029081; x=1749565081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=acnCYH3i2T2FKiuQ3cllcOgHI13TIHgssFKuFUgTrzw=;
 b=XF/GEUsySNeKbGHPZmUzcGeNlSBHkyi6jxM0Ca5z81sYzAx2iS3DRkIv
 ROGzGCAnEhvgIDAghjO+c9hgt8B4lrlehf5ene7fGB2kG8ueTEzSGuZ9D
 sNcjmr0DITt4Lg6NOcoqSfkaw4RqluaUpFpI6xrww3TMoZhuN3s+EF4vW
 khJULpKgNP2c58JXswS1TAfFK7bZ18RHtAR/24xDceZmmcePpqSrAD/D+
 HAfH/oWrOFSGnOOJ5LE9SXAn6DFqrZpj6FisqEORfDOwfQ9ZnTqZ6SoIJ
 514eJXWBbvioVXPM1MjfFAK3m8YH/t0dVt/3Co53+qTWV9Z0CLytt/6cR A==;
X-CSE-ConnectionGUID: aMzjv5Y3QwqkE4ktFz8/ng==
X-CSE-MsgGUID: lvZoMnE0Rrelf9tFlbaaxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864870"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: Uo/OnHrcQ0Orr4ytDqLpWA==
X-CSE-MsgGUID: L3L5eTD5Td6r4ugMnSW9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238693"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
Date: Mon, 10 Jun 2024 07:18:18 -0700
Message-Id: <20240610141823.2605496-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

Add helper to convert GT clock ticks to msec. Useful for determining if
timeouts occur by examing GT clock ticks.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 9ff2061133df..a9392a743fd5 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -79,3 +79,21 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.reference_clock = freq;
 	return 0;
 }
+
+static u64 div_u64_roundup(u64 nom, u32 den)
+{
+	return div_u64(nom + den - 1, den);
+}
+
+/**
+ * xe_gt_clock_interval_to_ms - Convert sampled GT clock ticks to msec
+ *
+ * @gt: the &xe_gt
+ * @count: count of GT clock ticks
+ *
+ * Returns: time in msec
+ */
+u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
+{
+	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 44fa0371b973..3adeb7baaca4 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -11,5 +11,6 @@
 struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
+u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
 
 #endif
-- 
2.34.1

