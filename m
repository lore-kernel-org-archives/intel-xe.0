Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92ECC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 09:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AAA10E17E;
	Tue, 14 Mar 2023 09:01:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2049A10E17E;
 Tue, 14 Mar 2023 09:01:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 185A0A66C9;
 Tue, 14 Mar 2023 09:01:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 14 Mar 2023 09:01:42 -0000
Message-ID: <167878450206.26415.8354003650499653809@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230314085842.134239-1-matthew.auld@intel.com>
In-Reply-To: <20230314085842.134239-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Some_small-bar_prep_patches_=28rev4=29?=
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

Series: Some small-bar prep patches (rev4)
URL   : https://patchwork.freedesktop.org/series/114521/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 5ae1df0ae08d77109ecd4febf8d3ff92a0095d31
Author:     Riana Tauro <riana.tauro@intel.com>
AuthorDate: Thu Mar 9 18:48:56 2023 +0530
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Tue Mar 14 08:30:37 2023 +0000

    drm/xe: Fix overflow in vram manager
    
    The overflow caused xe_bo_restore_kernel to return an error
    Fix overflow in vram manager alloc function.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
=== git am output follows ===
Applying: drm/xe: one more s/lmem/vram/
Applying: drm/xe: add xe_ttm_stolen_cpu_access_needs_ggtt()
Applying: drm/xe/vram: start tracking the io_size
Applying: drm/xe/buddy: remove the virtualized start
Applying: drm/xe/buddy: add visible tracking
Applying: drm/xe/buddy: add compatible and intersects hooks


