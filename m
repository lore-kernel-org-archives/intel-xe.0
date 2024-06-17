Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C632EC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707E010E3EC;
	Mon, 17 Jun 2024 14:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3lr9K78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145ED10E3E7;
 Mon, 17 Jun 2024 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718633996; x=1750169996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2X5wER3cN2q4cAk64/ig/YgL3IiObrhDUI7MlDeKoY=;
 b=J3lr9K78T4Gtb+X5ul/YVWHRCn90Cq4bGEyENA5e5wk7yqKrjSrhplIb
 HbHwhuVav/kpEzZhLiJ8MuUM4NwYsPYXjRu6TcrL7d3v3du3lvYPMJ8W9
 X8a95BCqTsEhhnDWdUy78YX91KU5vFoDZsD2KpHhl52l2KbyzeOcn8qvR
 IYUbG3qixqBGVx77RWSb2AsHt5JvU2M3pY9+WdJ7tv/Df0I+sf9DriPm7
 vosGfM6/VkQKdFfY+RomqMsS4FhEv06HTSIxf/a6zfNGCsBnrOcp0NJi6
 km2tJq2ZV6FAjCslU2EqWxgUufCbdKCz/XG5Ovq5LByZcbmjeeBMZ8KgW A==;
X-CSE-ConnectionGUID: PVUlmhGGShSNgRgjRRXGzw==
X-CSE-MsgGUID: emvS/V5yQvqWXdHrVOZ3TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15593335"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15593335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:19:40 -0700
X-CSE-ConnectionGUID: rI50lKjfTvCrkzmhjOwQaQ==
X-CSE-MsgGUID: HCzsTAjtQ1WkgOfA6Sh3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41083549"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:19:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 5/5] drm/i915/frontbuffer: make struct intel_frontbuffer opaque
Date: Mon, 17 Jun 2024 17:19:02 +0300
Message-Id: <ba2e3e16b5c47f7e6d434d8fa815e965458a98d5.1718633874.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718633874.git.jani.nikula@intel.com>
References: <cover.1718633874.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hide struct intel_frontbuffer implementation details within
intel_frontbuffer.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_frontbuffer.c   | 10 ++++++++++
 .../gpu/drm/i915/display/intel_frontbuffer.h   | 18 ++++--------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index dd5fd1e2859e..53a4cbc43ae3 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -67,6 +67,16 @@
 #include "intel_psr.h"
 #include "intel_tdf.h"
 
+struct intel_frontbuffer {
+	struct kref ref;
+	atomic_t bits;
+	struct i915_active write;
+	struct drm_i915_gem_object *obj;
+	struct rcu_head rcu;
+
+	struct work_struct flush_work;
+};
+
 unsigned int intel_frontbuffer_bits(struct intel_frontbuffer *front)
 {
 	return atomic_read(&front->bits);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 62d6e3cedea4..a6212ee4ed12 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -24,13 +24,13 @@
 #ifndef __INTEL_FRONTBUFFER_H__
 #define __INTEL_FRONTBUFFER_H__
 
-#include <linux/atomic.h>
 #include <linux/bits.h>
-#include <linux/kref.h>
-
-#include "i915_active_types.h"
+#include <linux/types.h>
 
+struct drm_i915_gem_object;
 struct drm_i915_private;
+struct i915_active;
+struct intel_frontbuffer;
 
 enum fb_op_origin {
 	ORIGIN_CPU = 0,
@@ -40,16 +40,6 @@ enum fb_op_origin {
 	ORIGIN_CURSOR_UPDATE,
 };
 
-struct intel_frontbuffer {
-	struct kref ref;
-	atomic_t bits;
-	struct i915_active write;
-	struct drm_i915_gem_object *obj;
-	struct rcu_head rcu;
-
-	struct work_struct flush_work;
-};
-
 /*
  * Frontbuffer tracking bits. Set in obj->frontbuffer_bits while a gem bo is
  * considered to be the frontbuffer for the given plane interface-wise. This
-- 
2.39.2

