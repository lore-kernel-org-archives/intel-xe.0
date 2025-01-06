Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FFDE7719A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADE810E5A7;
	Mon,  6 Jan 2025 07:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLDE3QMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDB010E5A7
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736149002; x=1767685002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rID/vpk9yg5jWX/tIfbH6mqdFBtK2vxKTcGYNyoPBIg=;
 b=bLDE3QMyhCq/qoeUl1Em3S2FfxSr21Gz+66RGbtei/NOKPqScQKqk6CR
 JC4pNFAHvGTIjlNo/HJGMUeXk7MQeHH2uKwAwDryrYS/c6MjXbFuJKKKw
 7Cuj2QbwgqJLlSpBO6vn20ocuHXClz5GKNYWdLimECgz19wGXz9b6MIDZ
 BHWId8WRyXiHDiLYvUCM/K79l0KAsNGOSzFktlddE36k044wM7LXSZ8Ft
 0IFt3XTgYndIIkigZuwZUFLWlNhZOCegz/KXmQbvEfw1SCgbVD8GL9p6A
 IypPGYD6+bpbwvi7FFmJQsgs9bL+XqLzDSMReEx5eC7tBCtLUehwnkORJ Q==;
X-CSE-ConnectionGUID: ++JBtKV6TcCW9q9m89rNgA==
X-CSE-MsgGUID: +UKtsjfYTtile05w1oVB/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873078"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:42 -0800
X-CSE-ConnectionGUID: smFVflXATHe+bMa/++GFsw==
X-CSE-MsgGUID: mQNbzp4bS42R9/yYWyivlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650749"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:39 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 07/10] drm/xe/trace: Add trace for engine activity
Date: Mon,  6 Jan 2025 13:25:56 +0530
Message-ID: <20250106075600.852080-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  5 +++
 drivers/gpu/drm/xe/xe_trace_guc.h           | 49 +++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 687d90873e97..14950b42d1b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -15,6 +15,7 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_trace_guc.h"
 
 #define TOTAL_QUANTA 0x8000
 
@@ -165,6 +166,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 		}
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
index 23abdd55dc62..156d429d7e79 100644
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
2.47.1

