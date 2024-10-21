Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B5D0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 10:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26BA10E035;
	Mon, 21 Oct 2024 10:08:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E810E035;
 Mon, 21 Oct 2024 10:08:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_EU_online_debug_o?=
 =?utf-8?q?n_pagefault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 10:08:13 -0000
Message-ID: <172950529339.1303862.6899852965806451956@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

Series: Support EU online debug on pagefault
URL   : https://patchwork.freedesktop.org/series/140239/
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
commit d44780a1aa4e9cd3780e2a3fa5b38ef5c901cd1a
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Mon Oct 21 12:58:58 2024 +0300

    drm/xe/eudebug: Support EU online debug on pagefault
    
    When the EU debugger is connected, if a page fault occurs,
    the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event is passed to the client
    connected to the debugger after handling the pagefault WA.
    
    The pagefault WA is a mechanism that allows a stalled EU thread to enter
    SIP mode by installing a temporary page in the page table for the ppgtt
    address where the pagefault occurred.
    
    The pagefault eudebug event passed to the client follows the newly added
    struct drm_xe_eudebug_event_pagefault type.
    When a pagefault occurs, it prevents to send the
    DRM_XE_EUDEBUG_EVENT_EU_ATTENTION event to the client during
    pagefault WA processing.
    
    The page fault event delivery follows the below policy.
    (1) If EU Debugger discovery has been completed, pagefault handler delivers
        pagefault event directly.
    (2) If a pagefault occurs during eu debugger discovery process, pagefault
        handler queues a pagefault event and sends the queued event when
        discovery is completed
    
    The thread where the pagefault occurred will be notified only once,
    for an event with the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.
    
    Information about EU threads where a pagefault occurred is passed to the
    client only once for each event with the
    DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.
    Of course, if a pagefault occurs for a new thread, a new pagefault event
    will be passed to the client. It is also possible that a pagefault WA for
    multiple EU threads is processed and delivered for a single pagefault event
    
    The eu attention event is sent by the attention workqueue whenever the
    attention bit is turned on, and the eu attention event is also delivered
    to the client when the attention bit is turned on by a pagefault event.
    In this case, the pagefault event is always processed before
    the eu attention event.
    
    And when the client receives the eu attention event, the client can
    spot the thread where the page fault occurred as a previously
    delivered event, so it can spot that the attention bit is turned on by
    the breakpoint for threads other than the thread where the page fault
    occurred.
    
    Adding a temporary null page follows [1].
    
    A brief description of the page fault handling mechanism flow between KMD
    and the eu thread is as follows
    
    (1) EU Thread accesses unallocated memory
    (2) Pagefault occurs, EU Thread is stopped
    (3) XE kmd set an force EU Thread exception to allow the running EU Thread
        to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
        TD_CTL register)
        EU Threads that are not stopped enter SIP mode
    (4) XE kmd installs temporary page at the address where pagefault occurred
        of ppgtt pagetable
    (5) XE kmd replies Pagefault message to GUC
    (6) stopped EU Thread resumes when pagefault is resolved
    (7) resumed eu thread enters SIP mode due to force exception set by (3)
    
    [1] https://patchwork.freedesktop.org/patch/555097
    
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch 784111a40e40a37100e61736dd137c72cedbdb39 drm-intel
64a98951f20f ptrace: export ptrace_may_access
8dfafc8b4b99 drm/xe/eudebug: Introduce eudebug support
-:204: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#204: 
new file mode 100644

-:242: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#242: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:242: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#242: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:250: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#250: FILE: drivers/gpu/drm/xe/xe_eudebug.c:42:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:252: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#252: FILE: drivers/gpu/drm/xe/xe_eudebug.c:44:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:254: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#254: FILE: drivers/gpu/drm/xe/xe_eudebug.c:46:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:259: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#259: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:259: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#259: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:262: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#262: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:262: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#262: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:262: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#262: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:262: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#262: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:534: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#534: FILE: drivers/gpu/drm/xe/xe_eudebug.c:326:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:1189: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#1189: FILE: drivers/gpu/drm/xe/xe_eudebug.c:981:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1189: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#1189: FILE: drivers/gpu/drm/xe/xe_eudebug.c:981:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1598: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1598: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 13 checks, 1567 lines checked
555a95de103f drm/xe/eudebug: Introduce discovery for resources
-:96: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#96: FILE: drivers/gpu/drm/xe/xe_device.h:218:
+}
+static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)

total: 0 errors, 0 warnings, 1 checks, 318 lines checked
4500f7d2a284 drm/xe/eudebug: Introduce exec_queue events
1736ee985dee drm/xe/eudebug: hw enablement for eudebug
a42f39cf53a1 drm/xe: Add EUDEBUG_ENABLE exec queue property
98b8b7fa844b drm/xe/eudebug: Introduce per device attention scan worker
-:396: CHECK:LINE_SPACING: Please don't use multiple blank lines
#396: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1129:
+
+

-:628: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#628: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 748 lines checked
b73f6e4a2233 drm/xe/eudebug: Introduce EU control interface
07baf3ff0a6d drm/xe/eudebug: Add vm bind and vm bind ops
473026cdba21 drm/xe/eudebug: Add UFENCE events with acks
-:416: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#416: FILE: drivers/gpu/drm/xe/xe_eudebug.h:78:
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm) { }

-:634: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#634: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 1 warnings, 1 checks, 607 lines checked
93c4e43b4a35 drm/xe/eudebug: vm open/pread/pwrite
-:119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#119: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2961:
+static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
+				    void *buf, u64 len, bool write)

total: 0 errors, 0 warnings, 1 checks, 571 lines checked
026f54b4f747 drm/xe/eudebug: implement userptr_vma access
0e4685e3d581 drm/xe: Debug metadata create/destroy ioctls
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:202: CHECK:LINE_SPACING: Please don't use multiple blank lines
#202: FILE: drivers/gpu/drm/xe/xe_debug_metadata.h:49:
+
+

-:354: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#354: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)

-:355: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#355: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)

total: 0 errors, 3 warnings, 1 checks, 341 lines checked
00921daa6db9 drm/xe: Attach debug metadata to vma
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Introduces a vm_bind_op extension, enabling users to attach metadata objects

-:208: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#208: FILE: drivers/gpu/drm/xe/xe_debug_metadata.h:55:
+static inline struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id) { return NULL; }

-:313: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#313: FILE: drivers/gpu/drm/xe/xe_vm.c:2259:
+					err = xe_eudebug_copy_vma_metadata(&op->remap.prev->eudebug.metadata,

total: 0 errors, 3 warnings, 0 checks, 482 lines checked
b219f4e3b123 drm/xe/eudebug: Add debug metadata support for xe_eudebug
-:528: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#528: FILE: drivers/gpu/drm/xe/xe_eudebug.h:80:
+static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range, struct drm_gpuva_ops *ops) { }

-:536: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#536: FILE: drivers/gpu/drm/xe/xe_eudebug.h:90:
+static inline void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m) { }

-:537: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#537: FILE: drivers/gpu/drm/xe/xe_eudebug.h:91:
+static inline void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m) { }

total: 0 errors, 3 warnings, 0 checks, 580 lines checked
83c2344fb226 drm/xe/eudebug: Implement vm_bind_op discovery
8ff05fe6c727 drm/xe/eudebug: Dynamically toggle debugger functionality
7f3c79420e34 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 193 lines checked
d44780a1aa4e drm/xe/eudebug: Support EU online debug on pagefault
-:315: ERROR:SPACING: spaces required around that '=' (ctx:WxV)
#315: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4075:
+		struct xe_gt *gt =pf->q->gt;
 		                 ^

-:374: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#374: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4134:
+	if (fence == NULL)

-:419: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#419: FILE: drivers/gpu/drm/xe/xe_eudebug.h:60:
+struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx);

-:438: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#438: FILE: drivers/gpu/drm/xe/xe_eudebug.h:102:
+static inline struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx) { return NULL; }

-:441: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#441: FILE: drivers/gpu/drm/xe/xe_eudebug.h:105:
+static inline int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf) { return 0; }

-:442: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#442: FILE: drivers/gpu/drm/xe/xe_eudebug.h:106:
+static inline struct xe_eudebug_pagefault_fence *xe_eudebug_pagefault_fence_create(void) { return NULL; }

-:465: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#465: FILE: drivers/gpu/drm/xe/xe_eudebug_types.h:167:
+	struct mutex pf_lock;

-:532: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#532: FILE: drivers/gpu/drm/xe/xe_eudebug_types.h:391:
+	spinlock_t lock;

-:598: WARNING:MISSING_EOF_NEWLINE: adding a line without newline at end of file
#598: FILE: drivers/gpu/drm/xe/xe_gt_debug.c:199:
+}

-:727: WARNING:BRACES: braces {} are not necessary for single statement blocks
#727: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:276:
+	if (!pagefault_fence) {
+		goto err_unlock_eu_lock;
+	}

-:747: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#747: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:296:
+		udelay(200);

-:755: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#755: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:304:
+		udelay(200);

-:804: WARNING:LINE_SPACING: Missing a blank line after declarations
#804: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:353:
+		struct xe_device *xe = gt_to_xe(gt);
+		drm_warn(&xe->drm, "Forcewake fail: Can not recover TD_CTL");

-:885: CHECK:LINE_SPACING: Please don't use multiple blank lines
#885: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:439:
+
+

-:900: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#900: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:454:
+		 * in another context has allocated.*/

-:924: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#924: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:478:
+	}
+	else {

-:924: CHECK:BRACES: Unbalanced braces around else statement
#924: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:478:
+	else {

-:970: WARNING:BRACES: braces {} are not necessary for single statement blocks
#970: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:650:
+		if (unlikely(ret)) {
+			drm_dbg(&xe->drm, "GuC Pagefault reply failed: %d\n", ret);
+		}

total: 2 errors, 9 warnings, 7 checks, 910 lines checked


