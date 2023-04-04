Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6280FC761A6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 17:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB7310E72C;
	Tue,  4 Apr 2023 17:11:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1543410E730;
 Tue,  4 Apr 2023 17:11:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0D033A0078;
 Tue,  4 Apr 2023 17:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 04 Apr 2023 17:11:37 -0000
Message-ID: <168062829702.18898.2086072918610257302@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230404170737.1856619-1-lucas.demarchi@intel.com>
In-Reply-To: <20230404170737.1856619-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_tools=3A_Add_tool_to_dump_GuC/HuC_CSS_header_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: tools: Add tool to dump GuC/HuC CSS header (rev2)
URL   : https://patchwork.freedesktop.org/series/116048/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 804b2b8f9288047f496ae053c6b3dbf88fdd3dd3
Author:     Chang, Bruce <yu.bruce.chang@intel.com>
AuthorDate: Mon Apr 3 22:20:31 2023 +0000
Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CommitDate: Tue Apr 4 12:27:46 2023 -0400

    drm/xe: fix pvc unload issue
    
    Currently, unload pvc driver will generate a null dereference
    and the call stack is as below.
    
    [ 4850.618000] Call Trace:
    [ 4850.620740]  <TASK>
    [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
    [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
    [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
    [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
    [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
    [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
    [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
    [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
    [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
    [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
    [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
    
    There are a couple issues, but the main one is due to TTM has only
    one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
    1 TTM_PL_TT each tile. The second will overwrite the first one.
    
    During unload time, the first tile will reset the TTM_PL_TT manger
    and when the second tile is trying to free Bo and it will generate
    the null reference since the TTM manage is already got reset to 0.
    
    The fix is to use one global TTM_PL_TT manager.
    
    v2: make gtt mgr global and change the name to sys_mgr
    
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
=== git am output follows ===
error: tools/meson.build: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: tools: Add tool to dump GuC/HuC CSS header
Patch failed at 0001 tools: Add tool to dump GuC/HuC CSS header
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


