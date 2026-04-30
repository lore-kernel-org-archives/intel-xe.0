Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B218CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 11:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81C710E14B;
	Thu, 30 Apr 2026 11:09:37 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0098E10E14B;
 Thu, 30 Apr 2026 11:09:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v8?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 11:09:35 -0000
Message-ID: <177754737599.28203.7905051873400586782@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v8
URL   : https://patchwork.freedesktop.org/series/165777/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e920ee42bc0dcf88381b7e41fb18d758a03835a
Author: Maciej Patelczyk <maciej.patelczyk@intel.com>
Date:   Thu Apr 30 13:51:20 2026 +0300

    drm/xe/eudebug: Disable SVM in Xe for Eudebug
    
    Missing SVM pagefault intergration. Temporary exclude SVM in Xe until
    there is SVM support in EU Debugger.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d drm-intel
ecfd14ef7c80 drm/xe/eudebug: Introduce eudebug interface
-:235: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#235: 
new file mode 100644

-:293: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!READ_ONCE"
#293: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+	return READ_ONCE(d->target.xef) == NULL;

-:475: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#475: FILE: drivers/gpu/drm/xe/xe_eudebug.c:236:
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
#475: FILE: drivers/gpu/drm/xe/xe_eudebug.c:236:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:825: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#825: FILE: drivers/gpu/drm/xe/xe_eudebug.c:586:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:825: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#825: FILE: drivers/gpu/drm/xe/xe_eudebug.c:586:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1305: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1305: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
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

-:1305: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1305: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1312: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1312: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1314: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1314: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1316: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1316: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1527: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1527: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 9 checks, 1504 lines checked
20d2e2ea5f54 drm/xe/eudebug: Add documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
230ca6426623 drm/xe/eudebug: Add connection establishment documentation
cab635633925 drm/xe/eudebug: Introduce discovery for resources
ea14318160fc drm/xe/eudebug: Introduce exec_queue events
1cf709641970 drm/xe: Add EUDEBUG_ENABLE exec queue property
0aa3d7adea74 drm/xe/eudebug: Mark guc contexts as debuggable
c24e8c5b4140 drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:617: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#617: FILE: drivers/gpu/drm/xe/xe_vm.c:3660:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:620: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#620: FILE: drivers/gpu/drm/xe/xe_vm.c:3663:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:744: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#744: FILE: drivers/gpu/drm/xe/xe_vm_types.h:414:
+		struct mutex lock;

total: 0 errors, 1 warnings, 3 checks, 790 lines checked
bf304b06145b drm/xe/eudebug: Introduce vm bind and vm bind debug data events
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
ec17ff396a7b drm/xe/eudebug: Add ufence events with acks
-:28: WARNING:REPEATED_WORD: Possible repeated word: 'for'
#28: 
    - take reference for for tracking check (Mika)

-:337: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ufence"
#337: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1291:
+			xe_assert(vm->xe, ufence == NULL);

-:638: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#638: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 1 warnings, 2 checks, 654 lines checked
29637a08d924 drm/xe/eudebug: vm open/pread/pwrite
-:139: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#139: FILE: drivers/gpu/drm/xe/xe_eudebug.c:750:
+{
+

-:162: CHECK:LINE_SPACING: Please don't use multiple blank lines
#162: FILE: drivers/gpu/drm/xe/xe_eudebug.c:773:
+
+

-:202: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#202: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
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

-:202: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#202: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:252: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#252: 
new file mode 100644

total: 1 errors, 1 warnings, 3 checks, 644 lines checked
2dc1635f8b5b drm/xe/eudebug: userptr vm pread/pwrite
f20439c2fa6b drm/xe/eudebug: hw enablement for eudebug
-:144: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#144: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 481 lines checked
dba3233dca8a drm/xe/eudebug: Introduce EU control interface
-:295: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#295: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:183:
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:301: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#301: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:189:
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)

total: 0 errors, 0 warnings, 2 checks, 891 lines checked
d29bbbc620bc drm/xe/eudebug: Introduce per device attention scan worker
5bd603e4f848 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
f7030e98051e drm/xe: Implement SR-IOV and eudebug exclusivity
0eef827a8570 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:50:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
aa4b22466196 drm/xe/eudebug: Allow getting eudebug instance during discovery
c365fcd48a10 drm/xe/eudebug: Add read/count/compare helper for eu attention
-:131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#131: 
new file mode 100644

-:153: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#153: FILE: drivers/gpu/drm/xe/xe_gt_debug_types.h:18:
+	       XE_GT_EU_ATT_MAX_THREADS/8];
 	                               ^

total: 0 errors, 1 warnings, 1 checks, 121 lines checked
855e12416e46 drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
394b3b021487 drm/xe/eudebug: Introduce EU pagefault handling interface
-:359: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#359: 
new file mode 100644

-:421: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#421: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:58:
+	spinlock_t lock;

-:429: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#429: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:66:
+	if (fence == NULL)

-:535: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#535: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:172:
+		udelay(200);

total: 0 errors, 1 warnings, 3 checks, 858 lines checked
d789723aad4e drm/xe/eudebug: Enable EU pagefault handling
9e920ee42bc0 drm/xe/eudebug: Disable SVM in Xe for Eudebug


