Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F54FC3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 11:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6FA10E188;
	Fri,  2 May 2025 11:02:31 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E353810E05D;
 Fri,  2 May 2025 11:02:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_migratio?=
 =?utf-8?q?n_tests=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 11:02:30 -0000
Message-ID: <174618375093.34954.10697974148532261306@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502093514.510621-1-dev@lankhorst.se>
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
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

Series: drm/xe: Update migration tests.
URL   : https://patchwork.freedesktop.org/series/148544/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 562abc68162a7733a6deb145e448861ac4c3b516
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri May 2 11:35:13 2025 +0200

    drm/xe: Add migrate performance kunit test
    
    Ever since we added migration, we didn't have concrete numbers on how
    performant our implementation is. We are currently writing pagetables,
    flushing, then writing data and flushing again. Lets see what happens
    when we fix this.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 6a0ed9d606fcc48c990c2b4ec975c68c53139293 drm-intel
d232202c0ff9 drm/xe: Simplify migration kunit tests
-:62: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#62: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:625:
+static struct xe_bo *migratable_bo_create_pin_map(struct kunit *test, struct xe_device *xe, struct xe_vm *vm, u64 size, u32 caching, u32 flags)

-:73: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#73: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:627:
+	struct xe_bo *bo = xe_bo_create_user(xe, NULL, vm, size, caching, flags | XE_BO_FLAG_PINNED);

total: 0 errors, 2 warnings, 0 checks, 242 lines checked
eaa85380eb70 drm/xe: Silence migrate debug message.
506c36f28ee4 drm/xe: Fix small leak in migration error path.
562abc68162a drm/xe: Add migrate performance kunit test
-:93: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#93: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:736:
+		drm_dbg(&xe->drm, "[%i] Job (%s) copy of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);

-:97: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#97: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:740:
+		fence = xe_migrate_copy(tile->migrate, src, dst, src->ttm.resource, dst->ttm.resource, false);

-:104: WARNING:LONG_LINE: line length of 131 exceeds 100 columns
#104: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:747:
+		drm_dbg(&xe->drm, "[%i] Job (%s) migration of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);

-:110: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#110: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:753:
+	drm_info(&xe->drm, "%s %lu MB buffer took on average %llu us for copy, %llu us for migrate\n", description, src->size >> 20, div_u64(t_job, iter), div_u64(t_migrate, iter));

-:173: WARNING:LONG_LINE: line length of 142 exceeds 100 columns
#173: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:820:
+	sys_bo = migratable_bo_create_pin_map(test, xe, vm, size, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);

-:189: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#189: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:836:
+	batch_bo = migratable_bo_create_pin_map(test, xe, vm, SZ_2M, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);

total: 0 errors, 6 warnings, 0 checks, 253 lines checked


