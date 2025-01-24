Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA114C0218C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 05:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC4810E8CF;
	Fri, 24 Jan 2025 05:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQyMXY0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9510E253
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737695082; x=1769231082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBb6zhij9PTIg1FH91Kxd5/8i71QyvTJMNo9tpbeTRE=;
 b=EQyMXY0Rador+K2eW5uuB34D6igugFGmlEYpO9LA4EJyn+ViM1Dy8ntU
 q6LRgHCqQqkB8eQfYlMDWBWxjKykLLgXnkbt8EUthZ9+7A7P/+X6DmfDa
 a5V6VEHjAhpLXw44WzEhJxDmywrDYiSr9p39w3uothcsguMeAmmaqR3Ir
 M92siRwOsa7ZWktPtofcFRTaXkAOwhEUsiKmhPwT6nlACYN7oi+kASHIP
 QmsJ471IWxt6gZm7t7P0W/xxmy8zRfdujZjm9inr1pbNSPMifGXzAMryZ
 FdmH5NCE+LPnVjShECxI46pWxWo5cqmeVXhyxaPUUwMGoJQPNF74hDSuk A==;
X-CSE-ConnectionGUID: /N6RJMcGTrSx0B6lF5/D6g==
X-CSE-MsgGUID: DcrpzMaoTH68VG+dH0YWbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38253080"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38253080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:41 -0800
X-CSE-ConnectionGUID: PYs95WSjS7KvxeDdaxjZgw==
X-CSE-MsgGUID: 5KZHOAItRx6BNizlEpHvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112304770"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 4/6] drm/xe/pmu: Get/put runtime pm on event init
Date: Thu, 23 Jan 2025 21:04:09 -0800
Message-ID: <20250124050411.2189060-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

When the event is created, make sure runtime pm is taken and later put:
in order to read an event counter the GPU needs to remain accessible and
doing a get/put during perf's read is not possible it's holding a
raw_spinlock.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 33598272db6aa..6678340d6195b 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_pmu.h"
 
 /**
@@ -68,6 +69,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 
 	drm_WARN_ON(&xe->drm, event->parent);
+	xe_pm_runtime_put(xe);
 	drm_dev_put(&xe->drm);
 }
 
@@ -100,6 +102,7 @@ static int xe_pmu_event_init(struct perf_event *event)
 
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
+		xe_pm_runtime_get(xe);
 		event->destroy = xe_pmu_event_destroy;
 	}
 
-- 
2.48.0

