Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2070EE77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 16:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBDB10EEDE;
	Thu,  9 Jan 2025 16:11:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3C710EED8;
 Thu,  9 Jan 2025 16:11:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_const_qualify?=
 =?utf-8?q?_ctl=5Ftables_where_applicable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Granados" <joel.granados@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 16:11:44 -0000
Message-ID: <173643910431.1675666.10821350029808089715@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
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

Series: treewide: const qualify ctl_tables where applicable
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
commit 8c9fd692cfd7df82d0454d25ab66dc2185697be7
Author: Joel Granados <joel.granados@kernel.org>
Date:   Thu Jan 9 14:16:39 2025 +0100

    treewide: const qualify ctl_tables where applicable
    
    Add the const qualifier to all the ctl_tables in the tree except the
    ones in ./net dir. The "net" sysctl code is special as it modifies the
    arrays before passing it on to the registration function.
    
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
        identifier table_name;
        @@
    
        + const
        struct ctl_table table_name [] = { ... };
    
    sed:
        sed --in-place \
          -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
          kernel/utsname_sysctl.c
    
    Signed-off-by: Joel Granados <joel.granados@kernel.org>
    Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: "Darrick J. Wong" <djwong@kernel.org> # xfs
+ /mt/dim checkpatch 424f495e9572bf87a42e3be0aa02ac4777541033 drm-intel
8c9fd692cfd7 treewide: const qualify ctl_tables where applicable
-:32: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#32: 
      -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \

-:444: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#444: FILE: drivers/misc/sgi-xp/xpc_main.c:114:
 };
+static const struct ctl_table xpc_sys_xpc[] = {

-:1224: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1224: FILE: kernel/stackleak.c:47:
 }
+static const struct ctl_table stackleak_sysctls[] = {

total: 0 errors, 1 warnings, 2 checks, 960 lines checked


