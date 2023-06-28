Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB71EEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 21:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DC910E3B7;
	Wed, 28 Jun 2023 21:45:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8682610E3B8;
 Wed, 28 Jun 2023 21:45:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 82E33A3ECB;
 Wed, 28 Jun 2023 21:45:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 28 Jun 2023 21:45:06 -0000
Message-ID: <168798870653.32035.9024478905088071138@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230628214127.870717-1-matthew.brost@intel.com>
In-Reply-To: <20230628214127.870717-1-matthew.brost@intel.com>
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
commit 7421e9506c016eea67c7033ef9522eba0a08c84a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jun 28 14:41:27 2023 -0700

    drm/xe: Avoid doing rebinds
    
    If we dont change page sizes we can avoid doing rebinds rather just do a
    partial unbind. The algorithm to determine its page size is greedy as we
    assume all pages in the removed VMA are the largest page used in the
    VMA.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch abdb420db479bae28a2abd7ba2c66229b7e8cb77 drm-intel
2ee4a4ade drm/xe: Ban a VM if rebind worker hits an error
0a2ca40cc drm/xe: Add helpers to hide struct xe_vma internals
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
#887: FILE: drivers/gpu/drm/xe/xe_vm.c:3437:
+	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));

total: 0 errors, 6 warnings, 1 checks, 947 lines checked
17fce89e0 maple_tree: Export mas_preallocate
1ecdd8d6a maple_tree: split up MA_STATE() macro
-:50: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 19 lines checked
3d2e9151d drm: manager to keep track of GPUs VA mappings
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
208e94aea drm: debugfs: provide infrastructure to dump a DRM GPU VA space
8d9e32dd6 drm/xe: Remove __xe_vm_bind forward declaration
70451d80a drm/xe: Port Xe to GPUVA
-:16: WARNING:TYPO_SPELLING: 'commited' may be misspelled - perhaps 'committed'?
#16: 
GPUVA code to generate an VMA operations list which is parsed, commited,
                                                               ^^^^^^^^

-:22: WARNING:TYPO_SPELLING: 'verison' may be misspelled - perhaps 'version'?
#22: 
v5: Use unlocked verison VMA in error paths
                 ^^^^^^^

-:25: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost <matthew.brost@intel.com'
#25: 
Signed-off-by: Matthew Brost <matthew.brost@intel.com

-:63: ERROR:TRAILING_WHITESPACE: trailing whitespace
#63: FILE: drivers/gpu/drm/xe/xe_bo.c:432:
+ $

-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/xe/xe_bo.c:432:
+ $

-:561: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#561: FILE: drivers/gpu/drm/xe/xe_vm.c:1141:
+	XE_BUG_ON(start + range > vm->size);

-:664: WARNING:LINE_SPACING: Missing a blank line after declarations
#664: FILE: drivers/gpu/drm/xe/xe_vm.c:1406:
+	struct drm_gpuva *gpuva;
+	DRM_GPUVA_ITER(it, &vm->mgr, 0);

-:833: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#833: FILE: drivers/gpu/drm/xe/xe_vm.c:1818:
+		XE_BUG_ON(!xe_vm_in_fault_mode(vm));

-:1040: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1040: FILE: drivers/gpu/drm/xe/xe_vm.c:2167:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1040: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1040: FILE: drivers/gpu/drm/xe/xe_vm.c:2167:
+						   cleans up returns and 0 */

-:1042: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1042: FILE: drivers/gpu/drm/xe/xe_vm.c:2169:
+		if (XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))

-:1048: WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1048: FILE: drivers/gpu/drm/xe/xe_vm.c:2175:
+			return -ENODATA;	/* Not an actual error, IOCTL
+						   cleans up returns and 0 */

-:1048: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1048: FILE: drivers/gpu/drm/xe/xe_vm.c:2175:
+						   cleans up returns and 0 */

-:1051: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1051: FILE: drivers/gpu/drm/xe/xe_vm.c:2178:
+		XE_BUG_ON("NOT POSSIBLE");

-:1133: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1133: FILE: drivers/gpu/drm/xe/xe_vm.c:2231:
+		XE_BUG_ON("NOT POSSIBLE");

-:1295: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1295: FILE: drivers/gpu/drm/xe/xe_vm.c:2306:
+		XE_BUG_ON(!bo);

-:1326: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1326: FILE: drivers/gpu/drm/xe/xe_vm.c:2323:
+		XE_BUG_ON("NOT POSSIBLE");

-:1393: ERROR:SPACING: space required before the open parenthesis '('
#1393: FILE: drivers/gpu/drm/xe/xe_vm.c:2372:
+	} else if(!xe_vma_has_no_bo(vma) && !bo->vm) {

-:1408: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#1408: FILE: drivers/gpu/drm/xe/xe_vm.c:2387:
+ * prior to fully commiting to the operations. This setup can fail.
                   ^^^^^^^^^

-:1421: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1421: FILE: drivers/gpu/drm/xe/xe_vm.c:2400:
+	XE_BUG_ON(num_ops_list > 1 && !async);

-:1471: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1471: FILE: drivers/gpu/drm/xe/xe_vm.c:2429:
+			XE_BUG_ON(!first && !async);

-:1602: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1602: FILE: drivers/gpu/drm/xe/xe_vm.c:2518:
+				XE_BUG_ON("NOT POSSIBLE");

-:2011: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2011: FILE: drivers/gpu/drm/xe/xe_vm.c:2684:
+		XE_BUG_ON("NOT POSSIBLE");

-:2102: ERROR:SPACING: space required before the open parenthesis '('
#2102: FILE: drivers/gpu/drm/xe/xe_vm.c:2725:
+		else if(op->remap.prev)

-:2120: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2120: FILE: drivers/gpu/drm/xe/xe_vm.c:2743:
+		XE_BUG_ON("NOT POSSIBLE");

-:2213: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#2213: FILE: drivers/gpu/drm/xe/xe_vm.c:2817:
+		XE_BUG_ON("NOT POSSIBLE");

-:2319: WARNING:MEMORY_BARRIER: memory barrier without comment
#2319: FILE: drivers/gpu/drm/xe/xe_vm.c:2889:
+					smp_wmb();

-:2494: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#2494: FILE: drivers/gpu/drm/xe/xe_vm.c:3154:
+			err = -ENOTSUPP;

-:2503: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#2503: FILE: drivers/gpu/drm/xe/xe_vm.c:3176:
+		err = -ENOTSUPP;

-:2717: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#2717: FILE: drivers/gpu/drm/xe/xe_vm.c:3445:
+		struct xe_vma* vma = gpuva_to_vma(gpuva);

-:3142: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 6 errors, 24 warnings, 1 checks, 2987 lines checked
7421e9506 drm/xe: Avoid doing rebinds
-:71: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#71: FILE: drivers/gpu/drm/xe/xe_vm.c:2503:
+						IS_ALIGNED(xe_vma_end(vma), xe_vma_max_pte_size(old));

-:86: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#86: FILE: drivers/gpu/drm/xe/xe_vm.c:2532:
+						IS_ALIGNED(xe_vma_start(vma), xe_vma_max_pte_size(old));

total: 0 errors, 2 warnings, 0 checks, 161 lines checked


