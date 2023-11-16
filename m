Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7342BC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AEB10E24C;
	Thu, 16 Nov 2023 06:42:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2810E24C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116942; x=1731652942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ees8nbFVrFtqii4+JTaBTRptvZEI9b8SdIge9Zydv0=;
 b=FL15K/cOzXvTak0bGzcwgSSi0TZN4bSgbLSakHhRqdiiVndhIcW7zWf8
 zz/WBbdPi6stXJX3/PKM3oPy/v05Ddh65+Jwr20T+PJpw3W5V20XQFcWx
 z22kqIA5rOxvO0bbXzXLLivVnBYacicVe8trPkkDT0zekpnorxvZF5SMC
 d3hhSv8NLWbMxCvHCa/D7dxvqn7ZE5GfNqIFQPKCn56BKuuiGBGTfFaU4
 9M51JF8UwyncGT3XXQei7d4zUFS9e2qMTlhQS9CUAEbJz0esrolvcMr7E
 jB/x0aC8/YBH5q5fE5f5qcr5S1aknw6Iwn1BYnJvQsf2XKL2wtwulJxxA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422792"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216706"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216706"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:20 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:40 +0200
Message-Id: <20231116064145.3969338-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/8] fixup! drm/xe/display: Implement display
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

Move xe_bo_get and xe_bo_put into intel_frontbuffer_get/put. This is where
it's done for i915. It should work for Xe as well and this way we get rid
of related ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gem/i915_gem_object_frontbuffer.h         | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
index 2a3f12d2978c..498292fa15b9 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
@@ -6,7 +6,26 @@
 #ifndef _I915_GEM_OBJECT_FRONTBUFFER_H_
 #define _I915_GEM_OBJECT_FRONTBUFFER_H_
 
+#include "xe_bo_types.h"
+#include "xe_bo.h"
+
 #define i915_gem_object_get_frontbuffer(obj)		NULL
-#define i915_gem_object_set_frontbuffer(obj, front)	(front)
+
+static inline struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct xe_bo *bo,
+				struct intel_frontbuffer *front)
+{
+	if (!front) {
+		if (bo->flags & XE_BO_CREATE_PINNED_BIT) {
+			/* Unpin our kernel fb first */
+			xe_bo_lock(bo, false);
+			xe_bo_unpin(bo);
+			xe_bo_unlock(bo);
+		}
+		xe_bo_put(bo);
+	} else
+		xe_bo_get(bo);
+	return front;
+}
 
 #endif
-- 
2.34.1

