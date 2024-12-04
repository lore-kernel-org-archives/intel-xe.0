Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E2DE7716E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 14:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24D110ED40;
	Wed,  4 Dec 2024 14:06:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D110ED3F;
 Wed,  4 Dec 2024 14:06:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_kernel/cgroups=3A_Add_=22?=
 =?utf-8?q?dmem=22_memory_accounting_cgroup=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 14:06:50 -0000
Message-ID: <173332121080.2501704.15207251070163268806@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204134410.1161769-1-dev@lankhorst.se>
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
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

Series: kernel/cgroups: Add "dmem" memory accounting cgroup.
URL   : https://patchwork.freedesktop.org/series/142111/
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
commit f33553698b4dd8f10b4b0e36a4731bf42e1cd727
Author: Maxime Ripard <mripard@kernel.org>
Date:   Wed Dec 4 14:44:07 2024 +0100

    drm/gem: Add cgroup memory accounting for VRAM helper.
    
    This allows any driver using the VRAM helper to set limits on VRAM using
    cgroup.
    
    Signed-off-by: Maxime Ripard <mripard@kernel.org>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch c8df5caf278df4f9ca0aba627047c5ee4318fc0d drm-intel
5f0160b3585e kernel/cgroup: Add "dmem" memory accounting cgroup
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
- Use dmem_cgroup_try_charge to check if you can allocate a chunk of memory,

-:116: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#116: 
new file mode 100644

-:121: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#121: FILE: Documentation/core-api/cgroup.rst:1:
+==================

-:148: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#148: FILE: Documentation/gpu/drm-compute.rst:1:
+==================================

-:225: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#225: FILE: include/linux/cgroup_dmem.h:18:
+struct dmem_cgroup_region *dmem_cgroup_register_region(u64 size, const char *name_fmt, ...) __printf(2,3);

-:225: ERROR:SPACING: space required after that ',' (ctx:VxV)
#225: FILE: include/linux/cgroup_dmem.h:18:
+struct dmem_cgroup_region *dmem_cgroup_register_region(u64 size, const char *name_fmt, ...) __printf(2,3);
                                                                                                       ^

-:238: ERROR:SPACING: space required after that ',' (ctx:VxV)
#238: FILE: include/linux/cgroup_dmem.h:31:
+dmem_cgroup_register_region(u64 size, const char *name_fmt, ...) __printf(2,3);
                                                                            ^

-:368: WARNING:TYPO_SPELLING: 'succesful' may be misspelled - perhaps 'successful'?
#368: FILE: kernel/cgroup/dmem.c:22:
+	 * Keeps the region reference alive after a succesful RCU lookup.
 	                                            ^^^^^^^^^

-:537: WARNING:LINE_SPACING: Missing a blank line after declarations
#537: FILE: kernel/cgroup/dmem.c:191:
+	struct dmemcg_state *dmemcs = kzalloc(sizeof(*dmemcs), GFP_KERNEL);
+	if (!dmemcs)

-:549: WARNING:USE_LOCKDEP: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#549: FILE: kernel/cgroup/dmem.c:203:
+	list_for_each_entry_rcu(pool, &dmemcs->pools, css_node, spin_is_locked(&dmemcg_lock))

-:577: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#577: FILE: kernel/cgroup/dmem.c:231:
+	parent_pool = pool = limit_pool;

-:621: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#621: FILE: kernel/cgroup/dmem.c:275:
+		page_counter_calculate_protection(

-:659: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#659: FILE: kernel/cgroup/dmem.c:313:
+		for (pool = test_pool; pool && limit_pool != pool; pool = pool_parent(pool))
+			{}

-:669: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#669: FILE: kernel/cgroup/dmem.c:323:
+		for (limit_pool = test_pool; pool_parent(limit_pool); limit_pool = pool_parent(limit_pool))

-:669: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#669: FILE: kernel/cgroup/dmem.c:323:
+		for (limit_pool = test_pool; pool_parent(limit_pool); limit_pool = pool_parent(limit_pool))
+			{}

-:758: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#758: FILE: kernel/cgroup/dmem.c:412:
+	retpool = pool = find_cg_pool_locked(dmemcs, region);

-:880: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#880: FILE: kernel/cgroup/dmem.c:534:
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node, spin_is_locked(&dmemcg_lock))

-:880: WARNING:USE_LOCKDEP: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#880: FILE: kernel/cgroup/dmem.c:534:
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node, spin_is_locked(&dmemcg_lock))

-:979: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#979: FILE: kernel/cgroup/dmem.c:633:
+int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
+			  struct dmem_cgroup_pool_state **ret_pool,

-:1053: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1053: FILE: kernel/cgroup/dmem.c:707:
+static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
+				 char *buf, size_t nbytes, loff_t off,

-:1104: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1104: FILE: kernel/cgroup/dmem.c:758:
+
+

-:1109: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1109: FILE: kernel/cgroup/dmem.c:763:
+static int dmemcg_limit_show(struct seq_file *sf, void *v,
+			    u64 (*fn)(struct dmem_cgroup_pool_state *))

-:1143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1143: FILE: kernel/cgroup/dmem.c:797:
+static ssize_t dmem_cgroup_region_min_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)

-:1154: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1154: FILE: kernel/cgroup/dmem.c:808:
+static ssize_t dmem_cgroup_region_low_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)

-:1165: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1165: FILE: kernel/cgroup/dmem.c:819:
+static ssize_t dmem_cgroup_region_max_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)

total: 4 errors, 11 warnings, 10 checks, 1126 lines checked
493168326e7e drm/drv: Add drmm managed registration helper for dmem cgroups.
-:43: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#43: FILE: drivers/gpu/drm/drm_drv.c:838:
+struct dmem_cgroup_region *drmm_cgroup_register_region(struct drm_device *dev, const char *region_name, u64 size)

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
f9fa211e6a94 drm/ttm: Handle cgroup based eviction in TTM
-:224: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#224: FILE: drivers/gpu/drm/ttm/ttm_bo.c:588:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 0 warnings, 1 checks, 333 lines checked
5c5a29d9a35b drm/xe: Implement cgroup for vram
-:32: WARNING:LINE_SPACING: Missing a blank line after declarations
#32: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:317:
+		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
+		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
b8fe12b3fb5b drm/amdgpu: Add cgroups implementation
50ff0bed93f7 drm/xe: Hack to test with mapped pages instead of vram.
f33553698b4d drm/gem: Add cgroup memory accounting for VRAM helper.


