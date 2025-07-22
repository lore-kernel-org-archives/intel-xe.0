Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FFAC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 19:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEDA10E70A;
	Tue, 22 Jul 2025 19:57:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1929910E70A;
 Tue, 22 Jul 2025 19:57:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_build_witho?=
 =?utf-8?q?ut_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 19:57:41 -0000
Message-ID: <175321426109.181092.11756993616176938763@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722-xe-fix-build-fault-v1-1-157384d50987@intel.com>
In-Reply-To: <20250722-xe-fix-build-fault-v1-1-157384d50987@intel.com>
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

Series: drm/xe: Fix build without debugfs
URL   : https://patchwork.freedesktop.org/series/151962/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f3c3bf07df1ebc446d357e28aedebedf7be5cade
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jul 22 12:52:08 2025 -0700

    drm/xe: Fix build without debugfs
    
    When CONFIG_DEBUG_FS is off, drivers/gpu/drm/xe/xe_gt_debugfs.o
    is not built and build fails on some setups with:
    
            ld: drivers/gpu/drm/xe/xe_gt.o: in function `xe_fault_inject_gt_reset':
            drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1659): undefined reference to `gt_reset_failure'
            ld: drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1c16): undefined reference to `gt_reset_failure'
            collect2: error: ld returned 1 exit status
    
    Do not use the gt_reset_failure attribute if debugfs is not enabled.
    
    Fixes: 8f3013e0b222 ("drm/xe: Introduce fault injection for gt reset")
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Acked-by: Randy Dunlap <rdunlap@infradead.org>
    Tested-by: Randy Dunlap <rdunlap@infradead.org>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a drm-intel
f3c3bf07df1e drm/xe: Fix build without debugfs
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
	ld: drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1c16): undefined reference to `gt_reset_failure'

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


