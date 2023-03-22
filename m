Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB679C6FD20
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 00:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFF410E114;
	Wed, 22 Mar 2023 00:24:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C4FD10E114;
 Wed, 22 Mar 2023 00:24:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 54E99A882E;
 Wed, 22 Mar 2023 00:24:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 22 Mar 2023 00:24:34 -0000
Message-ID: <167944467431.13423.10487618867485361223@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230322002246.706065-1-matthew.brost@intel.com>
In-Reply-To: <20230322002246.706065-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Reinstate_render_/_compute_cache_invalidation_in_r?=
 =?utf-8?q?ing_ops?=
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

Series: drm/xe: Reinstate render / compute cache invalidation in ring ops
URL   : https://patchwork.freedesktop.org/series/115472/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1ae4dd9e82429e075aa7121404b06ce170da5848
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Mar 21 11:44:07 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Tue Mar 21 14:03:29 2023 +0000

    drm/xe/buddy: add compatible and intersects hooks
    
    Copy this from i915. We need .compatible for vram -> vram transfers, so
    they don't just get nooped by ttm, if need to move something from
    mappable to non-mappble or vice versa. The .intersects is needed for
    eviction, to determine if a victim resource is worth eviction. e.g if we
    need mappable space there is no point in evicting a resource that has
    zero mappable pages.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/regs/xe_gpu_commands.h:57
error: drivers/gpu/drm/xe/regs/xe_gpu_commands.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Reinstate render / compute cache invalidation in ring ops
Patch failed at 0001 drm/xe: Reinstate render / compute cache invalidation in ring ops
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


