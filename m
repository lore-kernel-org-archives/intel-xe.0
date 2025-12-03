Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942BBD116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 09:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553D510E733;
	Wed,  3 Dec 2025 09:13:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5110E733;
 Wed,  3 Dec 2025 09:13:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v6_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Dec 2025 09:13:49 -0000
Message-ID: <176475322916.53396.6022349550200270536@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v6 (rev2)
URL   : https://patchwork.freedesktop.org/series/158380/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a617783302a47fc8815335070690b60a3e42726
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Tue Dec 2 15:52:39 2025 +0200

    drm/xe/eudebug: Enable EU pagefault handling
    
    The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
    access will halt the corresponding EUs. To solve this problem, enable
    EU pagefault handling functionality, which allows to unhalt pagefaulted
    eu threads and to EU debugger to get inform about the eu attentions state
    of EU threads during execution.
    
    If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
    after handling the pagefault.
    
    The pagefault handling is a mechanism that allows a stalled EU thread to
    enter SIP mode by installing a temporal null page to the page table entry
    where the pagefault happened.
    
    A brief description of the page fault handling mechanism flow between KMD
    and the eu thread is as follows
    
    (1) eu thread accesses unallocated address
    (2) pagefault happens and eu thread stalls
    (3) XE kmd set an force eu thread exception to allow the running eu thread
        to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
        TD_CTL register)
        Not stalled (none-pagefaulted) eu threads enter SIP mode
    (4) XE kmd installs temporal null page to the pagetable entry of the
        address where pagefault happened.
    (5) XE kmd replies pagefault successful message to GUC
    (6) stalled eu thread resumes as per pagefault condition has resolved
    (7) resumed eu thread enters SIP mode due to force exception set by (3)
    (8) adapted to consumer/produced pagefaults
    
    As designed this feature to only work when eudbug is enabled, it should
    have no impact to regular recoverable pagefault code path.
    
    v2: - pf->q holds the vm ref so drop it (Mika)
        - streamline uapi (Mika)
        - cleanup the pagefault through producer if (Mika)
    
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 6a00c52137a5a8eb36cb762d4649abe16cc0ca33 drm-intel
4f88ee8d9a76 drm/xe/eudebug: Introduce eudebug interface
-:220: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#220: 
new file mode 100644

-:475: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#475: FILE: drivers/gpu/drm/xe/xe_eudebug.c:251:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:475: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#475: FILE: drivers/gpu/drm/xe/xe_eudebug.c:251:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:827: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#827: FILE: drivers/gpu/drm/xe/xe_eudebug.c:603:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:827: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#827: FILE: drivers/gpu/drm/xe/xe_eudebug.c:603:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1291: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1291: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:1291: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1291: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1298: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1298: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1300: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1300: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1302: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1302: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1520: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1520: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 8 checks, 1500 lines checked
86acf646b019 drm/xe/eudebug: Introduce discovery for resources
6ed3cde9df90 drm/xe/eudebug: Introduce exec_queue events
92e3650da9f7 drm/xe: Add EUDEBUG_ENABLE exec queue property
232d4097c8b0 drm/xe/eudebug: Mark guc contexts as debuggable
9184cbe77524 drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:617: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#617: FILE: drivers/gpu/drm/xe/xe_vm.c:3431:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:620: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#620: FILE: drivers/gpu/drm/xe/xe_vm.c:3434:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:740: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#740: FILE: drivers/gpu/drm/xe/xe_vm_types.h:343:
+		struct mutex lock;

total: 0 errors, 1 warnings, 3 checks, 759 lines checked
b1b98b59491c drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This patch adds events to track the bind ioctl and associated debug data add

-:390: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#390: FILE: include/uapi/drm/xe_drm_eudebug.h:92:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:391: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#391: FILE: include/uapi/drm/xe_drm_eudebug.h:93:
+ *  └───────────────────────┘                  │ │ ┊

-:392: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#392: FILE: include/uapi/drm/xe_drm_eudebug.h:94:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:394: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#394: FILE: include/uapi/drm/xe_drm_eudebug.h:96:
+ *      └──────────────────────────────────┘     │ ┊

-:396: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#396: FILE: include/uapi/drm/xe_drm_eudebug.h:98:
+ *      ┌──────────────────────────────────┐     │ ┊

-:398: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#398: FILE: include/uapi/drm/xe_drm_eudebug.h:100:
+ *      └──────────────────────────────────┘       ┊

-:400: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#400: FILE: include/uapi/drm/xe_drm_eudebug.h:102:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:402: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#402: FILE: include/uapi/drm/xe_drm_eudebug.h:104:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 9 warnings, 0 checks, 378 lines checked
b7ab6f17093b drm/xe/eudebug: Add UFENCE events with acks
-:309: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ufence"
#309: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1195:
+			xe_assert(vm->xe, ufence == NULL);

-:608: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#608: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 2 checks, 610 lines checked
1ecb1c146a40 drm/xe/eudebug: vm open/pread/pwrite
-:124: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#124: FILE: drivers/gpu/drm/xe/xe_eudebug.c:669:
+{
+

-:148: CHECK:LINE_SPACING: Please don't use multiple blank lines
#148: FILE: drivers/gpu/drm/xe/xe_eudebug.c:693:
+
+

-:188: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#188: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:188: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#188: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:237: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#237: 
new file mode 100644

total: 1 errors, 1 warnings, 3 checks, 619 lines checked
ee0c5b36bb8f drm/xe/eudebug: userptr vm pread/pwrite
8c318a3dc892 drm/xe/eudebug: hw enablement for eudebug
-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 452 lines checked
403b3838014e drm/xe/eudebug: Introduce EU control interface
-:277: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#277: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:183:
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:283: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#283: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:189:
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)

-:915: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#915: FILE: include/uapi/drm/xe_drm_eudebug.h:184:
+struct drm_xe_eudebug_eu_control {
+

total: 0 errors, 0 warnings, 3 checks, 860 lines checked
1879679d9ec9 drm/xe/eudebug: Introduce per device attention scan worker
1cb16bca5aae drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
6c904ea32cf0 drm/xe: Implement SR-IOV and eudebug exclusivity
32affb9db400 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:50:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
78c4d67f01d9 drm/xe/eudebug: Add read/count/compare helper for eu attention
-:127: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#127: 
new file mode 100644

-:149: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#149: FILE: drivers/gpu/drm/xe/xe_gt_debug_types.h:18:
+	       XE_GT_EU_ATT_MAX_THREADS/8];
 	                               ^

total: 0 errors, 1 warnings, 1 checks, 120 lines checked
d65709a989bd drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 42 lines checked
f1c09186db00 drm/xe/eudebug: Introduce EU pagefault handling interface
-:337: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#337: 
new file mode 100644

-:454: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#454: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:113:
+	spinlock_t lock;

-:462: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#462: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:121:
+	if (fence == NULL)

-:558: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#558: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:217:
+		udelay(200);

total: 0 errors, 1 warnings, 3 checks, 859 lines checked
5a617783302a drm/xe/eudebug: Enable EU pagefault handling


