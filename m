Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D2EB64DA
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jul 2023 06:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E610E651;
	Sat,  8 Jul 2023 06:59:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11B3910E651;
 Sat,  8 Jul 2023 06:59:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0DC9BA3ECB;
 Sat,  8 Jul 2023 06:59:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 08 Jul 2023 06:59:11 -0000
Message-ID: <168879955105.9510.17040522228989945888@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230708065614.1754600-1-matthew.brost@intel.com>
In-Reply-To: <20230708065614.1754600-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GP?=
 =?utf-8?q?UVA_with_no_uAPI_changes?=
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

Series: GPUVA with no uAPI changes
URL   : https://patchwork.freedesktop.org/series/120386/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f42798dc03c84089d1f2a0bb639c1110cff7a88
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 7 23:56:14 2023 -0700

    drm/xe: Port Xe to GPUVA
    
    Rather than open coding VM binds and VMA tracking, use the GPUVA
    library. GPUVA provides a common infrastructure for VM binds to use mmap
    / munmap semantics and support for VK sparse bindings.
    
    The concepts are:
    
    1) xe_vm inherits from drm_gpuva_manager
    2) xe_vma inherits from drm_gpuva
    3) xe_vma_op inherits from drm_gpuva_op
    4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
    GPUVA code to generate an VMA operations list which is parsed, committed,
    and executed.
    
    v2 (CI): Add break after default in case statement.
    v3: Rebase
    v4: Fix some error handling
    v5: Use unlocked version VMA in error paths
    v6: Rebase, address some review feedback mainly Thomas H
    v7: Fix compile error in xe_vma_op_unwind, address checkpatch
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 16b960c6321c6c67bf651a332b59166c2082d5c1 drm-intel
673fe269c drm/xe: Ban a VM if rebind worker hits an error
1d2e7fdc2 drm/xe: Add helpers to hide struct xe_vma internals
-:643: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#643: FILE: drivers/gpu/drm/xe/xe_vm.c:1170:
+	XE_BUG_ON(xe_vma_end(vma) > vm->size);

-:652: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#652: FILE: drivers/gpu/drm/xe/xe_vm.c:1179:
+	XE_BUG_ON(xe_vma_vm(vma) != vm);

-:661: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#661: FILE: drivers/gpu/drm/xe/xe_vm.c:1187:
+	XE_BUG_ON(xe_vma_vm(vma) != vm);

-:751: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#751: FILE: drivers/gpu/drm/xe/xe_vm.c:2601:
+		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))

-:858: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#858: FILE: drivers/gpu/drm/xe/xe_vm.c:2803:
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))

-:867: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#867: FILE: drivers/gpu/drm/xe/xe_vm.c:2817:
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))

-:893: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#893: FILE: drivers/gpu/drm/xe/xe_vm.c:3446:
+	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));

total: 0 errors, 6 warnings, 1 checks, 947 lines checked
f24c5a2cf drm: manager to keep track of GPUs VA mappings
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:104: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#104: 
new file mode 100644

-:562: ERROR:TRAILING_WHITESPACE: trailing whitespace
#562: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:454:
+ *^I^I^I$

-:712: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#712: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:604:
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)

-:718: WARNING:PREFER_DEFINED_ATTRIBUTE_MACRO: __always_unused or __maybe_unused is preferred over __attribute__((__unused__))
#718: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:610:
+		     GPUVA_START, GPUVA_LAST, static __attribute__((unused)),

-:759: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#759: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:651:
+{
+

-:811: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#811: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:703:
+
+}

-:1123: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#1123: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:1015:
+	if ((map = op->prev)) {

-:1128: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#1128: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:1020:
+	if ((map = op->next)) {

-:1822: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1822: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:1714:
+
+

-:2138: WARNING:NEW_TYPEDEFS: do not add new typedefs
#2138: FILE: include/drm/drm_gpuva_mgr.h:189:
+typedef struct lockdep_map *lock_dep_map;

-:2151: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2151: FILE: include/drm/drm_gpuva_mgr.h:202:
+#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
+	(mgr)->ext_lock = &(lock)->dep_map

-:2154: WARNING:NEW_TYPEDEFS: do not add new typedefs
#2154: FILE: include/drm/drm_gpuva_mgr.h:205:
+typedef struct { /* nothing */ } lock_dep_map;

-:2155: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#2155: FILE: include/drm/drm_gpuva_mgr.h:206:
+#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)

-:2285: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'va__' - possible side-effects?
#2285: FILE: include/drm/drm_gpuva_mgr.h:336:
+#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = drm_gpuva_next(va__))

-:2285: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'start__' - possible side-effects?
#2285: FILE: include/drm/drm_gpuva_mgr.h:336:
+#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = drm_gpuva_next(va__))

-:2285: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2285: FILE: include/drm/drm_gpuva_mgr.h:336:
+#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = drm_gpuva_next(va__))

-:2308: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'va__' - possible side-effects?
#2308: FILE: include/drm/drm_gpuva_mgr.h:359:
+#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+	     next__ = drm_gpuva_next(va__); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = next__, next__ = drm_gpuva_next(va__))

-:2308: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#2308: FILE: include/drm/drm_gpuva_mgr.h:359:
+#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+	     next__ = drm_gpuva_next(va__); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = next__, next__ = drm_gpuva_next(va__))

-:2308: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'start__' - possible side-effects?
#2308: FILE: include/drm/drm_gpuva_mgr.h:359:
+#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+	     next__ = drm_gpuva_next(va__); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = next__, next__ = drm_gpuva_next(va__))

-:2308: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2308: FILE: include/drm/drm_gpuva_mgr.h:359:
+#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+	     next__ = drm_gpuva_next(va__); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = next__, next__ = drm_gpuva_next(va__))

-:2604: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2604: FILE: include/drm/drm_gpuva_mgr.h:655:
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);

total: 4 errors, 5 warnings, 12 checks, 2644 lines checked
9ffa254b5 drm: debugfs: provide infrastructure to dump a DRM GPU VA space
80d87092c drm/xe: Remove __xe_vm_bind forward declaration
3f42798dc drm/xe: Port Xe to GPUVA
-:563: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#563: FILE: drivers/gpu/drm/xe/xe_vm.c:1143:
+	XE_BUG_ON(start + range > vm->size);

-:831: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#831: FILE: drivers/gpu/drm/xe/xe_vm.c:1821:
+		XE_BUG_ON(!xe_vm_in_fault_mode(vm));

-:1038: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1038: FILE: drivers/gpu/drm/xe/xe_vm.c:2170:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1038: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1038: FILE: drivers/gpu/drm/xe/xe_vm.c:2170:
+						   cleans up returns and 0 */

-:1040: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1040: FILE: drivers/gpu/drm/xe/xe_vm.c:2172:
+		if (XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))

-:1046: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1046: FILE: drivers/gpu/drm/xe/xe_vm.c:2178:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1046: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1046: FILE: drivers/gpu/drm/xe/xe_vm.c:2178:
+						   cleans up returns and 0 */

-:1049: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1049: FILE: drivers/gpu/drm/xe/xe_vm.c:2181:
+		XE_BUG_ON("NOT POSSIBLE");

-:1131: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1131: FILE: drivers/gpu/drm/xe/xe_vm.c:2234:
+		XE_BUG_ON("NOT POSSIBLE");

-:1293: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1293: FILE: drivers/gpu/drm/xe/xe_vm.c:2309:
+		XE_BUG_ON(!bo);

-:1324: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1324: FILE: drivers/gpu/drm/xe/xe_vm.c:2326:
+		XE_BUG_ON("NOT POSSIBLE");

-:1420: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1420: FILE: drivers/gpu/drm/xe/xe_vm.c:2403:
+	XE_BUG_ON(num_ops_list > 1 && !async);

-:1473: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1473: FILE: drivers/gpu/drm/xe/xe_vm.c:2432:
+			XE_BUG_ON(!first && !async);

-:1601: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1601: FILE: drivers/gpu/drm/xe/xe_vm.c:2521:
+				XE_BUG_ON("NOT POSSIBLE");

-:2010: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2010: FILE: drivers/gpu/drm/xe/xe_vm.c:2687:
+		XE_BUG_ON("NOT POSSIBLE");

-:2119: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2119: FILE: drivers/gpu/drm/xe/xe_vm.c:2746:
+		XE_BUG_ON("NOT POSSIBLE");

-:2214: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2214: FILE: drivers/gpu/drm/xe/xe_vm.c:2822:
+		XE_BUG_ON("NOT POSSIBLE");

total: 0 errors, 16 warnings, 1 checks, 2963 lines checked


