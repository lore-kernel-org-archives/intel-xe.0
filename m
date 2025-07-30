Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A14AC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 13:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030510E6AB;
	Wed, 30 Jul 2025 13:36:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7406010E695;
 Wed, 30 Jul 2025 13:36:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_MADVISE_SQUASH_?=
 =?utf-8?q?for_CI-v5=5Faddressed=5F=5Fwith=5Fgpuvm=5Fchanges_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 13:36:06 -0000
Message-ID: <175388256646.199285.6070085979041383209@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730124728.1001126-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250730124728.1001126-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: MADVISE SQUASH for CI-v5_addressed__with_gpuvm_changes (rev2)
URL   : https://patchwork.freedesktop.org/series/152280/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cfd418fa987068934548eba7e047e09c19d5ac31
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Jul 30 18:17:28 2025 +0530

    drm/xe: MADVISE SQUASH for CI-v5_addressed__with_gpuvm_changes
    
    DONOT REVIEW
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch e1805ad9a7175457902ae453ea67b76194e7d796 drm-intel
cfd418fa9870 drm/xe: MADVISE SQUASH for CI-v5_addressed__with_gpuvm_changes
-:1954: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1954: 
new file mode 100644

-:2080: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2080: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:122:
+			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+			    xe->info.has_device_atomics_on_smem)) {

-:2299: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2299: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:341:
+}
+/**

-:2541: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2541: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:2541: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#2541: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:2541: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2541: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:2574: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#2574: FILE: include/drm/drm_gpusvm.h:485:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:2574: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2574: FILE: include/drm/drm_gpusvm.h:485:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:2590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#2590: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#2590: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2590: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2722: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#2722: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

-:2723: WARNING:LONG_LINE: line length of 147 exceeds 100 columns
#2723: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)

total: 0 errors, 3 warnings, 10 checks, 2821 lines checked


