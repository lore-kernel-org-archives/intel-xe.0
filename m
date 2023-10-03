Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49DAE75435
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 08:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241110E264;
	Tue,  3 Oct 2023 08:58:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C828210E264
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696323528; x=1727859528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwNnZP3/3S+54ZL99zAHS2N5g3Rqrj+mbxStZGgJSNM=;
 b=SvaIMjV5b/YduCcOWJuqDWZHHvvnh/vo/6ImUfYkMAqyiACdY6snU+4s
 OJLkVeOWQWW+ClXwWYWm59JS+Rl+5kD2utJLTfMUjYxzQ1ab270CY9V1A
 XgUDZFgClaG6cmJLOfGk1lqFkQOvuMbFfkWypXqDn9NxCkxP8jxSF5sK9
 PYZaofvg57vmYct4HmxkIruZLmkcRd76yEpdiz8eCpe+A4qe8opjAQDTY
 gJ8OwUufJwQswFSiIYMuaxgMzp1VlFyxFYIPwjGvdcyF0wwrwxgCSn80R
 EKJ+sg1bKYnDC0MI+YRgrwXbQmlWkO+/H++i5xarG6Lnw9mDEqO/5mzJ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="469100744"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="469100744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924573872"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="924573872"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:58:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:58:38 +0300
Message-Id: <20231003085839.2008415-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003085839.2008415-1-jani.nikula@intel.com>
References: <20231003085839.2008415-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We have an abstraction for "display runtime info", and it's
DISPLAY_RUNTIME_INFO(). Use it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 7c825f129166..f739858d17e2 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -90,9 +90,9 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
 
 #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
-#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
-#define DISPLAY_VER_FULL(xe) IP_VER((xe)->info.display_runtime.ip.ver, \
-				    (xe)->info.display_runtime.ip.rel)
+#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
+#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
+				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
 
 #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
 #define IS_GRAPHICS_VER(xe, first, last) \
-- 
2.39.2

