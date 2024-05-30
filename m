Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A0C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 16:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331B010E109;
	Thu, 30 May 2024 16:27:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5EE10E109;
 Thu, 30 May 2024 16:27:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tracing_cleanup_and_add_m?=
 =?utf-8?q?mio_tracing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 16:27:06 -0000
Message-ID: <171708642618.2239183.134230603889294867@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

Series: Tracing cleanup and add mmio tracing
URL   : https://patchwork.freedesktop.org/series/134258/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf2736df07a3e896df2e89260356e5d049a7f7c4
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Thu May 30 08:13:13 2024 -0700

    drm/xe: Add reg read/write trace
    
    This will help debug register read/writes and provides
    a way to trace all the mmio transactions.
    
    v2: Fix kunit error
    v3: Print devid to help in multi-gpu setup
    
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch d02534bf06ad39143f8ed786e49a01e482812cd6 drm-intel
d007ec61997b drm/xe/trace: Extract bo, vm, vma traces
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:302: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#302: 
new file mode 100644

-:344: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#344: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:23:
+		    TP_STRUCT__entry(

-:350: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#350: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:29:
+		    TP_fast_assign(

-:369: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#369: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:48:
+	    TP_STRUCT__entry(

-:378: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#378: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:57:
+	    TP_fast_assign(

-:396: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#396: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:75:
+		    TP_STRUCT__entry(

-:404: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#404: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:83:
+		    TP_fast_assign(

-:496: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#496: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:175:
+		    TP_STRUCT__entry(

-:501: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#501: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:180:
+		    TP_fast_assign(

-:555: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#555: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:555: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#555: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:555: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#555: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:555: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#555: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:555: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#555: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 13 checks, 514 lines checked
d7ef252856db drm/xe/trace: Extract guc related traces
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
new file mode 100644

-:170: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#170: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:21:
+		    TP_STRUCT__entry(

-:178: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#178: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:29:
+		    TP_fast_assign(

-:209: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#209: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:60:
+		    TP_STRUCT__entry(

-:217: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#217: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:68:
+		    TP_fast_assign(

-:250: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#250: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:250: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#250: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:250: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#250: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:250: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#250: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:250: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#250: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 9 checks, 213 lines checked
8ab127201037 drm/xe/trace: Print device_id in xe_trace_bo events
f433a4823193 drm/xe/trace: Print device_id in xe_trace_guc events
6d6de6d030f7 drm/xe/trace: Print device_id in xe_trace events
-:318: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#318: FILE: drivers/gpu/drm/xe/xe_trace.h:283:
+			   memcpy(__entry->devid, dev_name(gt_to_xe(((struct xe_exec_queue *)msg->private_data)->gt)->drm.dev), 12);

total: 0 errors, 1 warnings, 0 checks, 298 lines checked
cf2736df07a3 drm/xe: Add reg read/write trace
-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: drivers/gpu/drm/xe/xe_trace.h:346:
+TRACE_EVENT_CONDITION(xe_reg_rw,
+	TP_PROTO(const char *devid, bool write, u32 reg, u64 val, int len, bool trace),

-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/xe/xe_trace.h:352:
+	TP_STRUCT__entry(

-:102: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#102: FILE: drivers/gpu/drm/xe/xe_trace.h:360:
+	TP_fast_assign(

total: 0 errors, 0 warnings, 3 checks, 93 lines checked


