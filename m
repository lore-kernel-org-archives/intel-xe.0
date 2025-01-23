Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAC4C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8EF10E142;
	Thu, 23 Jan 2025 04:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgFyQg+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCD110E142
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737605989; x=1769141989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbSkrVCQ6St6WTtTFr8henqmfW4s8kz28hTv8mQMS6A=;
 b=dgFyQg+jg1L6vTp2Mg0lql4s1Fp0czU+vvHodxZ+CQg1sc46dQhjXC0n
 5Wd70fxlpxW0heVRoqoak5ci8HOBsk8JCw+RIhY1lYmIK8+jyzL1BoU8q
 pzpunWWr0V1KCQx9OKHwKPvvlDQemo8OSYnBIMWvewEb4xMMJgy51rQ3r
 RDLlsi/13/4Q/MqeccRWRgoveAQHj6Y0zFQiM5FGw4lSBLcz2hnpLq1LT
 RmoMWlyE1MwmolgGXLrGU6lVTJklSGWQUpV0J8Oo6fxr8rIYuqj3RZqEW
 Ats5CNCo1h/7pP/AupF3zbNHPWVFf/9qN3I6Oki4x3yu48JP3PKy41tdi A==;
X-CSE-ConnectionGUID: nOaHuFC6QfGVwuHsR/DhDg==
X-CSE-MsgGUID: PdhpopsATgS0jmbkt9Aq9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37971651"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37971651"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:48 -0800
X-CSE-ConnectionGUID: n4sbsBBzSF+zSvTqYuZjrg==
X-CSE-MsgGUID: vn/49FcJQ82R95zpPTXTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107202067"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v15 5/6] drm/xe/pmu: Get/put runtime pm on event init
Date: Wed, 22 Jan 2025 20:19:22 -0800
Message-ID: <20250123041923.1892837-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250123041923.1892837-1-lucas.demarchi@intel.com>
References: <20250123041923.1892837-1-lucas.demarchi@intel.com>
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
index 5e5a9fcf30ace..2b66a7957b665 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_pmu.h"
 
 /**
@@ -71,6 +72,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 
 	drm_WARN_ON(&xe->drm, event->parent);
+	xe_pm_runtime_put(xe);
 	drm_dev_put(&xe->drm);
 }
 
@@ -103,6 +105,7 @@ static int xe_pmu_event_init(struct perf_event *event)
 
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
+		xe_pm_runtime_get(xe);
 		event->destroy = xe_pmu_event_destroy;
 	}
 
-- 
2.48.0

