Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714ADC6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 08:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230310E04D;
	Thu, 23 Mar 2023 08:17:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3FE810E04D;
 Thu, 23 Mar 2023 08:17:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA676A7DFB;
 Thu, 23 Mar 2023 08:17:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 23 Mar 2023 08:17:34 -0000
Message-ID: <167955945466.6628.9638107912811503657@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230323081546.1014414-1-matthew.brost@intel.com>
In-Reply-To: <20230323081546.1014414-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Use_BO=27s_GT_to_determine_dma=5Foffset_when_progr?=
 =?utf-8?q?amming_PTEs?=
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

Series: drm/xe: Use BO's GT to determine dma_offset when programming PTEs
URL   : https://patchwork.freedesktop.org/series/115533/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit e6f9b3b9a18f2ec7b3aea2bbc7160ef5387dc878
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Tue Mar 21 18:16:47 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Mar 22 12:42:12 2023 -0700

    drm/xe: Reinstate render / compute cache invalidation in ring ops
    
    Render / compute engines have additional caches (not just TLBs) that
    need to be invalidated each batch, reinstate these invalidations in ring
    ops.
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:792
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Use BO's GT to determine dma_offset when programming PTEs
Patch failed at 0001 drm/xe: Use BO's GT to determine dma_offset when programming PTEs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


