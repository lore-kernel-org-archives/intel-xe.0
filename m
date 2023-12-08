Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDC4C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 10:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB4D10EA4C;
	Fri,  8 Dec 2023 10:35:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BBA010EA4C;
 Fri,  8 Dec 2023 10:35:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D087DAADDD;
 Fri,  8 Dec 2023 10:35:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Adjust_to_GPUVM_/_fixup_v?=
 =?utf-8?q?ersion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 10:35:26 -0000
Message-ID: <170203172685.7327.12707169620156825386@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
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

Series: Adjust to GPUVM / fixup version
URL   : https://patchwork.freedesktop.org/series/127549/
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
commit 8b90911b49716377beb71d9f8171925abc2ef53b
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Dec 8 01:46:43 2023 -0500

    fixup! drm/xe: Port Xe to GPUVA
    
    drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c4235ef53c0265159d2c5f34459a3b6c37ab1995 drm-intel
0d5e62a56 drm/gpuvm: convert WARN() to drm_WARN() variants
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '546ca4d35dccaca6613766ed36ccfb2b5bd63bfe', maybe rebased or not pulled?
#12: 
(cherry picked from commit 546ca4d35dccaca6613766ed36ccfb2b5bd63bfe)

total: 0 errors, 1 warnings, 0 checks, 125 lines checked
a227828f4 drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd1adea27d0c8a08031b075f1bf4c5ce6f135ad7c', maybe rebased or not pulled?
#15: 
(cherry picked from commit d1adea27d0c8a08031b075f1bf4c5ce6f135ad7c)

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
e8958b70e drm/gpuvm: export drm_gpuvm_range_valid()
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9297cfc9405bc6b60540b8b8aaf930b7e449e15a', maybe rebased or not pulled?
#12: 
(cherry picked from commit 9297cfc9405bc6b60540b8b8aaf930b7e449e15a)

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
e410deb4d drm/nouveau: make use of drm_gpuvm_range_valid()
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b41e297abd2347075ec640daf0e5da576e3d7418', maybe rebased or not pulled?
#8: 
(cherry picked from commit b41e297abd2347075ec640daf0e5da576e3d7418)

total: 0 errors, 1 warnings, 0 checks, 44 lines checked
a97a6b745 drm/gpuvm: add common dma-resv per struct drm_gpuvm
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bbe8458037e74b9887ba2f0f0b8084a13ade3a90', maybe rebased or not pulled?
#13: 
(cherry picked from commit bbe8458037e74b9887ba2f0f0b8084a13ade3a90)

total: 0 errors, 1 warnings, 0 checks, 167 lines checked
493825e92 drm/nouveau: make use of the GPUVM's shared dma-resv
-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6118411428a393fb0868bad9025d71875418058b', maybe rebased or not pulled?
#17: 
(cherry picked from commit 6118411428a393fb0868bad9025d71875418058b)

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
5d212e511 drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '809ef191ee600e8bcbe2f8a769e00d2d54c16094', maybe rebased or not pulled?
#12: 
(cherry picked from commit 809ef191ee600e8bcbe2f8a769e00d2d54c16094)

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
31f413137 drm/nouveau: separately allocate struct nouveau_uvmm
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '266f7618e761c8a6aa89dbfe43cda1b69cdbbf14', maybe rebased or not pulled?
#12: 
(cherry picked from commit 266f7618e761c8a6aa89dbfe43cda1b69cdbbf14)

total: 0 errors, 1 warnings, 0 checks, 179 lines checked
f1976c968 drm/gpuvm: reference count drm_gpuvm structures
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8af72338dd81d1f8667e0240bd28f5fc98b3f20d', maybe rebased or not pulled?
#11: 
(cherry picked from commit 8af72338dd81d1f8667e0240bd28f5fc98b3f20d)

total: 0 errors, 1 warnings, 0 checks, 182 lines checked
4663150dd drm/gpuvm: add an abstraction for a VM / BO combination
-:31: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '94bc2249f08e141fb4aa120bfdc392c7a5e78211', maybe rebased or not pulled?
#31: 
(cherry picked from commit 94bc2249f08e141fb4aa120bfdc392c7a5e78211)

total: 0 errors, 1 warnings, 0 checks, 946 lines checked
edab2fca3 drm/gpuvm: track/lock/validate external/evicted objects
-:36: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '50c1a36f594bb3dd33f3f9386c5d960cd12327d8', maybe rebased or not pulled?
#36: 
(cherry picked from commit 50c1a36f594bb3dd33f3f9386c5d960cd12327d8)

-:110: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#110: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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

-:110: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#110: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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

-:110: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#110: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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

-:110: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#110: FILE: drivers/gpu/drm/drm_gpuvm.c:687:
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

-:173: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#173: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:173: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#173: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:173: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__local_list' - possible side-effects?
#173: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:173: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#173: FILE: drivers/gpu/drm/drm_gpuvm.c:750:
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))

-:203: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__gpuvm' - possible side-effects?
#203: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:203: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#203: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:203: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#203: FILE: drivers/gpu/drm/drm_gpuvm.c:780:
+#define restore_vm_bo_list(__gpuvm, __list_name)			\
+	__restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,	\
+			     &(__gpuvm)->__list_name.list,		\
+			     &(__gpuvm)->__list_name.local_list)

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#240: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#240: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:240: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#240: FILE: drivers/gpu/drm/drm_gpuvm.c:817:
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_add((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				&(__vm_bo)->vm->__list_name.list)

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:269: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#269: FILE: drivers/gpu/drm/drm_gpuvm.c:846:
+#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)		\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				true)

-:284: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__vm_bo' - possible side-effects?
#284: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:284: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__list_name' - possible side-effects?
#284: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:284: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__list_name' may be better as '(__list_name)' to avoid precedence issues
#284: FILE: drivers/gpu/drm/drm_gpuvm.c:861:
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)			\
+	__drm_gpuvm_bo_list_del((__vm_bo)->vm,					\
+				__lock ? &(__vm_bo)->vm->__list_name.lock :	\
+					 NULL,					\
+				&(__vm_bo)->list.entry.__list_name,		\
+				false)

-:851: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#851: FILE: include/drm/drm_gpuvm.h:517:
+	uint32_t flags;

total: 0 errors, 1 warnings, 21 checks, 985 lines checked
6ae486fef fixup! drm/xe/vm: Simplify and document xe_vm_lock()
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:22: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
a373dfb90 fixup! drm/xe: Convert pagefaulting code to use drm_exec
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
a5e885853 fixup! drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
7f24a9a17 fixup! drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
8b90911b4 fixup! drm/xe: Port Xe to GPUVA
-:113: CHECK:LINE_SPACING: Please don't use multiple blank lines
#113: FILE: drivers/gpu/drm/xe/xe_bo.h:22:
+
+

total: 0 errors, 0 warnings, 1 checks, 542 lines checked


