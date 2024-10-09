Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80903CEDDA4
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 14:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9DE10E762;
	Wed,  9 Oct 2024 14:53:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0310E762;
 Wed,  9 Oct 2024 14:53:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Make_struct_xe?=
 =?utf-8?q?=5Fggtt_private=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 14:53:20 -0000
Message-ID: <172848560051.1210599.8020798466508155802@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Make struct xe_ggtt private.
URL   : https://patchwork.freedesktop.org/series/139778/
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
commit 541919c0d28763f8c43eefa717069dccff409532
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Oct 9 14:51:14 2024 +0200

    drm/xe: Move struct xe_ggtt to xe_ggtt.c
    
    No users left outside of xe_ggtt.c, so we can make the struct private.
    
    This prevents us from accidentally touching it before init.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f drm-intel
a988a7b2d3d2 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
be8a657a3ba4 drm/xe: Add xe_ggtt_might_lock
8b557cf43d60 drm/xe: Add xe_ggtt_alloc
-:31: WARNING:LINE_SPACING: Missing a blank line after declarations
#31: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
88bcb3b9d196 drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:69: WARNING:LINE_SPACING: Missing a blank line after declarations
#69: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:208:
+		const struct intel_rotation_info *rot_info = &args->view->rotated;
+		for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)

-:71: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#71: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:210:
+			write_ggtt_rotated(ggtt, &ggtt_ofs, pte_encode_bo, write_pte,
+					bo, rot_info->plane[i].offset,

-:204: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#204: FILE: drivers/gpu/drm/xe/xe_ggtt.c:506:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:224: WARNING:LONG_LINE: line length of 136 exceeds 100 columns
#224: FILE: drivers/gpu/drm/xe/xe_ggtt.c:550:
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt, u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg)

-:236: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#236: FILE: drivers/gpu/drm/xe/xe_ggtt.c:562:
+			transform(ggtt, node, ggtt->pt_ops->pte_encode_bo, ggtt->pt_ops->ggtt_set_pte, arg);

-:283: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#283: FILE: drivers/gpu/drm/xe/xe_ggtt.h:25:
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt, u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg);

total: 0 errors, 4 warnings, 2 checks, 273 lines checked
11404c6a238e drm/xe/display: Dont poke into GGTT internals to fill a DPT
541919c0d287 drm/xe: Move struct xe_ggtt to xe_ggtt.c


