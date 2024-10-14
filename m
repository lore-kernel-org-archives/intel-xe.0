Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC78CFC50A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 09:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2129910E256;
	Mon, 14 Oct 2024 09:19:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D24210E277;
 Mon, 14 Oct 2024 09:19:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Introduce_DRM_clie?=
 =?utf-8?q?nt_library_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 09:19:22 -0000
Message-ID: <172889756224.1247603.13982700267788058949@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014085740.582287-1-tzimmermann@suse.de>
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
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

Series: drm: Introduce DRM client library (rev4)
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
commit e9d031c836bf52467a764751c12c68862346d832
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Oct 14 10:55:26 2024 +0200

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
    - fix commit changelog
    v2:
    - keep client code in core
    - protect lib with DRM_CLIENT_LIB
    - remove duplicate line from Makefile (Jocelyn)
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 55d09c71b082354090e8a11b4854224ef73e0798 drm-intel
890f8511c6fc drm/i915: Select DRM_CLIENT_SELECTION
266e90d22e14 drm/xe: Select DRM_CLIENT_SELECTION
2b9c04be9cb6 drm/fbdev-dma: Select FB_DEFERRED_IO
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
  219 |                 fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
a3d2a218df0f drm/fbdev: Select fbdev I/O helpers from modules that require them
1c038660079f drm/fbdev: Store fbdev module parameters in separate file
80abdf334d45 drm/client: Move client event handlers to drm_client_event.c
-:192: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#192: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 319 lines checked
af37c5598034 drm/client: Move suspend/resume into DRM client callbacks
62aaa52f09cf drm/amdgpu: Suspend and resume internal clients with client helpers
f4c42502e0d1 drm/nouveau: Suspend and resume clients with client helpers
e68912cc832e drm/radeon: Suspend and resume clients with client helpers
e754e4acba48 drm/client: Make client support optional
e9d031c836bf drm/client: Add client-lib module


