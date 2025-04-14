Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C1C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B9A10E53D;
	Mon, 14 Apr 2025 10:24:55 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1910E53D;
 Mon, 14 Apr 2025 10:24:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 10:24:54 -0000
Message-ID: <174462629423.647.17327484661181353987@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414093803.2133463-1-alexander.usyskin@intel.com>
In-Reply-To: <20250414093803.2133463-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics
URL   : https://patchwork.freedesktop.org/series/147661/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 61112f8736c8930a513b9fb764ee943de34876bc
Author: Abliyev, Reuven <reuven.abliyev@intel.com>
Date:   Mon Apr 14 12:38:03 2025 +0300

    drm/xe/nvm: add support for non-posted erase
    
    Erase command is slow on discrete graphics storage
    and may overshot PCI completion timeout.
    BMG introduces the ability to have non-posted erase.
    Add driver support for non-posted erase with polling
    for erase completion.
    
    Signed-off-by: Abliyev, Reuven <reuven.abliyev@intel.com>
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch 8d0b26a073a34e4eeef766fb53b62e7ec19f9456 drm-intel
4810fb10baee mtd: core: always create master device
105e83f5a855 mtd: add driver for intel graphics non-volatile memory device
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
6c795c501f69 mtd: intel-dg: implement region enumeration
d3301496e859 mtd: intel-dg: implement access functions
ba1d3bcd96c3 mtd: intel-dg: register with mtd
53b3108f409d mtd: intel-dg: align 64bit read and write
89571575cb28 mtd: intel-dg: wake card on operations
eb8e9ef73d97 drm/i915/nvm: add nvm device for discrete graphics
-:96: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#96: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
c0b086af9b7d drm/i915/nvm: add support for access mode
0ae79e33387c drm/xe/nvm: add on-die non-volatile memory device
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 212 lines checked
a4f87830dfb2 drm/xe/nvm: add support for access mode
61112f8736c8 drm/xe/nvm: add support for non-posted erase
-:121: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#121: FILE: drivers/mtd/devices/mtd_intel_dg.c:392:
+			while (!(reg & NVM_NON_POSTED_ERASE_DONE) &&
+				++iter < NVM_NON_POSTED_ERASE_DONE_ITER) {

-:122: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#122: FILE: drivers/mtd/devices/mtd_intel_dg.c:393:
+				msleep(10);

total: 0 errors, 1 warnings, 1 checks, 150 lines checked


