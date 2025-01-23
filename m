Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01DDC0218E
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3036210E338;
	Thu, 23 Jan 2025 04:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZadtVhB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67810E142
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737605989; x=1769141989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMYtN58lSxmb/FadiQtd/pr85r7tPSKbpF8uj1qju9M=;
 b=ZadtVhB5SDAJe2dTxs0OXc+RNTYZMGLhA1W9ob3qHALPMSJnk2O/aa4r
 pYOg9jJV/tvA2Ql6K7IxpRqAexXSQJELo9cNQOj+AVUzXPujNNCY8dkW1
 YdGVAHl7TNEynRjRjGIn7gQQsYytayb/ikkmOldfGC5Agu8qJz7p3l3iw
 Z3LM+9WZcfihAH591+whvSq2lXhPp1f+gxHay0HAiTPNA9G7ZC2pkspgy
 PKPzVljTt2315UPFo7A9dXY3Yp1l4UoCzhGFLIdB0/De50A7leSafADSM
 OvHR2xz4Nr3ybb3WN2QNaqMOXulK6YkyhUU2Ji2jYmYSGAzZmYz+dDwDt g==;
X-CSE-ConnectionGUID: wBD1Jw8KToqiuZ4q4uR8rg==
X-CSE-MsgGUID: J2oomGRnSV2bYiCxuxi9Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37971657"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37971657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:48 -0800
X-CSE-ConnectionGUID: Tz/70hzzRk6ULIslq8FJ1w==
X-CSE-MsgGUID: potXgsHvSvOukD1p/kfpgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107202070"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v15 6/6] drm/xe/pmu: Add GT C6 events
Date: Wed, 22 Jan 2025 20:19:23 -0800
Message-ID: <20250123041923.1892837-7-lucas.demarchi@intel.com>
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Provide a PMU interface for GT C6 residency counters. The interface is
similar to the one available for i915, but gt is passed in the config
when creating the event.

Sample usage and output:

	$ perf list | grep gt-c6
	  xe_0000_00_02.0/gt-c6-residency/                   [Kernel PMU event]

	$ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*
	==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency <==
	event=0x01

	==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency.unit <==
	ms

	$ perf stat -e xe_0000_00_02.0/gt-c6-residency,gt=0/ -I1000
	#           time             counts unit events
	     1.001196056              1,001 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/
	     2.005216219              1,003 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 2b66a7957b665..850bc48053a6b 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 
 #include "xe_device.h"
+#include "xe_gt_idle.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
@@ -115,12 +116,16 @@ static int xe_pmu_event_init(struct perf_event *event)
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
-	u64 val = 0;
 
 	if (!gt)
 		return 0;
 
-	return val;
+	switch (config_to_event_id(event->attr.config)) {
+	case XE_PMU_EVENT_GT_C6_RESIDENCY:
+		return xe_gt_idle_residency_msec(&gt->gtidle);
+	}
+
+	return 0;
 }
 
 static void xe_pmu_event_update(struct perf_event *event)
@@ -270,6 +275,10 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 
 static void set_supported_events(struct xe_pmu *pmu)
 {
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	if (!xe->info.skip_guc_pc)
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
 }
 
 /**
-- 
2.48.0

