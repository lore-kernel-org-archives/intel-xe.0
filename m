Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5078DCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 20:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF4B10E20B;
	Fri, 29 Aug 2025 20:26:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877810E20A;
 Fri, 29 Aug 2025 20:26:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Different_sized_pages_sup?=
 =?utf-8?q?port_in_migrate_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 20:26:49 -0000
Message-ID: <175649920955.286105.12260705749627861739@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829180018.1333174-1-matthew.brost@intel.com>
In-Reply-To: <20250829180018.1333174-1-matthew.brost@intel.com>
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

Series: Different sized pages support in migrate layer
URL   : https://patchwork.freedesktop.org/series/153731/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d01197bdd0ebd7dcb3aba4203cb178f1a5d31738
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 29 11:00:18 2025 -0700

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
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 94efba53a792987b3649b6370e69f772c2210412 drm-intel
30227fc043b1 drm/xe: Add support larger CPU pages to build_pt_update_batch_sram
d01197bdd0eb drm/xe: Enable 2M pages in xe_migrate_vram
-:109: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#109: FILE: drivers/gpu/drm/xe/xe_migrate.c:1813:
+	unsigned long i, incr = large_size / PAGE_SIZE;;

total: 0 errors, 1 warnings, 0 checks, 141 lines checked


