Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD17CF8542
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 21:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E545510E779;
	Wed,  2 Oct 2024 21:21:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F6510E779;
 Wed,  2 Oct 2024 21:21:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_GuC?=
 =?utf-8?q?_log_dumping_and_add_to_devcoredump_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 21:21:20 -0000
Message-ID: <172790408068.1165422.4588089437957477129@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002211422.2135130-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241002211422.2135130-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev5)
URL   : https://patchwork.freedesktop.org/series/137985/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b457795128f10d0ae6c41373c3e6469258a7869b
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Oct 2 14:14:22 2024 -0700

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
    Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 789d5631453c3edad1988cd47db1643555e52ac9 drm-intel
2b66b94c6f47 drm/xe/guc: Remove spurious line feed in debug print
076f9d38216e drm/xe/devcoredump: Use drm_puts and already cached local variables
d38d194ac57e drm/xe/devcoredump: Improve section headings and add tile info
58e588bab814 drm/xe/devcoredump: Add ASCII85 dump helper function
059aee99c9d8 drm/xe/guc: Copy GuC log prior to dumping
56d1762b790a drm/xe/guc: Use a two stage dump for GuC logs and add more info
1158d15e6718 drm/print: Introduce drm_line_printer
4fdede82017a drm/xe/guc: Dead CT helper
-:102: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#102: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:102: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#102: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 0 checks, 572 lines checked
5bc232d0885d drm/xe/guc: Dump entire CTB on errors
bec4246c9fba drm/xe/guc: Add GuC log to devcoredump captures
b457795128f1 drm/xe/guc: Add a helper function for dumping GuC log to dmesg


