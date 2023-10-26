Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31845C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 11:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FCC10E7B7;
	Thu, 26 Oct 2023 11:57:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1070410E7B7;
 Thu, 26 Oct 2023 11:57:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0EC44A0BA8;
 Thu, 26 Oct 2023 11:57:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 26 Oct 2023 11:57:03 -0000
Message-ID: <169832142305.20472.4514416122131571040@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231026101536.5509-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231026101536.5509-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C01/10=5D_drm/gpuvm=3A_convert_WARN?=
 =?utf-8?b?KCkgdG8gZHJtX1dBUk4oKSB2YXJpYW50cyAocmV2Mik=?=
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

Series: series starting with [CI,01/10] drm/gpuvm: convert WARN() to drm_WARN() variants (rev2)
URL   : https://patchwork.freedesktop.org/series/125627/
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
commit 935f1e7cb332501f5bbba5d51d7d2ead648af2b6
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Oct 26 12:15:36 2023 +0200

    drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
    
    Use DRM_GPUVM_RESV_PROTECTED to relax locking.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df drm-intel
5172fff92 drm/gpuvm: convert WARN() to drm_WARN() variants
4bbe38050 drm/gpuvm: add common dma-resv per struct drm_gpuvm
678e05ff2 drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 351 lines checked
37dbca54e drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
11cb48e90 drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
39ec168a2 drm/gpuvm: add an abstraction for a VM / BO combination
6ee08455b drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 96 lines checked
cef83ec37 drm/gpuvm: track/lock/validate external/evicted objects
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

-:164: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#164: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:164: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#164: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:164: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#164: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:164: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#164: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#194: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#194: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:194: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#194: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:231: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#231: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:231: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#231: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:231: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#231: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#260: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#260: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:260: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#260: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:275: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#275: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:275: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#275: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:275: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#275: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:611: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#611: FILE: drivers/gpu/drm/drm_gpuvm.c:1347:
+		return -ENOTSUPP;

-:839: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#839: FILE: include/drm/drm_gpuvm.h:495:
+	uint32_t flags;

total: 0 errors, 1 warnings, 21 checks, 983 lines checked
441d0d60f drm/xe: Adapt to GPUVM tracking of external / evicted objects.
935f1e7cb drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm


