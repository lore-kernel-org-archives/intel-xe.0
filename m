Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2E4CCF9F7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 20:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC0D10EA74;
	Wed, 25 Sep 2024 20:58:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B669810EA25;
 Wed, 25 Sep 2024 20:58:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/bios=3A_Refactor?=
 =?utf-8?q?_ROM_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 20:58:07 -0000
Message-ID: <172729788774.1102989.3845980073482871026@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923152453.11230-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240923152453.11230-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/bios: Refactor ROM access (rev2)
URL   : https://patchwork.freedesktop.org/series/138478/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 21047d00c5b7768187d52f916ee424476c0ec4b8
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Sep 23 18:24:53 2024 +0300

    drm/i915/bios: Extract soc/intel_rom.c
    
    Abstract away the nuts and bolts of the SPI vs. PCI ROM
    stuff, and hide it all in soc/intel_rom.c so that the
    VBT code doesn't have to care about this stuff.
    
    This leaves intel_bios.c with a single codepath that
    can focus on the details related to the VBT layout.
    
    This should have no functional changes.
    
    v2: Rebase due to vbt_signature changes
        Drop unnecessary cast (Jani)
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
2254cf11aa40 drm/i915/bios: Use drm_dbg_kms() consistently
4d315127a30c drm/i915/bios: Add some size checks to SPI VBT read
cede67235c96 drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
d5c1e841295e drm/i915/bios: Extract intel_spi_read16()
69f32bc05f60 drm/i915/bios: Extract vbt_signature[]
21047d00c5b7 drm/i915/bios: Extract soc/intel_rom.c
-:249: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#249: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 412 lines checked


