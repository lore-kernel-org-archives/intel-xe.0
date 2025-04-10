Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8E4C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 06:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AF910E76E;
	Thu, 10 Apr 2025 06:38:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0498610E35F;
 Thu, 10 Apr 2025 06:38:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_migration_f?=
 =?utf-8?q?or_display_GGTT_updates=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 06:38:28 -0000
Message-ID: <174426710801.54720.17865048662979215404@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407130449.1010470-1-dev@lankhorst.se>
In-Reply-To: <20250407130449.1010470-1-dev@lankhorst.se>
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

Series: drm/xe: Use migration for display GGTT updates. (rev2)
URL   : https://patchwork.freedesktop.org/series/147326/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a62ee63829e9d559993708f5e63db15c4e38b9c6
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Apr 7 15:04:49 2025 +0200

    drm/xe: Move struct xe_ggtt to xe_ggtt.c
    
    No users left outside of xe_ggtt.c, so we can make the struct private.
    
    This prevents us from accidentally touching it before init.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c54633598106dbdb97f3aa589587b8176009b6d8 drm-intel
33e974afce7f drm/xe: Use xe_ggtt_map_bo_unlocked for resume
22e5687157b5 drm/xe: Add xe_ggtt_might_lock
cd7409c7baef drm/xe: Add xe_ggtt_alloc
-:32: WARNING:LINE_SPACING: Missing a blank line after declarations
#32: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
e8fa4cb4f020 drm/xe/display: Remove dereferences of ggtt for tile id
892a76054596 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

-:160: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#160: FILE: drivers/gpu/drm/xe/xe_ggtt.c:662:
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+

total: 0 errors, 1 warnings, 1 checks, 187 lines checked
43576a7faa74 drm/xe/display: Dont poke into GGTT internals to fill a DPT
-:54: WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
c512fb030e6b drm/xe/display: Convert GGTT mapping to use pte_encode_flags
1b71320f29dd drm/xe: Remove pte_encode_bo callback
6c025026fa2a drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
a4376f6d5569 drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests
b143feda4bff drm/xe: Add GGTT updates to migration engine
-:59: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#59: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:392:
+	fence = xe_migrate_update_gtt(m, update_gtt, NULL, node->base.start, node->base.size / XE_PAGE_SIZE);

-:72: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#72: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:405:
+
+	}

-:146: WARNING:LINE_SPACING: Missing a blank line after declarations
#146: FILE: drivers/gpu/drm/xe/xe_migrate.c:1750:
+		u32 avail_ptes = min(num_pte, 33 * 511);
+		num_pte -= avail_ptes;

-:162: WARNING:LINE_SPACING: Missing a blank line after declarations
#162: FILE: drivers/gpu/drm/xe/xe_migrate.c:1766:
+			u32 batched_ptes = min(avail_ptes, 511);
+			bb->cs[bb->len++] = MI_UPDATE_GTT | (2 * batched_ptes);

-:165: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#165: FILE: drivers/gpu/drm/xe/xe_migrate.c:1769:
+			set_ptes_cb(arg, ggtt_offset, local_offset, (u64 *)&bb->cs[bb->len], batched_ptes);

total: 0 errors, 4 warnings, 1 checks, 203 lines checked
2640867c0065 drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:190: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#190: FILE: drivers/gpu/drm/xe/xe_ggtt.c:526:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:252: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#252: FILE: drivers/gpu/drm/xe/xe_ggtt.c:690:
+						   u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg)

-:272: WARNING:LINE_SPACING: Missing a blank line after declarations
#272: FILE: drivers/gpu/drm/xe/xe_ggtt.c:710:
+		u64 pte_flags = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+		transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_pte, arg);

-:277: CHECK:LINE_SPACING: Please don't use multiple blank lines
#277: FILE: drivers/gpu/drm/xe/xe_ggtt.c:715:
+
+

total: 0 errors, 2 warnings, 2 checks, 296 lines checked
35c43e43be94 drm/xe: Allow for optimization of xe_ggtt_map_bo
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:42: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/xe_ggtt.c:617:
+static void xe_ggtt_map_bo_cb(void *args, u32 ggtt_offset, u32 local_offset, u64 *ptes, u32 num_ptes)

-:114: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#114: FILE: drivers/gpu/drm/xe/xe_ggtt.c:670:
+		for (u32 local_offset = 0; local_offset < node->base.size; local_offset += XE_PAGE_SIZE) {

-:116: WARNING:LINE_SPACING: Missing a blank line after declarations
#116: FILE: drivers/gpu/drm/xe/xe_ggtt.c:672:
+			u64 pte;
+			xe_ggtt_map_bo_cb(&data, node->base.start, local_offset, &pte, 1);

total: 0 errors, 4 warnings, 0 checks, 128 lines checked
a62ee63829e9 drm/xe: Move struct xe_ggtt to xe_ggtt.c


