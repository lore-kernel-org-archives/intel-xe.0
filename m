Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F7AC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 08:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2195112B88;
	Tue,  9 Apr 2024 08:16:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781E5112B8C;
 Tue,  9 Apr 2024 08:16:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_Co?=
 =?utf-8?q?nvert_fbdev_to_DRM_client?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 08:16:13 -0000
Message-ID: <171265057349.1300821.5778588110057661039@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409081029.17843-1-tzimmermann@suse.de>
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
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

Series: drm/{i915,xe}: Convert fbdev to DRM client
URL   : https://patchwork.freedesktop.org/series/132193/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 01c9492f7ed73a8afae53249d54b9c6feae1ed46
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Apr 9 10:04:28 2024 +0200

    drm/{i915, xe}: Implement fbdev emulation as in-kernel client
    
    Replace all code that initializes or releases fbdev emulation
    throughout the driver. Instead initialize the fbdev client by a
    single call to intel_fbdev_setup() after i915 has registered its
    DRM device. Just like similar code in other drivers, i915 fbdev
    emulation now acts like a regular DRM client. Do the same for xe.
    
    The fbdev client setup consists of the initial preparation and the
    hot-plugging of the display. The latter creates the fbdev device
    and sets up the fbdev framebuffer. The setup performs display
    hot-plugging once. If no display can be detected, DRM probe helpers
    re-run the detection on each hotplug event.
    
    A call to drm_client_dev_unregister() releases all in-kernel clients
    automatically. No further action is required within i915. If the fbdev
    framebuffer has been fully set up, struct fb_ops.fb_destroy implements
    the release. For partially initialized emulation, the fbdev client
    reverts the initial setup. Do the same for xe and remove its call to
    intel_fbdev_fini().
    
    v8:
    - setup client in intel_display_driver_register (Jouni)
    - mention xe in commit message
    
    v7:
    - update xe driver
    - reword commit message
    
    v6:
    - use 'i915' for i915 device (Jouni)
    - remove unnecessary code for non-atomic mode setting (Jouni, Ville)
    - fix function name in commit message (Jouni)
    
    v3:
    -  as before, silently ignore devices without displays
    
    v2:
    -  let drm_client_register() handle initial hotplug
    -  fix driver name in error message (Jani)
    -  fix non-fbdev build (kernel test robot)
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 2417474ba0be0f6b5838349e9f44419f530511e4 drm-intel
acf941fcd2ed drm/client: Export drm_client_dev_unregister()
c0c0bb19ef87 drm/i915: Move fbdev functions
83819ef2990c drm/i915: Initialize fbdev DRM client with callback functions
029e9437d1a2 drm/{i915,xe}: Unregister in-kernel clients
1a17e9bb2e4c drm/{i915,xe}: Implement fbdev client callbacks
01c9492f7ed7 drm/{i915, xe}: Implement fbdev emulation as in-kernel client


