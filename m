Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC10BC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE57C10F636;
	Thu,  3 Sep 2026 15:35:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032910E433;
 Thu,  3 Sep 2026 15:35:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Intel_Xe_GPU_Debug_Suppor?=
 =?utf-8?q?t_=28eudebug=29_v10?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 15:35:00 -0000
Message-ID: <178844970012.119019.13191734181830619806@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Series: Intel Xe GPU Debug Support (eudebug) v10
URL   : https://patchwork.freedesktop.org/series/173321/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d03ce24af3561c5b07e9ec0e6df79468661c27ff
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Thu Sep 3 17:59:51 2026 +0300

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
        to enter SIP mode (kmd set ForceException bit of TD_CTL register)
        Not stalled (none-pagefaulted) eu threads enter SIP mode
    (4) XE kmd installs temporal null page to the pagetable entry of the
        address where pagefault happened.
    (5) XE kmd replies pagefault successful message to GUC
    (6) When a given pagefault is fully handled temporary NULL VMA is
        removed.
    (7) If multiple threads caused a pagefault and this is reflected in
        pagefault queue or worker's cache then the first pagefault
        finalization is postponed but the worker is released
    (8) All subsequent pagefaults for a given VM are handled by eudebug by
        inserting NULL VMA, ACK and then remove the temporary VMA
    (9) stalled eu thread resumes as per pagefault condition has resolved
    (10) resumed eu thread enters SIP mode due to force exception set
         by (3)
    (9) When there are no more pagefault to process the first pagefault
        finalization is performed and event is send.
    
    As designed this feature to only work when eudbug is enabled, it should
    have no impact to regular recoverable pagefault code path.
    
    v2: - pf->q holds the vm ref so drop it (Mika)
        - streamline uapi (Mika)
        - cleanup the pagefault through producer if (Mika)
    v3: - pagefault rework (Maciej)
    
    Assisted-by: GitHub Copilot CLI:claude-opus-4.7
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 78e2bb86709699d886be71a6f9c9dc41e4bf9aab drm-intel
322a1f188b42 drm/xe/eudebug: Introduce eudebug interface
-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

-:1666: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#1666: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)

total: 0 errors, 2 warnings, 0 checks, 1618 lines checked
fa8a713d1d4d drm/xe/eudebug: Add documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
deb802674560 drm/xe/eudebug: Add connection establishment documentation
c0a975307c69 drm/xe/eudebug: Introduce discovery for resources
e40b9cb77532 drm/xe: Add EUDEBUG_ENABLE exec queue property
88c9ba66c927 drm/xe/eudebug: Introduce exec_queue events
63a035d43d2c drm/xe/eudebug: Mark guc contexts as debuggable
6bf14ce4a7e6 drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop checking
0fdc2fa23802 drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 901 lines checked
928cfe738f7d drm/xe/eudebug: Introduce vm bind and vm bind debug data events
-:420: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#420: FILE: include/uapi/drm/xe_drm_eudebug.h:133:
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐

-:421: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#421: FILE: include/uapi/drm/xe_drm_eudebug.h:134:
+ *  └───────────────────────┘                  │ │ ┊

-:422: WARNING:LONG_LINE_COMMENT: line length of 130 exceeds 100 columns
#422: FILE: include/uapi/drm/xe_drm_eudebug.h:135:
+ *      ┌──────────────────────────────────┐   │ │ ┊

-:424: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#424: FILE: include/uapi/drm/xe_drm_eudebug.h:137:
+ *      └──────────────────────────────────┘     │ ┊

-:426: WARNING:LONG_LINE_COMMENT: line length of 128 exceeds 100 columns
#426: FILE: include/uapi/drm/xe_drm_eudebug.h:139:
+ *      ┌──────────────────────────────────┐     │ ┊

-:428: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#428: FILE: include/uapi/drm/xe_drm_eudebug.h:141:
+ *      └──────────────────────────────────┘       ┊

-:430: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#430: FILE: include/uapi/drm/xe_drm_eudebug.h:143:
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊

-:432: WARNING:LONG_LINE_COMMENT: line length of 116 exceeds 100 columns
#432: FILE: include/uapi/drm/xe_drm_eudebug.h:145:
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘

total: 0 errors, 8 warnings, 0 checks, 432 lines checked
2703cac288c2 drm/xe/eudebug: Add ufence events with acks
5abf0595edf3 drm/xe/eudebug: Add vm open/pread/pwrite
-:191: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#191: FILE: drivers/gpu/drm/xe/xe_eudebug.h:46:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		for_each_if(xe_hw_engine_has_eudebug(__hwe))

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

-:191: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__hwe' - possible side-effects?
#191: FILE: drivers/gpu/drm/xe/xe_eudebug.h:46:
+#define xe_eudebug_for_each_hw_engine(__hwe, __gt, __id) \
+	for_each_hw_engine(__hwe, __gt, __id)	       \
+		for_each_if(xe_hw_engine_has_eudebug(__hwe))

-:217: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#217: 
new file mode 100644

total: 1 errors, 1 warnings, 1 checks, 642 lines checked
a1425e0f0c96 drm/xe/eudebug: Add userptr vm pread/pwrite
e22df9db693a drm/xe/eudebug: Add hw enablement
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 456 lines checked
44eb27038319 drm/xe/eudebug: Introduce EU control interface
1c242ee4bbfa drm/xe/eudebug: Introduce per device attention scan worker
762caa7954a6 drm/xe/eudebug_test: Introduce eudebug live tests
-:22: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#22: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 242 lines checked
5451f466ea71 drm/xe: Implement SR-IOV and eudebug exclusivity
6e7fc2819d05 drm/xe: Add xe_client_debugfs and introduce debug_data file
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 149 lines checked
d580805aec6f drm/xe/pagefault: export pagefault queue properties
30c56dbd14db drm/xe/eudebug: Add read/count/compare helper for eu attention
-:82: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#82: FILE: drivers/gpu/drm/xe/xe_gt_debug.c:243:
+		udelay(15);

-:116: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#116: 
new file mode 100644

-:138: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#138: FILE: drivers/gpu/drm/xe/xe_gt_debug_types.h:18:
+	       XE_GT_EU_ATT_MAX_THREADS/8];
 	                               ^

total: 0 errors, 1 warnings, 2 checks, 105 lines checked
71a69c0a851c drm/xe/vm: Support for adding null page VMA to VM on request
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
8b06486bccb1 drm/xe/vm: Add xe_vm_svm_vma_subtract() to carve out a sub-range from an SVM VMA
f27d7b656acb drm/xe: Support for xe_vma_unbind()
-:33: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#33: FILE: drivers/gpu/drm/xe/xe_vm.c:1081:
+static int xe_vm_ops_add_unbind(struct xe_vma_ops *vops,
+				  struct xe_vma *vma,

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
0ebfc10ecda1 drm/xe: export prep_vma_destroy as xe_vm_prep_vma_destroy
-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/xe/xe_vm.c:2904:
+		xe_vm_prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);

total: 0 errors, 0 warnings, 1 checks, 80 lines checked
6b9c82eb5cb7 drm/xe/eudebug: Introduce EU pagefault handling interface
-:257: CHECK:LINE_SPACING: Please don't use multiple blank lines
#257: FILE: drivers/gpu/drm/xe/xe_eudebug.c:2085:
+
+

-:407: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#407: 
new file mode 100644

-:484: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#484: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:73:
+	spinlock_t lock;

-:492: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!fence"
#492: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:81:
+	if (fence == NULL)

-:710: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#710: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:299:
+
+}

-:711: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#711: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:300:
+}
+static struct xe_eudebug_pagefault *xe_eudebug_get_epf(struct xe_pagefault *pf)

-:1052: WARNING:LINE_SPACING: Missing a blank line after declarations
#1052: FILE: drivers/gpu/drm/xe/xe_eudebug_pagefault.c:641:
+		struct xe_vm *vm;
+		epf = d->pf.first;

total: 0 errors, 2 warnings, 5 checks, 1234 lines checked
d03ce24af356 drm/xe/eudebug: Enable EU pagefault handling


