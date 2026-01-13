Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28053D30CFB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2F10E57C;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQtZ1sxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFF010E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RDQD3gO9g0ZxkIViME8XwQbnAutAICxFBF6aWaM5IOs=;
 b=GQtZ1sxsamsjkH/v111sxLU3FWYj1RXSm8g8bpbJsR4FxxdiJeEygiBa
 p+fq7OOBDxv1ljidEJ7c0m8aKBGMmhTPqUEwij+yFRx05mOZtsDZV1IT7
 1bl+B+1/HRg7HoVvZ/UJZ4VQdRcQ9v3GZgGWb2b6wf3pZh6CovxyGjSzu
 faUDJ2Nb34ugQRb6j1d6JAXzGXlqO1eTpHJVfjFe9nQxzlPViw16s6qf0
 KrwLppUz0vvDbz39auAMh/ISpaX1MwMnb7oAmsq6Tymx5Bp358wqZNJIg
 i3etCTl1Y2qcHiQfmuqq3UJVmcjaKLeUhE4HQctcRvxyj81nr4xh1V8hf w==;
X-CSE-ConnectionGUID: CUp0QyLoQuSSfTi5KmRgHg==
X-CSE-MsgGUID: xgu/7PV8TV+JKjfabu4phg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311128"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: 5qO8Ix8TSA+5UN7B1RAxKA==
X-CSE-MsgGUID: mrIT7M5uTbCfwkuyrbw2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147355"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 23/79] drm/xe: Simplify header in xe_gt_stats.c
Date: Tue, 13 Jan 2026 15:03:28 -0800
Message-ID: <20260113230315.3081153-104-matthew.d.roper@intel.com>
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

xe_gt_stats.c doesn't use anything from xe_gt.h; it only needs the
corresponding "types" header.  Replace the include accordingly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 8294bcd40310..37506434d7a3 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -7,8 +7,8 @@
 
 #include <drm/drm_print.h>
 
-#include "xe_gt.h"
 #include "xe_gt_stats.h"
+#include "xe_gt_types.h"
 
 /**
  * xe_gt_stats_incr - Increments the specified stats counter
-- 
2.52.0

