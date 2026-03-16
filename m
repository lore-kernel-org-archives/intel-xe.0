Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F53FB5E8B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 23:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE710E3F6;
	Mon, 16 Mar 2026 23:33:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A7410E331;
 Mon, 16 Mar 2026 23:33:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_format_spec?=
 =?utf-8?q?ifier_for_printing_pointer_differences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 23:33:40 -0000
Message-ID: <177370402044.364341.4646527987848896234@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316-drm-xe-fix-32-bit-wformat-ptrdiff-v1-1-0108b10b2b6b@kernel.org>
In-Reply-To: <20260316-drm-xe-fix-32-bit-wformat-ptrdiff-v1-1-0108b10b2b6b@kernel.org>
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

Series: drm/xe: Fix format specifier for printing pointer differences
URL   : https://patchwork.freedesktop.org/series/163323/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b051423143c12e3c80a199105d705e69ba771380
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Mon Mar 16 14:54:22 2026 -0700

    drm/xe: Fix format specifier for printing pointer differences
    
    GCC and clang warn (or error with CONFIG_WERROR=y / W=e) several times
    when targeting 32-bit platforms along the lines of
    
      drivers/gpu/drm/xe/xe_lrc.c: In function 'dump_mi_command':
      drivers/gpu/drm/xe/xe_lrc.c:1921:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
       1921 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
            |                                    ~~~~^
            |                                        |
            |                                        long unsigned int
            |                                    %#5x
       1922 |                            dw - num_noop - start, inst_header, num_noop);
            |                            ~~~~~~~~~~~~~~~~~~~~~
            |                                          |
            |                                          int
    
      drivers/gpu/drm/xe/xe_lrc.c:1922:7: error: format specifies type 'unsigned long' but the argument has type '__ptrdiff_t' (aka 'int') [-Werror,-Wformat]
       1921 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
            |                                    ~~~~~
            |                                    %#5tx
       1922 |                            dw - num_noop - start, inst_header, num_noop);
            |                            ^~~~~~~~~~~~~~~~~~~~~
    
    Use the '%tx' specifier for printing pointer differences, which clears
    up the warnings for 32-bit platforms while introducing no regressions
    for 64-bit platforms.
    
    Fixes: 65fcf19cb36b ("drm/xe: Include running dword offset in default_lrc dumps")
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch a25d8c583e1e52bde77d371081a7c3fcd0a2e820 drm-intel
b051423143c1 drm/xe: Fix format specifier for printing pointer differences
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
   1921 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",

total: 0 errors, 1 warnings, 0 checks, 100 lines checked


