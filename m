Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC90C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 13:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ABF10E8AE;
	Thu, 15 May 2025 13:57:08 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B66110E8AE;
 Thu, 15 May 2025 13:57:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 13:57:07 -0000
Message-ID: <174731742736.85021.886064599252218638@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
In-Reply-To: <20250515133345.2805031-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev3)
URL   : https://patchwork.freedesktop.org/series/147661/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9328f30c471247ed87dc99019b0573d552225646
Author: Reuven Abliyev <reuven.abliyev@intel.com>
Date:   Thu May 15 16:33:45 2025 +0300

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
+ /mt/dim checkpatch 76f8a5c7f0061924fc911a16ea33cb61d6ce88cb drm-intel
62e4b6969808 mtd: add driver for intel graphics non-volatile memory device
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
c0848526332e mtd: intel-dg: implement region enumeration
c8b680b6e9dc mtd: intel-dg: implement access functions
e6f748220cd7 mtd: intel-dg: register with mtd
2eb0d57294e1 mtd: intel-dg: align 64bit read and write
406146043936 drm/i915/nvm: add nvm device for discrete graphics
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
f8a553ca8616 drm/i915/nvm: add support for access mode
13f7b8067a40 drm/xe/nvm: add on-die non-volatile memory device
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 212 lines checked
8d5e736ee4a5 drm/xe/nvm: add support for access mode
9328f30c4712 drm/xe/nvm: add support for non-posted erase
-:124: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#124: FILE: drivers/mtd/devices/mtd_intel_dg.c:398:
+				msleep(10);

total: 0 errors, 1 warnings, 0 checks, 149 lines checked


