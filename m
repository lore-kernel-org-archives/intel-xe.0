Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4983EC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 22:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF4E10E31E;
	Wed,  6 Aug 2025 22:32:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191310E270;
 Wed,  6 Aug 2025 22:32:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_TLB_invalidation_abst?=
 =?utf-8?q?raction_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "stuartsummers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 22:32:14 -0000
Message-ID: <175451953450.217857.8243478980971525330@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806222404.30333-1-stuart.summers@intel.com>
In-Reply-To: <20250806222404.30333-1-stuart.summers@intel.com>
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

Series: Add TLB invalidation abstraction (rev3)
URL   : https://patchwork.freedesktop.org/series/152022/
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
commit d8f4127e7ea9ffc9d09fe9a6159c733b962d65a9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Aug 6 22:24:04 2025 +0000

    drm/xe: Split TLB invalidation code in frontend and backend
    
    The frontend exposes an API to the driver to send invalidations, handles
    sequence number assignment, synchronization (fences), and provides a
    timeout mechanism. The backend issues the actual invalidation to the
    hardware (or firmware).
    
    The new layering easily allows issuing TLB invalidations to different
    hardware or firmware interfaces.
    
    Normalize some naming while here too.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 drm-intel
b594faa31785 drm/xe: Move explicit CT lock in TLB invalidation sequence
b0d8bbcb3fbe drm/xe: s/tlb_invalidation/tlb_inval
-:128: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#128: 
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

total: 0 errors, 1 warnings, 0 checks, 1100 lines checked
8d68f7e65f23 drm/xe: Add xe_tlb_inval structure
a0173596ae1c drm/xe: Add xe_gt_tlb_invalidation_done_handler
7a5f49718612 drm/xe: Decouple TLB invalidations from GT
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1234 lines checked
dc84cbe735b1 drm/xe: Prep TLB invalidation fence before sending
6c20fc5c2c79 drm/xe: Add helpers to send TLB invalidations
d8f4127e7ea9 drm/xe: Split TLB invalidation code in frontend and backend
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

-:650: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__tlb_inval' - possible side-effects?
#650: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:215:
+#define xe_tlb_inval_issue(__tlb_inval, __fence, op, args...)	\
+({								\
+	int __ret;						\
+								\
+	xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);	\
+	xe_assert((__tlb_inval)->xe, (__fence));		\
+								\
+	xe_tlb_inval_fence_prep((__fence));			\
+	__ret = op((__tlb_inval), (__fence)->seqno, ##args);	\
+	if (__ret < 0)						\
+		xe_tlb_inval_fence_signal_unlocked((__fence));	\
+								\
+	__ret == -ECANCELED ? 0 : __ret;			\
+})

-:650: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__fence' - possible side-effects?
#650: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:215:
+#define xe_tlb_inval_issue(__tlb_inval, __fence, op, args...)	\
+({								\
+	int __ret;						\
+								\
+	xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);	\
+	xe_assert((__tlb_inval)->xe, (__fence));		\
+								\
+	xe_tlb_inval_fence_prep((__fence));			\
+	__ret = op((__tlb_inval), (__fence)->seqno, ##args);	\
+	if (__ret < 0)						\
+		xe_tlb_inval_fence_signal_unlocked((__fence));	\
+								\
+	__ret == -ECANCELED ? 0 : __ret;			\
+})

total: 0 errors, 1 warnings, 2 checks, 1084 lines checked


