Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFD4CF6D2C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 13:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75ED10E735;
	Wed,  2 Oct 2024 13:51:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBE510E176;
 Wed,  2 Oct 2024 13:51:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Introduce_DRM_clie?=
 =?utf-8?q?nt_library_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 13:51:58 -0000
Message-ID: <172787711818.1163616.3572624436140160685@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002131306.288618-1-tzimmermann@suse.de>
In-Reply-To: <20241002131306.288618-1-tzimmermann@suse.de>
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

Series: drm: Introduce DRM client library (rev2)
URL   : https://patchwork.freedesktop.org/series/139220/
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
commit 1942a025a0c37642555d80aaaa5527a9e010a964
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Oct 2 15:04:37 2024 +0200

    drm/client: Add client-lib module
    
    Add drm_client_lib.ko to contain DRM's built-in client. Move the
    existing client for fbdev emulation into the new module. Protect the
    new module behind CONFIG_DRM_CLIENT_LIB.
    
    The Kconfig rules separate the DRM drivers from the DRM clients. A
    driver can opt into the default clients, but the user configures
    each client individually. To do so, DRM drivers still select
    DRM_CLIENT_SELECTION. The option is now a tristate that further
    selects all dependencies of the enabled DRM clients. There's
    a menu option for each client. Enabling at least one client also
    selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
    New DRM clients should depend on DRM_CLIENT_SELECTION.
    
    There are existing kernel options in drm_fb_helper.o, so leave this
    file in the KMS-helper module for now.
    
    v3:
    - keep client code in core
    - protect lib with DRM_CLIENT_LIB
    - remove duplicate line from Makefile (Jocelyn)
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 55a90a928d9752b8a21298cb525b95de4b78f4ed drm-intel
6d6e04920a11 drm/i915: Select DRM_CLIENT_SELECTION
-:10: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Jani Nikula <jani.nikula@linux.intel.com>i', should be: 'Jani Nikula <jani.nikula@linux.intel.com> (i)'
#10: 
Cc: Jani Nikula <jani.nikula@linux.intel.com>i

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
dd4665fff342 drm/xe: Select DRM_CLIENT_SELECTION
49722d27eef7 drm/fbdev: Select fbdev I/O helpers from modules that require them
0a1e448cf072 drm/fbdev: Store fbdev module parameters in separate file
c74f8f50b057 drm/client: Move client event handlers to drm_client_event.c
-:191: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#191: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 319 lines checked
494411783f35 drm/client: Move suspend/resume into DRM client callbacks
7fd86bea9176 drm/amdgpu: Suspend and resume internal clients with client helpers
0d34dc82cd00 drm/nouveau: Suspend and resume clients with client helpers
1efa259277c8 drm/radeon: Suspend and resume clients with client helpers
56820c53dbe4 drm/client: Make client support optional
1942a025a0c3 drm/client: Add client-lib module


