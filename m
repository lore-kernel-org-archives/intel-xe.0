Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5FC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 16:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7382D10E7D9;
	Tue, 21 Mar 2023 16:27:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E057310E7D9;
 Tue, 21 Mar 2023 16:27:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C5BB6A0003;
 Tue, 21 Mar 2023 16:27:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 21 Mar 2023 16:27:06 -0000
Message-ID: <167941602678.18679.13019429266597999444@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230321160815.673423-1-matthew.brost@intel.com>
In-Reply-To: <20230321160815.673423-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Decrement_fault_mode_counts_in_xe=5Fvm=5Fclose=5Fa?=
 =?utf-8?q?nd=5Fput_=28rev2=29?=
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

Series: drm/xe: Decrement fault mode counts in xe_vm_close_and_put (rev2)
URL   : https://patchwork.freedesktop.org/series/115303/
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
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:1393
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Decrement fault mode counts in xe_vm_close_and_put
Patch failed at 0001 drm/xe: Decrement fault mode counts in xe_vm_close_and_put
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


