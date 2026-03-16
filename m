Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB18F4645E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 12:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E310E505;
	Mon, 16 Mar 2026 12:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWl5aEOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A56A10E508;
 Mon, 16 Mar 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773663330; x=1805199330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uAA/iqsYYWOIFhQl1c7GbFm+ukskIimF0O18s2IuI18=;
 b=iWl5aEOLD7fufDlNKGlwK5wTdc3AzYfz3CIA0a95S9dfZtrjo2Z/Hsxf
 OjaxgFqwSLkHKdskSmHiaP4HZL8kKIVKoaKBsHasSbwaNN+7kq+Nf6rw0
 jDRyo9xjY19S5Caf1AGHSgfJTJ5LueN870wP6WhSYaNl6HHJqtTxW1lNi
 ds8GDV6BJg9aTPkPo1tCyRxvmyKyuFmCYRCFbilf7VtEhbfVBHLybPfYr
 Ek+Z2KqIFd/ghwwNtvOnzbdzQTXNAJ/8XOfL5LC5MwH6cNTw8a60zGmmV
 qCMckIQjNFC8SKFdbt0peKsgvJeVnuvEKwdYmCc8vZEmVOzEPRWDdyND0 g==;
X-CSE-ConnectionGUID: T4WxdNBASqqGsE/YAklY1Q==
X-CSE-MsgGUID: /aYr2luaQqyxAHr1ikDqDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74711463"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74711463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 05:15:30 -0700
X-CSE-ConnectionGUID: F1TaDm+/ShWAfk2VxmYXxw==
X-CSE-MsgGUID: DHWSuNm7Sbar71iNM6Bbsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221846877"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 05:15:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [CI 4/5] drm/xe/compat: remove intel_step_name macro
Date: Mon, 16 Mar 2026 14:15:01 +0200
Message-ID: <816e3f6dda0a112392e8f8ccff820a81aff63f32.1773663208.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773663208.git.jani.nikula@intel.com>
References: <cover.1773663208.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

As there are no more compat users left for intel_step_name(), remove the
macro and use the more direct include for the enumerations.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
index 2cf13a572ab0..0eabe2866f5f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
@@ -6,9 +6,8 @@
 #ifndef __INTEL_STEP_H__
 #define __INTEL_STEP_H__
 
-#include "xe_step.h"
+#include "xe_step_types.h"
 
 #define intel_step xe_step
-#define intel_step_name xe_step_name
 
 #endif /* __INTEL_STEP_H__ */
-- 
2.47.3

