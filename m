Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51461E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 14:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864410F0E7;
	Fri, 10 Jan 2025 14:22:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9932A10F0DB;
 Fri, 10 Jan 2025 14:22:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_const_qualify?=
 =?utf-8?q?_ctl=5Ftables_where_applicable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Granados" <joel.granados@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Jan 2025 14:22:32 -0000
Message-ID: <173651895261.1979009.3779880384652773279@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
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

Series: treewide: const qualify ctl_tables where applicable (rev2)
URL   : https://patchwork.freedesktop.org/series/143333/
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
commit 41ee812bcb9a4c0b379344c48794930a372972ba
Author: Joel Granados <joel.granados@kernel.org>
Date:   Fri Jan 10 15:16:08 2025 +0100

    treewide: const qualify ctl_tables where applicable
    
    Add the const qualifier to all the ctl_tables in the tree except for
    watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
    loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
    drivers/inifiniband dirs). These are special cases as they use a
    registration function with a non-const qualified ctl_table argument or
    modify the arrays before passing them on to the registration function.
    
    Constifying ctl_table structs will prevent the modification of
    proc_handler function pointers as the arrays would reside in .rodata.
    This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
    constify the ctl_table argument of proc_handlers") constified all the
    proc_handlers.
    
    Created this by running an spatch followed by a sed command:
    Spatch:
        virtual patch
    
        @
        depends on !(file in "net")
        disable optional_qualifier
        @
        identifier table_name != {watchdog_hardlockup_sysctl,iwcm_ctl_table,ucma_ctl_table,memory_allocation_profiling_sysctls,loadpin_sysctl_table};
        @@
    
        + const
        struct ctl_table table_name [] = { ... };
    
    sed:
        sed --in-place \
          -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
          kernel/utsname_sysctl.c
    
    Reviewed-by: Song Liu <song@kernel.org>
    Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/
    Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI
    Reviewed-by: Darrick J. Wong <djwong@kernel.org> # xfs
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Acked-by: Corey Minyard <cminyard@mvista.com>
    Signed-off-by: Joel Granados <joel.granados@kernel.org>
+ /mt/dim checkpatch 00f4619246294b1de4bac42742cfef95c1f37fde drm-intel
41ee812bcb9a treewide: const qualify ctl_tables where applicable
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
    identifier table_name != {watchdog_hardlockup_sysctl,iwcm_ctl_table,ucma_ctl_table,memory_allocation_profiling_sysctls,loadpin_sysctl_table};

-:424: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#424: FILE: drivers/misc/sgi-xp/xpc_main.c:114:
 };
+static const struct ctl_table xpc_sys_xpc[] = {

-:1204: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1204: FILE: kernel/stackleak.c:47:
 }
+static const struct ctl_table stackleak_sysctls[] = {

total: 0 errors, 1 warnings, 2 checks, 920 lines checked


