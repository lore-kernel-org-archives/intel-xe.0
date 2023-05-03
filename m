Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0B4C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821910E0CB;
	Wed,  3 May 2023 13:10:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6510E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119442; x=1714655442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zip6wNunLqH864T2SW/aOFWHc/VAQdnKvNBNpta877M=;
 b=WUn7Mgbb6qiNnWPt0FaMKJZqXsbzde7qaLoGBGO7B9AlS1ZK+p+Dk/YY
 EXqiMHw+F6wT06zhCiIjWqbkX1QQUl5cDxqvyMYOGcaYmnLrsNQtx75O+
 exH6rg17gTsJjIhEINdYMT2+bmB7oNJu6mQ7jRGuHBNUgNvdgudCBK8EX
 vINVrgvP4bMV+XXb6TlXzxrKdYobkdwImCj9WUlJ/HjtdShdTl2+qEteK
 i51XJZEcM6q1ACyMfS8pKi36aInFBbDVOsCQfU2UPKPlWVzwdtLBAEpPA
 S5CueGVhWolvrjQ+C7jvcqV2Y+CfceG7E0FT7dwfkR78wCO+pSQAdgGJf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348691467"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="348691467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="727132358"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="727132358"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:53 +0300
Message-Id: <20230503131005.1602412-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/18] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use i915/display/intel_de.h for real.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 5c223ff6b3ec..22907719bb1e 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -3,9 +3,6 @@
  * Copyright © 2019 Intel Corporation
  */
 
-#ifdef BUILD_FOR_XE
-#include_next "intel_de.h"
-#else
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
 
@@ -177,4 +174,3 @@ static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox
 }
 
 #endif /* __INTEL_DE_H__ */
-#endif
-- 
2.39.2

