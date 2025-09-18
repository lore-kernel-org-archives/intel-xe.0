Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C917CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 21:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DDF10E901;
	Thu, 18 Sep 2025 21:04:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F3210E901;
 Thu, 18 Sep 2025 21:04:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_some_rebar_?=
 =?utf-8?q?issues_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 21:04:49 -0000
Message-ID: <175822948999.345795.13430426526533064070@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
In-Reply-To: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
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

Series: drm/xe: Fix some rebar issues (rev2)
URL   : https://patchwork.freedesktop.org/series/154679/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80d4959cd4061dc0667a560959b437fe0fb231fb
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Sep 18 13:58:57 2025 -0700

    drm/xe: Move rebar to be done earlier
    
    There may be cases in which the BAR0 also needs to move to accommodate
    the bigger BAR2. However if it's not released, the BAR2 resize fails.
    During the vram probe it can't be released as it's already in use by
    xe_mmio for early register access.
    
    Add a new function in xe_vram and let xe_pci call it directly before
    even early device probe. This allows the BAR2 to resize in cases BAR0
    also needs to move:
    
            [] xe 0000:03:00.0: vgaarb: deactivate vga console
            [] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB
            [] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
            [] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
            [] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
            [] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
            [] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
            [] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
            [] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
            [] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
            [] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
            [] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
            [] pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x44007fffff 64bit pref]
            [] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
            [] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
            [] pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
            [] pcieport 0000:02:01.0: PCI bridge to [bus 03]
            [] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
            [] pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
            [] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
            [] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000 dgfx:1 gfx:Xe2_HPG (20.02) ...
    
    As shown above, it happens even before we try to read any register for
    platform identification.
    
    All the rebar logic is more pci-specific than xe-specific and can be
    done very early in the probe sequence. In future it would be good to
    move it out of xe_vram.c, but this refactor is left for later.
    
    Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Cc: <stable@vger.kernel.org> # 6.12+
    Link: https://lore.kernel.org/intel-xe/fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch d96edc0e90a16032294fb5c32aa8139fbc052a1e drm-intel
76df318630dc PCI: Release BAR0 of an integrated bridge to allow GPU BAR resize
-:37: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#37: 
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/

-:74: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 26 lines checked
80d4959cd406 drm/xe: Move rebar to be done earlier
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB

-:147: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 78 lines checked


