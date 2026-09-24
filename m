Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56340C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 09:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE410F3E6;
	Thu, 24 Sep 2026 09:38:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279210E12E;
 Thu, 24 Sep 2026 09:38:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/fbdev=3A_Move_helpers?=
 =?utf-8?q?_to_clients/_subdirectory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 09:38:09 -0000
Message-ID: <179024268933.202183.11137464500229258377@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924093036.82356-1-tzimmermann@suse.de>
In-Reply-To: <20260924093036.82356-1-tzimmermann@suse.de>
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

Series: drm/fbdev: Move helpers to clients/ subdirectory (rev2)
URL   : https://patchwork.freedesktop.org/series/174787/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdd5dd330d22cccdebb578859f2d9e97d02e1eae
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu Sep 24 11:29:14 2026 +0200

    drm/fbdev: Move fbdev helpers into client library
    
    DRM's fbdev helpers are for the fbdev-emulation clients. Move them
    into the client-library module. Fix include statements throughout
    DRM drivers.
    
    While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
    The old name was too reminiscent of DRM's framebuffer code.
    
    The GEM support code for fbdev remains part of DRM's memory managers.
    
    v2:
    - update armada und docs
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a61293e633b18c618fd2f7d508cf558db0f42227 drm-intel
ad04b33c44bf drm/fbdev: Move fbdev module parameters next to module init
cdd5dd330d22 drm/fbdev: Move fbdev helpers into client library
-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
rename from drivers/gpu/drm/drm_fb_helper.c

total: 0 errors, 1 warnings, 0 checks, 261 lines checked


