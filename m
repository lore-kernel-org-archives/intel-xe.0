Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F978C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 14:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336B710E736;
	Wed,  6 Dec 2023 14:11:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9999610E736;
 Wed,  6 Dec 2023 14:11:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9655BAADF2;
 Wed,  6 Dec 2023 14:11:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 06 Dec 2023 14:11:17 -0000
Message-ID: <170187187761.26426.10766145294460873882@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C01/17=5D_drm/gpuvm=3A_convert_WARN?=
 =?utf-8?q?=28=29_to_drm=5FWARN=28=29_variants?=
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

Series: series starting with [CI,01/17] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/127431/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c7e05ff6e820c7b58bb7d14aaae46114ec86623
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Dec 6 13:58:17 2023 +0100

    drm/xe: Disable panic_on_warn for testing purposes.
    
    Turn off panic_on_warn and add some debugging printouts.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
3442a57ef drm/gpuvm: convert WARN() to drm_WARN() variants
a21f3cc37 drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
4cddf379a drm/gpuvm: export drm_gpuvm_range_valid()
f241d54be drm/nouveau: make use of drm_gpuvm_range_valid()
51ffc8b35 drm/gpuvm: add common dma-resv per struct drm_gpuvm
52ab21968 drm/nouveau: make use of the GPUVM's shared dma-resv
e3f26b062 drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
65283eaf5 drm/nouveau: separately allocate struct nouveau_uvmm
9764edaf2 drm/gpuvm: reference count drm_gpuvm structures
84e9be6d2 drm/gpuvm: add an abstraction for a VM / BO combination
e44f81c85 drm/gpuvm: track/lock/validate external/evicted objects
-:109: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#109: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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
+			drm_WARN_ON((__gpuvm)->drm,					\
+				    (__gpuvm)->__list_name.local_list != __local_list);	\
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

-:109: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#109: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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
+			drm_WARN_ON((__gpuvm)->drm,					\
+				    (__gpuvm)->__list_name.local_list != __local_list);	\
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

-:109: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#109: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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
+			drm_WARN_ON((__gpuvm)->drm,					\
+				    (__gpuvm)->__list_name.local_list != __local_list);	\
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

-:109: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#109: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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
+			drm_WARN_ON((__gpuvm)->drm,					\
+				    (__gpuvm)->__list_name.local_list != __local_list);	\
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

-:172: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#172: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:172: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#172: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:172: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#172: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:172: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#172: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:202: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#202: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:202: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#202: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:202: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#202: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:239: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#239: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:239: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#239: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:239: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#239: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:268: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#268: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:268: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#268: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:268: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#268: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:283: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#283: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:283: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#283: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:283: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#283: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:850: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#850: FILE: include/drm/drm_gpuvm.h:517:
+	uint32_t flags;

total: 0 errors, 0 warnings, 21 checks, 985 lines checked
52a9ab0bb drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 364 lines checked
890ccb10e drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
300e33a03 drm/xe: Adjust to commit drm/gpuvm: reference count drm_gpuvm structures
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
b2950cad5 drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 96 lines checked
4e43e3550 drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
3c7e05ff6 drm/xe: Disable panic_on_warn for testing purposes.


