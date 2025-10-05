Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F2BCAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7A10E2B0;
	Sun,  5 Oct 2025 13:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcUI/OMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765DC10E2AE
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759671415; x=1791207415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awyrO8J+AYxrJRWzH5qgCohrrKXqv0edIUvRtDFLr10=;
 b=EcUI/OMUyKMuvCPiryMB0dUADN7OCITvU0H/0bxKnKFPl6lN3bXM6OBv
 S09MN4WZwUsBHTLMNFsyXOeT1h5gWnjf6EZEpcyzbduq+kBFWLqMO2cOK
 UW1HbMZgDDzqP5Ob/lL7go3APgquOroIjPjWNHkZVF/RWox7IRSOoaWQ5
 w369QiO6aoYP3kJhkIH7+xAMdunKN0ncXJJUnLGAnlsyyjvfVBSqIkQEX
 cCIZF3Cx2e/9RPwLujA6kSrB18A3Fz+KQ6WBmX4465SoN75lOouJU4Tr3
 V4tnwNDgPybA6b78KBFeZuc3YsoKmnXL7YwET2UElt8vw88myvJeAVepV A==;
X-CSE-ConnectionGUID: jlxJiGeZQWSJ7TGdEha8MA==
X-CSE-MsgGUID: YqOkdFyLRx+dJvu5Dkqxxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61779324"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="61779324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:55 -0700
X-CSE-ConnectionGUID: 9moTRz52QaOjFeLbsyOcrA==
X-CSE-MsgGUID: n4Wc/3hyT9qmaRpWNCq+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="179348611"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe: Update MEMIRQ to use tile-based printk macros
Date: Sun,  5 Oct 2025 15:36:40 +0200
Message-ID: <20251005133641.2651-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005133641.2651-1-michal.wajdeczko@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

We already have tile-based printk macros, there is no need to
manually prepare MEMIRQ specific messages to include tile id.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 49c45ec3e83c..0affede05820 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -14,16 +14,15 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
+#include "xe_tile_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
 #define memirq_printk(m, _level, _fmt, ...)			\
-	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
-		     memirq_to_tile(m)->id, ##__VA_ARGS__)
+	xe_tile_##_level(memirq_to_tile(m), "MEMIRQ: " _fmt, ##__VA_ARGS__)
 
 #ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
 #define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt, ##__VA_ARGS__)
-- 
2.47.1

