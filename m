Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B656CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 12:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454A810E3C9;
	Mon,  6 Oct 2025 12:30:36 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6DE10E345;
 Mon,  6 Oct 2025 12:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 12:30:34 -0000
Message-ID: <175975383451.7930.147408810283948615@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v5
URL   : https://patchwork.freedesktop.org/series/155452/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e6a3eb9952045883e24bb470bcecc6f5715301d5
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Mon Oct 6 14:17:10 2025 +0300

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
    
    As designed this feature to only work when eudbug is enabled, it should
    have no impact to regular recoverable pagefault code path.
    
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
+ /mt/dim checkpatch 29dc3d947463e9e9756a253801e5cc4466536ecc drm-intel
5fb3fc4a2601 drm/xe/eudebug: Introduce eudebug interface
-:227: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#227: 
new file mode 100644

-:482: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#482: FILE: drivers/gpu/drm/xe/xe_eudebug.c:251:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:831: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#831: FILE: drivers/gpu/drm/xe/xe_eudebug.c:600:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:831: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#831: FILE: drivers/gpu/drm/xe/xe_eudebug.c:600:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1295: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1295: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
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

-:1295: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1295: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1302: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1302: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1304: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1304: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1306: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1306: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1523: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1523: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 7 checks, 1503 lines checked
15b82102f262 drm/xe/eudebug: Introduce discovery for resources
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
currently existing resources to the debugger. The client is held on selected

total: 0 errors, 1 warnings, 0 checks, 295 lines checked
68f923c76314 drm/xe/eudebug: Introduce exec_queue events
828f0be35045 drm/xe: Add EUDEBUG_ENABLE exec queue property
97d5924dfa95 drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: drivers/gpu/drm/xe/xe_debug_data.c:32:
+		if (XE_IOCTL_DBG(xe, (dd->addr < ext->addr + ext->range) &&
+				     (ext->addr < dd->addr + dd->range))) {

-:119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#119: FILE: drivers/gpu/drm/xe/xe_debug_data.c:74:
+	if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+			     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA))

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/xe/xe_debug_data.c:88:
+	    XE_IOCTL_DBG(xe, ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO &&
+			     ext->offset != 0) ||

-:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#135: FILE: drivers/gpu/drm/xe/xe_debug_data.c:90:
+	    XE_IOCTL_DBG(xe, ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO &&
+			     (ext->pseudopath < DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA ||

-:138: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#138: FILE: drivers/gpu/drm/xe/xe_debug_data.c:93:
+	    XE_IOCTL_DBG(xe, !(ext->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) &&
+			     strnlen(ext->pathname, PATH_MAX) >= PATH_MAX)) {

-:575: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#575: FILE: drivers/gpu/drm/xe/xe_vm.c:3384:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:578: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#578: FILE: drivers/gpu/drm/xe/xe_vm.c:3387:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:698: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#698: FILE: drivers/gpu/drm/xe/xe_vm_types.h:347:
+		struct mutex lock;

total: 0 errors, 1 warnings, 8 checks, 720 lines checked
dc1e51594e41 drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This patch adds events to track the bind ioctl and associated debug data add

-:347: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "ufence"
#347: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1135:
+				fill_vm_bind_fields(vm, e, ufence != NULL, bind_ops);

-:651: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#651: FILE: include/uapi/drm/xe_drm_eudebug.h:92:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:652: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#652: FILE: include/uapi/drm/xe_drm_eudebug.h:93:
+ *  └───────────────────────┘                  │ │ ┊

-:653: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#653: FILE: include/uapi/drm/xe_drm_eudebug.h:94:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:655: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#655: FILE: include/uapi/drm/xe_drm_eudebug.h:96:
+ *      └──────────────────────────────────┘     │ ┊

-:657: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#657: FILE: include/uapi/drm/xe_drm_eudebug.h:98:
+ *      ┌──────────────────────────────────┐     │ ┊

-:659: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#659: FILE: include/uapi/drm/xe_drm_eudebug.h:100:
+ *      └──────────────────────────────────┘       ┊

-:661: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#661: FILE: include/uapi/drm/xe_drm_eudebug.h:102:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:663: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#663: FILE: include/uapi/drm/xe_drm_eudebug.h:104:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 9 warnings, 1 checks, 649 lines checked
8d3d0548a042 drm/xe/eudebug: Add UFENCE events with acks
-:188: CHECK:LINE_SPACING: Please don't use multiple blank lines
#188: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1097:
 
+

-:668: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#668: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 2 checks, 636 lines checked
b5039b9f92c6 drm/xe/eudebug: vm open/pread/pwrite
-:115: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#115: FILE: drivers/gpu/drm/xe/xe_eudebug.c:675:
+{
+

-:139: CHECK:LINE_SPACING: Please don't use multiple blank lines
#139: FILE: drivers/gpu/drm/xe/xe_eudebug.c:699:
+
+

-:179: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#179: FILE: drivers/gpu/drm/xe/xe_eudebug.h:41:
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

-:179: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#179: FILE: drivers/gpu/drm/xe/xe_eudebug.h:41:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:215: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#215: 
new file mode 100644

total: 1 errors, 1 warnings, 3 checks, 599 lines checked
b754e5aa56a6 drm/xe/eudebug: userptr vm pread/pwrite
d2771e0bc227 drm/xe/eudebug: hw enablement for eudebug
-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 463 lines checked
d8994ebf26dd drm/xe/eudebug: Introduce EU control interface
-:272: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#272: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:183:
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:278: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#278: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:189:
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)

-:910: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#910: FILE: include/uapi/drm/xe_drm_eudebug.h:185:
+struct drm_xe_eudebug_eu_control {
+

total: 0 errors, 0 warnings, 3 checks, 855 lines checked
8fc1933b11ce drm/xe/eudebug: Introduce per device attention scan worker
67ee594be7a7 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
2ed66d3a05fb drm/xe: Implement SR-IOV and eudebug exclusivity
022dc3059031 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:50:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 161 lines checked
576256a71788 drm/xe/eudebug: Mark guc contexts as debuggable
-:9: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#9: 
Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

-:10: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#10: 
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

total: 0 errors, 2 warnings, 0 checks, 118 lines checked
9cf1196625c6 drm/xe/eudebug: Add read/count/compare helper for eu attention
89d6e551ce50 drm/xe/eudebug: Introduce EU pagefault handling interface
-:347: CHECK:LINE_SPACING: Please don't use multiple blank lines
#347: FILE: drivers/gpu/drm/xe/xe_eudebug.h:95:
+
+

-:415: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#415: 
new file mode 100644

-:541: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#541: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:122:
+	spinlock_t lock;

-:549: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#549: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:130:
+	if (fence == NULL)

-:640: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#640: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:221:
+		udelay(200);

total: 0 errors, 1 warnings, 4 checks, 827 lines checked
24fbc6d651c2 drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 42 lines checked
e6a3eb995204 drm/xe/eudebug: Enable EU pagefault handling


