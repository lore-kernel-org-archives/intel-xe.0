Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C35C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E1D10E12A;
	Wed,  9 Sep 2026 06:25:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA05C10E12A;
 Wed,  9 Sep 2026 06:25:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fmigrate=3A_Fi?=
 =?utf-8?q?x_memory_corruption_with_unaligned_dst_in_MEM=5FCOPY_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 06:25:34 -0000
Message-ID: <178893513482.139265.2771306584661353382@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909061845.4048047-1-jan.maslak@intel.com>
In-Reply-To: <20260909061845.4048047-1-jan.maslak@intel.com>
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

Series: drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY (rev3)
URL   : https://patchwork.freedesktop.org/series/167675/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9684cd1085c5ac6f2fbf009b2f9bff9a0a56dc5
Author: Jan Maslak <jan.maslak@intel.com>
Date:   Wed Sep 9 08:18:45 2026 +0200

    drm/xe/tests: Add xe_migrate_access_memory subtest
    
    Add a new xe_migrate subtest for vram to sram migration works:
     - when the dst address is not 4-byte aligned
     - when the dst address in not 4-byte aligned but the migration size is
     - when src BO offset is not 4-byte aligned
    
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
    Signed-off-by: Jan Maslak <jan.maslak@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch dd822035c9dcd89e47cbfa75da6f3119617fbada drm-intel
05653043a411 drm/xe/xe_migrate: Align MEM_COPY pitch with destination address
7bcf21a50257 drm/xe/xe_migrate: Fix page tracking in access_memory
6c40b316ac97 drm/xe/xe_migrate: Optimize unaligned access_memory copies
-:166: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#166: FILE: drivers/gpu/drm/xe/xe_migrate.c:2684:
+										 XE_CACHELINE_BYTES));

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
b9684cd1085c drm/xe/tests: Add xe_migrate_access_memory subtest
-:112: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#112: FILE: drivers/gpu/drm/xe/tests/xe_migrate.c:852:
+static void access_memory_test_unaligned_bo_offset(struct kunit *test,
+						    struct xe_migrate *m,

total: 0 errors, 0 warnings, 1 checks, 296 lines checked


