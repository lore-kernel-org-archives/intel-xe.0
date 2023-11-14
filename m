Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB9AC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B230510E206;
	Tue, 14 Nov 2023 13:05:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5BF10E44C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967113; x=1731503113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtZwDmjfQ63FxfVlgBu1Xk9pX/BJGJXJHgN/Ro8JpR8=;
 b=mDZRVyya+Q1q81KPm/+FCSzSMnleOqRrTIlY12NRcYCfOGJXc39WjjP6
 n0NSIFGEIleojea1/4sopkmVSqx+foeiJ2XLZ4w98kf1i557RyHWTDnP4
 LM8JGvr4KDKN4dS899gV2qSXzLOhDl4eJPvGum8/podoXKuf1N2JIgDje
 qQp5gLRkJ5nJA2pSfCUURqcHOL/wgIotFhc6ImYhwjJy/ylzk3apmiWaU
 nO7yF9zLTbkMLUebA8YCVHNsbsAB2gMCTlhNMQcF+yDmy0IOC9FEGdOj5
 Bh6DMacPgJJiOyB6Bq2y5O/tY9MF4taIyoZzt0+GWkLwTwCJRC/od11VW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565371"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565371"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778949"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778949"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:11 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:39 +0200
Message-Id: <20231114130443.2503708-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/9] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add i915_gem_fb_mmap define into i915_gem_mman.h comptatibility header.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../xe/compat-i915-headers/gem/i915_gem_mman.h  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
new file mode 100644
index 000000000000..650ea2803a97
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _I915_GEM_MMAN_H_
+#define _I915_GEM_MMAN_H_
+
+#include "xe_bo_types.h"
+#include <drm/drm_prime.h>
+
+static inline int i915_gem_fb_mmap(struct xe_bo *bo, struct vm_area_struct *vma)
+{
+	return drm_gem_prime_mmap(&bo->ttm.base, vma);
+}
+
+#endif
-- 
2.34.1

