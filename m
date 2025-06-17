Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7629FC71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E30D10E3F8;
	Tue, 17 Jun 2025 14:06:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3110E15A;
 Tue, 17 Jun 2025 14:06:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 14:06:17 -0000
Message-ID: <175016917729.87049.7142573587422869522@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617134532.3768283-1-alexander.usyskin@intel.com>
In-Reply-To: <20250617134532.3768283-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev6)
URL   : https://patchwork.freedesktop.org/series/147661/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af4cfe21fc7dce70a0ef7063182547feb14b8403
Author: Reuven Abliyev <reuven.abliyev@intel.com>
Date:   Tue Jun 17 16:45:32 2025 +0300

    drm/xe/nvm: add support for non-posted erase
    
    Erase command is slow on discrete graphics storage
    and may overshot PCI completion timeout.
    BMG introduces the ability to have non-posted erase.
    Add driver support for non-posted erase with polling
    for erase completion.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Reuven Abliyev <reuven.abliyev@intel.com>
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 drm-intel
f501030f343f mtd: add driver for intel graphics non-volatile memory device
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
9e98da39e0e1 mtd: intel-dg: implement region enumeration
a53cbddb6c1e mtd: intel-dg: implement access functions
7128920c3ae8 mtd: intel-dg: register with mtd
306969a15f97 mtd: intel-dg: align 64bit read and write
d96344031a76 drm/i915/nvm: add nvm device for discrete graphics
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 169 lines checked
d7e85619086a drm/i915/nvm: add support for access mode
762b18656207 drm/xe/nvm: add on-die non-volatile memory device
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 218 lines checked
bb394b2c52b9 drm/xe/nvm: add support for access mode
af4cfe21fc7d drm/xe/nvm: add support for non-posted erase
-:126: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#126: FILE: drivers/mtd/devices/mtd_intel_dg.c:398:
+				msleep(10);

total: 0 errors, 1 warnings, 0 checks, 151 lines checked


