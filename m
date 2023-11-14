Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E84C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5C10E1FA;
	Tue, 14 Nov 2023 11:01:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA110E1FD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699959688; x=1731495688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvUNGtN2kXCd+cRcdZdoCIsWveJmrNprXPfQKUzb2lc=;
 b=Zh8OYPhwyzqWGpK5XJ9apPWf6xJFafjukoNi/NXhSwsiqcDjfOiT6wHu
 ZM4+gHTb0Zh+1K2lAuALpZ6sI1lVYAD6llrglKNonN+RzI9MCboC4vSs5
 /9tLKdvYSePLaOaj25h5+dYJEmbma9pbLepGixXgHl8Q4S4i9wFL0ORhK
 fZGuo+AZDKTvUqC65RxIzz4J2PTsilqi2Z2X0wSkGj8It2mlNFe+g6lEN
 jtsMmmqUyXmLoUdy5wG+xDpdi8W7z5VrL2yawGdKCNliUMd+HnqOkO9aS
 CUcAr8M7Ti3wbVygvq34kJN3W+wabjodDO5ZQml5KDe0RcwMkwO1vbxCa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454924440"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="454924440"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1096057515"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="1096057515"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:01:21 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:00:54 +0200
Message-Id: <20231114110056.2423853-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114110056.2423853-1-jouni.hogander@intel.com>
References: <20231114110056.2423853-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] fixup! drm/xe/display: Implement display
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

Add i915_gem_object_is_shmem into i915_gem_object.h compatibility
header. This is needed by intel_fbdev.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/xe/compat-i915-headers/gem/i915_gem_object.h  | 11 +++++++++++
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h     |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
new file mode 100644
index 000000000000..3b305c291cdd
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _I915_GEM_OBJECT_H_
+#define _I915_GEM_OBJECT_H_
+
+#define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
+
+#endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 3012b787aa6a..8e67f38e98fd 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -12,6 +12,8 @@
 
 #include <drm/drm_drv.h>
 
+#include "gem/i915_gem_object.h"
+
 #include "soc/intel_pch.h"
 #include "xe_device.h"
 #include "xe_bo.h"
-- 
2.34.1

