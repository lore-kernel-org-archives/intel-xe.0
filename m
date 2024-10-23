Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC593D2E023
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 08:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B75B10E788;
	Wed, 23 Oct 2024 08:12:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD34C10E788;
 Wed, 23 Oct 2024 08:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_kernel/cgroups=3A_Add_=22?=
 =?utf-8?q?dev=22_memory_accounting_cgroup=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 08:12:14 -0000
Message-ID: <172967113477.1323037.14799858857895995692@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

Series: kernel/cgroups: Add "dev" memory accounting cgroup.
URL   : https://patchwork.freedesktop.org/series/140361/
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
commit d3c3bb202d972256d5f6bf2fb6c127a11b4d14f0
Author: Maxime Ripard <mripard@kernel.org>
Date:   Wed Oct 23 09:53:00 2024 +0200

    drm/gem: Add cgroup memory accounting
    
    In order to support any device using the GEM support, let's register a
    dev cgroup device in the drm_dev_register path, and account for
    allocated buffers in the buffer allocation path.
    
    Marked discussion by Maarten Lankhorst:
    This is only implemented for drm_gem_dma_helper.c, and breaks the other
    drivers. It's still here for discussion, as we need to figure out how to
    make something like this work for both TTM and GEM drivers.
    
    Signed-off-by: Maxime Ripard <mripard@kernel.org>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 0cd3ccdcf9525b9d2f822df5f8d16b552753cf88 drm-intel
c2f417069c9c kernel/cgroup: Add "dev" memory accounting cgroup
-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

-:111: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#111: FILE: Documentation/core-api/cgroup.rst:1:
+==================

-:138: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#138: FILE: Documentation/gpu/drm-compute.rst:1:
+==================================

-:258: WARNING:REPEATED_WORD: Possible repeated word: 'int'
#258: FILE: include/linux/cgroup_dev.h:61:
+static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,

-:372: WARNING:TYPO_SPELLING: 'succesful' may be misspelled - perhaps 'successful'?
#372: FILE: kernel/cgroup/dev.c:22:
+	 * Keeps the device reference alive after a succesful RCU lookup.
 	                                            ^^^^^^^^^

-:551: WARNING:LINE_SPACING: Missing a blank line after declarations
#551: FILE: kernel/cgroup/dev.c:201:
+	struct devcg_state *devcs = kzalloc(sizeof(*devcs), GFP_KERNEL);
+	if (!devcs)

-:563: WARNING:USE_LOCKDEP: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#563: FILE: kernel/cgroup/dev.c:213:
+	list_for_each_entry_rcu(pool, &devcs->pools, css_node, spin_is_locked(&devcg_lock))

-:611: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#611: FILE: kernel/cgroup/dev.c:261:
+		for (pool = test_pool; pool && limit_pool != pool; pool = pool_parent(pool))
+			{}

-:621: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#621: FILE: kernel/cgroup/dev.c:271:
+		for (limit_pool = test_pool; pool_parent(limit_pool); limit_pool = pool_parent(limit_pool))

-:621: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#621: FILE: kernel/cgroup/dev.c:271:
+		for (limit_pool = test_pool; pool_parent(limit_pool); limit_pool = pool_parent(limit_pool))
+			{}

-:657: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#657: FILE: kernel/cgroup/dev.c:307:
+		pool = kzalloc(offsetof(struct dev_cgroup_pool_state, resources[dev->base.num_regions]), GFP_NOWAIT);

-:714: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#714: FILE: kernel/cgroup/dev.c:364:
+	retpool = pool = find_cg_pool_locked(devcs, dev);

-:813: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#813: FILE: kernel/cgroup/dev.c:463:
+	cgdev->priv = dev = kzalloc(sizeof (*dev), GFP_KERNEL);

-:813: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#813: FILE: kernel/cgroup/dev.c:463:
+	cgdev->priv = dev = kzalloc(sizeof (*dev), GFP_KERNEL);

-:841: WARNING:USE_LOCKDEP: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#841: FILE: kernel/cgroup/dev.c:491:
+	list_for_each_entry_rcu(dev, &devcg_devices, dev_node, spin_is_locked(&devcg_lock))

-:888: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#888: FILE: kernel/cgroup/dev.c:538:
+			allocpool = kzalloc(offsetof(struct dev_cgroup_pool_state, resources[dev->base.num_regions]), GFP_KERNEL);

-:984: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#984: FILE: kernel/cgroup/dev.c:634:
+			*ret_limit_pool = container_of(fail, struct dev_cgroup_pool_state, resources[index].cnt);

-:1066: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1066: FILE: kernel/cgroup/dev.c:716:
+
+

-:1135: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1135: FILE: kernel/cgroup/dev.c:785:
+
+

total: 2 errors, 13 warnings, 4 checks, 1160 lines checked
73a717e17624 drm/drv: Add drmm cgroup registration for dev cgroups.
bcc345cd4b87 drm/ttm: Handle cgroup based eviction in TTM
-:228: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#228: FILE: drivers/gpu/drm/ttm/ttm_bo.c:591:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 0 warnings, 1 checks, 343 lines checked
28dc4bcae4e7 drm/xe: Implement cgroup for vram
a3b33ad8006a drm/amdgpu: Add cgroups implementation
ab5ea38d5277 drm/xe: Hack to test with mapped pages instead of vram.
-:33: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#33: FILE: drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:115:
+
+}

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
d3c3bb202d97 drm/gem: Add cgroup memory accounting


