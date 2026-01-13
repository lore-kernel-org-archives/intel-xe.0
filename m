Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65782D318A3
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537BB10E5B9;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEHwOM0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F610E581
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0YGSu4CZWcy8KdxtkxjmwKJshkkEr3weR6vLLZjQws=;
 b=kEHwOM0VJAFl/Eco2q2BYFBW9yUR7aZo8mpdLzkGLL2vEdadLufPvT9B
 clIAk1Yf8eOSvLTKuYWp34r70QwK7C8Yh2M8kBkAZZekprX0pDO6+APom
 86BWsDSMW/quYvE9so1UM87hMAN6PZyaDwEHuced5S01L2AUtQwsvsgeH
 A1riPfrHMQ9ZUHSCQ3/bT5LsLEnPU0qQ4gkDrjZtLKoYXnWuTA6jQWwAH
 7qCR+grPiyHt3zsUJuqzggBPU1MzVqdB3t+1Ja/0El9tQYLaje1f96XaR
 S/6sHKx9/g9KeuzzkyGPJbZV4g+daWlqdXOcPUN3yO/D5zrcCEfX2CVt5 A==;
X-CSE-ConnectionGUID: by1XCoFTRsCWvgmwHsUOog==
X-CSE-MsgGUID: koDjOXNdSXq+bbQ+n4chWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311185"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: HX2ZbRcxQJCnwCK3soxLmw==
X-CSE-MsgGUID: vK0RTM9xRFqLfUfzs1OxXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147492"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 79/79] drm/xe: Simplify header in xe_wopcm.c
Date: Tue, 13 Jan 2026 15:04:24 -0800
Message-ID: <20260113230315.3081153-160-matthew.d.roper@intel.com>
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

xe_wopcm.c only needs the GT type header rather than the full GT header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index ada0d0aa6b74..dde4f4967ca3 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -10,7 +10,7 @@
 #include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
-- 
2.52.0

