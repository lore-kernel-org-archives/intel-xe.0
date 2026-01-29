Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577D4D6100A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 11:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090E310E324;
	Thu, 29 Jan 2026 11:35:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE97910E324;
 Thu, 29 Jan 2026 11:35:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_kernel-?=
 =?utf-8?q?doc_warning_in_GuC_scheduler_ABI_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 11:35:00 -0000
Message-ID: <176968650090.205652.14358977766443458221@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129103730.2289942-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260129103730.2289942-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header
URL   : https://patchwork.freedesktop.org/series/160835/
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
commit 9f316a72cbb9b3339482bd14b5ab93823096993a
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Thu Jan 29 16:07:30 2026 +0530

    drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header
    
    The GuC scheduler ABI header contains a file-level comment that is not
    intended to document a kernel-doc symbol. Using kernel-doc comment
    syntax (/** */) triggers kernel-doc warnings.
    
    With "-Werror", this causes the build to fail. Convert the comment to a
    regular block comment.
    
    HDRTEST drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
    Warning: drivers/gpu/drm/xe/abi/guc_scheduler_abi.h:11 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
     * Generic defines required for registration with and submissions to the GuC
    1 warnings as errors
    make[6]: *** [drivers/gpu/drm/xe/Makefile:377: drivers/gpu/drm/xe/abi/guc_scheduler_abi.hdrtest] Error 3
    make[5]: *** [scripts/Makefile.build:544: drivers/gpu/drm/xe] Error 2
    make[4]: *** [scripts/Makefile.build:544: drivers/gpu/drm] Error 2
    make[3]: *** [scripts/Makefile.build:544: drivers/gpu] Error 2
    make[2]: *** [scripts/Makefile.build:544: drivers] Error 2
    make[1]: *** [/home/kbuild2/kernel/Makefile:2088: .] Error 2
    make: *** [Makefile:248: __sub-make] Error 2
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 drm-intel
9f316a72cbb9 drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
Warning: drivers/gpu/drm/xe/abi/guc_scheduler_abi.h:11 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


