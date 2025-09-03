Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7867DCA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF3610E94D;
	Wed,  3 Sep 2025 21:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2dy6q/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7110E94D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935453; x=1788471453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUwXGFEnUg+rJzyPTYPAL7jBtNQgV3UEHHLEvR/Jqi4=;
 b=c2dy6q/KNXpOFznZWKpXIXksgVidnzUan9+gKLXz/S6dAjaIF5JhyU3L
 pvwCpsH2/Ky6aHCNV2Ags3ABVIgB3LiTGm6APMX4ybcSeLWBQvyEl8E3Y
 s4D1YhXXK9EG9OniLGZ00jX1k9Mhx7yO3t6DMjPRftTRviONDFDN0lACY
 jArUgR1m6vJy7MCKQqtA8fVD0I0usVbYbdeaQiOdBoSBhOXD8HiL8dm1R
 Hfsj8ETNqn0KheJcvNxHT9rl0Qf5UdJ05S9q+JtBc2FesrXwTfFfmkRgC
 7Dg5II2opGupK8xNr7VHVTuFeByZEiLvVKScbYwNPCIKU8lfNVEyQZB1I Q==;
X-CSE-ConnectionGUID: SWhlPc0TSOa6RzW5x01Z7Q==
X-CSE-MsgGUID: bU/KN8P1RRaHC/LWYC7Tvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178989"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:33 -0700
X-CSE-ConnectionGUID: nbEOghzRSRKpXHrVW7xpfQ==
X-CSE-MsgGUID: h4Kikd9cREaJXRBU4XxwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957603"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 7/7] drm/xe: Use tile-oriented messages in LMTT code
Date: Wed,  3 Sep 2025 23:36:12 +0200
Message-ID: <20250903213712.6364-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903213712.6364-1-michal.wajdeczko@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
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

Use recently added macros to print tile-oriented messages.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index f2bfbfa3efa1..d4412ee074a5 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -18,6 +18,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
+#include "xe_tile_printk.h"
 
 /**
  * DOC: Local Memory Translation Table
@@ -32,7 +33,7 @@
  */
 
 #define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
-#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
+#define lmtt_debug(lmtt, msg...)	xe_tile_dbg_verbose(lmtt_to_tile(lmtt), "LMTT: " msg)
 
 static bool xe_has_multi_level_lmtt(struct xe_device *xe)
 {
-- 
2.47.1

