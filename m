Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC6BC25B76
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104C410E4D1;
	Thu,  6 Jun 2024 00:25:10 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58BD10E4D1;
 Thu,  6 Jun 2024 00:25:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Tracing_cleanup_and_add_mmio_t?=
 =?utf-8?q?racing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 00:25:08 -0000
Message-ID: <171763350887.79.1890178537448224882@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Tracing cleanup and add mmio tracing (rev2)
URL   : https://patchwork.freedesktop.org/series/134258/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:46:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   46 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:46:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   46 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h: In function ‘trace_event_raw_event_xe_guc_ct_flow_control’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:35:7: error: ‘__assign_str’ undeclared (first use in this function)
   35 |       __assign_str(dev, __dev_name_xe(xe));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:34:7: note: in expansion of macro ‘TP_fast_assign’
   34 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:35:7: note: each undeclared identifier is reported only once for each function it appears in
   35 |       __assign_str(dev, __dev_name_xe(xe));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:34:7: note: in expansion of macro ‘TP_fast_assign’
   34 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:87:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   87 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_gt_tlb_invalidation_fence’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:39:7: error: ‘__assign_str’ undeclared (first use in this function)
   39 |       __assign_str(dev, __dev_name_xe(xe));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:38:7: note: in expansion of macro ‘TP_fast_assign’
   38 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:39:7: note: each undeclared identifier is reported only once for each function it appears in
   39 |       __assign_str(dev, __dev_name_xe(xe));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:38:7: note: in expansion of macro ‘TP_fast_assign’
   38 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:114:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  114 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:111,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h: In function ‘trace_event_raw_event_xe_guc_ctb’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:76:8: error: ‘__assign_str’ undeclared (first use in this function)
   76 |        __assign_str(dev, __dev_name_xe(xe));
      |        ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_guc.h:75:7: note: in expansion of macro ‘TP_fast_assign’
   75 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_exec_queue’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:100:7: error: ‘__assign_str’ undeclared (first use in this function)
  100 |       __assign_str(dev, __dev_name_eq(q));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:99:7: note: in expansion of macro ‘TP_fast_assign’
   99 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:240:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  240 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_trace_guc.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:45:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   45 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_sched_job’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:223:7: error: ‘__assign_str’ undeclared (first use in this function)
  223 |       __assign_str(dev, __dev_name_eq(job->q));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:222:7: note: in expansion of macro ‘TP_fast_assign’
  222 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:296:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  296 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: In function ‘trace_event_raw_event_xe_bo’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:36:7: error: ‘__assign_str’ undeclared (first use in this function)
   36 |       __assign_str(dev, __dev_name_bo(bo));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:35:7: note: in expansion of macro ‘TP_fast_assign’
   35 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:36:7: note: each undeclared identifier is reported only once for each function it appears in
   36 |       __assign_str(dev, __dev_name_bo(bo));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:35:7: note: in expansion of macro ‘TP_fast_assign’
   35 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:77:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   77 | );
      | ^~                  
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_sched_msg’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:288:8: error: ‘__assign_str’ undeclared (first use in this function)
  288 |        __assign_str(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)));
      |        ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:287:7: note: in expansion of macro ‘TP_fast_assign’
  287 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:328:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  328 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: In function ‘trace_event_raw_event_xe_bo_move’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:70:6: error: ‘__assign_str’ undeclared (first use in this function)
   70 |      __assign_str(device_id, __dev_name_bo(bo));
      |      ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/trace_events.h:44:9: note: in expansion of macro ‘PARAMS’
   44 |         PARAMS(assign),         \
      |         ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:52:1: note: in expansion of macro ‘TRACE_EVENT’
   52 | TRACE_EVENT(xe_bo_move,
      | ^~~~~~~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:65:6: note: in expansion of macro ‘TP_fast_assign’
   65 |      TP_fast_assign(
      |      ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:104:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  104 | )
      | ^             
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_hw_fence’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:320:7: error: ‘__assign_str’ undeclared (first use in this function)
  320 |       __assign_str(dev, __dev_name_gt(fence->ctx->gt));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:319:7: note: in expansion of macro ‘TP_fast_assign’
  319 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:376:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  376 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: In function ‘trace_event_raw_event_xe_vma’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:93:7: error: ‘__assign_str’ undeclared (first use in this function)
   93 |       __assign_str(dev, __dev_name_vma(vma));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:92:7: note: in expansion of macro ‘TP_fast_assign’
   92 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:419,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:199:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  199 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function ‘trace_event_raw_event_xe_reg_rw’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:364:3: error: ‘__assign_str’ undeclared (first use in this function)
  364 |   __assign_str(dev, __dev_name_gt(gt));
      |   ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/trace_events.h:44:9: note: in expansion of macro ‘PARAMS’
   44 |         PARAMS(assign),         \
      |         ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:350:1: note: in expansion of macro ‘TRACE_EVENT’
  350 | TRACE_EVENT(xe_reg_rw,
      | ^~~~~~~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:363:2: note: in expansion of macro ‘TP_fast_assign’
  363 |  TP_fast_assign(
      |  ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:469,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace.h:376:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
  376 | );
      | ^~            
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace.h:385,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
In file included from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: In function ‘trace_event_raw_event_xe_vm’:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:192:7: error: ‘__assign_str’ undeclared (first use in this function)
  192 |       __assign_str(dev, __dev_name_vm(vm));
      |       ^~~~~~~~~~~~
../include/trace/trace_events.h:402:4: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  402 |  { assign; }       \
      |    ^~~~~~
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:191:7: note: in expansion of macro ‘TP_fast_assign’
  191 |       TP_fast_assign(
      |       ^~~~~~~~~~~~~~
In file included from ../include/trace/trace_events.h:469,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h: At top level:
../include/trace/../../drivers/gpu/drm/xe/xe_trace_bo.h:77:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
   77 | );
      | ^~                  
In file included from ../include/trace/trace_events.h:375,
                 from ../include/trace/define_trace.h:102,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:248,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
   34 | #define __assign_str(dst)      \
      | 
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_trace.o] Error 1
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_trace_bo.o] Error 1
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1934: .] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[00:24:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:24:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


