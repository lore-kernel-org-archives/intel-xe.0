Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D027C47DDF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 06:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDF810F803;
	Thu, 25 Jan 2024 06:47:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CAD10F803;
 Thu, 25 Jan 2024 06:47:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Fix_mem?=
 =?utf-8?q?leak_in_display_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "wangxiaoming321" <xiaoming.wang@intel.com>
Date: Thu, 25 Jan 2024 06:47:10 -0000
Message-ID: <170616523054.710554.9022218765702491736@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <y>
In-Reply-To: <y>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/display: Fix memleak in display initialization
URL   : https://patchwork.freedesktop.org/series/129150/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a86c8ec82f0017134e00d8d1c31e0ba4bb2b646e
Author: wangxiaoming321 <xiaoming.wang@intel.com>
Date:   Thu Jan 25 14:36:33 2024 +0800

    drm/xe/display: Fix memleak in display initialization
    
    In the call stack xe_device_probe ->  xe_display_init_nommio -> intel_power_domains_init
    Power_domains  hasn't been cleaned up if return error,
    which has do the clean in i915_driver_late_release call from i915_driver_probe.
    
    unreferenced object 0xffff88811150ee00 (size 512):
      comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
      hex dump (first 32 bytes):
        10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
        ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
      backtrace:
        [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
        [<ffffffff812c98b2>] __kmalloc+0x52/0x150
        [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
        [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
        [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
        [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
        [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
        [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
        [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
        [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
        [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
        [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
        [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
        [<ffffffff8192e159>] bus_add_driver+0x119/0x220
        [<ffffffff81930d00>] driver_register+0x60/0x120
        [<ffffffffa05e50a0>] 0xffffffffa05e50a0
    
    Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
+ /mt/dim checkpatch e7da820591c355e591fe880ff1e02b85a3f1a413 drm-intel
a86c8ec82 drm/xe/display: Fix memleak in display initialization
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
In the call stack xe_device_probe ->  xe_display_init_nommio -> intel_power_domains_init

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


