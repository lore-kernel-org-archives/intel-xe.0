Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7605E674B6
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 14:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4BE10E6B8;
	Mon, 22 Dec 2025 14:15:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9310E6B8;
 Mon, 22 Dec 2025 14:15:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_nova-core=3A_Memory_manag?=
 =?utf-8?q?ement_initial_patches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 14:15:52 -0000
Message-ID: <176641295276.111296.13588097439411045360@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
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

Series: nova-core: Memory management initial patches
URL   : https://patchwork.freedesktop.org/series/159316/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 161a78dd1d28c025c39662c58e75cc60f0f21bd6
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Fri Dec 19 15:38:05 2025 -0500

    nova-core: Add PRAMIN aperture self-tests
    
    Add self-tests for the PRAMIN aperture mechanism to verify correct
    operation during GPU probe. The tests validate:
    
    - Byte-level read/write at odd-aligned locations
    - Word write followed by byte-level readback (endianness verification)
    - Window repositioning across 1MB boundaries
    
    The tests are gated behind CONFIG_NOVA_PRAMIN_SELFTESTS which is
    disabled by default. When enabled, tests run after GSP boot during
    probe.
    
    Also remove the unused lint suppression at the module level since the
    PRAMIN code is now being actively used.
    
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 373a53bd0fb5466451d376c4d54409d271ff26f2 drm-intel
270cb832d54a rust: clist: Add support to interface with C linked lists
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 396 lines checked
a74e4961da6e gpu: Move DRM buddy allocator one level up
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:51: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#51: FILE: drivers/gpu/Kconfig:8:
+config GPU_BUDDY_KUNIT_TEST
+	tristate "KUnit tests for GPU buddy allocator" if !KUNIT_ALL_TESTS
+	depends on GPU_BUDDY && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the GPU buddy allocator.

-:95: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#95: FILE: drivers/gpu/buddy.c:23:
+	BUG_ON(order > GPU_BUDDY_MAX_ORDER);

-:107: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#107: FILE: drivers/gpu/buddy.c:35:
+	BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);

-:382: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#382: FILE: drivers/gpu/buddy.c:310:
+	BUG_ON(mm->max_order > GPU_BUDDY_MAX_ORDER);

-:427: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#427: FILE: drivers/gpu/buddy.c:355:
+		BUG_ON(root_count > mm->max_order);

-:428: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#428: FILE: drivers/gpu/buddy.c:356:
+		BUG_ON(gpu_buddy_block_size(mm, root) < chunk_size);

-:494: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#494: FILE: drivers/gpu/buddy.c:422:
+	BUG_ON(!gpu_buddy_block_is_free(block));

-:495: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#495: FILE: drivers/gpu/buddy.c:423:
+	BUG_ON(!gpu_buddy_block_order(block));

-:597: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#597: FILE: drivers/gpu/buddy.c:525:
+	BUG_ON(!gpu_buddy_block_is_allocated(block));

-:845: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#845: FILE: drivers/gpu/buddy.c:773:
+	BUG_ON(!gpu_buddy_block_is_free(block));

-:1221: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1221: FILE: drivers/gpu/buddy.c:1149:
+		BUG_ON(order > mm->max_order);

-:1222: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1222: FILE: drivers/gpu/buddy.c:1150:
+		BUG_ON(order < min_order);

-:1348: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1348: FILE: drivers/gpu/buddy.c:1276:
+				BUG_ON(!gpu_buddy_block_is_free(block));

-:3135: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#3135: FILE: drivers/gpu/drm/drm_buddy.c:40:
+	drm_printf(

-:3149: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#3149: FILE: drivers/gpu/drm/drm_buddy.c:52:
+		for_each_free_tree(tree)
+		{

-:3157: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#3157: FILE: drivers/gpu/drm/drm_buddy.c:58:
+				BUG_ON(!gpu_buddy_block_is_free(block));

-:5351: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#5351: FILE: include/linux/gpu_buddy.h:28:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)

total: 1 errors, 15 warnings, 2 checks, 5193 lines checked
33ca9f4b178d rust: gpu: Add GPU buddy allocator bindings
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 584 lines checked
ecf92b9dca15 nova-core: mm: Add support to use PRAMIN windows to write to VRAM
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
c2d8aa39aa72 docs: gpu: nova-core: Document the PRAMIN aperture mechanism
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 129 lines checked
161a78dd1d28 nova-core: Add PRAMIN aperture self-tests


