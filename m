Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7BDFF5136
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 19:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532910E4A7;
	Tue,  7 Apr 2026 19:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aiy4Hjqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AFB10E4A7;
 Tue,  7 Apr 2026 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775590616; x=1807126616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Xoea6ILCsQiNMXOpmzl2MQn8yGfJS7o8+adSBNVD5M=;
 b=Aiy4HjqaBHI3eT7y0MKOXSPsujQpA4X4k3E5ZV5Q1sg42mOnRyi9uwgm
 hxNdHMoNkWytllNNdtUDeosJUyl7lZuSM4U1FEvnwySpGG9V+9WJscJjt
 7hLE1nVlMOZLmw/Hi6xXq4up8XajrZB130zY1h2pjRAETGHqOkCokS6Tk
 x2in/X7ln/RVxtqZiynoq7d0p50/yVceQRSXboj2DDhnk3KnFjX19aCGv
 Zu5Hh409YPCMiJ2KqGtKNRpA+McjqSLGzaO9WNVvcvKa6QbAneyAqD3SH
 y8bduRPlZNK6gVqO6aT97AZl7IalCmWiJQdDvo9OVJJHapMuKh/d4st7g A==;
X-CSE-ConnectionGUID: Ofrl5+ptQjeLepe/DyN2Cg==
X-CSE-MsgGUID: DzhUOMtmSl29q/V+dcxZtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80424041"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="80424041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:56 -0700
X-CSE-ConnectionGUID: PuyL60UJR9Cpu8Dvged0Fg==
X-CSE-MsgGUID: 7EdDbpiHRDuazwEQBFSz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="227419553"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 4/5] drm/i915: drop unnecessary intel_pci_config.h include
Date: Tue,  7 Apr 2026 22:36:29 +0300
Message-ID: <8323c99f379809b2973c99ebe54c21fd274d246c.1775590536.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775590536.git.jani.nikula@intel.com>
References: <cover.1775590536.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There's an unnecessary include. Drop it.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c10cab38935a..129013c5fb42 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -122,7 +122,6 @@
 #include "intel_cpu_info.h"
 #include "intel_gvt.h"
 #include "intel_memory_region.h"
-#include "intel_pci_config.h"
 #include "intel_pcode.h"
 #include "intel_region_ttm.h"
 #include "vlv_iosf_sb.h"
-- 
2.47.3

