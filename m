Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6315C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D38E10E1D3;
	Fri,  7 Jun 2024 18:37:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5E510E1D3;
 Fri,  7 Jun 2024 18:37:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tracing_cleanup_and_add_m?=
 =?utf-8?q?mio_tracing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 18:37:57 -0000
Message-ID: <171778547712.27586.14663452039138479901@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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

Series: Tracing cleanup and add mmio tracing (rev4)
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
commit 5ccaa97376eb60fe69304119a4af191906431f9e
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Fri Jun 7 11:29:43 2024 -0700

    drm/xe: Add reg read/write trace
    
    This will help debug register read/writes and provides
    a way to trace all the mmio transactions.
    
    v2: Fix kunit error
    v3: Print devid to help in multi-gpu setup
    v3: rebase and use variable sized variant to display
        dev name(Gustavo)
    v4: Pass single argument to __asign_str to fix kunit error
    v5: Remove unrelated include xe_tile.h and remove cast in trace
    
    Reviewd-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch 29955874be9f82296c8cc21cdd66a7cdf51faee2 drm-intel
50e6e8767862 drm/xe/trace: Extract bo, vm, vma traces
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:305: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#305: 
new file mode 100644

-:347: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#347: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:23:
+		    TP_STRUCT__entry(

-:353: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#353: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:29:
+		    TP_fast_assign(

-:372: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#372: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:48:
+	    TP_STRUCT__entry(

-:381: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#381: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:57:
+	    TP_fast_assign(

-:399: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#399: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:75:
+		    TP_STRUCT__entry(

-:407: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#407: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:83:
+		    TP_fast_assign(

-:499: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#499: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:175:
+		    TP_STRUCT__entry(

-:504: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#504: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:180:
+		    TP_fast_assign(

-:558: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#558: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:558: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#558: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:558: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#558: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:558: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#558: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:558: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#558: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:234:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 13 checks, 514 lines checked
acb65d29eb8a drm/xe/trace: Extract guc related traces
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:133: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#133: 
new file mode 100644

-:173: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#173: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:21:
+		    TP_STRUCT__entry(

-:181: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#181: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:29:
+		    TP_fast_assign(

-:212: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#212: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:60:
+		    TP_STRUCT__entry(

-:220: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#220: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:68:
+		    TP_fast_assign(

-:253: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#253: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:253: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#253: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:253: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#253: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:253: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#253: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:253: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#253: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:101:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 9 checks, 213 lines checked
cec1e3859516 drm/xe/trace: Print device_id in xe_trace_bo events
2454366a8338 drm/xe/trace: Print device_id in xe_trace_guc events
-:88: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#88: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:21:
+		    TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 size, u32 space, u32 len),

-:125: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#125: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:53:
+		   TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 size, u32 space, u32 len),

-:138: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#138: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:62:
+		    TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),

-:175: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#175: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:94:
+		   TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),

total: 0 errors, 4 warnings, 0 checks, 145 lines checked
755c7dab42b0 drm/xe/trace: Print device_id in xe_trace events
-:322: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#322: FILE: drivers/gpu/drm/xe/xe_trace.h:281:
+			     __string(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)))

total: 0 errors, 1 warnings, 0 checks, 306 lines checked
5ccaa97376eb drm/xe: Add reg read/write trace
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Reviewd-by:' - perhaps 'Reviewed-by:'?
#16: 
Reviewd-by: Gustavo Sousa <gustavo.sousa@intel.com>

-:94: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#94: FILE: drivers/gpu/drm/xe/xe_trace.h:350:
+TRACE_EVENT(xe_reg_rw,
+	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),

-:98: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#98: FILE: drivers/gpu/drm/xe/xe_trace.h:354:
+	TP_STRUCT__entry(

-:106: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#106: FILE: drivers/gpu/drm/xe/xe_trace.h:362:
+	TP_fast_assign(

total: 0 errors, 1 warnings, 3 checks, 92 lines checked


