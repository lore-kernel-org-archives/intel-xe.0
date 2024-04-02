Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5069C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 15:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580F10E275;
	Tue,  2 Apr 2024 15:03:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964F110E275;
 Tue,  2 Apr 2024 15:03:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_ensure_drm_headers?=
 =?utf-8?q?_are_self-contained_and_pass_kernel-doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 15:03:32 -0000
Message-ID: <171207021261.1154935.10600182453435318832@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402140136.1722533-1-jani.nikula@intel.com>
In-Reply-To: <20240402140136.1722533-1-jani.nikula@intel.com>
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

Series: drm: ensure drm headers are self-contained and pass kernel-doc
URL   : https://patchwork.freedesktop.org/series/131943/
State : warning

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
commit c3164ef7ea8a75e6ab7a9d1b9c25452dba386663
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 2 17:01:36 2024 +0300

    drm: ensure drm headers are self-contained and pass kernel-doc
    
    Ensure drm headers build, are self-contained, have header guards, and
    have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=y.
    
    The mechanism follows similar patters used in i915, xe, and usr/include.
    
    To cover include/drm, we need to recurse there using the top level
    Kbuild and the new include/Kbuild files.
    
    v2: make DRM_HEADER_TEST depend on DRM
    
    Suggested-by: Daniel Vetter <daniel@ffwll.ch>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Masahiro Yamada <masahiroy@kernel.org>
    Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5100fcc57dc5d45b246a0aeb068f4f8062d29b09 drm-intel
c3164ef7ea8a drm: ensure drm headers are self-contained and pass kernel-doc
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


