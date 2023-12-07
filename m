Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22364C10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEB510E95F;
	Thu,  7 Dec 2023 19:45:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0C7B10E95F;
 Thu,  7 Dec 2023 19:45:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9C341AADD8;
 Thu,  7 Dec 2023 19:45:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Adjust_to_DRM_G?=
 =?utf-8?q?PUVM_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Dec 2023 19:45:26 -0000
Message-ID: <170197832663.28722.17789098867152467263@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Adjust to DRM GPUVM changes
URL   : https://patchwork.freedesktop.org/series/127496/
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
commit 954662af24d22ed283218c2734fb06ac23e2fcf2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Dec 7 15:11:56 2023 +0100

    drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
    
    Use DRM_GPUVM_RESV_PROTECTED to relax locking.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
c894f4a3d drm/gpuvm: convert WARN() to drm_WARN() variants
8978ec67c drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
d9c9098a0 drm/gpuvm: export drm_gpuvm_range_valid()
679a9fec2 drm/nouveau: make use of drm_gpuvm_range_valid()
ab9a7970c drm/gpuvm: add common dma-resv per struct drm_gpuvm
58f1a0e54 drm/nouveau: make use of the GPUVM's shared dma-resv
29957eb2e drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
7ee75530b drm/nouveau: separately allocate struct nouveau_uvmm
2d815b168 drm/gpuvm: reference count drm_gpuvm structures
646747f06 drm/gpuvm: add an abstraction for a VM / BO combination
ce5ded1e1 drm/gpuvm: track/lock/validate external/evicted objects
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
62cb671c3 drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:86: CHECK:LINE_SPACING: Please don't use multiple blank lines
#86: FILE: drivers/gpu/drm/xe/xe_bo.h:22:
+
+

total: 0 errors, 1 warnings, 1 checks, 396 lines checked
52450d0f3 drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
8b3c62746 drm/xe: Adjust to commit drm/gpuvm: reference count drm_gpuvm structures
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
a9d65466f drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
954662af2 drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm


