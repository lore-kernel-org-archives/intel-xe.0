Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB5C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 18:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5BF10E3C4;
	Mon, 20 May 2024 18:24:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E716910E3C4;
 Mon, 20 May 2024 18:23:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Cleanup_xe=5Fmm?=
 =?utf-8?q?io=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 May 2024 18:23:58 -0000
Message-ID: <171622943894.2157358.15918680234307155088@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520181814.2392-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240520181814.2392-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Cleanup xe_mmio.h
URL   : https://patchwork.freedesktop.org/series/133824/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f4c50799b67e833a87f5f5ae146165316bd614a4
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 20 20:18:14 2024 +0200

    drm/xe: Cleanup xe_mmio.h
    
    We don't need <linux/delay.h> include since commit 5c09bd6ccd41
    ("drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c").
    
    We don't need <linux/io-64-nonatomic-lo-hi.h> include since commit
    54c659660d63 ("drm/xe: Make xe_mmio_read|write() functions non-
    inline").
    
    And since commit 924e6a9789a0 ("drm/xe/uapi: Remove MMIO ioctl")
    we don't need forward declarations of drm_device and drm_file.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 1ba62f8cea9c797427d45108df1d453f4b343240 drm-intel
1a19347ae638 drm/i915/display: Add missing include to intel_vga.c
81b6dbaecceb drm/xe: Don't rely on indirect includes from xe_mmio.h
f4c50799b67e drm/xe: Cleanup xe_mmio.h
-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 54c659660d63 ("drm/xe: Make xe_mmio_read|write() functions non-inline")'
#9: 
We don't need <linux/io-64-nonatomic-lo-hi.h> include since commit

total: 1 errors, 0 warnings, 0 checks, 39 lines checked


