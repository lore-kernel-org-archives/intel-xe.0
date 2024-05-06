Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A14C25B10
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 20:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C4010ED0E;
	Mon,  6 May 2024 20:54:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314C10ED0E;
 Mon,  6 May 2024 20:54:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Nuke_xe=27s_cop?=
 =?utf-8?q?y_of_intel=5Ffbdev=5Ffb=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 20:54:40 -0000
Message-ID: <171502888027.1942097.12202326589692029414@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506183331.7720-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240506183331.7720-1-ville.syrjala@linux.intel.com>
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

Series: drm/xe: Nuke xe's copy of intel_fbdev_fb.h
URL   : https://patchwork.freedesktop.org/series/133247/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e7224a08febb4c7b19a7032b7d78848221ac91bb
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon May 6 21:33:31 2024 +0300

    drm/xe: Nuke xe's copy of intel_fbdev_fb.h
    
    For some reason xe and i915 each have an identical (fortunately)
    copy of intel_fbdev_fb.h. The xe copy actually only gets included
    by xe's intel_fbdev_fb.c, and the i915 copy by everyone else,
    include intel_fbdev.c which is the actual caller of the
    functions declared in the header.
    
    This means the xe and i915 headers are free to define/declare
    completely incompatible things and the build would still succeed
    as long as the symbol names match.
    
    That is not a good thing, so let's nuke xe's copy of the header
    so that everyone will use the same header, and be forced to
    agree on the same API/ABI.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 83e0d2a2621c7550c198b8936f4680b24f24a698 drm-intel
e7224a08febb drm/xe: Nuke xe's copy of intel_fbdev_fb.h
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 0 lines checked


