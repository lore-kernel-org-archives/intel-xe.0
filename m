Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A2D11196
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 20:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90310E61E;
	Wed, 26 Nov 2025 20:25:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDE910E61E;
 Wed, 26 Nov 2025 20:25:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_DRM_scheduler_layerin?=
 =?utf-8?q?g_violations_in_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 20:25:12 -0000
Message-ID: <176418871251.30433.7427852558206975694@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126201916.618996-1-matthew.brost@intel.com>
In-Reply-To: <20251126201916.618996-1-matthew.brost@intel.com>
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

Series: Fix DRM scheduler layering violations in Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/155314/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1585a14a4f0a6a9ed398e33c210af67d9736df77
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Nov 26 12:19:16 2025 -0800

    drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
    
    We now have proper infrastructure to accurately check the LRC timestamp
    without toggling the scheduling state for non-VFs. For VFs, it is still
    possible to get an inaccurate view if the context is on hardware. We
    guard against free-running contexts on VFs by banning jobs whose
    timestamps are not moving. In addition, VFs have a timeslice quantum
    that naturally triggers context switches when more than one VF is
    running, thus updating the LRC timestamp.
    
    For multi-queue, it is desirable to avoid scheduling toggling in the TDR
    because this scheduling state is shared among many queues. Furthermore,
    this change simplifies the GuC state machine. The trade-off for VF cases
    seems worthwhile.
    
    v5:
     - Add xe_lrc_timestamp helper (Umesh)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e41f42483c6f784fce3deb5eca0931bcbffb01df drm-intel
53c4e1d9dae5 drm/sched: Add several job helpers to avoid drivers touching scheduler state
b4dced1d5a9b drm/sched: Add pending job list iterator
-:73: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#73: FILE: include/drm/gpu_scheduler.h:778:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__job' - possible side-effects?
#73: FILE: include/drm/gpu_scheduler.h:778:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sched' - possible side-effects?
#73: FILE: include/drm/gpu_scheduler.h:778:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__entity' - possible side-effects?
#73: FILE: include/drm/gpu_scheduler.h:778:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

total: 1 errors, 0 warnings, 3 checks, 54 lines checked
7e1105b2e2f7 drm/xe: Add dedicated message lock
f1c4fea65269 drm/xe: Stop abusing DRM scheduler internals
ffa72fa13c6a drm/xe: Only toggle scheduling in TDR if GuC is running
288805e801da drm/xe: Do not deregister queues in TDR
db33301b9292 drm/xe: Remove special casing for LR queues in submission
1585a14a4f0a drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR


