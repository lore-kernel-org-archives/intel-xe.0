Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2570D29DDD
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDE010E581;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNBKubez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2410E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l5DO4fY+lIxZWI2VksmKnDzBbo11bkpsAi3i3nh52Ww=;
 b=JNBKubezaat8+D2aNHHb4PYUPjlhqAA7YDO5RTVhPl+S1bMC8pLShBPS
 3ahdskPcuYRFJc54sYwSaI82g2D3sMTnRO9rIedbNZJz4vcoJl2xLFNyd
 Uiy2vZTB6LZpH13BSijKo9LXRcuQYpCvSJg1k56e/wfhLh8mNI1GsLVnb
 xJ2fC5hJmjDMfJeoxWc2yqhUnta36nG5ZnDmbMUzVohevx878v0omUY4K
 fAXM2JmrCBXykkI7XG9DOaNb8HzzkEg1uYEmmF4SuNBSNsrYa6EQlnFtm
 KQ/Tv3UhMNzUHi9xXtcQWLglXh0129enIIwBNQeT3sxtp0ts6h4xkt5F3 Q==;
X-CSE-ConnectionGUID: x/5X9nE4Spu2p4kzEwUXmQ==
X-CSE-MsgGUID: vIHF3KstSVeUsIOBejXlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311139"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: tTvIesvZR2C0qJQLstBzgg==
X-CSE-MsgGUID: heJPIQ8fTIyZZcZ9WszWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147377"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 32/79] drm/xe: Cleanup headers in xe_guc_relay.c
Date: Tue, 13 Jan 2026 15:03:37 -0800
Message-ID: <20260113230315.3081153-113-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_guc_relay.c doesn't use anything from xe_gt.h.  If also doesn't need
xe_device.h, only xe_device_types.h.  Drop/replace the unnecessary
includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index 0c0ff24ba62a..577a315854af 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -17,8 +17,7 @@
 #include "abi/guc_relay_communication_abi.h"
 
 #include "xe_assert.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_guc.h"
-- 
2.52.0

