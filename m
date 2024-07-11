Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8679BC3271E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 06:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029210E964;
	Thu, 11 Jul 2024 06:51:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379C510E964;
 Thu, 11 Jul 2024 06:51:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/xe/migrate=3A_Handle_clear_ccs_logic_for_xe2_dgfx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 06:51:50 -0000
Message-ID: <172068071022.124492.3908430009981194575@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720677099.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720677099.git.akshata.jahagirdar@intel.com>
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

Series: series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
URL   : https://patchwork.freedesktop.org/series/135977/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87da61e4a9c6a21e5cd3dd7511c10d687183fa7f
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Thu Jul 11 05:55:05 2024 +0000

    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
    
    In xe2+ dgfx, we don't need to handle the copying of ccs
    metadata during migration. This test validates the ccs data post
    clear and copy during evict/restore operation. Thus, we can skip
    this test on xe2+ dgfx.
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 drm-intel
07434ba821fb drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
1c8ccb77d291 drm/xe/migrate: Add kunit to test clear functionality
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
our clear function or simply because the initial data present there was zero.

-:24: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#24: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:364:
+static struct dma_fence *blt_copy(struct xe_tile *tile,
+				struct xe_bo *src_bo, struct xe_bo *dst_bo,

-:101: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#101: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:441:
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+					src_is_vram, dst_L0_ofs,

-:146: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#146: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:486:
+static void test_clear(struct xe_device *xe, struct xe_tile *tile,
+			struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct kunit *test)

-:176: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#176: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:516:
+	fence = blt_copy(tile, vram_bo, sys_bo,
+				false, "Blit copy from vram to sysmem", test);

-:186: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#186: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:526:
+	fence = blt_copy(tile, vram_bo, sys_bo,
+			true, "Blit surf copy from vram to sysmem", test);

-:196: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#196: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:536:
+static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)

-:203: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#203: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:543:
+	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+			ttm_bo_type_device, XE_BO_CREATE_SYSTEM_BIT | XE_BO_NEEDS_CPU_ACCESS);

-:226: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#226: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:566:
+	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+			       ttm_bo_type_device, bo_flags | XE_BO_NEEDS_CPU_ACCESS);

total: 0 errors, 2 warnings, 7 checks, 287 lines checked
40d00c6bc128 drm/xe/xe2: Introduce identity map for compressed pat for vram
-:36: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#36: 
migration/clear.During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.

-:140: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#140: FILE: drivers/gpu/drm/xe/xe_migrate.c:520:
+					      cur->start + vram_region_gpu_offset(res), is_comp_pte);

total: 0 errors, 2 warnings, 0 checks, 133 lines checked
f11ec2ba9304 drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
4ddee9420c66 drm/xe/migrate: Add kunit to test migration functionality for BMG
-:33: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#33: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:486:
+static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
+			struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,

-:71: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#71: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:524:
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+			true, "Blit surf copy from vram to sysmem", test);

-:110: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#110: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:563:
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+			true, "Blit surf copy from vram to sysmem", test);

-:137: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#137: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:654:
+	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+				  ttm_bo_type_device, bo_flags | XE_BO_NEEDS_CPU_ACCESS);

total: 0 errors, 0 warnings, 4 checks, 164 lines checked
87da61e4a9c6 drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx


