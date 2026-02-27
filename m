Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17186FD4618
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 06:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2EB10E13A;
	Fri, 27 Feb 2026 06:52:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59D110E13A;
 Fri, 27 Feb 2026 06:52:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gma500=3A_fix_kernel-?=
 =?utf-8?q?doc_warning_for_framebuffer_init/create_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yujie Liu" <yujie.liu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 06:52:00 -0000
Message-ID: <177217512066.294210.126847475128386860@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260227061807.1755150-1-yujie.liu@intel.com>
In-Reply-To: <20260227061807.1755150-1-yujie.liu@intel.com>
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

Series: drm/gma500: fix kernel-doc warning for framebuffer init/create functions
URL   : https://patchwork.freedesktop.org/series/162268/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dd42fd964ccc8b5be81723d736124a95dc17a677
Author: Yujie Liu <yujie.liu@intel.com>
Date:   Fri Feb 27 14:18:06 2026 +0800

    drm/gma500: fix kernel-doc warning for framebuffer init/create functions
    
    Warning: drivers/gpu/drm/gma500/framebuffer.c:34 function parameter 'info' not described in 'psb_framebuffer_init'
    Warning: drivers/gpu/drm/gma500/framebuffer.c:101 function parameter 'info' not described in 'psb_user_framebuffer_create'
    
    Fixes: 4a792c59203b ("drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()")
    Signed-off-by: Yujie Liu <yujie.liu@intel.com>
+ /mt/dim checkpatch 038d33d4e44e0ca905790b64f418a9195dd5d105 drm-intel
dd42fd964ccc drm/gma500: fix kernel-doc warning for framebuffer init/create functions
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Warning: drivers/gpu/drm/gma500/framebuffer.c:34 function parameter 'info' not described in 'psb_framebuffer_init'

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


