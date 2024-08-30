Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF6CA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485710E814;
	Fri, 30 Aug 2024 06:59:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222C10E814;
 Fri, 30 Aug 2024 06:59:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_GuC?=
 =?utf-8?q?_log_dumping_and_add_to_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 06:59:46 -0000
Message-ID: <172500118626.850645.13637202277064301374@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump
URL   : https://patchwork.freedesktop.org/series/137985/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8036f2304d4d7eaf18f4dd85f854a7f45beb4aec
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Aug 29 23:23:10 2024 -0700

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
+ /mt/dim checkpatch d6714e4e0e19fa8eac4d75293eaae7e479b590a3 drm-intel
32923f639216 drm/xe/guc: Remove spurious line feed in debug print
2a5498b80730 drm/xe: Add ASCII85 dump helper function
2e5bd91033f0 drm/xe/guc: Copy GuC log prior to dumping
a259f51fe66c drm/xe/guc: Use a two stage dump for GuC logs and add more info
53c459c23278 drm/print: Introduce drm_line_printer
2a5f4d64d671 drm/xe/guc: Dead CT helper
-:83: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ct' - possible side-effects?
#83: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:55:
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

-:99: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#99: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:99: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#99: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 1 checks, 504 lines checked
622d9916a054 drm/xe/guc: Dump entire CTB on errors
941b3d93a6b8 drm/xe/guc: Add GuC log to devcoredump captures
8036f2304d4d drm/xe/guc: Add a helper function for dumping GuC log to dmesg


