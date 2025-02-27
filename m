Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCD7C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 06:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7F10EA4B;
	Thu, 27 Feb 2025 06:54:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DAD10EA4B;
 Thu, 27 Feb 2025 06:54:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_SVM_squash_for_?=
 =?utf-8?q?CI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 06:54:38 -0000
Message-ID: <174063927885.2607309.16757515018107942459@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227064842.3352539-1-matthew.brost@intel.com>
In-Reply-To: <20250227064842.3352539-1-matthew.brost@intel.com>
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

Series: drm/xe: SVM squash for CI (rev2)
URL   : https://patchwork.freedesktop.org/series/145551/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57f9d5078c0547a4935c5b7e06afe6b3922269d7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Feb 26 22:48:42 2025 -0800

    drm/xe: SVM squash for CI
    
    Fixing Kconfig issues, kernel doc, sending for CI. Do not review.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8541a64154cd8b9c07977dedc1d22883f43279a0 drm-intel
57f9d5078c05 drm/xe: SVM squash for CI
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

-:16: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#16: FILE: Documentation/gpu/rfc/gpusvm.rst:1:
+===============

-:346: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#346: FILE: drivers/gpu/drm/drm_gpusvm.c:194:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:553: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#553: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:553: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#553: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:553: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#553: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:600: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#600: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:600: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#600: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:616: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#616: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:616: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#616: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:616: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#616: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2405: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#2405: FILE: drivers/gpu/drm/xe/Kconfig:77:
+config DRM_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+

-:3835: WARNING:REPEATED_WORD: Possible repeated word: 'for'
#3835: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:56:
+	/** @sgl: Scatterlist for for cursor */

-:4048: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#4048: FILE: drivers/gpu/drm/xe/xe_svm.c:53:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
+	       xe_svm_range_size((r__)))

-:4348: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#4348: FILE: drivers/gpu/drm/xe/xe_svm.c:353:
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)

-:6334: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#6334: FILE: include/drm/drm_gpusvm.h:374:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:6341: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#6341: FILE: include/drm/drm_gpusvm.h:381:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:6341: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#6341: FILE: include/drm/drm_gpusvm.h:381:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:6463: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#6463: FILE: include/drm/drm_gpusvm.h:503:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:6463: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#6463: FILE: include/drm/drm_gpusvm.h:503:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:6853: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#6853: FILE: mm/migrate_device.c:878:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 7 warnings, 14 checks, 6616 lines checked


