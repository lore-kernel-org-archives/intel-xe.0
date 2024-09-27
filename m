Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F171CCDD1CE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18E910E21B;
	Fri, 27 Sep 2024 16:19:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17B710E215;
 Fri, 27 Sep 2024 16:19:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Introduce_DRM_clie?=
 =?utf-8?q?nt_library?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 16:19:48 -0000
Message-ID: <172745398891.1112058.526584519195531152@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927144252.31813-1-tzimmermann@suse.de>
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
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

Series: drm: Introduce DRM client library
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
commit cc61093390dc2d8658ba2dfd3dcbfb4a738262bf
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Fri Sep 27 16:37:30 2024 +0200

    drm: Add client-lib module
    
    Add drm_client_lib.ko to contain most of the client code. Move the
    existing client for fbdev emulation into the new module. Protect the
    new module behind CONFIG_DRM_CLIENT.
    
    The Kconfig rules separate the DRM drivers from the DRM clients. A
    driver can opt into the default clients, but the user configures
    each client individually. To do so, DRM drivers still select
    DRM_CLIENT_SELECTION. The option is now a tristate that further
    selects all dependencies of the enabled DRM clients. There's
    a menu option for each client. Enabling at least one client also
    selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
    New DRM clients should depend on DRM_CLIENT_SELECTION.
    
    The KMS-helper module now exports handful of symbols needed by the
    DRM client library.
    
    There are existing kernel options in drm_fb_helper.o, so leave this
    file in the KMS-helper module for now.
    
    Amdgpu has an internal DRM client, so it has to select DRM_CLIENT by
    itself unconditionally.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 4d4fdd11d1cc941f2f7c1653fc07519851d9052b drm-intel
2807d594b161 drm/i915: Select DRM_CLIENT_SELECTION
e2641dde7c72 drm/xe: Select DRM_CLIENT_SELECTION
be45e9f3e494 drm: Move client-device functions in to drm_client_dev.c
-:179: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#179: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 260 lines checked
1f420f772df7 drm: Select fbdev helpers for modules that require them
cc61093390dc drm: Add client-lib module


