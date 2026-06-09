Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF108CD6E79
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 09:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B7D10E1D0;
	Tue,  9 Jun 2026 09:27:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226AC10E1D0;
 Tue,  9 Jun 2026 09:27:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_cross-tile_?=
 =?utf-8?q?SVM_migration_mapping_on_PVC_and_harden_ENOSPC_retry_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nishit Sharma" <nishit.sharma@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 09:27:38 -0000
Message-ID: <178099725813.58705.14603012590473270487@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609084003.70975-1-nishit.sharma@intel.com>
In-Reply-To: <20260609084003.70975-1-nishit.sharma@intel.com>
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

Series: drm/xe: fix cross-tile SVM migration mapping on PVC and harden ENOSPC retry path
URL   : https://patchwork.freedesktop.org/series/168162/
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
commit af466049dcc9f88ea27e1896ce6c097bf2cbf470
Author: Nishit Sharma <nishit.sharma@intel.com>
Date:   Tue Jun 9 08:40:03 2026 +0000

    drm/xe: fix cross-tile SVM migration mapping on PVC and harden ENOSPC retry path
    
    This update addresses correctness and stability issues in unified memory migration on
    multi-tile (such as PVC) systems where multiple tiles share a single device context.
    In that environment, local and peer memory paths can appear equivalent at the device level,
    which may cause cross-tile traffic to use an address form that is only valid on the owning tile.
    Under page-fault-driven migration, that can intermittently fail when one tile accesses pages
    currently resident on another tile.
    The fix introduces explicit peer-aware mapping semantics so cross-tile accesses are resolved
    through a valid peer-accessible DMA path rather than tile-local addressing.
    
    Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
+ /mt/dim checkpatch e591d473e392997b89c9ab9598bfe027c59ac21c drm-intel
af466049dcc9 drm/xe: fix cross-tile SVM migration mapping on PVC and harden ENOSPC retry path
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This update addresses correctness and stability issues in unified memory migration on

-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/xe/xe_svm.c:615:
+				xe_svm_copy_kb_stats_incr(gt, dir,
+						(i - pos) * (PAGE_SIZE / SZ_1K));

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/xe/xe_svm.c:618:
+					__fence = xe_migrate_from_vram(vr->migrate,
+							i - pos, vram_addr,

-:90: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#90: FILE: drivers/gpu/drm/xe/xe_svm.c:623:
+					__fence = xe_migrate_to_vram(vr->migrate,
+							i - pos, &pagemap_addr[pos],

-:114: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#114: FILE: drivers/gpu/drm/xe/xe_svm.c:1183:
+		if (!supports_4K_migration(vm->xe) &&
+		   (!IS_ALIGNED(xe_svm_range_start(range), SZ_64K) ||

-:166: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#166: FILE: drivers/gpu/drm/xe/xe_svm.c:1433:
+		drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, &range->base,
+				&ctx);

-:189: ERROR:CODE_INDENT: code indent should use tabs where possible
#189: FILE: drivers/gpu/drm/xe/xe_svm.c:1784:
+        dma_addr_t addr = dma_map_resource(dev,$

-:189: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#189: FILE: drivers/gpu/drm/xe/xe_svm.c:1784:
+        dma_addr_t addr = dma_map_resource(dev,$

-:216: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#216: FILE: drivers/gpu/drm/xe/xe_sync.c:349:
+#if 0

total: 1 errors, 3 warnings, 5 checks, 214 lines checked


