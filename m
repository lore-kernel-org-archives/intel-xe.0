Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C48C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372FF10E2B3;
	Wed,  3 May 2023 13:11:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD3210E2B3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119479; x=1714655479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BtsbxiSxnLPUBY81PSEep6hYtk4HC9UzPXyWa+piNM=;
 b=eJW+tShq9KsQ6jOKU911q0qdga+yck516/WpLoUJZmxkkG24uNgb4CTU
 QZwl0qujmfptCCYHXeMi8VVjLlHcbUXlqe/steE7XxvDXoSbLDgmomUJU
 dk5rbQwGwTuKDu8HbrGbjM9hchefzW91s87As9TRxtPQX5m3t56ymYgUZ
 Hm0qzf+IRMG6iw2iI7RCbLt3M0Go4bFJaYPNfD0WJ3zIF3THP0WIRwdNm
 FltXDSoJcfiNq0MJusgvlpuzC5if4iILWKbM+h0TYxjcHUFl+0r0LXk5Y
 9WxKoncATE0xPwBzaahAH5X8Bk44ckK0do9ZryuRcQKlmHPTjzZ3RdvGN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="414109777"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="414109777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870933204"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="870933204"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:10:00 +0300
Message-Id: <20230503131005.1602412-14-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/18] fixup! drm/i915/display: Remaining changes
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

Restore a removed include.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 90368bf5a1f6..ff70225c0263 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -18,6 +18,7 @@
 #include "intel_display_power.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_pcode.h"
 #include "intel_wm.h"
 #include "skl_watermark.h"
 
-- 
2.39.2

