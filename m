Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAFFC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FAF10E2CB;
	Mon,  6 Nov 2023 11:26:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FCFB10E2CB;
 Mon,  6 Nov 2023 11:26:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7D5E1A0078;
 Mon,  6 Nov 2023 11:26:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 06 Nov 2023 11:26:15 -0000
Message-ID: <169926997550.20422.3288142884719234937@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?-eudebug=3A_GPU_debugging_interface?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe-eudebug: GPU debugging interface
URL   : https://patchwork.freedesktop.org/series/126019/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 77e8500f7589521665f03db5c263daafe60daddc
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Mon Nov 6 13:18:45 2023 +0200

    drm/xe/eudebug: vm open/pread/pwrite
    
    Debugger needs access to the client's vm to read and write. For
    example inspecting ISA/ELF and setting up breakpoints.
    
    Add ioctl to open target vm with debugger client and vm_handle
    and hook up pread/pwrite possibility.
    
    Open will take timeout argument so that standard fsync
    can be used for explicit flushing between cpu/gpu for
    the target vm.
    
    TODO: userptr
    TODO: flushes per engine
    
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch fc457bcc18109467961edc92c80b238009f6a9fb drm-intel
e793dfbe2 drm/xe/eudebug: Introduce eudebug support
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
-:172: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#172: 
new file mode 100644

-:210: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#210: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) current->pid, \
+		task_tgid_nr(current), \
+		(d)->session, \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:210: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#210: FILE: drivers/gpu/drm/xe/xe_eudebug.c:34:
+#define XE_EUDEBUG_DBG_ARGS(d) current->pid, \
+		task_tgid_nr(current), \
+		(d)->session, \
+		(d)->target_task->pid, \
+		task_tgid_nr((d)->target_task)

-:216: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#216: FILE: drivers/gpu/drm/xe/xe_eudebug.c:40:
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:218: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#218: FILE: drivers/gpu/drm/xe/xe_eudebug.c:42:
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:220: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#220: FILE: drivers/gpu/drm/xe/xe_eudebug.c:44:
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)

-:223: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#223: FILE: drivers/gpu/drm/xe/xe_eudebug.c:47:
+#define struct_member(T, member) (((T *)0)->member)

-:223: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#223: FILE: drivers/gpu/drm/xe/xe_eudebug.c:47:
+#define struct_member(T, member) (((T *)0)->member)

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#225: FILE: drivers/gpu/drm/xe/xe_eudebug.c:49:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:225: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#225: FILE: drivers/gpu/drm/xe/xe_eudebug.c:49:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#225: FILE: drivers/gpu/drm/xe/xe_eudebug.c:49:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#225: FILE: drivers/gpu/drm/xe/xe_eudebug.c:49:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:521: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!event"
#521: FILE: drivers/gpu/drm/xe/xe_eudebug.c:345:
+	if (*event == NULL)

-:784: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#784: FILE: drivers/gpu/drm/xe/xe_eudebug.c:608:
+						       msecs_to_jiffies(10*10000));
 						                          ^

-:861: CHECK:LINE_SPACING: Please don't use multiple blank lines
#861: FILE: drivers/gpu/drm/xe/xe_eudebug.c:685:
+
+

-:1446: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#1446: FILE: include/uapi/drm/xe_drm_tmp.h:16:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 1 errors, 2 warnings, 13 checks, 1417 lines checked
c1f1509f3 drm/xe/eudebug: Introduce discovery for resources
661ce4c31 drm/xe/eudebug: Introduce exec_queue events
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1040:
+static int send_exec_queue_event(struct xe_eudebug *d, u32 flags,
+			     u64 client_handle, u64 vm_handle,

-:45: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#45: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1057:
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, exec_queue_handle, exec_queue_handle);

total: 0 errors, 1 warnings, 1 checks, 286 lines checked
b16f0af5c drm/xe/eudebug: hw enablement for eudebug
276eaf4f8 drm/xe: define XE_MAX_[DSS|EU]_FUSE_BITS globally
-:38: WARNING:NEW_TYPEDEFS: do not add new typedefs
#38: FILE: drivers/gpu/drm/xe/xe_gt_types.h:32:
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];

-:39: WARNING:NEW_TYPEDEFS: do not add new typedefs
#39: FILE: drivers/gpu/drm/xe/xe_gt_types.h:33:
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];

total: 0 errors, 2 warnings, 0 checks, 23 lines checked
9ba055fbe drm/xe: Introduce for_each_dss_steering loop
-:70: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ss_' - possible side-effects?
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:70: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:70: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'group_' - possible side-effects?
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:70: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as '(group_)' to avoid precedence issues
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:70: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'instance_' - possible side-effects?
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:70: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'instance_' may be better as '(instance_)' to avoid precedence issues
#70: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_dss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(test_bit(ss_, gt_->fuse_topo.c_dss_mask) || \
+			    test_bit(ss_, gt_->fuse_topo.g_dss_mask))

-:77: CHECK:LINE_SPACING: Please don't use multiple blank lines
#77: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:43:
+
+

total: 0 errors, 0 warnings, 7 checks, 55 lines checked
cb3761f3d drm/xe: Export xe_hw_engine's mmio accessors
7ed7b8cdd drm/xe: Add runalone engine property
-:75: ERROR:TRAILING_WHITESPACE: trailing whitespace
#75: FILE: drivers/gpu/drm/xe/xe_lrc.c:1276:
+^I$

-:93: CHECK:LINE_SPACING: Please don't use multiple blank lines
#93: FILE: drivers/gpu/drm/xe/xe_lrc.h:60:
+
+

total: 1 errors, 0 warnings, 1 checks, 65 lines checked
39e3e738f drm/xe/eudebug: Introduce per device attention scan worker
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:152: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#152: FILE: drivers/gpu/drm/xe/xe_eudebug.c:707:
+{
+

-:319: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'T' may be better as '(T)' to avoid precedence issues
#319: FILE: drivers/gpu/drm/xe/xe_eudebug.c:874:
+#define struct_member(T, member) (((T *)0)->member)

-:319: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'member' may be better as '(member)' to avoid precedence issues
#319: FILE: drivers/gpu/drm/xe/xe_eudebug.c:874:
+#define struct_member(T, member) (((T *)0)->member)

-:321: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#321: FILE: drivers/gpu/drm/xe/xe_eudebug.c:876:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:321: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ptr' may be better as '(ptr)' to avoid precedence issues
#321: FILE: drivers/gpu/drm/xe/xe_eudebug.c:876:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:321: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#321: FILE: drivers/gpu/drm/xe/xe_eudebug.c:876:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:321: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#321: FILE: drivers/gpu/drm/xe/xe_eudebug.c:876:
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}

-:378: CHECK:LINE_SPACING: Please don't use multiple blank lines
#378: FILE: drivers/gpu/drm/xe/xe_eudebug.c:933:
+
+

-:506: WARNING:BRACES: braces {} are not necessary for single statement blocks
#506: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1233:
+	if (xe->eudebug.available) {
+		attention_scan_flush(xe);
+	}

-:552: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#552: FILE: drivers/gpu/drm/xe/xe_eudebug_types.h:128:
+	u8 bitmask[0];
+} __packed;

-:568: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#568: 
new file mode 100644

-:587: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#587: FILE: drivers/gpu/drm/xe/xe_gt_debug.c:15:
+static int xe_gt_for_each_dss_group_instance(struct xe_gt *gt,
+					     int (*fn)(struct xe_gt *gt,
+						       void *data,
+						       unsigned int group,
+						       unsigned int instance),
+					     void *data)
+{

-:678: CHECK:LINE_SPACING: Please don't use multiple blank lines
#678: FILE: drivers/gpu/drm/xe/xe_gt_debug.c:106:
+
+

total: 2 errors, 2 warnings, 9 checks, 708 lines checked
240371147 drm/xe: Move and export xe_hw_engine lookup.
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 125 lines checked
6ec79652d drm/xe/eudebug: Introduce EU control interface
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Based on implementation created by authors and other folks within i915 driver.

-:202: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#202: FILE: drivers/gpu/drm/xe/xe_eudebug.c:826:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size);

-:202: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#202: FILE: drivers/gpu/drm/xe/xe_eudebug.c:826:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size);

-:202: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#202: FILE: drivers/gpu/drm/xe/xe_eudebug.c:826:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size);

-:213: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#213: FILE: drivers/gpu/drm/xe/xe_eudebug.c:837:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u, ret=%d\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size, ret);

-:213: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#213: FILE: drivers/gpu/drm/xe/xe_eudebug.c:837:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u, ret=%d\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size, ret);

-:213: WARNING:UNNECESSARY_MODIFIER: Integer promotion: Using 'h' in '%hu' is unnecessary
#213: FILE: drivers/gpu/drm/xe/xe_eudebug.c:837:
+	eu_dbg(d,
+	       "eu_control: client_handle=%llu, cmd=%u, flags=0x%x, ci.engine_class=%hu,"
+	       "ci.engine_instance=%hu, ci.gt_id=%hu, bitmask_size=%u, ret=%d\n",
+	       user_arg.client_handle, user_arg.cmd, user_arg.flags, user_arg.ci.engine_class,
+	       user_arg.ci.gt_id, user_arg.ci.engine_instance, user_arg.bitmask_size, ret);

-:336: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#336: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1265:
+	udelay(100);

-:345: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#345: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1274:
+	udelay(100);

-:398: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#398: FILE: drivers/gpu/drm/xe/xe_eudebug.c:1327:
+			eu_dbg(d,
+				"WRONG CLEAR (%u:%u:%u) TD_CRL: 0x%08x; TD_ATT: 0x%08x\n",

total: 0 errors, 7 warnings, 3 checks, 560 lines checked
14a6b7c78 drm/xe: Extend drm_xe_vm_bind_op
5da32407c drm/xe/eudebug: uapi for client to debugger metadata (work in progress)
-:31: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#31: FILE: include/uapi/drm/xe_drm.h:130:
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)

-:32: WARNING:LONG_LINE: line length of 144 exceeds 100 columns
#32: FILE: include/uapi/drm/xe_drm.h:131:
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)

total: 0 errors, 2 warnings, 0 checks, 141 lines checked
495bbea60 drm/xe/eudebug: Create/destroy user metadata
2dc23ac3e drm/xe/eudebug: Set vm metadata
4aab75f57 drm/xe/eudebug: User coredump support
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
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

-:198: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#198: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:145:
+	uint64_t addr;

-:338: WARNING:STRCPY: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#338: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:285:
+		strcpy(s->comm, "");

-:413: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#413: FILE: drivers/gpu/drm/xe/xe_usercoredump_types.h:37:
+struct xe_user_state_snapshot {
+

-:415: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#415: FILE: drivers/gpu/drm/xe/xe_usercoredump_types.h:39:
+		struct mutex lock;

total: 0 errors, 2 warnings, 3 checks, 527 lines checked
a4c967d59 drm/xe/eudebug: Add per process coredumps
-:174: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#174: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:387:
+	d = debugfs_create_file(name, S_IRUSR | S_IWUSR,

-:241: WARNING:MISORDERED_TYPE: type 'long unsigned int' should be specified in [[un]signed] [short|int|long|long long] order
#241: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:454:
+	long unsigned int pid;

-:241: WARNING:UNNECESSARY_INT: Prefer 'unsigned long' over 'long unsigned int' as the int is unnecessary
#241: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:454:
+	long unsigned int pid;

-:319: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#319: FILE: drivers/gpu/drm/xe/xe_usercoredump_types.h:65:
+	struct mutex lock;

total: 0 errors, 3 warnings, 1 checks, 281 lines checked
b6201c624 drm/xe: Debug metadata create/destroy ioctls
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
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 227 lines checked
eddbabfc8 xe/drm: Include debug_metadata in usercoredump
207876b25 drm/xe: Set vm debug metadata
-:43: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#43: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:232:
+	list_for_each_entry(vmd, &vm->debug_metadata, link) {
+

total: 0 errors, 0 warnings, 1 checks, 297 lines checked
c10f013cd drm/xe/: Include attention in usercapture.
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:160: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#160: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:323:
+		udelay(200);

-:169: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#169: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:332:
+		udelay(200);

-:180: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#180: FILE: drivers/gpu/drm/xe/xe_usercoredump.c:343:
+
+}

total: 0 errors, 1 warnings, 3 checks, 255 lines checked
6b487280f RFC: xe/drm: attach debug metadata to vma
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 289 lines checked
6fcaf6ffc drm/xe: Capture metadata attached to vma
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
32562466a drm/xe/xe_eudebug: Add vm bind events w/o acking
77e8500f7 drm/xe/eudebug: vm open/pread/pwrite
-:29: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#29: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:417:
+#define RCU_ASYNC_FLUSH^I      ^I^I^IXE_REG(0x149fc)$

-:51: ERROR:SPACING: space prohibited before that close parenthesis ')'
#51: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:439:
+	RCU_ASYNC_INVALIDATE_INSTRUCTION_CACHE )

-:293: ERROR:SPACING: space required after that ',' (ctx:VxV)
#293: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2368:
+		xe_mmio_write32(gt, psmi_addr,_MASKED_BIT_ENABLE(IDLE_MSG_DISABLE));
 		                             ^

total: 2 errors, 1 warnings, 0 checks, 494 lines checked


