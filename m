Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D204C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D200C10E19F;
	Fri, 26 Jul 2024 14:33:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9D710E19F;
 Fri, 26 Jul 2024 14:33:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GPU_debug_support_=28eude?=
 =?utf-8?q?bug=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 14:33:23 -0000
Message-ID: <172200440318.386404.7506811864939469576@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Series: GPU debug support (eudebug)
URL   : https://patchwork.freedesktop.org/series/136572/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d23ac5e3fa5a7c6e67b1c1347540bd1fc57f026
Author: Christoph Manszewski <christoph.manszewski@intel.com>
Date:   Fri Jul 26 17:08:18 2024 +0300

    drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
    
    Introduce kunit test for eudebug. For now it checks the dynamic
    application of WAs.
    
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 220554a8ef7ac26fbfc4f141816679d742a0d232 drm-intel
7d261e4b538f drm/xe: Export xe_hw_engine's mmio accessors
4fe8f7a4aa13 drm/xe: Move and export xe_hw_engine lookup.
351f7c4287f9 drm/xe/eudebug: Introduce eudebug support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:194: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#194: 
new file mode 100644

-:233: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#233: FILE: drivers/gpu/drm/xe/xe_eudebug.c:35:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:233: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#233: FILE: drivers/gpu/drm/xe/xe_eudebug.c:35:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:241: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#241: FILE: drivers/gpu/drm/xe/xe_eudebug.c:43:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:243: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#243: FILE: drivers/gpu/drm/xe/xe_eudebug.c:45:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:245: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#245: FILE: drivers/gpu/drm/xe/xe_eudebug.c:47:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:250: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#250: FILE: drivers/gpu/drm/xe/xe_eudebug.c:52:
+#define struct_member(T, member) (((T *)0)->member)

-:250: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#250: FILE: drivers/gpu/drm/xe/xe_eudebug.c:52:
+#define struct_member(T, member) (((T *)0)->member)

-:253: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#253: FILE: drivers/gpu/drm/xe/xe_eudebug.c:55:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:253: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#253: FILE: drivers/gpu/drm/xe/xe_eudebug.c:55:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:253: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#253: FILE: drivers/gpu/drm/xe/xe_eudebug.c:55:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:253: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#253: FILE: drivers/gpu/drm/xe/xe_eudebug.c:55:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:527: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#527: FILE: drivers/gpu/drm/xe/xe_eudebug.c:329:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:765: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!p"
#765: FILE: drivers/gpu/drm/xe/xe_eudebug.c:567:
+	if (XE_WARN_ON(p == NULL))

-:1159: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1159: FILE: drivers/gpu/drm/xe/xe_eudebug.c:961:
+		ret = send_open_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+					     ret, seqno);

-:1178: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#1178: FILE: drivers/gpu/drm/xe/xe_eudebug.c:980:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1178: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#1178: FILE: drivers/gpu/drm/xe/xe_eudebug.c:980:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1549: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1549: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 15 checks, 1531 lines checked
f670c21445e9 kernel: export ptrace_may_access
b2a4a17a9993 drm/xe/eudebug: Use ptrace_may_access for xe_eudebug_attach
99d7da859ca5 drm/xe/eudebug: Introduce discovery for resources
6e206ec1b909 drm/xe/eudebug: Introduce exec_queue events
-:151: CHECK:LINE_SPACING: Please don't use multiple blank lines
#151: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1218:
+
+

total: 0 errors, 0 warnings, 1 checks, 310 lines checked
855870945dcb drm/xe/eudebug: hw enablement for eudebug
7202420b7699 drm/xe: Add EUDEBUG_ENABLE exec queue property
08c055a645ca drm/xe/eudebug: Introduce per device attention scan worker
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:154: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#154: FILE: drivers/gpu/drm/xe/xe_eudebug.c:858:
+{
+

-:238: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#238: FILE: drivers/gpu/drm/xe/xe_eudebug.c:942:
+static bool engine_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)

-:419: CHECK:LINE_SPACING: Please don't use multiple blank lines
#419: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1123:
+
+

-:620: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#620: 
new file mode 100644

-:732: CHECK:LINE_SPACING: Please don't use multiple blank lines
#732: FILE: drivers/gpu/drm/xe/xe_gt_debug.c:108:
+
+

total: 0 errors, 1 warnings, 4 checks, 744 lines checked
11671229915a drm/xe/eudebug: Introduce EU control interface
-:510: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#510: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1531:
+	udelay(100);

-:519: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#519: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1540:
+	udelay(100);

-:570: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#570: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1591:
+			eu_dbg(d,
+				"WRONG CLEAR (%u:%u:%u) TD_CRL: 0x%08x; TD_ATT: 0x%08x\n",

total: 0 errors, 0 warnings, 3 checks, 772 lines checked
b74047948af8 drm/xe/eudebug: Add vm bind and vm bind ops
-:21: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#21: 
Co-developed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

total: 0 errors, 1 warnings, 0 checks, 520 lines checked
28847e71da5e drm/xe/eudebug: Add UFENCE events with acks
-:371: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#371: FILE: drivers/gpu/drm/xe/xe_eudebug_types.h:155:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 555 lines checked
8398543a44bb drm/xe/eudebug: vm open/pread/pwrite
-:262: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "w_buffer"
#262: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2991:
+	const bool write = w_buffer != NULL;

total: 0 errors, 0 warnings, 1 checks, 564 lines checked
84e7d905de17 drm/xe/eudebug: implement userptr_vma access
fe24dd12c7a2 drm/xe: Debug metadata create/destroy ioctls
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:304: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#304: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)

-:305: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#305: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)

total: 0 errors, 3 warnings, 0 checks, 303 lines checked
a990dca74af3 drm/xe: Attach debug metadata to vma
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Introduces a vm_bind_op extension, enabling users to attach metadata objects

total: 0 errors, 1 warnings, 0 checks, 386 lines checked
e1441649fa3d drm/xe/eudebug: Add debug metadata support for xe_eudebug
-:255: CHECK:LINE_SPACING: Please don't use multiple blank lines
#255: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2654:
+
+

-:383: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#383: FILE: drivers/gpu/drm/xe/xe_eudebug.c:3001:
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_METADATA, seqno,
+				       flags, sizeof(*e), GFP_KERNEL);

-:416: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#416: FILE: drivers/gpu/drm/xe/xe_eudebug.c:3034:
+static int debug_metadata_destroy_event(struct xe_eudebug *d,
+				       struct xe_file *xef, struct xe_debug_metadata *m)

total: 0 errors, 0 warnings, 3 checks, 552 lines checked
a81fb287d1c1 drm/xe/eudebug: Implement vm_bind_op discovery
9979c431bc9c drm/xe/eudebug: Dynamically toggle debugger functionality
9d23ac5e3fa5 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

-:196: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#196: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:12:
+extern struct kunit_suite xe_eudebug_test_suite;

total: 0 errors, 2 warnings, 0 checks, 190 lines checked


