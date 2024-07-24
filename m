Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4959C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 21:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA8D10E1CD;
	Wed, 24 Jul 2024 21:59:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AFB10E1CD;
 Wed, 24 Jul 2024 21:59:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_opregion_le?=
 =?utf-8?q?ak?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 21:59:01 -0000
Message-ID: <172185834145.363797.15394144328073142947@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724215309.644423-1-lucas.demarchi@intel.com>
In-Reply-To: <20240724215309.644423-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix opregion leak
URL   : https://patchwork.freedesktop.org/series/136460/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5629bbfb1e002e919a599824ddc5a240719cceb
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jul 24 14:53:09 2024 -0700

    drm/xe: Fix opregion leak
    
    Being part o the display, ideally the setup and cleanup would be done by
    display itself. However this is a bigger refactor that needs to be done
    on both i915 and xe. For now, just fix the leak:
    
    unreferenced object 0xffff8881a0300008 (size 192):
      comm "modprobe", pid 4354, jiffies 4295647021
      hex dump (first 32 bytes):
        00 00 87 27 81 88 ff ff 18 80 9b 00 00 c9 ff ff  ...'............
        18 81 9b 00 00 c9 ff ff 00 00 00 00 00 00 00 00  ................
      backtrace (crc 99260e31):
        [<ffffffff823ce65b>] kmemleak_alloc+0x4b/0x80
        [<ffffffff81493be2>] kmalloc_trace_noprof+0x312/0x3d0
        [<ffffffffa1345679>] intel_opregion_setup+0x89/0x700 [xe]
        [<ffffffffa125bfaf>] xe_display_init_noirq+0x2f/0x90 [xe]
        [<ffffffffa1199ec3>] xe_device_probe+0x7a3/0xbf0 [xe]
        [<ffffffffa11f3713>] xe_pci_probe+0x333/0x5b0 [xe]
        [<ffffffff81af6be8>] local_pci_probe+0x48/0xb0
        [<ffffffff81af8778>] pci_device_probe+0xc8/0x280
        [<ffffffff81d09048>] really_probe+0xf8/0x390
        [<ffffffff81d0937a>] __driver_probe_device+0x8a/0x170
        [<ffffffff81d09503>] driver_probe_device+0x23/0xb0
        [<ffffffff81d097b7>] __driver_attach+0xc7/0x190
        [<ffffffff81d0628d>] bus_for_each_dev+0x7d/0xd0
        [<ffffffff81d0851e>] driver_attach+0x1e/0x30
        [<ffffffff81d07ac7>] bus_add_driver+0x117/0x250
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4a9ed276779ab36170c7ee6c5237263eb563acc1 drm-intel
a5629bbfb1e0 drm/xe: Fix opregion leak


