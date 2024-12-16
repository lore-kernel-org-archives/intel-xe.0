Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C0E77180
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 16:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16CD8926F;
	Mon, 16 Dec 2024 16:39:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D398926F;
 Mon, 16 Dec 2024 16:39:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/7=5D_drm/xe=3A_use_backup_object_for_pinned_save/restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 16:39:18 -0000
Message-ID: <173436715847.3346481.865777412915176968@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216162941.86070-8-matthew.auld@intel.com>
In-Reply-To: <20241216162941.86070-8-matthew.auld@intel.com>
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

Series: series starting with [1/7] drm/xe: use backup object for pinned save/restore
URL   : https://patchwork.freedesktop.org/series/142664/
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
commit 8e10b2435532a89cebfeabfbf57df314ea34e5bf
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Dec 16 16:29:48 2024 +0000

    drm/xe/sriov: support non-contig VRAM provisioning
    
    Currently we can run into issues with provisioning VRAM region, due to
    requiring contig VRAM BO underneath. We sometimes see that allocation
    (multiple GB) can fail even when there is enough free space.  We don't
    need CPU access to the buffer in the first place, so can forgo pin_map
    and therefore also the contig requirement. Keep the same behavior with
    save and restore during suspend/resume (which can now be done with
    blitter).  We also need the VRAM to occupy the same pages so we don't
    need to re-program the LMTT, so should still remain pinned (also we
    don't want something to try evict it). With that covert over to plain
    pinned kernel object.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd drm-intel
0d668b8a37c9 drm/xe: use backup object for pinned save/restore
-:108: CHECK:BRACES: Unbalanced braces around else statement
#108: FILE: drivers/gpu/drm/xe/xe_bo.c:792:
+	} else

-:195: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#195: FILE: drivers/gpu/drm/xe/xe_bo.c:872:
+	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
+			      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED);

total: 0 errors, 0 warnings, 2 checks, 380 lines checked
40a0d925c7b1 drm/xe: split pinned save/restore into phases
d732ffa49657 drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
154851352225 drm/xe: add XE_BO_FLAG_PINNED_EARLY_RESTORE
769bbe53c8f4 drm/xe: unconditionally apply PINNED for pin_map()
498d942f40bc drm/xe: allow non-contig VRAM kernel BO
8e10b2435532 drm/xe/sriov: support non-contig VRAM provisioning


