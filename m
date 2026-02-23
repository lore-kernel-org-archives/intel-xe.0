Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A628EEA4FCF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 15:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767310E2F1;
	Mon, 23 Feb 2026 15:14:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68710E2F1;
 Mon, 23 Feb 2026 15:14:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v7?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 15:14:51 -0000
Message-ID: <177185969176.275505.10950513504324041033@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v7
URL   : https://patchwork.freedesktop.org/series/161979/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4356dbe33a5eb3ae829a1911e21aa2712b055693
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Mon Feb 23 16:03:17 2026 +0200

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
+ /mt/dim checkpatch 45a3045fc0dc46a893cb8bbe304afafd4120c904 drm-intel
c1065702b0ff drm/xe/eudebug: Introduce eudebug interface
-:226: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#226: 
new file mode 100644

-:284: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!READ_ONCE"
#284: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+	return READ_ONCE(d->target.xef) == NULL;

-:467: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#467: FILE: drivers/gpu/drm/xe/xe_eudebug.c:237:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:467: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#467: FILE: drivers/gpu/drm/xe/xe_eudebug.c:237:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:819: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#819: FILE: drivers/gpu/drm/xe/xe_eudebug.c:589:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:819: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#819: FILE: drivers/gpu/drm/xe/xe_eudebug.c:589:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1283: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1283: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
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

-:1283: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1283: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1290: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1290: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1292: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1292: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1294: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1294: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1505: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1505: FILE: include/uapi/drm/xe_drm.h:129:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 9 checks, 1491 lines checked
b6a8216a1b6d drm/xe/eudebug: Add documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
c942cff65862 drm/xe/eudebug: Add connection establishment documentation
4614d5180fcc drm/xe/eudebug: Introduce discovery for resources
7d1a7be2ee3c drm/xe/eudebug: Introduce exec_queue events
feff6753f4d3 drm/xe: Add EUDEBUG_ENABLE exec queue property
52ec38632a8c drm/xe/eudebug: Mark guc contexts as debuggable
6adca595de2d drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:617: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#617: FILE: drivers/gpu/drm/xe/xe_vm.c:3478:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:620: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#620: FILE: drivers/gpu/drm/xe/xe_vm.c:3481:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:740: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#740: FILE: drivers/gpu/drm/xe/xe_vm_types.h:372:
+		struct mutex lock;

total: 0 errors, 1 warnings, 3 checks, 787 lines checked
63c125f233b9 drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This patch adds events to track the bind ioctl and associated debug data add

-:414: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#414: FILE: include/uapi/drm/xe_drm_eudebug.h:112:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:415: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#415: FILE: include/uapi/drm/xe_drm_eudebug.h:113:
+ *  └───────────────────────┘                  │ │ ┊

-:416: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#416: FILE: include/uapi/drm/xe_drm_eudebug.h:114:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:418: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#418: FILE: include/uapi/drm/xe_drm_eudebug.h:116:
+ *      └──────────────────────────────────┘     │ ┊

-:420: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#420: FILE: include/uapi/drm/xe_drm_eudebug.h:118:
+ *      ┌──────────────────────────────────┐     │ ┊

-:422: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#422: FILE: include/uapi/drm/xe_drm_eudebug.h:120:
+ *      └──────────────────────────────────┘       ┊

-:424: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#424: FILE: include/uapi/drm/xe_drm_eudebug.h:122:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:426: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#426: FILE: include/uapi/drm/xe_drm_eudebug.h:124:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 9 warnings, 0 checks, 427 lines checked
ca09231b0e9e drm/xe/eudebug: Add UFENCE events with acks
-:320: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ufence"
#320: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1273:
+			xe_assert(vm->xe, ufence == NULL);

-:621: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#621: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 2 checks, 640 lines checked
19cb953494c2 drm/xe/eudebug: vm open/pread/pwrite
-:138: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#138: FILE: drivers/gpu/drm/xe/xe_eudebug.c:747:
+{
+

-:161: CHECK:LINE_SPACING: Please don't use multiple blank lines
#161: FILE: drivers/gpu/drm/xe/xe_eudebug.c:770:
+
+

-:201: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#201: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
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

-:201: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#201: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:251: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#251: 
new file mode 100644

total: 1 errors, 1 warnings, 3 checks, 642 lines checked
43418d456fb5 drm/xe/eudebug: userptr vm pread/pwrite
bf5b27b0ca3f drm/xe/eudebug: hw enablement for eudebug
-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 452 lines checked
fc993f381517 drm/xe/eudebug: Introduce EU control interface
-:297: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#297: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:183:
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:303: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#303: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:189:
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)

total: 0 errors, 0 warnings, 2 checks, 912 lines checked
94daf711b082 drm/xe/eudebug: Introduce per device attention scan worker
f8c8e4cfbf22 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
6a1fb3c4be57 drm/xe: Implement SR-IOV and eudebug exclusivity
d4023d6256f3 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:50:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
bf32a13c5225 drm/xe/eudebug: Add read/count/compare helper for eu attention
-:127: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#127: 
new file mode 100644

-:149: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#149: FILE: drivers/gpu/drm/xe/xe_gt_debug_types.h:18:
+	       XE_GT_EU_ATT_MAX_THREADS/8];
 	                               ^

total: 0 errors, 1 warnings, 1 checks, 120 lines checked
29924ce91f73 drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
c4c56069ef09 drm/xe/eudebug: Introduce EU pagefault handling interface
-:338: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#338: 
new file mode 100644

-:455: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#455: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:113:
+	spinlock_t lock;

-:463: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#463: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:121:
+	if (fence == NULL)

-:559: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#559: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:217:
+		udelay(200);

total: 0 errors, 1 warnings, 3 checks, 857 lines checked
4356dbe33a5e drm/xe/eudebug: Enable EU pagefault handling


