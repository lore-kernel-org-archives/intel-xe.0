Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA6CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1447710F6B3;
	Mon,  8 Jun 2026 16:24:40 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1715D10F6B3;
 Mon,  8 Jun 2026 16:24:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v9?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 16:24:39 -0000
Message-ID: <178093587909.54361.4064573414290405746@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v9
URL   : https://patchwork.freedesktop.org/series/168104/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28a3a9eb917fa47d6ebfe89f126867f248576393
Author: Christoph Manszewski <c.manszewski@gmail.com>
Date:   Mon Jun 8 19:16:36 2026 +0300

    drm/xe: Add xe_client_debugfs and introduce debug_data file
    
    Create a debug_data file for each xe file/client which is supposed to
    list all mapped debug data and attempts to mimic '/proc/pid/maps'.
    Each line represents a single mapping and has the following format:
    
      <vm id> <begin>-<end> <flags> <offset> <pathname>
    
    v2: trim len in debug_data_read() (Sashiko)
    
    Cc: Sunil Khatri <sunil.khatri@amd.com>
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
    Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 044152a1643f7150f482c8d326caa5023ae4c397 drm-intel
7d145466de5f drm/xe/eudebug: Introduce eudebug interface
-:228: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#228: 
new file mode 100644

-:349: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!READ_ONCE"
#349: FILE: drivers/gpu/drm/xe/xe_eudebug.c:117:
+	return READ_ONCE(d->target.xef) == NULL;

-:410: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#410: FILE: drivers/gpu/drm/xe/xe_eudebug.c:178:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:410: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#410: FILE: drivers/gpu/drm/xe/xe_eudebug.c:178:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:1336: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1336: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
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

-:1336: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1336: FILE: drivers/gpu/drm/xe/xe_eudebug.h:20:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1

-:1343: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1343: FILE: drivers/gpu/drm/xe/xe_eudebug.h:27:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1345: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1345: FILE: drivers/gpu/drm/xe/xe_eudebug.h:29:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1347: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#1347: FILE: drivers/gpu/drm/xe/xe_eudebug.h:31:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:1569: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#1569: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 7 checks, 1534 lines checked
e8c5c56d4c52 drm/xe/eudebug: Add documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
ead67f97b767 drm/xe/eudebug: Add connection establishment documentation
7934fecb8a0c drm/xe/eudebug: Introduce discovery for resources
9942530d243d drm/xe: Add EUDEBUG_ENABLE exec queue property
5739be64f362 drm/xe/eudebug: Introduce exec_queue events
8cabf443a121 drm/xe/eudebug: Mark guc contexts as debuggable
73f8b036237c drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

-:691: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#691: FILE: drivers/gpu/drm/xe/xe_vm.c:3692:
+		if (XE_IOCTL_DBG(xe, operation != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+				     operation != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA &&

-:694: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#694: FILE: drivers/gpu/drm/xe/xe_vm.c:3695:
+		    XE_IOCTL_DBG(xe, ext.name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA &&
+				     ++debug_data_count > 1))

-:818: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#818: FILE: drivers/gpu/drm/xe/xe_vm_types.h:414:
+		struct mutex lock;

total: 0 errors, 1 warnings, 3 checks, 861 lines checked
9acd4ea869b7 drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This patch adds events to track the bind ioctl and associated debug data add

-:427: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#427: FILE: include/uapi/drm/xe_drm_eudebug.h:112:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:428: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#428: FILE: include/uapi/drm/xe_drm_eudebug.h:113:
+ *  └───────────────────────┘                  │ │ ┊

-:429: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#429: FILE: include/uapi/drm/xe_drm_eudebug.h:114:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:431: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#431: FILE: include/uapi/drm/xe_drm_eudebug.h:116:
+ *      └──────────────────────────────────┘     │ ┊

-:433: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#433: FILE: include/uapi/drm/xe_drm_eudebug.h:118:
+ *      ┌──────────────────────────────────┐     │ ┊

-:435: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#435: FILE: include/uapi/drm/xe_drm_eudebug.h:120:
+ *      └──────────────────────────────────┘       ┊

-:437: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#437: FILE: include/uapi/drm/xe_drm_eudebug.h:122:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:439: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#439: FILE: include/uapi/drm/xe_drm_eudebug.h:124:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 9 warnings, 0 checks, 440 lines checked
ff6c4d73bab5 drm/xe/eudebug: Add ufence events with acks
-:337: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ufence"
#337: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1299:
+			xe_assert(vm->xe, ufence == NULL);

-:641: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#641: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 2 checks, 656 lines checked
261f837fa8a5 drm/xe/eudebug: vm open/pread/pwrite
-:182: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#182: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
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

-:182: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#182: FILE: drivers/gpu/drm/xe/xe_eudebug.h:42:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		if (xe_hw_engine_has_eudebug(__hwe))

-:210: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#210: 
new file mode 100644

total: 1 errors, 1 warnings, 1 checks, 614 lines checked
159eb0cbc906 drm/xe/eudebug: userptr vm pread/pwrite
2cd0ca8cb89e drm/xe/eudebug: hw enablement for eudebug
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 445 lines checked
a1cb4ab87aaa drm/xe/eudebug: Introduce EU control interface
-:303: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#303: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:183:
+static bool engine_has_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:309: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#309: FILE: drivers/gpu/drm/xe/xe_eudebug_hw.c:189:
+static bool engine_has_context_set(const struct xe_hw_engine * const hwe,
+				  u32 rcu_debug1)

total: 0 errors, 0 warnings, 2 checks, 902 lines checked
a84a2f84a023 drm/xe/eudebug: Introduce per device attention scan worker
93d992d05f92 drm/xe/eudebug_test: Introduce eudebug live tests
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 213 lines checked
4f1d68521cbf drm/xe: Implement SR-IOV and eudebug exclusivity
28a3a9eb917f drm/xe: Add xe_client_debugfs and introduce debug_data file
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/xe/xe_client_debugfs.c:51:
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,

total: 0 errors, 1 warnings, 1 checks, 175 lines checked


