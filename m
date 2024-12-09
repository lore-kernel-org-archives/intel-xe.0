Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49979E77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A02910E75E;
	Mon,  9 Dec 2024 14:38:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F510E75E;
 Mon,  9 Dec 2024 14:38:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_debug_suppor?=
 =?utf-8?q?t_=28eudebug=29_v3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 14:38:54 -0000
Message-ID: <173375513449.486559.17443593592732943944@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU debug support (eudebug) v3
URL   : https://patchwork.freedesktop.org/series/142295/
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
commit 00b6bd24a242c98271f20d013a487ae9666d092e
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Mon Dec 9 15:33:17 2024 +0200

    drm/xe/eudebug: Enable EU pagefault handling
    
    The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
    access will halt the corresponding EUs. To solve this problem, enable
    EU pagefault handling functionality, which allows to unhalt pagefaulted
    eu threads and to EU debugger to get inform about the eu attentions state
    of EU threads during execution.
    
    If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event to
    the client connected to the xe_eudebug after handling the pagefault.
    
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
+ /mt/dim checkpatch c266f2fbb9c0250af17b14788364766adf802a4a drm-intel
729648a2eb39 ptrace: export ptrace_may_access
ac2f364d93cd drm/xe/eudebug: Introduce eudebug support
-:211: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#211: 
new file mode 100644

-:249: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#249: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:249: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#249: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:257: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#257: FILE: drivers/gpu/drm/xe/xe_eudebug.c:42:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:259: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#259: FILE: drivers/gpu/drm/xe/xe_eudebug.c:44:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:261: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#261: FILE: drivers/gpu/drm/xe/xe_eudebug.c:46:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:266: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#266: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:266: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#266: FILE: drivers/gpu/drm/xe/xe_eudebug.c:51:
+#define struct_member(T, member) (((T *)0)->member)

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#269: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:269: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#269: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#269: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#269: FILE: drivers/gpu/drm/xe/xe_eudebug.c:54:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	(ptr)->member = (value); \
+	}

-:541: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#541: FILE: drivers/gpu/drm/xe/xe_eudebug.c:326:
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg(d, "Session closed (%d)", (_err)); \
+		else \
+			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})

-:1201: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_d' - possible side-effects?
#1201: FILE: drivers/gpu/drm/xe/xe_eudebug.c:986:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1201: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_err' - possible side-effects?
#1201: FILE: drivers/gpu/drm/xe/xe_eudebug.c:986:
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})

-:1610: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1610: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 13 checks, 1577 lines checked
c97ad7125e5c drm/xe/eudebug: Introduce discovery for resources
-:95: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#95: FILE: drivers/gpu/drm/xe/xe_device.h:232:
+}
+static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)

total: 0 errors, 0 warnings, 1 checks, 318 lines checked
17ef44596324 drm/xe/eudebug: Introduce exec_queue events
9b1663a6ba62 drm/xe/eudebug: Introduce exec queue placements event
-:78: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#78: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1245:
+{
+

-:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#135: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1332:
+	ret = send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+				  h_c, h_vm, h_queue, q->class,

total: 0 errors, 0 warnings, 2 checks, 198 lines checked
d6539334fb02 drm/xe/eudebug: hw enablement for eudebug
71935b719213 drm/xe: Add EUDEBUG_ENABLE exec queue property
faa9fdc51a4f drm/xe/eudebug: Introduce per device attention scan worker
-:429: CHECK:LINE_SPACING: Please don't use multiple blank lines
#429: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1156:
+
+

-:649: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#649: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 770 lines checked
af1c94d3a52a drm/xe/eudebug: Introduce EU control interface
2ecba6c79908 drm/xe/eudebug: Add vm bind and vm bind ops
19cfd471bec6 drm/xe/eudebug: Add UFENCE events with acks
-:667: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#667: FILE: drivers/gpu/drm/xe/xe_sync_types.h:26:
+		spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 635 lines checked
e9ba92596063 drm/xe/eudebug: vm open/pread/pwrite
43ef77a37d6f drm/xe: add system memory page iterator support to xe_res_cursor
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:148:
+static inline void __xe_res_first_sg(const struct sg_table *sg,
+				   u64 start, u64 size,

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:189:
+static inline void xe_res_first_sg_system(const struct sg_table *sg,
+				   u64 start, u64 size,

total: 0 errors, 0 warnings, 2 checks, 71 lines checked
ea30cab25fb5 drm/xe/eudebug: implement userptr_vma access
ab7e2f12115d drm/xe: Debug metadata create/destroy ioctls
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:202: CHECK:LINE_SPACING: Please don't use multiple blank lines
#202: FILE: drivers/gpu/drm/xe/xe_debug_metadata.h:49:
+
+

-:351: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#351: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)

-:352: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#352: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)

total: 0 errors, 3 warnings, 1 checks, 337 lines checked
673be9f4e1cb drm/xe: Attach debug metadata to vma
-:315: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#315: FILE: drivers/gpu/drm/xe/xe_vm.c:2261:
+					err = xe_eudebug_copy_vma_metadata(&op->remap.prev->eudebug.metadata,

total: 0 errors, 1 warnings, 0 checks, 485 lines checked
6950a7c43f9e drm/xe/eudebug: Add debug metadata support for xe_eudebug
-:48: CHECK:LINE_SPACING: Please don't use multiple blank lines
#48: FILE: drivers/gpu/drm/xe/xe_debug_metadata.c:198:
 
+

total: 0 errors, 0 warnings, 1 checks, 599 lines checked
8f29285760a5 drm/xe/eudebug: Implement vm_bind_op discovery
59784a8a0666 drm/xe/eudebug: Dynamically toggle debugger functionality
1bbfdddec9c4 drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 194 lines checked
7419000de5f6 drm/xe/eudebug/ptl: Add support for extra attention register
cc6676ac179e drm/xe/eudebug/ptl: Add RCU_DEBUG_1 register support for xe3
86497262e6c8 drm/xe/eudebug: Add read/count/compare helper for eu attention
1a6695e5836f drm/xe/eudebug: Introduce EU pagefault handling interface
-:409: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#409: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4234:
+	spinlock_t lock;

-:417: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#417: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4242:
+	if (fence == NULL)

-:514: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#514: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4339:
+		udelay(200);

-:522: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#522: FILE: drivers/gpu/drm/xe/xe_eudebug.c:4347:
+		udelay(200);

total: 0 errors, 0 warnings, 4 checks, 774 lines checked
09839463caad drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
00b6bd24a242 drm/xe/eudebug: Enable EU pagefault handling


