Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47140C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0965510E061;
	Tue, 17 Jun 2025 15:48:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E7C10E061;
 Tue, 17 Jun 2025 15:48:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 15:48:27 -0000
Message-ID: <175017530707.88503.2036652142300310228@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617145159.3803852-1-alexander.usyskin@intel.com>
In-Reply-To: <20250617145159.3803852-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev7)
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
commit 5371f1bf6171149469d0002c42a8a493ba7a6aa7
Author: Reuven Abliyev <reuven.abliyev@intel.com>
Date:   Tue Jun 17 17:51:58 2025 +0300

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
+ /mt/dim checkpatch bd41471dab0093a7057a9a9888337d916145bbb1 drm-intel
4169fe56b46d mtd: add driver for intel graphics non-volatile memory device
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
4d02fbe96e9b mtd: intel-dg: implement region enumeration
fc4b2e6b2b8e mtd: intel-dg: implement access functions
2b5d76634fc1 mtd: intel-dg: register with mtd
7111a18ee86b mtd: intel-dg: align 64bit read and write
851c5a5feaf4 drm/xe/nvm: add on-die non-volatile memory device
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 218 lines checked
5406f164a6ed drm/xe/nvm: add support for access mode
5371f1bf6171 drm/xe/nvm: add support for non-posted erase
-:126: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#126: FILE: drivers/mtd/devices/mtd_intel_dg.c:398:
+				msleep(10);

total: 0 errors, 1 warnings, 0 checks, 151 lines checked


