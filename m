Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE8FC10F13
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 06:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F05310E2D4;
	Mon,  4 Dec 2023 06:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3310E165
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701672611; x=1733208611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ees8nbFVrFtqii4+JTaBTRptvZEI9b8SdIge9Zydv0=;
 b=f0nwnebWrvWKFXiogoxr38Uuo82lvVk4/Jdknxj6nrjr8X7doPewan+Z
 TMv87L0bGsNwCJC3SpkxGyzgN5ehKug8Nw/mWA2prJ52K4u+205n7gPLo
 B/6b8SEPwW26RxvCRqR7hoCFEJ5omyewP1tADPE5jNoI1aGW7jqg9ug97
 gJ/qtGFF96brqSEr5h32w3uCgosNc+rv6qd856BbONArin3xS7KIM7Z79
 ns6pKjgDQ6H0+KAwWcRB/I/Vg5xJMLukCS3szcenzuPuovNrxN04Ke8lh
 hs4y47cV2fmGxmTzhHiVZCtIxkmetO82d/A0hUFHRr8MgS1H2/LANBnsB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373880080"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="373880080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836482859"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836482859"
Received: from martinro-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.46.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:09 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 08:49:30 +0200
Message-Id: <20231204064932.869215-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204064932.869215-1-jouni.hogander@intel.com>
References: <20231204064932.869215-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/9] fixup! drm/xe/display: Implement display
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

