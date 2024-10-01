Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E37CEACD5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF27C10E309;
	Tue,  1 Oct 2024 15:03:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503410E309;
 Tue,  1 Oct 2024 15:03:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GPU_debug_support_=28eude?=
 =?utf-8?q?bug=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 15:03:19 -0000
Message-ID: <172779499901.1142568.17741317305740046468@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

Series: GPU debug support (eudebug) (rev2)
URL   : https://patchwork.freedesktop.org/series/136572/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fefc940eb695b6ace9e906fbe1869fd9b7f658dd
Author: Christoph Manszewski <christoph.manszewski@intel.com>
Date:   Tue Oct 1 17:43:06 2024 +0300

    drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
    
    Introduce kunit test for eudebug. For now it checks the dynamic
    application of WAs.
    
    v2: adapt to removal of call_for_each_device (Mika)
    
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch f3f61bfc1cddded910b3916aa2c576a14bf62f71 drm-intel
cfddad185c79 ptrace: export ptrace_may_access
6de3ddf0c385 drm/xe/eudebug: Introduce eudebug support
-:202: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#202: 
new file mode 100644

-:240: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#240: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#240: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:248: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#248: FILE: drivers/gpu/drm/xe/xe_eudebug.c:42:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:250: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#250: FILE: drivers/gpu/drm/xe/xe_eudebug.c:44:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:252: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#252: FILE: drivers/gpu/drm/xe/xe_eudebug.c:46:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:257: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#257: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:257: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#257: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#260: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:260: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#260: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#260: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#260: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:532: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#532: FILE: drivers/gpu/drm/xe/xe_eudebug.c:326:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:1188: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#1188: FILE: drivers/gpu/drm/xe/xe_eudebug.c:982:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1188: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#1188: FILE: drivers/gpu/drm/xe/xe_eudebug.c:982:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1597: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1597: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 13 checks, 1568 lines checked
c85f0d674e4c drm/xe/eudebug: Introduce discovery for resources
-:94: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#94: FILE: drivers/gpu/drm/xe/xe_device.h:218:
+}
+static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)

total: 0 errors, 0 warnings, 1 checks, 318 lines checked
31f53dce7293 drm/xe/eudebug: Introduce exec_queue events
3524200dba1a drm/xe/eudebug: hw enablement for eudebug
5606c41b22a2 drm/xe: Add EUDEBUG_ENABLE exec queue property
eab05032a20b drm/xe/eudebug: Introduce per device attention scan worker
-:390: CHECK:LINE_SPACING: Please don't use multiple blank lines
#390: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1127:
+
+

-:610: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#610: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 735 lines checked
4b37794314ac drm/xe/eudebug: Introduce EU control interface
4aaf27fb08d6 drm/xe/eudebug: Add vm bind and vm bind ops
904c12faa332 drm/xe/eudebug: Add UFENCE events with acks
-:415: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#415: FILE: drivers/gpu/drm/xe/xe_eudebug.h:78:
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm) { }

-:642: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#642: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 1 warnings, 1 checks, 615 lines checked
d24f5ef48159 drm/xe/eudebug: vm open/pread/pwrite
-:116: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#116: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2960:
+static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
+				    void *buf, u64 len, bool write)

total: 0 errors, 0 warnings, 1 checks, 570 lines checked
b6bda0e13538 drm/xe/eudebug: implement userptr_vma access
d85eae9bd2b1 drm/xe: Debug metadata create/destroy ioctls
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:201: CHECK:LINE_SPACING: Please don't use multiple blank lines
#201: FILE: drivers/gpu/drm/xe/xe_debug_metadata.h:49:
+
+

-:353: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#353: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)

-:354: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#354: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)

total: 0 errors, 3 warnings, 1 checks, 341 lines checked
1e7e3d39885d drm/xe: Attach debug metadata to vma
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Introduces a vm_bind_op extension, enabling users to attach metadata objects

-:207: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#207: FILE: drivers/gpu/drm/xe/xe_debug_metadata.h:55:
+static inline struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id) { return NULL; }

-:312: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#312: FILE: drivers/gpu/drm/xe/xe_vm.c:2259:
+					err = xe_eudebug_copy_vma_metadata(&op->remap.prev->eudebug.metadata,

total: 0 errors, 3 warnings, 0 checks, 482 lines checked
8765e631476b drm/xe/eudebug: Add debug metadata support for xe_eudebug
-:527: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#527: FILE: drivers/gpu/drm/xe/xe_eudebug.h:80:
+static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range, struct drm_gpuva_ops *ops) { }

-:535: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#535: FILE: drivers/gpu/drm/xe/xe_eudebug.h:90:
+static inline void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m) { }

-:536: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#536: FILE: drivers/gpu/drm/xe/xe_eudebug.h:91:
+static inline void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m) { }

total: 0 errors, 3 warnings, 0 checks, 580 lines checked
6de2c5528aa1 drm/xe/eudebug: Implement vm_bind_op discovery
a3740d54ebdd drm/xe/eudebug: Dynamically toggle debugger functionality
fefc940eb695 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 193 lines checked


