Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A0ECD54A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 08:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC0D10E0F1;
	Tue, 19 Sep 2023 08:39:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E13610E17B;
 Tue, 19 Sep 2023 08:39:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6830CAADD8;
 Tue, 19 Sep 2023 08:39:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Tue, 19 Sep 2023 08:39:26 -0000
Message-ID: <169511276642.3668.13821810665147123458@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919083627.10955-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230919083627.10955-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/display=3A_Implement_display_support_=28rev6=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: fixup! drm/xe/display: Implement display support (rev6)
URL   : https://patchwork.freedesktop.org/series/117592/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e0996890a7f1b475f71e6ce298ad743b13fa5aba
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 19 10:36:27 2023 +0200

    fixup! drm/xe/display: Implement display support
    
    When selecting CONFIG_XE_DISPLAY, the following missing symbols can be
    seen unless something else has selected the corresponding configs.
    
    ERROR: modpost: "cfb_copyarea" [drivers/gpu/drm/xe/xe.ko] undefined!
    ERROR: modpost: "cfb_fillrect" [drivers/gpu/drm/xe/xe.ko] undefined!
    ERROR: modpost: "cfb_imageblit" [drivers/gpu/drm/xe/xe.ko] undefined
    
    Make sure these are included in the Xe Display build.
    
    v2:
    - Use "select FB_IOMEM_HELPERS" (Maarten Lankhorst)
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 3d7e02fb9c40263a989c4c19d2dc5a07659965ed drm-intel
e0996890a fixup! drm/xe/display: Implement display support


