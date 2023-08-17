Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA28EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A47D10E413;
	Thu, 17 Aug 2023 08:25:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ADE10E413
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260722; x=1723796722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WM7OCh+8rZuY0rLYveDi7pUZNRJwd0SQr/BGlY1bYF4=;
 b=F/E5hD9QRsTRoE2V86u1bbb7Y65dvrsI2GChKPhlhDK4nqkiXqJtzB67
 J2liiIyh8kZEvZuizEhhi0BaZu7vRB1g9o8UWsTA27n5bx1m/rmkJqBWE
 a9eW/7+eRGJ9cYHVwyw+LcNgRJljkRAx2hcm7DJ3Nhn+8y2sYMKafr5t6
 R18AEgqCszon8VBLQeM4tKf0PX50wU1ZQQI4CBrZHjHGagODiQbkDhqVk
 jFHTG+tn4yRZ7MyPuZkNQ2MHQTVE7D+HPgSjTLAEDrSYbQ3TJeec7e7Xh
 KeIJsYV1x2kHYPk67YA9k8IvQyG59oGnzcbooAWIQGhj+GPRHxqV5NMhV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403727889"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="403727889"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065161513"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1065161513"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:37 +0300
Message-Id: <20230817082437.3116208-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 9/9] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915 now has a display/intel_wm_types.h and this is no longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../xe/compat-i915-headers/intel_pm_types.h   | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
deleted file mode 100644
index 0bd4b1cb9c83..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#ifndef __INTEL_PM_TYPES_H__
-#define __INTEL_PM_TYPES_H__
-
-#include <linux/types.h>
-
-enum intel_ddb_partitioning {
-	INTEL_DDB_PART_1_2,
-	INTEL_DDB_PART_5_6, /* IVB+ */
-};
-
-struct skl_ddb_entry {
-	u16 start, end;	/* in number of blocks, 'end' is exclusive */
-};
-
-static inline u16 skl_ddb_entry_size(const struct skl_ddb_entry *entry)
-{
-	return entry->end - entry->start;
-}
-
-static inline bool skl_ddb_entry_equal(const struct skl_ddb_entry *e1,
-				       const struct skl_ddb_entry *e2)
-{
-	if (e1->start == e2->start && e1->end == e2->end)
-		return true;
-
-	return false;
-}
-
-#endif /* __INTEL_PM_TYPES_H__ */
-- 
2.39.2

