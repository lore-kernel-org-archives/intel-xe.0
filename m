Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D28C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 14:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066B10E44D;
	Fri, 25 Jul 2025 14:31:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3F10E0E2;
 Fri, 25 Jul 2025 14:31:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_remapped_fb_view_test_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 14:31:46 -0000
Message-ID: <175345390620.189846.8287620409311043908@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
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

Series: remapped fb view test (rev4)
URL   : https://patchwork.freedesktop.org/series/152114/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d5f7c69614d8fe4a9441187dd1d81163dbbbac3
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Jul 25 15:26:11 2025 +0100

    drm/xe/display: Add support for AuxCCS
    
    debug
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch a8e405f4aa574428fb324baa6082991006e813c4 drm-intel
9d5f7c69614d drm/xe/display: Add support for AuxCCS
-:19: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#19: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:144:
+		printk("write_dpt_remapped plane_alignment=%x\n",

-:24: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#24: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:149:
+				printk("write_dpt_remapped [%u] linear offset=%x size=%x\n",

-:27: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#27: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:152:
+				printk("write_dpt_remapped [%u] tiled  offset=%x %ux%u src_stride=%u dst_stride=%u\n",

-:28: WARNING:LONG_LINE: line length of 194 exceeds 100 columns
#28: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:153:
+				       i, remap_info->plane[i].offset, remap_info->plane[i].width, remap_info->plane[i].height, remap_info->plane[i].src_stride, remap_info->plane[i].dst_stride);

-:37: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#37: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:162:
+			printk("write_dpt_remapped [%u] to dest=%x\n",

total: 0 errors, 5 warnings, 0 checks, 28 lines checked


