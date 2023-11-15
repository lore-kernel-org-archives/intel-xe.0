Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C62C47072
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9D10E4F0;
	Wed, 15 Nov 2023 06:32:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CEE10E4F5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029962; x=1731565962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9BtlsGgqLW9cmgoTv0QG35nkQRJshSgcuHg4HA0Wqas=;
 b=Hcna8ST2ne7oDC4BzHP1bj2+RuFgl60mzJesbzKx0P14JtFRIw0kTypI
 Md116tTGJACZ/dj/HUvRp568CpXTtKLb6pdbKaRo9s3/8wqmreYTBslBW
 n9/SkNsA+tyw2MuhVmoakKlyPa88t40ydMvrm1+YTif20igv5H4K12f+W
 0YhbD5ROT2ZWzAgGJMBZ9GBKQMqQn6jQJ+tKURJ4nMvPlWuXsa8e7k+N3
 SJF1HrQ1rv49l6ukpXVz+QeVog4ousdlwQWyZ9m8Gt6kVGlLmmhjr6jBP
 3cEpwhSRVTSkUpV9zFy4DNS/2mrqQxcS34c95EH60OookCWbmhdX0dthL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616514"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616514"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389832"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389832"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:40 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:08 +0200
Message-Id: <20231115063210.3112123-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 7/9] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add i915_gem_object_is_shmem into i915_gem_object.h compatibility
header. This is needed by intel_fbdev.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

