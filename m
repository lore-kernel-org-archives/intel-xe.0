Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B0BCE7A9D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF010E083;
	Thu,  5 Sep 2024 20:57:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C9810E083;
 Thu,  5 Sep 2024 20:57:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_GuC?=
 =?utf-8?q?_log_dumping_and_add_to_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 20:57:33 -0000
Message-ID: <172556985381.952179.7438155221083394755@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/137985/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 394a22c1f649be5bf07d58b630aa3e36c084f3c8
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Sep 5 13:51:05 2024 -0700

    drm/xe/guc: Add a helper function for dumping GuC log to dmesg
    
    Create a helper function that can be used to dump the GuC log to dmesg
    in a manner that is reliable for extraction and decode. The intention
    is that calls to this can be added by developers when debugging
    specific issues that require a GuC log but do not allow easy capture
    of the log - e.g. failures in selftests and failues that lead to
    kernel hangs.
    
    Also note that this is really a temporary stop-gap. The aim is to
    allow on demand creation and dumping of devcoredump captures (which
    includes the GuC log and much more). Currently this is not possible as
    much of the devcoredump code requires a 'struct xe_sched_job' and
    those are not available at many places that might want to do the dump.
    
    v2: Add kerneldoc - review feedback from Michal W.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d drm-intel
c1b6085dae2e drm/xe/guc: Remove spurious line feed in debug print
93c2469fde94 drm/xe/devcoredump: Add a section heading for the submission backend
41e9a65650a5 drm/xe/devcoredump: Add ASCII85 dump helper function
0319f8f8d6b9 drm/xe/guc: Copy GuC log prior to dumping
9923ff30ac15 drm/xe/guc: Use a two stage dump for GuC logs and add more info
8cdf5b5e9e12 drm/print: Introduce drm_line_printer
7332d3d58548 drm/xe/guc: Dead CT helper
-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ct' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:55:
+#define CT_DEAD(ct, ctb, reason_code)								\
+	do {											\
+		struct guc_ctb *_ctb = (ctb);							\
+		if (_ctb)									\
+			_ctb->info.broken = true;						\
+		if (!(ct)->dead.reported) {							\
+			struct xe_guc *guc = ct_to_guc(ct);					\
+			spin_lock_irq(&ct->dead.lock);						\
+			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code;			\
+			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);	\
+			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);	\
+			spin_unlock_irq(&ct->dead.lock);					\
+			queue_work(system_unbound_wq, &(ct)->dead.worker);			\
+		}										\
+	} while (0)

-:103: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#103: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:103: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#103: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 1 checks, 510 lines checked
7358f7258afc drm/xe/guc: Dump entire CTB on errors
-:16: WARNING:TYPO_SPELLING: 'seperately' may be misspelled - perhaps 'separately'?
#16: 
v5: Dump the entire CTB object rather than seperately dumping just the
                                           ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
f67041bdc3d0 drm/xe/guc: Add GuC log to devcoredump captures
394a22c1f649 drm/xe/guc: Add a helper function for dumping GuC log to dmesg


