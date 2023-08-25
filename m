Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD40C71133
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26BA10E651;
	Fri, 25 Aug 2023 09:39:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412D10E64E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956371; x=1724492371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIkipG69jtwJAoN1ZLxJaVexrTs9ZOEKaDgXQMmn0EQ=;
 b=M28ao+BGTdjQDU1+EEcZMay6tP1kGc4T7JoNTNkCAGfVJr6md2V5QSC9
 PPfe4wvrB229an9g5/seTJMKZu+K5aBQUsxAd7XkBCEh9MBGGkTjZgseg
 j6lV1edZc7D75By+6DIAdmNapXBzGjLeMNcLStanDKFqe/SzqkJBvi4VP
 x8GOBHN2HkfxcF6qVhQa5DhHnJhZQpRkT147/RcE5j1pYS35cJoNrTQpd
 A2YDIXcdw0CkN7+hB88n5yUzjdzGs/R+hKiUnAR85AvVCHj8hKx3pHiQs
 inTw03Qyoqg8FfosYrFPg0aXWTxUl38Z/fGU8sEBNR8B5P9xpiYdW+HtM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037120"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037120"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246840"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246840"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:59 +0300
Message-Id: <20230825093904.1230143-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/12] drm/xe/display: Include i916_active header
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

We have compatibility headers containing dummy defines to handle lack
of i915_active in Xe driver. Include a header to avoid build problems
with Xe.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 452d77594783..92e027fb52b7 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -55,6 +55,7 @@
  * cancelled as soon as busyness is detected.
  */
 
+#include "i915_active.h"
 #include "i915_drv.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
-- 
2.34.1

