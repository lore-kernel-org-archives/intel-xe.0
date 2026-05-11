Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C26ACD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E52D10E7E8;
	Mon, 11 May 2026 15:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvbdVh2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79D10E7D2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778513627; x=1810049627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=odkO2W8A4KmkOmoDnO5HfPejQoconNfIgf5LcxgzQ70=;
 b=BvbdVh2/0kBeR3kZZGGClSoZrRtmwfREcGTccvVq6ZaXlqZ9eOHVirsi
 FMZMJ5LWXbXTKiMWt9uxliOun9z44EJGWOyyOVsD/WZvjJoteL0OtnlDK
 oTpONIeebZSYb2VnAXgqgeFOb4k7pFUnzgMs/ZfeU7TU8du4Lb17iNe4s
 pZxio61r3e7KWyMBjSk5ibNVIfCnd2zgR901nLOLkShTaGhQZ5Gm51j/F
 glAmE2qICGl/wvTs6TYYR/JNZuxqRSqWbRmqFFrtlIScWwuZmAg+2+YsG
 djEg9SCiz9m+aVudmj9CblpSvvqcXw75GYnhLxT+e72QEzwrTflxrYXkO A==;
X-CSE-ConnectionGUID: GaxiqYcoQEmxLdNWmiZFxw==
X-CSE-MsgGUID: KCmBb+w7Qh6r6KedMpDYeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79350350"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79350350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:33:47 -0700
X-CSE-ConnectionGUID: mH4sa2HfRoW7cVhSZcfjmQ==
X-CSE-MsgGUID: uTlVWAcZQ6Wc0NoxtqhV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="234826580"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 08:33:45 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/gt_idle: Use NSEC_PER_MSEC instead of float literal
Date: Mon, 11 May 2026 15:33:07 +0000
Message-Id: <20260511153307.223435-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The residency multiplier conversion in get_residency_ms() used the
floating-point literal 1e6 as the divisor of mul_u64_u32_div(). While
the compiler constant-folds this to an integer, using float literals
in kernel code is bad practice since the kernel generally avoids
floating-point operations.

Replace 1e6 with the standard NSEC_PER_MSEC macro from <linux/time64.h>,
which is both self-documenting (ns to ms conversion) and unambiguously
integer. Add the corresponding include rather than relying on
transitive inclusion.

No functional change.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 4a2d9edb6a4c..04b24e1c8b78 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/time64.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -93,7 +95,7 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 	gtidle->cur_residency = cur_residency;
 
 	/* residency multiplier in ns, convert to ms */
-	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
+	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, NSEC_PER_MSEC);
 
 	return cur_residency;
 }
-- 
2.43.0

