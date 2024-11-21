Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EB6D75BBB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53B610E3D6;
	Thu, 21 Nov 2024 06:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8EacokC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951110E875
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732170238; x=1763706238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UgFsjkYOYtOOqVqQ0wrgEbTmzbnIY2sy6bpaabql6Uo=;
 b=Q8EacokCDU3cPzAC6ksO40JDoS9AmCq2+GeCVeZYYt+uhp+9w3nbNrp4
 KC8YI8sqoCS5M4/GNRA49pYGJukC3Kd0e0mSRh1GnQHn8AOSrADM6zITP
 PDcAz0Dyo/KQRLxBG0smAaLdhhaT1npolbM9Q1xOqm5cRB4+gQzt6ru+Z
 P9HAOaOWykUsjjM0pmUbc6N5LNd6SMFfCNBMHPIkffQfqlrRzkO2b1kcS
 C9hD4Kw3esKfLlxtPXfMWf2q3YPX7oUjYmXqaSnjTZBW3eP/ctIA4CMQc
 zs0WEKHqxwZpKUjy+pf7YJYGd0+QtzzB8omZRdQq/+TfT80Ij4VvwqesR g==;
X-CSE-ConnectionGUID: jAOC0RVeT8WCoeqlWSo94Q==
X-CSE-MsgGUID: tbhiHtuHSrqjTcLCNRgBug==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36173594"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="36173594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:58 -0800
X-CSE-ConnectionGUID: pA4q6NqoRueGWUsYhKJZ5g==
X-CSE-MsgGUID: MxCqOUVFRA+BpnpML/GPNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="94219821"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:56 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH v2 6/8] drm/xe/trace: Add trace for xe_engine_activity
Date: Thu, 21 Nov 2024 12:09:02 +0530
Message-Id: <20241121063904.3033754-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241121063904.3033754-1-riana.tauro@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_activity.c |  5 ++-
 drivers/gpu/drm/xe/xe_trace_guc.h       | 49 +++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
index 464cb09933b5..cbafd42f7f2f 100644
--- a/drivers/gpu/drm/xe/xe_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
@@ -15,6 +15,7 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_trace_guc.h"
 
 #define TOTAL_QUANTA 0x8000
 
@@ -150,7 +151,7 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	cached_activity->change_num = change_num;
 	cached_activity->last_update_tick = last_update_tick;
 	cached_activity->active_ticks = active_ticks;
-
+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
 update:
 	if (ea->running) {
 		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
@@ -162,6 +163,7 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 		}
 	}
 
+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
 	return ea->total + ea->active;
 }
 
@@ -200,6 +202,7 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
 	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
 
+	trace_xe_guc_engine_activity(xe, ea, hwe->name, hwe->instance);
 	return ea->quanta;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
index 23abdd55dc62..01be5631f99d 100644
--- a/drivers/gpu/drm/xe/xe_trace_guc.h
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -14,6 +14,7 @@
 
 #include "xe_device_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_engine_activity_types.h"
 
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
+		      "Activity data: change_num=%u, quanta_ratio=%u, last_update_tick=%u, active_ticks=%llu\n",
+		      __get_str(dev), __get_str(name), __entry->instance,
+		      (__entry->active +  __entry->total), __entry->quanta, __entry->last_cpu_ts,
+		      __entry->global_change_num, __entry->guc_tsc_frequency_hz,
+		      __entry->lag_latency_usec, __entry->change_num, __entry->quanta_ratio,
+		      __entry->last_update_tick, __entry->active_ticks)
+);
 #endif
 
 /* This part must be outside protection */
-- 
2.40.0

