Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269F4C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D202510E760;
	Thu, 29 May 2025 18:22:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9672410E75D;
 Thu, 29 May 2025 18:22:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vsec=3A_fix_CONFIG?=
 =?utf-8?q?=5FINTEL=5FVSEC_dependency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 18:22:16 -0000
Message-ID: <174854293661.32355.15592931776372794668@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529172355.2395634-2-lucas.demarchi@intel.com>
In-Reply-To: <20250529172355.2395634-2-lucas.demarchi@intel.com>
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

Series: drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency (rev2)
URL   : https://patchwork.freedesktop.org/series/149427/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e599443893d63ab2d7cd7d3c58e36e2ff1dc4597
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu May 29 10:23:56 2025 -0700

    drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
    
    The XE driver can be built with or without VSEC support, but fails to link as
    built-in if vsec is in a loadable module:
    
    x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
    (.text+0x1e83e16): undefined reference to `intel_vsec_register'
    
    The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
    forcing XE to be a loadable module as well, but that causes a circular
    dependency:
    
            symbol DRM_XE depends on INTEL_VSEC
            symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
            symbol X86_PLATFORM_DEVICES is selected by DRM_XE
    
    The problem here is selecting a symbol from another subsystem, so change
    that as well and rephrase the 'select' into the corresponding dependency.
    Since X86_PLATFORM_DEVICES is 'default y', there is no change to
    defconfig builds here.
    
    Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 901190a062301f01d432d9cf164a6b013df3e745 drm-intel
e599443893d6 drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
The XE driver can be built with or without VSEC support, but fails to link as

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


