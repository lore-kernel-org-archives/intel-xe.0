Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F30DCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA3110EB88;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3G6bspo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31D910E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539210; x=1794075210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wV1AUp2eihpVvy+QQErUY3F0+TPw8tA+mk6G73UmE7A=;
 b=T3G6bspoK/9jecHQw4LnbWp3oLtW7/CpB7WMooxCQx98p95s0pU0WQzY
 7fmWqwedmfegZ5YYl/BbsHfS/aOgWaCx0qXWMT4tGYFRInVOqwO7zRgxj
 /RZLxtKdTtOJ9NwpmQDhL9A5xFLv6HJDK1xhtuLn8W5am5tGdMseHxE8P
 uyfU7BS5Nk8grHLrRAAHK7slGpb2r9Znb4TzNxs3TMgIVLgMC5/M//pii
 7tm0KeA7ztArBNToGHtN3wjxYqU8gfR6EZsUc0I6gkxuqBrYNYrw8rwuS
 TqAEuayisfaTU35VLkNewpjFAvX87EpDI9bq1id6BDj5yUSrD6PQNFKiz Q==;
X-CSE-ConnectionGUID: RrV3rhbaTrC9o/KRPJFyqg==
X-CSE-MsgGUID: L7vIoqzrT6+2wQ8mwIdQEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733141"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: 6EBY5U2QQ9axoizKFeIB3Q==
X-CSE-MsgGUID: QEtD/y4fT6C9RKd1ITKvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271170"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 08/33] drm/xe/pm: Add scope-based cleanup helper for runtime PM
Date: Fri,  7 Nov 2025 10:13:24 -0800
Message-ID: <20251107181315.631642-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Add a scope-based helpers for runtime PM that may be used to simplify
cleanup logic and potentially avoid goto-based cleanup.

For example, using

        guard(xe_pm_runtime)(xe);

will get runtime PM and cause a corresponding put to occur automatically
when the current scope is exited.  'xe_pm_runtime_noresume' can be used
as a guard replacement for the corresponding 'noresume' variant.
There's also an xe_pm_runtime_ioctl conditional guard that can be used
as a replacement for xe_runtime_ioctl():

        ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
        if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
                /* failed */

In a few rare cases (such as gt_reset_worker()) we need to ensure that
runtime PM is dropped when the function is exited by any means
(including error paths), but the function does not need to acquire
runtime PM because that has already been done earlier by a different
function.  For these special cases, an 'xe_pm_runtime_release_only'
guard can be used to handle the release without doing an acquisition.

These guards will be used in future patches to eliminate some of our
goto-based cleanup.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f7f89a18b6fc..c2cde906aeaf 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -6,6 +6,7 @@
 #ifndef _XE_PM_H_
 #define _XE_PM_H_
 
+#include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
 
 #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
@@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
 void xe_pm_might_block_on_suspend(void);
 int xe_pm_module_init(void);
 
+static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
+
+DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
+	     xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
+DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
+	     xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
+DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T))
+
+/*
+ * Used when a function needs to release runtime PM in all possible cases
+ * and error paths, but the wakeref was already acquired by a different
+ * function (i.e., get() has already happened so only a put() is needed).
+ */
+DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
+	     __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));
+
 #endif
-- 
2.51.1

