Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F269C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 12:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1C210E60F;
	Tue,  3 Jun 2025 12:01:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3613E10E60F;
 Tue,  3 Jun 2025 12:01:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 12:01:32 -0000
Message-ID: <174895209221.43069.11587089395415390507@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603113953.3599816-1-alexander.usyskin@intel.com>
In-Reply-To: <20250603113953.3599816-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev5)
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
commit 3993b163bcdd44ef8e5e53e2bfc198040d1e1233
Author: Reuven Abliyev <reuven.abliyev@intel.com>
Date:   Tue Jun 3 14:39:53 2025 +0300

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
+ /mt/dim checkpatch bea2a0d35dc29d6ae8a4e44506af9b563f012211 drm-intel
ef76def2a2d2 mtd: add driver for intel graphics non-volatile memory device
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
f9ba87d50f7c mtd: intel-dg: implement region enumeration
d229f8491502 mtd: intel-dg: implement access functions
847cca1c01ca mtd: intel-dg: register with mtd
fac3e2fc4176 mtd: intel-dg: align 64bit read and write
c5e363a87f19 drm/i915/nvm: add nvm device for discrete graphics
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 169 lines checked
472b8177b18c drm/i915/nvm: add support for access mode
9771664d2aaa drm/xe/nvm: add on-die non-volatile memory device
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 218 lines checked
836ab8d4e0ca drm/xe/nvm: add support for access mode
3993b163bcdd drm/xe/nvm: add support for non-posted erase
-:126: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#126: FILE: drivers/mtd/devices/mtd_intel_dg.c:398:
+				msleep(10);

total: 0 errors, 1 warnings, 0 checks, 151 lines checked


