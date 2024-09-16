Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E12C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 14:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDD10E04B;
	Mon, 16 Sep 2024 14:05:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396510E04B;
 Mon, 16 Sep 2024 14:05:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_spi=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Sep 2024 14:05:46 -0000
Message-ID: <172649554673.1018682.11993655162219290503@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
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

Series: spi: add driver for Intel discrete graphics (rev5)
URL   : https://patchwork.freedesktop.org/series/136430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47931206e3f4fbd0e043d4b1717462c4ac3564ed
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Mon Sep 16 16:49:28 2024 +0300

    drm/xe/spi: add support for access mode
    
    Check SPI access mode from GSC FW status registers
    and overwrite access status read from SPI descriptor, if needed.
    
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch cb4252b3107f36d565422099fdde8d7e34ffbf1d drm-intel
c9b615c2e6d7 spi: add driver for intel graphics on-die spi device
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 206 lines checked
93568d6aa41c spi: intel-dg: implement region enumeration
6b5a9dfb11b5 spi: intel-dg: implement spi access functions
8aa4f61bc6eb spi: intel-dg: spi register with mtd
6cd1ff990988 spi: intel-dg: implement mtd access handlers
6226166a9a27 spi: intel-dg: align 64bit read and write
4fce22c594cd spi: intel-dg: wake card on operations
71288e0b3906 drm/i915/spi: add spi device for discrete graphics
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 140 lines checked
04f2922f510c drm/i915/spi: add intel_spi_region map
767a5c69ba48 drm/i915/spi: add support for access mode
d513b7b88c07 drm/xe/spi: add on-die spi device
-:137: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#137: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 192 lines checked
47931206e3f4 drm/xe/spi: add support for access mode


