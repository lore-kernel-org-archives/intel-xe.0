Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25EDEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B676810E1D5;
	Thu, 29 Jun 2023 20:14:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B08C310E1D5;
 Thu, 29 Jun 2023 20:14:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AD23BA0BA8;
 Thu, 29 Jun 2023 20:14:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 29 Jun 2023 20:14:03 -0000
Message-ID: <168806964370.28965.13544446713065641540@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230629201046.989033-1-matthew.brost@intel.com>
In-Reply-To: <20230629201046.989033-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GP?=
 =?utf-8?q?UVA_with_no_uAPI_changes_=28rev3=29?=
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

Series: GPUVA with no uAPI changes (rev3)
URL   : https://patchwork.freedesktop.org/series/120000/
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
commit e5a45a05fd2818d42f7afdcb7cc3ff1837263c51
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 29 13:10:46 2023 -0700

    drm/xe: Avoid doing rebinds
    
    If we dont change page sizes we can avoid doing rebinds rather just do a
    partial unbind. The algorithm to determine its page size is greedy as we
    assume all pages in the removed VMA are the largest page used in the
    VMA.
    
    v2: Don't exceed 100 lines
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2ec46ad7578ebba3048d6031c1a75c21920f0e19 drm-intel
d9264cc07 drm/xe: Ban a VM if rebind worker hits an error
ae4cc3da1 drm/xe: Add helpers to hide struct xe_vma internals
-:637: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#637: FILE: drivers/gpu/drm/xe/xe_vm.c:1168:
+	XE_BUG_ON(xe_vma_end(vma) > vm->size);

-:646: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#646: FILE: drivers/gpu/drm/xe/xe_vm.c:1177:
+	XE_BUG_ON(xe_vma_vm(vma) != vm);

-:655: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#655: FILE: drivers/gpu/drm/xe/xe_vm.c:1185:
+	XE_BUG_ON(xe_vma_vm(vma) != vm);

-:745: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#745: FILE: drivers/gpu/drm/xe/xe_vm.c:2592:
+		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))

-:852: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#852: FILE: drivers/gpu/drm/xe/xe_vm.c:2794:
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))

-:861: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#861: FILE: drivers/gpu/drm/xe/xe_vm.c:2808:
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))

-:887: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#887: FILE: drivers/gpu/drm/xe/xe_vm.c:3436:
+	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));

total: 0 errors, 6 warnings, 1 checks, 947 lines checked
29477ad42 maple_tree: Export mas_preallocate
be8337f69 maple_tree: split up MA_STATE() macro
-:50: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 19 lines checked
346654870 drm: manager to keep track of GPUs VA mappings
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:109: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#109: 
new file mode 100644

-:615: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#615: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:502:
+ *^I^I ^I       struct drm_gpuva_op_map *op);$

-:817: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#817: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:704:
+{
+

-:865: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#865: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:752:
+
+}

-:2055: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2055: FILE: drivers/gpu/drm/drm_gpuva_mgr.c:1942:
+
+

-:2407: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2407: FILE: include/drm/drm_gpuva_mgr.h:225:
+struct drm_gpuva_prealloc * drm_gpuva_prealloc_create(struct drm_gpuva_manager *mgr);

-:2424: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2424: FILE: include/drm/drm_gpuva_mgr.h:242:
+};
+typedef struct drm_gpuva_iterator * drm_gpuva_state_t;

-:2424: WARNING:NEW_TYPEDEFS: do not add new typedefs
#2424: FILE: include/drm/drm_gpuva_mgr.h:242:
+typedef struct drm_gpuva_iterator * drm_gpuva_state_t;

-:2424: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2424: FILE: include/drm/drm_gpuva_mgr.h:242:
+typedef struct drm_gpuva_iterator * drm_gpuva_state_t;

-:2448: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mgr__' - possible side-effects?
#2448: FILE: include/drm/drm_gpuva_mgr.h:266:
+#define DRM_GPUVA_ITER(name, mgr__, start)				\
+	struct drm_gpuva_iterator name = {				\
+		.mas = MA_STATE_INIT(&(mgr__)->mtree, start, 0),	\
+		.mgr = mgr__,						\
+	}

-:2466: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2466: FILE: include/drm/drm_gpuva_mgr.h:284:
+#define drm_gpuva_iter_for_each_range(va__, it__, end__) \
+	while (((va__) = drm_gpuva_iter_find(&(it__), (end__) - 1)))

-:2484: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'it__' - possible side-effects?
#2484: FILE: include/drm/drm_gpuva_mgr.h:302:
+#define drm_gpuva_iter_for_each(va__, it__) \
+	drm_gpuva_iter_for_each_range(va__, it__, (it__).mgr->mm_start + (it__).mgr->mm_range)

-:2753: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2753: FILE: include/drm/drm_gpuva_mgr.h:571:
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);

total: 3 errors, 3 warnings, 7 checks, 2797 lines checked
096e0a3c1 drm: debugfs: provide infrastructure to dump a DRM GPU VA space
2833b1119 drm/xe: Remove __xe_vm_bind forward declaration
fd5725c9c drm/xe: Port Xe to GPUVA
-:559: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#559: FILE: drivers/gpu/drm/xe/xe_vm.c:1141:
+	XE_BUG_ON(start + range > vm->size);

-:831: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#831: FILE: drivers/gpu/drm/xe/xe_vm.c:1818:
+		XE_BUG_ON(!xe_vm_in_fault_mode(vm));

-:1038: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1038: FILE: drivers/gpu/drm/xe/xe_vm.c:2167:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1038: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1038: FILE: drivers/gpu/drm/xe/xe_vm.c:2167:
+						   cleans up returns and 0 */

-:1040: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1040: FILE: drivers/gpu/drm/xe/xe_vm.c:2169:
+		if (XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))

-:1046: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1046: FILE: drivers/gpu/drm/xe/xe_vm.c:2175:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1046: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1046: FILE: drivers/gpu/drm/xe/xe_vm.c:2175:
+						   cleans up returns and 0 */

-:1049: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1049: FILE: drivers/gpu/drm/xe/xe_vm.c:2178:
+		XE_BUG_ON("NOT POSSIBLE");

-:1131: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1131: FILE: drivers/gpu/drm/xe/xe_vm.c:2231:
+		XE_BUG_ON("NOT POSSIBLE");

-:1293: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1293: FILE: drivers/gpu/drm/xe/xe_vm.c:2306:
+		XE_BUG_ON(!bo);

-:1324: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1324: FILE: drivers/gpu/drm/xe/xe_vm.c:2323:
+		XE_BUG_ON("NOT POSSIBLE");

-:1420: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1420: FILE: drivers/gpu/drm/xe/xe_vm.c:2400:
+	XE_BUG_ON(num_ops_list > 1 && !async);

-:1473: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1473: FILE: drivers/gpu/drm/xe/xe_vm.c:2429:
+			XE_BUG_ON(!first && !async);

-:1601: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1601: FILE: drivers/gpu/drm/xe/xe_vm.c:2518:
+				XE_BUG_ON("NOT POSSIBLE");

-:2010: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2010: FILE: drivers/gpu/drm/xe/xe_vm.c:2684:
+		XE_BUG_ON("NOT POSSIBLE");

-:2119: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2119: FILE: drivers/gpu/drm/xe/xe_vm.c:2743:
+		XE_BUG_ON("NOT POSSIBLE");

-:2214: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2214: FILE: drivers/gpu/drm/xe/xe_vm.c:2819:
+		XE_BUG_ON("NOT POSSIBLE");

total: 0 errors, 16 warnings, 1 checks, 2970 lines checked
e5a45a05f drm/xe: Avoid doing rebinds


