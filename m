Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70FCCD187
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 02:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2110E359;
	Mon, 13 Oct 2025 02:02:37 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E130710E35E;
 Mon, 13 Oct 2025 02:02:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Different_page_size_handl?=
 =?utf-8?q?e_in_migrate_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 02:02:36 -0000
Message-ID: <176032095691.3591.852794766155776296@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013015620.4115242-1-matthew.brost@intel.com>
In-Reply-To: <20251013015620.4115242-1-matthew.brost@intel.com>
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

Series: Different page size handle in migrate layer
URL   : https://patchwork.freedesktop.org/series/155794/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf63ebef4fac2ce8f2dbab32fb0ab7e43e6ab404
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Oct 12 18:56:20 2025 -0700

    drm/xe: Enable 2M pages in xe_migrate_vram
    
    Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
    instructions per 2M copy (1 vs. 512), and the cache hit rate should be
    higher. This results in increased copy engine bandwidth, as shown by
    benchmark IGTs.
    
    Enable 2M pages by reserving PDEs in the migrate VM and using 2M pages
    in xe_migrate_vram if the DMA address order matches 2M.
    
    v2:
     - Reuse build_pt_update_batch_sram (Stuart)
     - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
    v3:
     - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as needed
     - Use stack incr var in xe_migrate_vram_use_pde (Stuart)
    v4:
     - Split PAGE_SIZE > 4K fix out in different patch (Stuart)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 085518a4da5bcf9b68ef798e27ef71d64443aad7 drm-intel
8a4e2dccbc64 drm/xe: Fix build_pt_update_batch_sram for non-4K PAGE_SIZE
cf63ebef4fac drm/xe: Enable 2M pages in xe_migrate_vram
-:86: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#86: FILE: drivers/gpu/drm/xe/xe_migrate.c:1845:
+	unsigned long i, incr = large_size / PAGE_SIZE;;

total: 0 errors, 1 warnings, 0 checks, 109 lines checked


