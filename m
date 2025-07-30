Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A06C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7510E0F8;
	Wed, 30 Jul 2025 20:52:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896B10E0F8;
 Wed, 30 Jul 2025 20:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_TLB_invalidation_abst?=
 =?utf-8?q?raction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "stuartsummers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 20:52:08 -0000
Message-ID: <175390872862.200375.335133745969472784@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730204514.76459-1-stuart.summers@intel.com>
In-Reply-To: <20250730204514.76459-1-stuart.summers@intel.com>
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

Series: Add TLB invalidation abstraction (rev2)
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
commit cc0a7a766e1eb3465bc58b86c32eff842ec5f1ba
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 30 20:45:14 2025 +0000

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
+ /mt/dim checkpatch bca98310921a3284d7c2f0bc96828f06b3eb7f3a drm-intel
b9ac9cf0691e drm/xe: Move explicit CT lock in TLB invalidation sequence
e2faeae2cc84 drm/xe: s/tlb_invalidation/tlb_inval
-:128: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#128: 
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

total: 0 errors, 1 warnings, 0 checks, 1100 lines checked
74101fea3190 drm/xe: Add xe_tlb_inval structure
6d3521b48a85 drm/xe: Add xe_gt_tlb_invalidation_done_handler
b4544329fda2 drm/xe: Decouple TLB invalidations from GT
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1236 lines checked
05ad732e1892 drm/xe: Prep TLB invalidation fence before sending
45f016fe0434 drm/xe: Add helpers to send TLB invalidations
cc0a7a766e1e drm/xe: Split TLB invalidation code in frontend and backend
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

-:649: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__tlb_inval' - possible side-effects?
#649: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:215:
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

-:649: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__fence' - possible side-effects?
#649: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:215:
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


