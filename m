Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A15C47074
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E624610E4F7;
	Wed, 15 Nov 2023 06:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2410E4F5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029958; x=1731565958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NP5h1sLEm75OWrAUtWU11ZxlLPtpyxFOMRcJiF82Ko=;
 b=Mx/gsBURWfSYeHvhmUmCKJp/FhPzynVWRvjKiMR/Tu8v9eYRYQoa4a+p
 UyhTusD4lraLxcAJJ05rgvvwfjwXQr78t5SbycJlX+HLMr37m92EzanPa
 lCoVfY9hDKaH67ULYgjy/4Swg/oZtRy9QzqJR56x1L59HImgMm+ebHvn0
 PsFM/f3sV9dCNnxtEGqfrAc3EoOM8/VZ9MaCoIUTmKBrH3iYxPKCcvr3F
 fsBAFNXoJIWWDjmvHAoDa1KnEKWrd/X3xEEtwbF8FKMIdbTvblj5Tmgh5
 hyaHXOYh2Ky+7DrkQt9x8m29KG4BF1MxrhWf6A1XZu+oQMblr5iz74jW+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616508"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389797"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389797"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:35 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:06 +0200
Message-Id: <20231115063210.3112123-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/9] fixup! drm/xe/display: Implement display
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

Add i915_gem_fb_mmap define into i915_gem_mman.h comptatibility header.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

