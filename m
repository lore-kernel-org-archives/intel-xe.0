Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C688CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9A510E346;
	Mon, 22 Jun 2026 15:58:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682EC10E778;
 Mon, 22 Jun 2026 15:58:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fmigrate=3A_Fi?=
 =?utf-8?q?x_memory_corruption_with_unaligned_dst_in_MEM=5FCOPY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 15:58:15 -0000
Message-ID: <178214389542.102379.6138491083563478278@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622103449.3335928-1-jan.maslak@intel.com>
In-Reply-To: <20260622103449.3335928-1-jan.maslak@intel.com>
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

Series: drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY (rev2)
URL   : https://patchwork.freedesktop.org/series/167675/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3640ec306ed6e7bd9ed0d3013f8088f5c7274b9d
Author: Christoph Manszewski <c.manszewski@gmail.com>
Date:   Mon Jun 22 12:34:49 2026 +0200

    drm/xe/tests: Add xe_migrate_access_memory subtest
    
    Add a new xe_migrate subtest for vram to sram migration works:
     - when the dst address is not 4-byte aligned
     - when the dst address in not 4-byte aligned but the migration size is
     - when src BO offset is not 4-byte aligned
    
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
    Signed-off-by: Jan Maslak <jan.maslak@intel.com>
+ /mt/dim checkpatch 6583dd200482a34bb17e5dc54551f91f53b79798 drm-intel
d4605c24b4d5 drm/xe/xe_migrate: Align MEM_COPY pitch with destination address
44f09530bec8 drm/xe/xe_migrate: Fix page tracking in access_memory
50a2bebaba1c drm/xe/xe_migrate: Optimize unaligned access_memory copies
-:162: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#162: FILE: drivers/gpu/drm/xe/xe_migrate.c:2662:
+										 XE_CACHELINE_BYTES));

total: 0 errors, 1 warnings, 0 checks, 160 lines checked
3640ec306ed6 drm/xe/tests: Add xe_migrate_access_memory subtest
-:111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#111: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:853:
+static void access_memory_test_unaligned_bo_offset(struct kunit *test,
+						    struct xe_migrate *m,

total: 0 errors, 0 warnings, 1 checks, 296 lines checked


