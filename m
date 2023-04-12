Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26D7C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FB610E82A;
	Wed, 12 Apr 2023 14:27:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC44910E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309666; x=1712845666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vQHYXCqmAwkgECXgdGsoEhaZPzRBJTWbL5JO6FOkPgs=;
 b=Jy6BD1J4+/yEO4Clcs2Z5DkU6cYmT2jLc94UMun/Z/rTftdpTMstdjOz
 KBzzmMAkd1kt2fgOBqkXMJIGtX7JO1h5hff6BuQKD+Xqjmh/cBkaAGgzG
 Qrf0JUIwyA+wwo6lYeyQPosm4oCqKpYoZs4cfFvM84RmGp0Pj+10R3S7L
 U2/thC75Apr4zfS6kbVj+mOD9NFktObCZNQUx1nDqAdPGs7XWd1dbCznG
 dsZyqq8YcNFhe/RMYS+ss+0gbHsF+1Abc5T1NXNKPXeBWGYdPthJwjTwV
 39XodvtgDStcfb/3FGq8gtmJXKtmhOuJykt9JuvPjYpzX0cPfJjZYTcuJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341405399"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341405399"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639253134"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="639253134"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:03 +0300
Message-Id: <20230412142006.877109-39-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 38/41] fixup! drm/i915/display: Remaining changes
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 6698e1a47f0f..cc5026272558 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -9,13 +9,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "hsw_ips.h"
-
-#ifdef I915
 #include "i915_debugfs.h"
-#else
-#define i915_debugfs_describe_obj(a, b) do { } while (0)
-#endif
-
 #include "i915_irq.h"
 #include "i915_reg.h"
 #include "intel_de.h"
-- 
2.39.2

