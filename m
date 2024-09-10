Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB6EDE99D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BA010E4FD;
	Tue, 10 Sep 2024 15:21:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A210E61F;
 Tue, 10 Sep 2024 15:21:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/bios=3A_Refactor?=
 =?utf-8?q?_ROM_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 15:21:43 -0000
Message-ID: <172598170332.981519.14305097040415764543@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/bios: Refactor ROM access
URL   : https://patchwork.freedesktop.org/series/138478/
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
commit 7f9c0dd2c4fb474ff8d9f7790fd02ca98cfebfc2
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Sep 10 16:42:19 2024 +0300

    drm/i915/bios: Extract soc/intel_rom.c
    
    Abstract away the nuts and bolts of the SPI vs. PCI ROM
    stuff, and hide it all in soc/intel_rom.c so that the
    VBT code doesn't have to care about this stuff.
    
    This leaves intel_bios.c with a single codepath that
    can focus on the details related to the VBT layout.
    
    This should have no functional changes.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f25ffe1514b26574258bb767f5c6f53facdfaaca drm-intel
846b4a679873 drm/i915/bios: Add some size checks to SPI VBT read
4a752ef61a02 drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
98ee26563cf2 drm/i915/bios: Extract intel_spi_read16()
1297e413e90d drm/i915/bios: Extract vbt_signature[]
7f9c0dd2c4fb drm/i915/bios: Extract soc/intel_rom.c
-:244: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#244: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 411 lines checked


