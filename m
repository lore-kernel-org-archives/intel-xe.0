Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F8C98309
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 11:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A173C10E87E;
	Wed, 23 Sep 2026 11:12:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EB510E12B;
 Wed, 23 Sep 2026 11:12:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/fbdev=3A_Move_helpers?=
 =?utf-8?q?_to_clients/_subdirectory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 11:12:45 -0000
Message-ID: <179016196553.196549.10098893276292963698@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923110537.451614-1-tzimmermann@suse.de>
In-Reply-To: <20260923110537.451614-1-tzimmermann@suse.de>
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

Series: drm/fbdev: Move helpers to clients/ subdirectory
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
commit bcf9f1f54d3cafa967dab6b2a51ee65ef4b438d8
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 23 12:59:10 2026 +0200

    drm/fbdev: Move fbdev helpers into client library
    
    DRM's fbdev helpers are for the fbdev-emulation clients. Move them
    into the client-library module. Fix include statements throughout
    DRM drivers.
    
    While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
    The old name was too reminiscent of DRM's framebuffer code.
    
    The GEM support code for fbdev remains part of DRM's memory managers.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 890d1157247d8ad65d9a2d44c065accd550b61f4 drm-intel
612d309895e2 drm/fbdev: Move fbdev module parameters next to module init
bcf9f1f54d3c drm/fbdev: Move fbdev helpers into client library
-:89: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#89: 
rename from drivers/gpu/drm/drm_fb_helper.c

total: 0 errors, 1 warnings, 0 checks, 235 lines checked


