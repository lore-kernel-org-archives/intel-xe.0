Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E63C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7710E9F4;
	Fri,  3 Nov 2023 14:39:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0410E9FA;
 Fri,  3 Nov 2023 14:39:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 89E3CA7DFB;
 Fri,  3 Nov 2023 14:39:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 03 Nov 2023 14:39:30 -0000
Message-ID: <169902237056.29106.11530197273706992996@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103143456.7-1-francois.dugast@intel.com>
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_take_2?=
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

Series: uAPI Alignment - take 2
URL   : https://patchwork.freedesktop.org/series/125955/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f8ae8a8b6d5aa79787be3c14ac987d12f1f7657a
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Nov 3 14:34:56 2023 +0000

    drm/xe/uapi: Add examples of user space code
    
    Complete the documentation of some structs by adding functional
    examples of user space code. Those examples are intentionally kept
    very simple. Put together, they provide a foundation for a minimal
    application that executes a job using the Xe driver.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 58dfdb8dc78e5668f9891c798ec3191863c1e0d2 drm-intel
b71b984e7 fixup! drm/xe: Correlate engine and cpu timestamps with better accuracy
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
    -:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
4eca559df drm/xe/uapi: Add documentation for query
f378f7b96 drm/xe: Extend drm_xe_vm_bind_op
a7beddc1c drm/xe: Add uAPI to query micro-controler firmware version
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
04fed299a drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
a74517063 drm/xe: Extend uAPI to query HuC micro-controler firmware version
e70f626ef drm/xe: Remove useless query config num_params
624448442 drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
1cd63ff52 drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
59b57dfeb fixup! drm/xe: Add uAPI to query micro-controler firmware version
b86e5314b drm/xe/uapi: Make constant comments visible in kernel doc
22b414069 fixup! drm/xe: Correlate engine and cpu timestamps with better accuracy
56d9994cd drm/xe/uapi: Remove GT_TYPE_REMOTE
fc52bae5f drm/xe/uapi: Kill VM_MADVISE IOCTL
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
deleted file mode 100644

-:445: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#445: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)

-:446: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#446: FILE: include/uapi/drm/xe_drm.h:119:
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)

-:447: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#447: FILE: include/uapi/drm/xe_drm.h:120:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

-:449: WARNING:LONG_LINE: line length of 135 exceeds 100 columns
#449: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)

-:450: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#450: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 6 warnings, 0 checks, 165 lines checked
bf686e6ff drm/xe/uapi: Separate bo_create placement from flags
7eac25575 drm/xe/uapi: Remove unused inaccessible memory region
17f0b60d9 drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
b5100554c drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
4e622686c drm/xe/uapi: Rename *_mem_regions masks
03bc8b0ce drm/xe/uapi: Rename query's mem_usage to mem_regions
-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/xe/xe_query.c:246:
+static int query_mem_regions(struct xe_device *xe,
 			      struct drm_xe_device_query *query)

total: 0 errors, 0 warnings, 1 checks, 83 lines checked
8da345c3e drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
We have at least 2 future features(OA and future media engines capabilities)

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
960fb8f4c drm/xe/uapi: Replace BO with GEM in documentation
8cde06fe3 drm/xe/pmu: Drop interrupt pmu event
558f04824 xe/xe_bo: Reject bo creation of unaligned size
0087d80c6 fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
487fa31c4 drm/xe/uapi: Fix indentation issues that sometimes causes build warning
4ed2965f7 drm/xe/uapi: Order sections
-:79: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#79: FILE: include/uapi/drm/xe_drm.h:50:
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)

-:80: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#80: FILE: include/uapi/drm/xe_drm.h:51:
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)

-:81: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#81: FILE: include/uapi/drm/xe_drm.h:52:
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)

-:82: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#82: FILE: include/uapi/drm/xe_drm.h:53:
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)

-:83: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#83: FILE: include/uapi/drm/xe_drm.h:54:
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)

-:84: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#84: FILE: include/uapi/drm/xe_drm.h:55:
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)

-:85: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#85: FILE: include/uapi/drm/xe_drm.h:56:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

-:86: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#86: FILE: include/uapi/drm/xe_drm.h:57:
+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)

-:87: WARNING:LONG_LINE: line length of 135 exceeds 100 columns
#87: FILE: include/uapi/drm/xe_drm.h:58:
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)

-:88: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#88: FILE: include/uapi/drm/xe_drm.h:59:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

-:89: WARNING:LONG_LINE: line length of 146 exceeds 100 columns
#89: FILE: include/uapi/drm/xe_drm.h:60:
+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)

-:90: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#90: FILE: include/uapi/drm/xe_drm.h:61:
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)

total: 0 errors, 12 warnings, 0 checks, 480 lines checked
09e8ed1a5 drm/xe/uapi: More uAPI documentation additions and cosmetic updates
f0fae092c drm/xe/uapi: Split xe_sync types from flags
-:108: WARNING:TYPO_SPELLING: 'An user' may be misspelled - perhaps 'A user'?
#108: FILE: include/uapi/drm/xe_drm.h:935:
+ *  - %DRM_XE_SYNC_TYPE_USER_FENCE - An user fence
                                      ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
88a27a444 drm/xe/uapi: Standardize the FLAG naming and assignment
20987be92 drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
c80231c5b drm/xe/uapi: Move xe_exec after xe_exec_queue
-:50: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#50: FILE: include/uapi/drm/xe_drm.h:83:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
3df838d56 fixup! drm/xe/uapi: Split xe_sync types from flags
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
178a3f189 drm/xe/uapi: Move memory_region masks from GT to engine
6a0270930 drm/xe/uapi: Document the memory_region bitmask
7c1d7e92e drm/xe/uapi: Be more specific about the vm_bind prefetch region
c9cec85b9 drm/xe/uapi: Convert tile_mask to a pt_placement_hint
dcdb17ac2 drm/xe/uapi: Rename couple exec_queue items
114ce04ba drm/xe/uapi: Refactor engine information
a86a87399 drm/xe/uapi: Add link to Xe documentation
dbf2478c6 drm/xe/uapi: Crystal Reference Clock updates
f09d891bb drm/xe/uapi: Add Tile ID information to the GT info query
72b3547e1 squash! drm/xe/uapi: Rename couple exec_queue items
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
Let's make it obvious and straight forward. Not only because it is important

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
cb371e714 fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
e0af430ad drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL
7f40430db drm/xe/uapi: Align on a common way to return arrays (memory regions)
-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/xe/xe_query.c:269:
+static int query_mem_region(struct xe_device *xe,
 			      struct drm_xe_device_query *query)

-:92: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#92: FILE: drivers/gpu/drm/xe/xe_query.c:318:
+						     &usage->mem_regions[usage->num_mem_regions].used,

-:93: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#93: FILE: drivers/gpu/drm/xe/xe_query.c:319:
+						     &usage->mem_regions[usage->num_mem_regions].cpu_visible_used);

total: 0 errors, 2 warnings, 1 checks, 170 lines checked
a7c8e387c drm/xe/uapi: Align on a common way to return arrays (gt)
b75f3da14 drm/xe/uapi: Align on a common way to return arrays (engines)
-:215: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#215: FILE: include/uapi/drm/xe_drm.h:654:
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":

-:216: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#216: FILE: include/uapi/drm/xe_drm.h:655:
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":

total: 0 errors, 2 warnings, 0 checks, 184 lines checked
cfa4f1f0f drm/xe/uapi: Add block diagram of a device
-:35: WARNING:LONG_LINE_COMMENT: line length of 209 exceeds 100 columns
#35: FILE: include/uapi/drm/xe_drm.h:39:
+ *   ┌──────────────────────────────────────────────────────────────────┐

-:36: WARNING:LONG_LINE_COMMENT: line length of 203 exceeds 100 columns
#36: FILE: include/uapi/drm/xe_drm.h:40:
+ *   │ ┌──────────────────────────────────────────────────┐ ┌─────────┐ │

-:37: WARNING:LONG_LINE_COMMENT: line length of 149 exceeds 100 columns
#37: FILE: include/uapi/drm/xe_drm.h:41:
+ *   │ │              ┌───────────────────────┐           │ │ ┌─────┐ │ │

-:39: WARNING:LONG_LINE_COMMENT: line length of 149 exceeds 100 columns
#39: FILE: include/uapi/drm/xe_drm.h:43:
+ *   │ │              └───────────┬───────────┘           │ │ └──┬──┘ │ │

-:40: WARNING:LONG_LINE_COMMENT: line length of 195 exceeds 100 columns
#40: FILE: include/uapi/drm/xe_drm.h:44:
+ *   │ │ ┌────────────────────────┴─────────────────────┐ │ │ ┌──┴──┐ │ │

-:41: WARNING:LONG_LINE_COMMENT: line length of 177 exceeds 100 columns
#41: FILE: include/uapi/drm/xe_drm.h:45:
+ *   │ │ │ ┌─────────────────────┐  ┌─────────────────┐ │ │ │ │     │ │ │

-:42: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#42: FILE: include/uapi/drm/xe_drm.h:46:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:43: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#43: FILE: include/uapi/drm/xe_drm.h:47:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │RCS0 │ │BCS0 │ │ │ │ │ │     │ │ │

-:44: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#44: FILE: include/uapi/drm/xe_drm.h:48:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:45: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#45: FILE: include/uapi/drm/xe_drm.h:49:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:46: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#46: FILE: include/uapi/drm/xe_drm.h:50:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VCS0 │ │VCS1 │ │ │ │ │ │     │ │ │

-:47: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#47: FILE: include/uapi/drm/xe_drm.h:51:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:48: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#48: FILE: include/uapi/drm/xe_drm.h:52:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:49: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#49: FILE: include/uapi/drm/xe_drm.h:53:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VECS0│ │VECS1│ │ │ │ │ │ ... │ │ │

-:50: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#50: FILE: include/uapi/drm/xe_drm.h:54:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:51: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#51: FILE: include/uapi/drm/xe_drm.h:55:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:52: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#52: FILE: include/uapi/drm/xe_drm.h:56:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │CCS0 │ │CCS1 │ │ │ │ │ │     │ │ │

-:53: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#53: FILE: include/uapi/drm/xe_drm.h:57:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:54: WARNING:LONG_LINE_COMMENT: line length of 165 exceeds 100 columns
#54: FILE: include/uapi/drm/xe_drm.h:58:
+ *   │ │ │ └─────────DSS─────────┘  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:55: WARNING:LONG_LINE_COMMENT: line length of 105 exceeds 100 columns
#55: FILE: include/uapi/drm/xe_drm.h:59:
+ *   │ │ │                          │ │CCS2 │ │CCS3 │ │ │ │ │ │     │ │ │

-:56: WARNING:LONG_LINE_COMMENT: line length of 167 exceeds 100 columns
#56: FILE: include/uapi/drm/xe_drm.h:60:
+ *   │ │ │ ┌─────┐ ┌─────┐ ┌─────┐  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:57: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#57: FILE: include/uapi/drm/xe_drm.h:61:
+ *   │ │ │ │ ... │ │ ... │ │ ... │  │                 │ │ │ │ │     │ │ │

-:58: WARNING:LONG_LINE_COMMENT: line length of 141 exceeds 100 columns
#58: FILE: include/uapi/drm/xe_drm.h:62:
+ *   │ │ │ └─DSS─┘ └─DSS─┘ └─DSS─┘  └─────Engines─────┘ │ │ │ │     │ │ │

-:59: WARNING:LONG_LINE_COMMENT: line length of 183 exceeds 100 columns
#59: FILE: include/uapi/drm/xe_drm.h:63:
+ *   │ │ └───────────────────────────GT0────────────────┘ │ │ └─GT1─┘ │ │

-:60: WARNING:LONG_LINE_COMMENT: line length of 181 exceeds 100 columns
#60: FILE: include/uapi/drm/xe_drm.h:64:
+ *   │ └────────────────────────────Tile0─────────────────┘ └─ Tile1──┘ │

-:61: WARNING:LONG_LINE_COMMENT: line length of 195 exceeds 100 columns
#61: FILE: include/uapi/drm/xe_drm.h:65:
+ *   └─────────────────────────────Device0───────┬──────────────────────┘

-:64: WARNING:LONG_LINE_COMMENT: line length of 136 exceeds 100 columns
#64: FILE: include/uapi/drm/xe_drm.h:68:
+ *                        ───────────────────────┴────────── PCI bus

total: 0 errors, 27 warnings, 0 checks, 47 lines checked
f8ae8a8b6 drm/xe/uapi: Add examples of user space code


