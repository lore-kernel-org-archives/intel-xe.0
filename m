Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC674CA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858710E6B5;
	Tue, 26 Aug 2025 18:55:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9C10E6B5;
 Tue, 26 Aug 2025 18:55:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_TLB_invalidation_abst?=
 =?utf-8?q?raction_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 18:55:39 -0000
Message-ID: <175623453970.271012.5126596925516403268@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826182911.392550-1-stuart.summers@intel.com>
In-Reply-To: <20250826182911.392550-1-stuart.summers@intel.com>
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

Series: Add TLB invalidation abstraction (rev10)
URL   : https://patchwork.freedesktop.org/series/152022/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3d03f9c7415eef22222cbd23bd34661d54379252
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 58f83882d315070e5958402612241a4830b73d5b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 26 18:29:11 2025 +0000

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
+ /mt/dim checkpatch 016f7657fa9e25eea21758ab0d02bc13639b667c drm-intel
cd0760afaeb6 drm/xe: Move explicit CT lock in TLB invalidation sequence
9fe5c3dab052 drm/xe: Cancel pending TLB inval workers on teardown
acc6da45411d drm/xe: s/tlb_invalidation/tlb_inval
-:137: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#137: 
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

total: 0 errors, 1 warnings, 0 checks, 1151 lines checked
8211a73ef213 drm/xe: Add xe_tlb_inval structure
9bc3054b13d6 drm/xe: Add xe_gt_tlb_invalidation_done_handler
7446d4c0f116 drm/xe: Decouple TLB invalidations from GT
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1234 lines checked
f643d7dc3dcd drm/xe: Prep TLB invalidation fence before sending
e9d8519baa78 drm/xe: Add helpers to send TLB invalidations
58f83882d315 drm/xe: Split TLB invalidation code in frontend and backend
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:712: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__tlb_inval' - possible side-effects?
#712: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:240:
+#define xe_tlb_inval_issue(__tlb_inval, __fence, op, args...)	\
+({								\
+	int __ret;						\
+								\
+	xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);	\
+	xe_assert((__tlb_inval)->xe, (__fence));		\
+								\
+	mutex_lock(&(__tlb_inval)->seqno_lock); 		\
+	xe_tlb_inval_fence_prep((__fence));			\
+	__ret = op((__tlb_inval), (__fence)->seqno, ##args);	\
+	if (__ret < 0)						\
+		xe_tlb_inval_fence_signal_unlocked((__fence));	\
+	mutex_unlock(&(__tlb_inval)->seqno_lock);		\
+								\
+	__ret == -ECANCELED ? 0 : __ret;			\
+})

-:712: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__fence' - possible side-effects?
#712: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:240:
+#define xe_tlb_inval_issue(__tlb_inval, __fence, op, args...)	\
+({								\
+	int __ret;						\
+								\
+	xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);	\
+	xe_assert((__tlb_inval)->xe, (__fence));		\
+								\
+	mutex_lock(&(__tlb_inval)->seqno_lock); 		\
+	xe_tlb_inval_fence_prep((__fence));			\
+	__ret = op((__tlb_inval), (__fence)->seqno, ##args);	\
+	if (__ret < 0)						\
+		xe_tlb_inval_fence_signal_unlocked((__fence));	\
+	mutex_unlock(&(__tlb_inval)->seqno_lock);		\
+								\
+	__ret == -ECANCELED ? 0 : __ret;			\
+})

-:719: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#719: FILE: drivers/gpu/drm/xe/xe_tlb_inval.c:247:
+^Imutex_lock(&(__tlb_inval)->seqno_lock); ^I^I\$

total: 0 errors, 2 warnings, 2 checks, 1151 lines checked


