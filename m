Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CB5CEBF60
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 01:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A9610EBF0;
	Fri, 27 Sep 2024 01:13:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5A10EBF2;
 Fri, 27 Sep 2024 01:13:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_memory_leak?=
 =?utf-8?q?s_on_vm=5Fbind=5Fioctl_failure_paths?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 01:13:19 -0000
Message-ID: <172739959919.1109466.7823446863630897233@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
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

Series: drm/xe: fix memory leaks on vm_bind_ioctl failure paths
URL   : https://patchwork.freedesktop.org/series/139181/
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
commit 26c53f47f13cd3cc6d238296f6548b8c472321f2
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Thu Sep 26 17:36:33 2024 -0700

    drm/xe: fix memory leaks on vm_bind_ioctl failure paths
    
    Caught by kmemleak when running Vulkan CTS tests on LNL. The leak
    seems to happen only when there's some kind of failure happening, like
    the lack of memory. Example output:
    
    unreferenced object 0xffff9120bdf62000 (size 8192):
      comm "deqp-vk", pid 115008, jiffies 4310295728
      hex dump (first 32 bytes):
        00 00 00 00 00 00 00 00 1b 05 f9 28 01 00 00 40  ...........(...@
        00 00 00 00 00 00 00 00 1b 15 f9 28 01 00 00 40  ...........(...@
      backtrace (crc 7a56be79):
        [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
        [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
        [<ffffffffc08e8309>] xe_pt_insert_entry+0xb9/0x140 [xe]
        [<ffffffffc08eab6d>] xe_pt_stage_bind_entry+0x12d/0x5b0 [xe]
        [<ffffffffc08ecbca>] xe_pt_walk_range+0xea/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08e9eff>] xe_pt_stage_bind.constprop.0+0x25f/0x580 [xe]
        [<ffffffffc08eb21a>] bind_op_prepare+0xea/0x6e0 [xe]
        [<ffffffffc08ebab8>] xe_pt_update_ops_prepare+0x1c8/0x440 [xe]
        [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
        [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
        [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
        [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
    unreferenced object 0xffff9120bdf72000 (size 8192):
      comm "deqp-vk", pid 115008, jiffies 4310295728
      hex dump (first 32 bytes):
        6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
        6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
      backtrace (crc 23b2f0b5):
        [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
        [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
        [<ffffffffc08e8453>] xe_pt_stage_unbind_post_descend+0xb3/0x150 [xe]
        [<ffffffffc08ecd26>] xe_pt_walk_range+0x246/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
        [<ffffffffc08ece31>] xe_pt_walk_shared+0xc1/0x110 [xe]
        [<ffffffffc08e7b2a>] xe_pt_stage_unbind+0x9a/0xd0 [xe]
        [<ffffffffc08e913d>] unbind_op_prepare+0xdd/0x270 [xe]
        [<ffffffffc08eb9f6>] xe_pt_update_ops_prepare+0x106/0x440 [xe]
        [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
        [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
        [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
        [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
        [<ffffffffc05e95a0>] drm_ioctl+0x280/0x4e0 [drm]
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2877
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch 6bd25f52157328ac4b7b09a3946281957afe3bfd drm-intel
26c53f47f13c drm/xe: fix memory leaks on vm_bind_ioctl failure paths
-:93: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#93: FILE: drivers/gpu/drm/xe/xe_pt.c:940:
+		if (entries[i].pt_entries)
+			kfree(entries[i].pt_entries);

-:116: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#116: FILE: drivers/gpu/drm/xe/xe_pt.c:1581:
+		if (entry->pt_entries)
+			kfree(entry->pt_entries);

total: 0 errors, 2 warnings, 0 checks, 56 lines checked


