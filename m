Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8957ACA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 22:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73910ECE5;
	Fri, 12 Sep 2025 22:00:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D3810ECE5;
 Fri, 12 Sep 2025 22:00:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_build_with_?=
 =?utf-8?q?CONFIG=5FMODULES=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 22:00:49 -0000
Message-ID: <175771444978.331678.17632596511843652643@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912-fix-nomodule-build-v1-1-d11b70a92516@intel.com>
In-Reply-To: <20250912-fix-nomodule-build-v1-1-d11b70a92516@intel.com>
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

Series: drm/xe: Fix build with CONFIG_MODULES=n
URL   : https://patchwork.freedesktop.org/series/154478/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7e093563aaedd8cf9f5030bf19bb6b96510d9ff3
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Sep 12 14:54:51 2025 -0700

    drm/xe: Fix build with CONFIG_MODULES=n
    
    When building with CONFIG_MODULES=n, the __exit functions are dropped.
    However our init functions may call them for error handling, so they are
    not good candidates for the exit sections.
    
    Fix this error reported by 0day:
    
            ld.lld: error: relocation refers to a symbol in a discarded section: xe_configfs_exit
            >>> defined in vmlinux.a(drivers/gpu/drm/xe/xe_configfs.o)
            >>> referenced by xe_module.c
            >>>               drivers/gpu/drm/xe/xe_module.o:(init_funcs) in archive vmlinux.a
    
    This is the only exit function using __exit. Drop it to fix the build.
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202506092221.1FmUQmI8-lkp@intel.com/
    Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 398e936298bfb35e4764b26bc0b298b240be93ca drm-intel
7e093563aaed drm/xe: Fix build with CONFIG_MODULES=n
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
	ld.lld: error: relocation refers to a symbol in a discarded section: xe_configfs_exit

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


