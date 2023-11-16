Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13A8C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8488410E24E;
	Thu, 16 Nov 2023 06:42:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BABB10E24E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116945; x=1731652945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fi3jhXQp19yU4AVlCuRxW5dc/Lo7wZCXZbHPVH/p32I=;
 b=I3pJSUD7OVwVn6oudsEWT4Nqdpt5bimt5k5men6ao3BSmlJ0WbO9ToJH
 hhyjE1VP6cpmF+1lNfafv6/w21znM0cmt8n1YXegA2dMzTNFkUN2WFtBg
 Fa31X5w2yaNMOnG6aLTEVj/ROT5RSSn9BAaGdFf+vmOJ/GJ+6v8fXfW7o
 PGtrWAMWH5R76rptWMFdnwe+KPPrKwG+uI26R13c8qsjMLYAhPM/JHe53
 IcNl6E2o9dplD44j7AulXDSOVWUUfz9X+R1z/T5EYvQ8B88rIl7Omglcd
 pW+l4FberPSrT2V31VxYlOcLUPHTcqhglYZTBkIsGiRmgOYL4eG9hDJ1V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422794"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216734"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216734"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:23 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:41 +0200
Message-Id: <20231116064145.3969338-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/8] fixup! drm/xe/display: Implement display
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

Adding i915_gem_object_is_tiled and i915_gem_object_is_userptr for
intel_fb.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
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

