Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9A8C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 13:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9962410E1E2;
	Fri,  8 Aug 2025 13:18:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBB010E1E2;
 Fri,  8 Aug 2025 13:18:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v4?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 13:18:26 -0000
Message-ID: <175465910696.222611.17737544255357738723@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v4
URL   : https://patchwork.freedesktop.org/series/152682/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 661233e829023403fa3a46d8ef6d0a0e5a130e1b
Author: Christoph Manszewski <christoph.manszewski@intel.com>
Date:   Fri Aug 8 13:43:50 2025 +0300

    drm/xe: Add xe_client_debugfs and introduce debug_data file
    
    Create a debug_data file for each xe file/client which is supposed to
    list all mapped debug data and attempts to mimic '/proc/pid/maps'.
    Each line represents a single mapping and has the following format:
    
      <vm id> <begin>-<end> <flags> <offset> <pathname>
    
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
+ /mt/dim checkpatch 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b drm-intel
68cf7e3e7e4f drm/xe/eudebug: Introduce eudebug interface
-:220: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#220: 
new file mode 100644

-:475: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#475: FILE: drivers/gpu/drm/xe/xe_eudebug.c:251:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:824: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#824: FILE: drivers/gpu/drm/xe/xe_eudebug.c:600:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:824: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#824: FILE: drivers/gpu/drm/xe/xe_eudebug.c:600:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1288: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1288: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
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

-:1288: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1288: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1295: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1295: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1297: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1297: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1299: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1299: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1516: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1516: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 7 checks, 1496 lines checked
c3e29a81b6cf drm/xe/eudebug: Introduce discovery for resources
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
currently existing resources to the debugger. The client is held on selected

total: 0 errors, 1 warnings, 0 checks, 295 lines checked
fef08eb1019d drm/xe/eudebug: Introduce exec_queue events
3c7af8a08a0d drm/xe: Add EUDEBUG_ENABLE exec queue property
41d8134d1d7f drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
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
#575: FILE: drivers/gpu/drm/xe/xe_vm.c:3403:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:578: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#578: FILE: drivers/gpu/drm/xe/xe_vm.c:3406:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:698: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#698: FILE: drivers/gpu/drm/xe/xe_vm_types.h:337:
+		struct mutex lock;

total: 0 errors, 1 warnings, 8 checks, 720 lines checked
3b6e470bce74 drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This patch adds events to track the bind ioctl and associated debug data add

-:641: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#641: FILE: include/uapi/drm/xe_drm_eudebug.h:92:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:642: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#642: FILE: include/uapi/drm/xe_drm_eudebug.h:93:
+ *  └───────────────────────┘                  │ │ ┊

-:643: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#643: FILE: include/uapi/drm/xe_drm_eudebug.h:94:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:645: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#645: FILE: include/uapi/drm/xe_drm_eudebug.h:96:
+ *      └──────────────────────────────────┘     │ ┊

-:647: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#647: FILE: include/uapi/drm/xe_drm_eudebug.h:98:
+ *      ┌──────────────────────────────────┐     │ ┊

-:649: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#649: FILE: include/uapi/drm/xe_drm_eudebug.h:100:
+ *      └──────────────────────────────────┘       ┊

-:651: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#651: FILE: include/uapi/drm/xe_drm_eudebug.h:102:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:653: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#653: FILE: include/uapi/drm/xe_drm_eudebug.h:104:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 9 warnings, 0 checks, 641 lines checked
b4689918317b drm/xe/eudebug: Add UFENCE events with acks
-:184: CHECK:LINE_SPACING: Please don't use multiple blank lines
#184: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1097:
 
+

-:355: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "ufence"
#355: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1389:
+				fill_vm_bind_fields(vm, e, ufence != NULL, bind_ops);

-:696: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#696: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 3 checks, 681 lines checked
998f2efed412 drm/xe/eudebug: vm open/pread/pwrite
-:113: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#113: FILE: drivers/gpu/drm/xe/xe_eudebug.c:675:
+{
+

-:137: CHECK:LINE_SPACING: Please don't use multiple blank lines
#137: FILE: drivers/gpu/drm/xe/xe_eudebug.c:699:
+
+

-:177: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#177: FILE: drivers/gpu/drm/xe/xe_eudebug.h:41:
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

-:177: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#177: FILE: drivers/gpu/drm/xe/xe_eudebug.h:41:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:213: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#213: 
new file mode 100644

total: 1 errors, 1 warnings, 3 checks, 599 lines checked
2658ec32785d drm/xe/eudebug: userptr vm pread/pwrite
be47d563271c drm/xe/eudebug: hw enablement for eudebug
-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 463 lines checked
f1a8db89f118 drm/xe/eudebug: Introduce EU control interface
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
4998a58f01f2 drm/xe/eudebug: Introduce per device attention scan worker
599ac1c9ef4e drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
492a2cde2be8 drm/xe: Implement SR-IOV and eudebug exclusivity
661233e82902 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:50:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 161 lines checked


