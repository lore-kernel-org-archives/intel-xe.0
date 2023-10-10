Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F39CD80A3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 11:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885BA10E1DE;
	Tue, 10 Oct 2023 11:11:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37B0D10E337;
 Tue, 10 Oct 2023 11:11:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 35A95AADE3;
 Tue, 10 Oct 2023 11:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 10 Oct 2023 11:11:04 -0000
Message-ID: <169693626421.28099.13473162296204740062@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C01/11=5D_drm/gpuvm=3A_add_common_dma?=
 =?utf-8?q?-resv_per_struct_drm=5Fgpuvm?=
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

Series: series starting with [CI,01/11] drm/gpuvm: add common dma-resv per struct drm_gpuvm
URL   : https://patchwork.freedesktop.org/series/124889/
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
commit a6d9b5a2c343dc3cc3daa42f9ddffac2e4130bff
Author: Danilo Krummrich <dakr@redhat.com>
Date:   Tue Oct 10 13:07:11 2023 +0200

    drm/nouveau: make use of the GPUVM's shared dma-resv
    
    DRM GEM objects private to a single GPUVM can use a shared dma-resv.
    Make use of the shared dma-resv of GPUVM rather than a driver specific
    one.
    
    The shared dma-resv originates from a "root" GEM object serving as
    container for the dma-resv to make it compatible with drm_exec.
    
    In order to make sure the object proving the shared dma-resv can't be
    freed up before the objects making use of it, let every such GEM object
    take a reference on it.
    
    Signed-off-by: Danilo Krummrich <dakr@redhat.com>
+ /mt/dim checkpatch 37b2d042c23ae6a10055ea92101a15083d64c718 drm-intel
f232a9192 drm/gpuvm: add common dma-resv per struct drm_gpuvm
e1acfaf3a drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:278: ERROR:TRAILING_WHITESPACE: trailing whitespace
#278: FILE: drivers/gpu/drm/xe/xe_vm.c:1387:
+^I$

-:307: ERROR:TRAILING_WHITESPACE: trailing whitespace
#307: FILE: drivers/gpu/drm/xe/xe_vm.c:1499:
+err_no_resv:^I$

total: 2 errors, 1 warnings, 0 checks, 351 lines checked
b626601bf drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
0c2b518f8 drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
e9ae627cb drm/gpuvm: add an abstraction for a VM / BO combination
-:626: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#626: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
+			if (!(op->gem.obj = obj))

-:884: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#884: FILE: include/drm/drm_gpuvm.h:427:
+struct drm_gpuvm_bo {
+

total: 1 errors, 0 warnings, 1 checks, 932 lines checked
3a0c5f318 drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:66: ERROR:TRAILING_WHITESPACE: trailing whitespace
#66: FILE: drivers/gpu/drm/xe/xe_vm.c:918:
+^I^I^I$

-:95: ERROR:TRAILING_WHITESPACE: trailing whitespace
#95: FILE: drivers/gpu/drm/xe/xe_vm.c:1014:
+^I^I^I$

total: 2 errors, 1 warnings, 0 checks, 97 lines checked
69fba083b drm/gpuvm: track/lock/validate external/evicted objects
-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#101: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo = NULL;					\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		if (!(__gpuvm)->__list_name.local_list)					\
+			(__gpuvm)->__list_name.local_list = __local_list;		\
+		else									\
+			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);	\
+											\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})

-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#101: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo = NULL;					\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		if (!(__gpuvm)->__list_name.local_list)					\
+			(__gpuvm)->__list_name.local_list = __local_list;		\
+		else									\
+			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);	\
+											\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})

-:101: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#101: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo = NULL;					\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		if (!(__gpuvm)->__list_name.local_list)					\
+			(__gpuvm)->__list_name.local_list = __local_list;		\
+		else									\
+			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);	\
+											\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})

-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#101: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo = NULL;					\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		if (!(__gpuvm)->__list_name.local_list)					\
+			(__gpuvm)->__list_name.local_list = __local_list;		\
+		else									\
+			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);	\
+											\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})

-:158: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#158: FILE: drivers/gpu/drm/drm_gpuvm.c:744:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:158: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#158: FILE: drivers/gpu/drm/drm_gpuvm.c:744:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:158: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#158: FILE: drivers/gpu/drm/drm_gpuvm.c:744:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:158: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#158: FILE: drivers/gpu/drm/drm_gpuvm.c:744:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:188: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#188: FILE: drivers/gpu/drm/drm_gpuvm.c:774:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:188: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#188: FILE: drivers/gpu/drm/drm_gpuvm.c:774:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:188: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#188: FILE: drivers/gpu/drm/drm_gpuvm.c:774:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#225: FILE: drivers/gpu/drm/drm_gpuvm.c:811:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#225: FILE: drivers/gpu/drm/drm_gpuvm.c:811:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:225: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#225: FILE: drivers/gpu/drm/drm_gpuvm.c:811:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:254: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#254: FILE: drivers/gpu/drm/drm_gpuvm.c:840:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:254: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#254: FILE: drivers/gpu/drm/drm_gpuvm.c:840:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:254: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#254: FILE: drivers/gpu/drm/drm_gpuvm.c:840:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:855:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:855:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:269: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:855:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:378: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#378: FILE: drivers/gpu/drm/drm_gpuvm.c:1111:
+
+}

-:437: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#437: FILE: drivers/gpu/drm/drm_gpuvm.c:1170:
+	uint32_t flags;

-:540: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#540: FILE: drivers/gpu/drm/drm_gpuvm.c:1273:
+	uint32_t flags;

-:624: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#624: FILE: drivers/gpu/drm/drm_gpuvm.c:1357:
+		return -ENOTSUPP;

-:631: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#631: FILE: drivers/gpu/drm/drm_gpuvm.c:1364:
+
+}

total: 0 errors, 1 warnings, 24 checks, 992 lines checked
9840ba2fe drm/xe: Adapt to GPUVM tracking of external / evicted objects.
eca05351a drm/gpuvm: Local fixes
f5f924ac1 drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
a6d9b5a2c drm/nouveau: make use of the GPUVM's shared dma-resv


