Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65942ECD9B5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 00:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C63510E1B2;
	Fri,  6 Feb 2026 00:52:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6888510E1A0;
 Fri,  6 Feb 2026 00:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu=3A_Move_DRM_buddy_all?=
 =?utf-8?q?ocator_one_level_up_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 00:52:33 -0000
Message-ID: <177033915340.228376.10854895174821061206@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
In-Reply-To: <20260206003451.1914130-1-joelagnelf@nvidia.com>
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

Series: gpu: Move DRM buddy allocator one level up (rev2)
URL   : https://patchwork.freedesktop.org/series/158056/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7404e742baa4d733e33794f64860b5f70fdcbe5b
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Thu Feb 5 19:34:51 2026 -0500

    gpu: Move DRM buddy allocator one level up
    
    Move the DRM buddy allocator one level up so that it can be used by GPU
    drivers (example, nova-core) that have usecases other than DRM (such as
    VFIO vGPU support). Modify the API, structures and Kconfigs to use
    "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
    
    The commit cannot be split due to bisectability, however no functional
    change is intended. Verified by running K-UNIT tests and build tested
    various configurations.
    
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 75acb0a8b6f69c6429941e6845df2af94ed15939 drm-intel
7404e742baa4 gpu: Move DRM buddy allocator one level up
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

-:495: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#495: FILE: drivers/gpu/buddy.c:423:
+	BUG_ON(!gpu_buddy_block_is_free(block));

-:496: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#496: FILE: drivers/gpu/buddy.c:424:
+	BUG_ON(!gpu_buddy_block_order(block));

-:598: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#598: FILE: drivers/gpu/buddy.c:526:
+	BUG_ON(!gpu_buddy_block_is_allocated(block));

-:846: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#846: FILE: drivers/gpu/buddy.c:774:
+	BUG_ON(!gpu_buddy_block_is_free(block));

-:1231: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1231: FILE: drivers/gpu/buddy.c:1159:
+		BUG_ON(order > mm->max_order);

-:1232: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1232: FILE: drivers/gpu/buddy.c:1160:
+		BUG_ON(order < min_order);

-:1358: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1358: FILE: drivers/gpu/buddy.c:1286:
+				BUG_ON(!gpu_buddy_block_is_free(block));

-:3155: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#3155: FILE: drivers/gpu/drm/drm_buddy.c:40:
+	drm_printf(

-:3175: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#3175: FILE: drivers/gpu/drm/drm_buddy.c:57:
+				BUG_ON(!gpu_buddy_block_is_free(block));

-:5415: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#5415: FILE: include/linux/gpu_buddy.h:28:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)

total: 0 errors, 15 warnings, 2 checks, 5255 lines checked


