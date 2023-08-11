Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB447C001DB
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B865E10E68C;
	Fri, 11 Aug 2023 09:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71910E686
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746603; x=1723282603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XaZyFvt3NSMOY9vqplMkuyNXCDYMdsmDl1mN6yossjw=;
 b=QGHmvMhLFUZVuAy1iZ8H8yQXGnvzK/yjdpitJXpS42+kQUQAHNTl9pjT
 Dg32YQXBe+8gdMKT36Q9FJRjkhkbTkEeXu+XjCBNXOJSG/RKdUka9HqDw
 jF8kHYTU5aKwQFN5RRPNIb+HNKauJ6M6p7eQFxw4ZM9YooRpNc474KMPS
 1F5g3EVaEJFO8tag0xawRogFOtonjaG3QujXMf2ya9cdXoh4TRjPXvN9M
 LX/Hxc+qyaICMA3TDDScREn/Y1wa9FY/BBisleSxjn2TivIrG4X4FS9Ub
 1/jlFKLnbsbxffn4QZHBX0qfpc0E/IudyQqW7vTOoyGIAwfmMBXjchhQE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375354258"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="375354258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822605306"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="822605306"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:59 +0300
Message-Id: <20230811093559.2304457-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915 now has a display/intel_wm_types.h and this is no longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

