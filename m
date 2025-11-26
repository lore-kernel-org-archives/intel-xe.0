Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E2D10372
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE510E4FB;
	Wed, 26 Nov 2025 03:17:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65F10E0F9;
 Wed, 26 Nov 2025 03:17:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu=3A_Move_DRM_buddy_all?=
 =?utf-8?q?ocator_one_level_up?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 03:17:14 -0000
Message-ID: <176412703463.28034.15259066553317927145@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
In-Reply-To: <20251124234432.1988476-1-joelagnelf@nvidia.com>
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

Series: gpu: Move DRM buddy allocator one level up
URL   : https://patchwork.freedesktop.org/series/158056/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e7def6ac21baebe7b86c62829add33872ed1fda
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Mon Nov 24 18:44:22 2025 -0500

    gpu: Move DRM buddy allocator one level up
    
    Move the DRM buddy allocator one level up so that it can be used by GPU
    drivers (example, nova-core) that have usecases other than DRM (such as
    VFIO vGPU support). Modify the API, structures and Kconfigs to use
    "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
    
    The commit cannot be split due to bissectability, however no functional
    change is intended. Verified by running K-UNIT tests and build tested
    various configurations.
    
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 8052b0ba2e97387477c22ba816fabca9a4728aae drm-intel
6e7def6ac21b gpu: Move DRM buddy allocator one level up
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

-:5364: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#5364: FILE: include/linux/gpu_buddy.h:28:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)

total: 1 errors, 15 warnings, 2 checks, 5201 lines checked


