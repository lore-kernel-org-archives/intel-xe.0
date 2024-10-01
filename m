Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71908CEB2D2
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 00:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7B610E5B0;
	Tue,  1 Oct 2024 00:49:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831CD10E167;
 Tue,  1 Oct 2024 00:49:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_GuC?=
 =?utf-8?q?_log_dumping_and_add_to_devcoredump_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 00:49:23 -0000
Message-ID: <172774376353.1139837.4050376502275353453@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240920032108.629796-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev4)
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
commit fc7727292de201fa58457403db241a167b1f3cf3
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Sep 19 20:21:08 2024 -0700

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
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
4763fb335f94 drm/xe/guc: Remove spurious line feed in debug print
b23d5e37e925 drm/xe/devcoredump: Use drm_puts and already cached local variables
d3872325ccb2 drm/xe/devcoredump: Improve section headings and add tile info
9b500f4b8c94 drm/xe/devcoredump: Add ASCII85 dump helper function
ad85121396fd drm/xe/guc: Copy GuC log prior to dumping
723207ea73c4 drm/xe/guc: Use a two stage dump for GuC logs and add more info
4373507fd059 drm/print: Introduce drm_line_printer
3a1d80b32d7c drm/xe/guc: Dead CT helper
-:99: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#99: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:99: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#99: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 0 checks, 559 lines checked
ee93fb22a1cf drm/xe/guc: Dump entire CTB on errors
c0b057303d07 drm/xe/guc: Add GuC log to devcoredump captures
fc7727292de2 drm/xe/guc: Add a helper function for dumping GuC log to dmesg


