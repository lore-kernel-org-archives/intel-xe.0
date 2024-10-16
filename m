Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAB8D2A52C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6410E754;
	Wed, 16 Oct 2024 15:56:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55CA10E73E;
 Wed, 16 Oct 2024 15:56:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_memory?=
 =?utf-8?q?_leak_in_parse=5Flfp=5Fpanel=5Fdtd=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 15:56:55 -0000
Message-ID: <172909421567.1274753.1422068269977182523@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016150154.1466131-1-shuicheng.lin@intel.com>
In-Reply-To: <20241016150154.1466131-1-shuicheng.lin@intel.com>
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

Series: drm/i915/dp: Fix memory leak in parse_lfp_panel_dtd() (rev2)
URL   : https://patchwork.freedesktop.org/series/139855/
State : success

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
commit 69289d95e057f6a09978bf2b8582da70abc85a66
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Oct 16 15:01:54 2024 +0000

    drm/i915/dp: Fix memory leak in parse_lfp_panel_dtd()
    
    The function parse_lfp_panel_dtd() is called when the driver
    attempts to initialize the eDP connector, and it allocates memory,
    which is recorded in panel->vbt.lfp_vbt_mode. However, since no
    eDP panel is connected, the driver fails at intel_edp_init_dpcd()
    and follows the failure path. Unfortunately, the allocated memory
    is not freed in this case.
    
    To fix this issue, free the memory in the failure path.
    
    leak info from kmemleak:
    "
    unreferenced object 0xffff8881252f8800 (size 128):
      comm "systemd-udevd", pid 192, jiffies 4294896880
      hex dump (first 32 bytes):
        e8 fd 00 00 00 04 18 04 a0 04 40 05 00 00 00 03  ..........@.....
        03 03 09 03 26 03 00 00 0a 00 00 00 00 00 00 00  ....&...........
      backtrace (crc 7448f6b4):
        [<ffffffff82475c9b>] kmemleak_alloc+0x4b/0x80
        [<ffffffff814bb50e>] __kmalloc_cache_noprof+0x2be/0x390
        [<ffffffffa069862c>] intel_bios_init_panel+0x1c4c/0x2720 [xe]
        [<ffffffffa0699123>] intel_bios_init_panel_early+0x13/0x20 [xe]
        [<ffffffffa06fceb9>] intel_dp_init_connector+0x2f9/0x1080 [xe]
        [<ffffffffa06c370a>] intel_ddi_init+0xbba/0xf50 [xe]
        [<ffffffffa069b906>] intel_bios_for_each_encoder+0x36/0x60 [xe]
        [<ffffffffa06d7bd6>] intel_setup_outputs+0x206/0x450 [xe]
        [<ffffffffa06dad33>] intel_display_driver_probe_nogem+0x163/0x1f0 [xe]
        [<ffffffffa0680fc7>] xe_display_init_noaccel+0x27/0x70 [xe]
        [<ffffffffa05b30d6>] xe_device_probe+0x806/0x9a0 [xe]
        [<ffffffffa0612f0f>] xe_pci_probe+0x31f/0x590 [xe]
        [<ffffffff81b41718>] local_pci_probe+0x48/0xb0
        [<ffffffff81b432c8>] pci_device_probe+0xc8/0x280
        [<ffffffff81d5dde8>] really_probe+0xf8/0x390
        [<ffffffff81d5e11a>] __driver_probe_device+0x8a/0x170
    "
    
    v2 (Jani):
      -use intel_bios_fini_panel() to pair with intel_bios_init_panel_early()
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 87312f4bbb70018f831a8ef565db9cdc37b4da67 drm-intel
69289d95e057 drm/i915/dp: Fix memory leak in parse_lfp_panel_dtd()


