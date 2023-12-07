Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17668C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1910E919;
	Thu,  7 Dec 2023 15:58:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D810E91D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701964725; x=1733500725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b61/x+Pt/X4gc6Mb+/mw7iuwAjXmgUe7Gs4xzHuBX98=;
 b=nPBKsCD9JO+4NrzFi+9iR2zMK5mwO2IAB3Y+E7wMjeHmv1tNie9pPwF7
 9VAcM0RZBwKEJGxH+7+G73PGO7Grzs1klhsUlK+bxZr4shGzQReZbfSz7
 woIR0TirAcypceURGK+PHmVWPYsB6h/UU1pzKL+HVPtbyRHRR093kZdVo
 0TrSnQ2xirW8b0dnc7Udwo26lDd1Jr1sqmvSR+a3/3qJWRGh5/ojPzMqw
 H6eluXk7z5Q33FIAwlXzoyayG5h/bxEEQFz5cOnnPgiycaDXjp/MZmrnr
 XlgfkLJudmJtOEU/DCRuMdzTS+4WbJ7/jtf098RWCpGKSqlK6MJDFWyXZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384655302"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384655302"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765151743"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765151743"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:42 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 8/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 17:58:14 +0200
Message-Id: <20231207155815.2467082-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding i915_gem_object_is_tiled and i915_gem_object_is_userptr for
intel_fb.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../xe/compat-i915-headers/gem/i915_gem_object.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 3b305c291cdd..996b4f4f27dc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -6,6 +6,22 @@
 #ifndef _I915_GEM_OBJECT_H_
 #define _I915_GEM_OBJECT_H_
 
+#include <linux/types.h>
+
+#include "xe_bo.h"
+
 #define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
 
+static inline bool i915_gem_object_is_tiled(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
+static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
 #endif
-- 
2.34.1

