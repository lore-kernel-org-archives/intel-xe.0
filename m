Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A9C021B3
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 05:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D17910E051;
	Mon, 24 Feb 2025 05:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5/vCbuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFE710E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 05:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740374290; x=1771910290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtRDl4AXgMQ4C4vVmmhmGR7NzvqwhDL/Ibfe665bJmU=;
 b=B5/vCbuHtxPmIGXQG8m4WaOnT+OQNqIKR5NJo+Xxff7RQao3Ot1pwV+t
 cxhcdPYKWilhxzDK6jkDvoRBOKsAU22fpY+Jqul1MWn+Uxxz3hvkW6YaO
 dOShSNL3uwUQb6wndEZzoVszlKib748dfgtPKq+0yESah5LGfm3JL205C
 Uqw1Uyp9aihu/GfhoHNo0W/H5LXbOyDxAucCsEBCq4DWb69+wMLY3Ziyb
 tMky1eIAdA5CB6cF1GEGwdtgUWS/11UDEE1YcH91LgLaw7LHIoHN3Xokt
 zjIl1COBia8i5+7l0WLu6WjsXNFFFPfYYH9cVNkdjpx0k7gFTxjNnWjZR A==;
X-CSE-ConnectionGUID: tGQZMdEJRVud3z5KfWkE8g==
X-CSE-MsgGUID: uRByP3KAROqp+gw46yPyGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41380321"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41380321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:10 -0800
X-CSE-ConnectionGUID: mMf0KGJYR/OZ1lxZBXG7QQ==
X-CSE-MsgGUID: 5bYbbY1gTsuGdgXrB7wReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153150701"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:07 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v9 2/5] drm/xe/trace: Add trace for engine activity
Date: Mon, 24 Feb 2025 11:08:59 +0530
Message-ID: <20250224053903.2253539-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250224053903.2253539-1-riana.tauro@intel.com>
References: <20250224053903.2253539-1-riana.tauro@intel.com>
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

Add engine activity related information to trace events for
better debuggability

v2: add trace for engine activity (Umesh)
v3: use hex for quanta_ratio

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  5 +++
 drivers/gpu/drm/xe/xe_trace_guc.h           | 49 +++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 255e63d82a96..a424527eddb6 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -17,6 +17,7 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_trace_guc.h"
 
 #define TOTAL_QUANTA 0x8000
 
@@ -165,6 +166,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
 	}
 
+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
+
 	return ea->total + ea->active;
 }
 
@@ -198,6 +201,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
 	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
 
+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
+
 	return ea->quanta;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
index 23abdd55dc62..78949db9cfce 100644
--- a/drivers/gpu/drm/xe/xe_trace_guc.h
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -14,6 +14,7 @@
 
 #include "xe_device_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_guc_engine_activity_types.h"
 
 #define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
 
@@ -100,6 +101,54 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+TRACE_EVENT(xe_guc_engine_activity,
+	    TP_PROTO(struct xe_device *xe, struct engine_activity *ea, const char *name,
+		     u16 instance),
+	    TP_ARGS(xe, ea, name, instance),
+
+	    TP_STRUCT__entry(
+			__string(dev, __dev_name_xe(xe))
+			__string(name, name)
+			__field(u32, global_change_num)
+			__field(u32, guc_tsc_frequency_hz)
+			__field(u32, lag_latency_usec)
+			__field(u16, instance)
+			__field(u16, change_num)
+			__field(u16, quanta_ratio)
+			__field(u32, last_update_tick)
+			__field(u64, active_ticks)
+			__field(u64, active)
+			__field(u64, total)
+			__field(u64, quanta)
+			__field(u64, last_cpu_ts)
+	    ),
+
+	    TP_fast_assign(
+			__assign_str(dev);
+			__assign_str(name);
+			__entry->global_change_num = ea->metadata.global_change_num;
+			__entry->guc_tsc_frequency_hz = ea->metadata.guc_tsc_frequency_hz;
+			__entry->lag_latency_usec = ea->metadata.lag_latency_usec;
+			__entry->instance = instance;
+			__entry->change_num = ea->activity.change_num;
+			__entry->quanta_ratio = ea->activity.quanta_ratio;
+			__entry->last_update_tick = ea->activity.last_update_tick;
+			__entry->active_ticks = ea->activity.active_ticks;
+			__entry->active = ea->active;
+			__entry->total = ea->total;
+			__entry->quanta = ea->quanta;
+			__entry->last_cpu_ts = ea->last_cpu_ts;
+	    ),
+
+	    TP_printk("dev=%s engine %s:%d Active=%llu, quanta=%llu, last_cpu_ts=%llu\n"
+		      "Activity metadata: global_change_num=%u, guc_tsc_frequency_hz=%u lag_latency_usec=%u\n"
+		      "Activity data: change_num=%u, quanta_ratio=0x%x, last_update_tick=%u, active_ticks=%llu\n",
+		      __get_str(dev), __get_str(name), __entry->instance,
+		      (__entry->active +  __entry->total), __entry->quanta, __entry->last_cpu_ts,
+		      __entry->global_change_num, __entry->guc_tsc_frequency_hz,
+		      __entry->lag_latency_usec, __entry->change_num, __entry->quanta_ratio,
+		      __entry->last_update_tick, __entry->active_ticks)
+);
 #endif
 
 /* This part must be outside protection */
-- 
2.47.1

