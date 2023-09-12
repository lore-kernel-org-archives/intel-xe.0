Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D31CA0ED5
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A742810E38B;
	Tue, 12 Sep 2023 06:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382C410E36E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501255; x=1726037255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=apdgH1acWudrdqdItMV5CDrTqIP2jtsp1nms7IYl6oc=;
 b=TTixru6+7JAzWQMmw22QGpYTusEA1mzPHLHKwO/jGlJP3rrhVSVeS8Y2
 VtQsEfqO1vTfc1q1lK6eaiiEBR/rklmqka4knIkaOISuZzAnKMJFuoel/
 7TifzdAqwuKOUrLwYQrTzy2Vx0iQAds85fYAqYNxRRBNw+1eTletCkQF7
 4jFL9BrvMbEFj0HTeefJXlc9diQT1+LNak3IboErTwDAsBxIIAG/WbqW5
 dyCEcyvm87IaRazNTZ8WmhV3MrkelGg6oBkJs+iJQrKd2dwCcc8QUUP5y
 ZTMI+0D1E3ziuEFYs4cfLrbK0dcsVOSf/CSu84GkF5RjGy9GhyAOMn04+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730352"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730352"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699058"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699058"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:06 +0300
Message-Id: <20230912064709.2802305-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 09/12] drm/xe/display: Include i916_active
 header
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
index c567220bfaf6..d70c941dcb67 100644
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

